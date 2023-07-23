# to refresh stage2:
# cd build
# rm tools/clang/stage2-stamps/stage2-configure tools/clang/stage2-bins/CMakeCache.txt; ninja tools/clang/stage2-stamps/stage2-configure

set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(LLVM_ENABLE_PROJECTS "clang;clang-tools-extra;lld" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt;libcxx;libcxxabi" CACHE STRING "")
set(LLVM_TARGETS_TO_BUILD "X86;BPF" CACHE STRING "")
set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_ENABLE_EH ON CACHE BOOL "")
set(LLVM_ENABLE_LLD ON CACHE BOOL "")
set(LLVM_INCLUDE_TESTS OFF CACHE BOOL "")
set(LLVM_INCLUDE_GO_TESTS OFF CACHE BOOL "")

set(CLANG_DEFAULT_UNWINDLIB "libgcc" CACHE STRING "")
set(CLANG_DEFAULT_LINKER lld CACHE STRING "")
set(CLANG_DEFAULT_OBJCOPY llvm-objcopy CACHE STRING "")
set(CLANG_DEFAULT_CXX_STDLIB libc++ CACHE STRING "")
set(CLANG_INCLUDE_TESTS OFF CACHE BOOL "")

set(COMPILER_RT_INCLUDE_TESTS OFF CACHE BOOL "")
set(COMPILER_RT_BUILD_SANITIZERS ON CACHE BOOL "")

set(CMAKE_C_FLAGS "-fPIC" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-fPIC" CACHE STRING "")

set(SANITIZER_CXX_ABI "libc++" CACHE STRING "")
set(SANITIZER_CXX_ABI_INTREE ON CACHE BOOL "")
set(SANITIZER_TEST_CXX "libc++" CACHE STRING "")
set(SANITIZER_TEST_CXX_INTREE ON CACHE BOOL "")

# setup toolchain
set(LLVM_INSTALL_TOOLCHAIN_ONLY ON CACHE BOOL "")
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
  CACHE STRING "")

set(LLVM_DISTRIBUTION_COMPONENTS
  clang
  LTO
  lld
#  clang-format
  clang-resource-headers
  builtins
  runtimes
#  clang-tidy
  ${LLVM_TOOLCHAIN_TOOLS}
  CACHE STRING "")
