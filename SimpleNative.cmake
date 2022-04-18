# to refresh stage2 remove build/tools/clang/stage2-stamps/stage2-configure, build/tools/clang/stage2-bins/CMakeCache.txt and run ninja tools/clang/stage2-stamps/stage2-configure

set(LLVM_ENABLE_PROJECTS "clang;clang-tools-extra;lld;llvm;lldb" CACHE STRING "")
set(LLVM_ENABLE_RUNTIMES "compiler-rt;libcxx;libcxxabi;libunwind" CACHE STRING "")

set(LLVM_TARGETS_TO_BUILD "X86;BPF" CACHE STRING "")

set(CMAKE_BUILD_TYPE Release CACHE STRING "")

set(CLANG_DEFAULT_LINKER lld CACHE STRING "")
set(CLANG_DEFAULT_OBJCOPY llvm-objcopy CACHE STRING "")
set(CLANG_DEFAULT_CXX_STDLIB libc++ CACHE STRING "")
set(CLANG_DEFAULT_RTLIB compiler-rt CACHE STRING "")
set(COMPILER_RT_USE_BUILTINS_LIBRARY ON CACHE BOOL "")

set(LLVM_ENABLE_RTTI ON CACHE BOOL "")
set(LLVM_ENABLE_EH ON CACHE BOOL "")

set(LIBUNWIND_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXX_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXXABI_USE_COMPILER_RT ON CACHE BOOL "")
set(LIBCXXABI_USE_LLVM_UNWINDER ON CACHE BOOL "")

set(CMAKE_C_FLAGS "-fPIC" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-fPIC" CACHE STRING "")

  
# setup toolchain
set(LLVM_INSTALL_TOOLCHAIN_ONLY ON CACHE BOOL "")

# added by add_llvm_tool (it creates a component with the tool name)

set(LLVM_TOOLCHAIN_TOOLS
  dsymutil
  llvm-ar
  llvm-cov
  llvm-cxxfilt
  llvm-dlltool
  llvm-dwarfdump
  llvm-dwp
  llvm-ifs
  llvm-gsymutil
  llvm-lib
  llvm-libtool-darwin
  llvm-lipo
  llvm-mt
  llvm-nm
  llvm-objcopy
  llvm-objdump
  llvm-otool
  llvm-pdbutil
  llvm-profdata
  llvm-rc
  llvm-ranlib
  llvm-readelf
  llvm-readobj
  llvm-size
  llvm-strip
  llvm-symbolizer
  llvm-xray
  sancov
  scan-build-py
  CACHE STRING "")

set(LLVM_DISTRIBUTION_COMPONENTS
  clang
  lld
  lldb
  liblldb
  LTO
  clang-apply-replacements
  clang-doc
  clang-format
  clang-resource-headers
  clang-include-fixer
  clang-refactor
  clang-scan-deps
  clang-tidy
  clangd
  builtins
  runtimes
  ${LLVM_TOOLCHAIN_TOOLS}
  CACHE STRING "")
