cmake_minimum_required(VERSION 3.20)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(../common/cmake/simd_x86_64_and_aarch64.cmake)

if(TEST_PLUGIN)
  build_test()
else()
  # VST 3 source files.
  set(plug_sources
    source/parameter.cpp
    source/gui/splashdraw.cpp
    source/plugprocessor.cpp
    source/editor.cpp
    source/plugfactory.cpp)

  build_vst3("${plug_sources}")
endif()
