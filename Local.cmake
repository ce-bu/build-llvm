set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(LLVM_ENABLE_PROJECTS "clang;clang-tools-extra;lld;lldb" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt;libcxx;libcxxabi" CACHE STRING "")
set(LLVM_TARGETS_TO_BUILD X86;BPF CACHE STRING "")
set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_ENABLE_EH ON CACHE BOOL "")
set(LLVM_INCLUDE_TESTS OFF CACHE BOOL "")
set(LLVM_INCLUDE_GO_TESTS OFF CACHE BOOL "")


set(CLANG_DEFAULT_UNWINDLIB "libgcc" CACHE STRING "")
set(CLANG_DEFAULT_LINKER lld CACHE STRING "")
set(CLANG_DEFAULT_OBJCOPY llvm-objcopy CACHE STRING "")
set(CLANG_DEFAULT_RTLIB compiler-rt CACHE STRING "")
set(CLANG_DEFAULT_CXX_STDLIB libc++ CACHE STRING "")
set(CLANG_INCLUDE_TESTS OFF CACHE BOOL "")

set(COMPILER_RT_INCLUDE_TESTS OFF CACHE BOOL "")
set(COMPILER_RT_BUILD_SANITIZERS OFF CACHE BOOL "")

set(LIBUNWIND_ENABLE_SHARED OFF CACHE BOOL "")
set(LIBUNWIND_INSTALL_LIBRARY OFF CACHE BOOL "")
set(LIBUNWIND_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXXABI_ENABLE_SHARED OFF CACHE BOOL "")
set(LIBCXXABI_ENABLE_STATIC_UNWINDER ON CACHE BOOL "")
set(LIBCXXABI_INSTALL_LIBRARY OFF CACHE BOOL "")
set(LIBCXXABI_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXXABI_USE_LLVM_UNWINDER OFF CACHE BOOL "")
set(LIBCXX_ENABLE_SHARED OFF CACHE BOOL "")
set(LIBCXX_ENABLE_STATIC_ABI_LIBRARY ON CACHE BOOL "")
set(LIBCXX_USE_COMPILER_RT ON CACHE BOOL "")

set(BUILTINS_CMAKE_ARGS   "-DCMAKE_SYSTEM_NAME=Linux" CACHE STRING "")
set(RUNTIMES_CMAKE_ARGS   "-DCMAKE_SYSTEM_NAME=Linux" CACHE STRING "")

set(BOOTSTRAP_LLVM_ENABLE_LTO ON CACHE BOOL "")
set(BOOTSTRAP_LLVM_ENABLE_LLD ON CACHE BOOL "")

set(CLANG_BOOTSTRAP_TARGETS
  check-all
  check-llvm
  check-clang
  check-lld
  check-lldb
  llvm-config
  test-suite
  test-depends
  llvm-test-depends
  clang-test-depends
  lld-test-depends
  distribution
  install-distribution
  install-distribution-stripped
  install-distribution-toolchain
  clang CACHE STRING "")

# Setup the bootstrap build.
set(CLANG_ENABLE_BOOTSTRAP ON CACHE BOOL "")
set(CLANG_BOOTSTRAP_EXTRA_DEPS
  builtins
  runtimes
  CACHE STRING "")
set(CLANG_BOOTSTRAP_CMAKE_ARGS
  ${EXTRA_ARGS}
  -C ${CMAKE_CURRENT_LIST_DIR}/Local-stage2.cmake
  CACHE STRING "")
