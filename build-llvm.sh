#!/bin/bash
# usage: ./build-llvm.sh -s <LLVM_SRC_DIR>

pushd $(dirname $0) > /dev/null
root_dir=$(pwd)
popd > /dev/null

D=/opt/llvm-15.0.7
cmake=/opt/cmake/bin/cmake

while [[ ! -z $1 ]]; do
    arg=$1
    case $arg in
        -s)
            shift
            S=$1
            ;;
        -d)
            shift
            D=$1
            ;;
        *)            
    esac
    shift
done

[[ -z $S ]] && { echo "ERROR: Missing llvm source" ; exit 1 ; }

B=$S/build

llvm-Prep-Local()
{
    set -x
    mkdir -p $B
    sudo rm -rf $B/*
    cd $B
    CC=gcc CXX=g++ $cmake -G Ninja \
      -DCMAKE_INSTALL_PREFIX="$D" \
      -C $root_dir/Local.cmake "$S/llvm"
}

llvm-Build-Local()
{    
    $cmake --build $B --target clang-bootstrap-deps
    $cmake --build $B --target stage2-distribution
    sudo $cmake --build $B --target install stage2-install-distribution-stripped
    sudo $cmake --build $B --target install stage2-install
    
}

llvm-updatecache()
{
    c=/etc/ld.so.conf.d/llvm15.conf
    echo $D/lib | sudo tee $c
    echo $D/lib/x86_64-unknown-linux-gnu | sudo tee -a $c
    sudo ldconfig
}

llvm-alternatives()
{
    set -x
    sudo bash -c " \
    rm -f /usr/bin/c++ ;  rm -f /bin/c++ ; rm -f /bin/cc ; \
    update-alternatives --remove-all cc ;\
    update-alternatives --remove-all c++ ;\
    update-alternatives --install /usr/bin/cc cc  $D/bin/clang 100 ;\
    update-alternatives --install /usr/bin/c++ c++ $D/bin/clang++ 100 ;\
    update-alternatives --install /usr/bin/clang clang $D/bin/clang 100 ;\
    update-alternatives --install /usr/bin/clang++ clang++ $D/bin/clang++ 100 \
    "
}

llvm-Prep-Local
llvm-Build-Local
llvm-updatecache
