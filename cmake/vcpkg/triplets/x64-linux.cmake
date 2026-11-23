# vcpkg's own x64-linux triplet, plus one fix for snappy.
#
# snappy uses AVX intrinsics whenever the compiler defines __AVX__, but includes
# <immintrin.h> only when its BMI2 or CRC32 code is on, and the vcpkg port turns
# both off. A compiler that targets AVX by default, as on GitHub's ubuntu-26.04
# runner, then fails on __m256i. Including the header is harmless otherwise.
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Linux)

if(PORT STREQUAL "snappy")
  set(VCPKG_CXX_FLAGS "-include immintrin.h")
  set(VCPKG_C_FLAGS "")
endif()
