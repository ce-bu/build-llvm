#!/bin/bash
# usage: ./build-llvm.sh -s <LLVM_SRC_DIR>

pushd $(dirname $0) > /dev/null
root_dir=$(pwd)
popd > /dev/null

D=/opt/llvm-14.0.1
CMAKE=/opt/cmake/bin/cmake
T=bootstrap
PYTHON3=$(realpath $(which python3))

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
        -t)
            shift
            T=$1
            ;;
        *)            
    esac
    shift
done

[[ -z $S ]] && { echo "ERROR: Missing llvm source" ; exit 1 ; }

B=$S/build

llvm-bootstrap()
{
    mkdir -p $B
    sudo rm -rf $B/*
    cd $B
    CC=gcc CXX=g++ $CMAKE -G Ninja \
      -DCMAKE_INSTALL_PREFIX="$D" \
      -DPython3_EXECUTABLE=$PYTHON3 \      
      -C $root_dir/Local.cmake "$S/llvm"

    cd $B
    ninja clang-bootstrap-deps
    ninja stage2-distribution
    sudo ninja stage2-install-distribution-stripped
    
}


llvm-simplenative()
{
    mkdir -p $B
    sudo rm -rf $B/*
    cd $B
    CC=gcc CXX=g++ $CMAKE -G Ninja \
      -DCMAKE_INSTALL_PREFIX="$D" \
      -DPython3_EXECUTABLE=$PYTHON3 \
      -C $root_dir/SimpleNative.cmake "$S/llvm"

    
}



llvm-updatecache()
{
    c=/etc/ld.so.conf.d/llvm14.conf
    echo $D/lib | sudo tee $c
    echo $D/lib/x86_64-unknown-linux-gnu/c++ | sudo tee -a $c
    sudo ldconfig
}

llvm-$T

