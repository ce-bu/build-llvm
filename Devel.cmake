set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(LLVM_ENABLE_PROJECTS "clang;clang-tools-extra;lld;lldb" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt;libcxx;libcxxabi" CACHE STRING "")

set(LLVM_TARGETS_TO_BUILD X86;BPF CACHE STRING "")

set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_ENABLE_EH ON CACHE BOOL "")
set(LLVM_INCLUDE_TESTS OFF CACHE BOOL "")
set(LLVM_INCLUDE_GO_TESTS OFF CACHE BOOL "")
set(LLVM_ENABLE_ASSERTIONS ON CACHE BOOL "")

set(CLANG_DEFAULT_UNWINDLIB "libgcc" CACHE STRING "")
set(CLANG_INCLUDE_TESTS OFF CACHE BOOL "")
set(CLANG_DEFAULT_OBJCOPY llvm-objcopy CACHE STRING "")
set(CLANG_DEFAULT_CXX_STDLIB libc++ CACHE STRING "")
set(CLANG_INCLUDE_TESTS OFF CACHE BOOL "")
set(CLANG_DEFAULT_RTLIB "libgcc" CACHE STRING "")
set(CLANG_ENABLE_STATIC_ANALYZER ON CACHE BOOL "")
set(CLANG_DEFAULT_LINKER lld CACHE STRING "")

set(CMAKE_C_FLAGS "-fPIC" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-fPIC" CACHE STRING "")

set(COMPILER_RT_USE_LLVM_UNWINDER OFF CACHE BOOL "")
set(COMPILER_RT_USE_BUILTINS_LIBRARY ON CACHE BOOL "")
set(COMPILER_RT_INCLUDE_TESTS OFF CACHE BOOL "")

set(LIBCXX_USE_COMPILER_RT OFF CACHE BOOL "")
set(LIBCXXABI_USE_COMPILER_RT OFF CACHE BOOL "")
set(LIBCXXABI_USE_LLVM_UNWINDER OFF CACHE BOOL "")

set(LLDB_ENABLE_SWIG ON CACHE BOOL "")
# setup toolchain
set(LLVM_INSTALL_TOOLCHAIN_ONLY ON CACHE BOOL "")

# defaults
set(LLVM_TOOLCHAIN_TOOLS
  dsymutil
  llvm-cov
  llvm-dwarfdump
  llvm-profdata
  llvm-objdump
  llvm-nm
  llvm-size
  llvm-ar
  llvm-cov
  llvm-cxxfilt
  llvm-dwarfdump
  llvm-lib
  llvm-nm
  llvm-objcopy
  llvm-ranlib
  llvm-strip
  llvm-readobj
  llvm-readelf
  llvm-symbolizer
  opt
  CACHE STRING "")

set(LLVM_DISTRIBUTION_COMPONENTS
  clang
  LTO
  lld
  clang-resource-headers
  builtins
  runtimes
  lldb
  ${LLVM_TOOLCHAIN_TOOLS}
  CACHE STRING "")
