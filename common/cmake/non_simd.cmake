function(get_plugin_name NAME_VAR)
  get_filename_component(PLUGIN_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)
  set(${NAME_VAR} ${PLUGIN_NAME} PARENT_SCOPE)
endfunction()

function(add_fftw3)
  if(UHHYOU_USE_FFTW)
    add_library(fftw3 STATIC IMPORTED)
    if(MSVC)
      get_filename_component(fftw3_path ../lib/fftw3/windows/fftw3f.lib ABSOLUTE)
    elseif(UNIX)
      if(APPLE)
        get_filename_component(fftw3_path ../lib/fftw3/macOS/libfftw3f.a ABSOLUTE)
      else()
        get_filename_component(fftw3_path ../lib/fftw3/linux/libfftw3f.a ABSOLUTE)
      endif()
    endif()
    set_property(TARGET fftw3 PROPERTY IMPORTED_LOCATION ${fftw3_path})
  endif()
endfunction()

function(build_test)
  find_package(SndFile CONFIG REQUIRED)

  get_plugin_name(PLUGIN_NAME)
  set(target "testdsp_${PLUGIN_NAME}")
  add_compile_definitions(TEST_DSP)

  add_executable(${target} test/testdsp.cpp)
  target_compile_definitions(${target} PRIVATE
    UHHYOU_PLUGIN_NAME="${PLUGIN_NAME}")

  set(src "${target}_source")
  add_fftw3()
  add_library(${src}
    source/parameter.cpp
    source/dsp/dspcore.cpp)
  target_link_libraries(${target} PRIVATE
    SndFile::sndfile
    ${src}
    fftw3)
endfunction()

function(build_vst3 plug_sources)
  get_plugin_name(PLUGIN_NAME)
  set(target ${PLUGIN_NAME})

  smtg_add_vst3plugin(${target}
    source/dsp/dspcore.cpp
    ${plug_sources})
  if(APPLE)
    target_compile_options(${target} PRIVATE -fno-aligned-allocation)
  elseif(MSVC)
    ## Too many warnings are emitted from VST 3 SDK.
    # target_compile_options(${target} PRIVATE /W4)
  endif()
  set_target_properties(${target} PROPERTIES ${SDK_IDE_MYPLUGINS_FOLDER})
  target_include_directories(${target} PUBLIC ${VSTGUI_ROOT}/vstgui4)
  include_directories(../common)
  add_fftw3()
  target_link_libraries(${target} PRIVATE
    UhhyouCommon
    fftw3
    base
    sdk
    vstgui_support)

  file(GLOB  snapshots "resource/*_snapshot.png")
  list(LENGTH snapshots length)
  if(length GREATER 0)
    list(GET snapshots 0 snapshot_path)
    if(length GREATER 1)
      message(WARNING "Several snapshots found. Using ${snapshot_path}")
    endif()
    smtg_target_add_plugin_resource(${target} "${snapshot_path}" "Snapshots")
  endif()

  smtg_target_add_plugin_resource(${target} "../common/resource/Fonts/Tinos-BoldItalic.ttf" "Fonts")
  smtg_target_add_plugin_resource(${target} "../common/resource/Fonts/LICENSE.txt" "Fonts")

  if(SMTG_MAC)
    smtg_target_set_bundle(${target}
      BUNDLE_IDENTIFIER "com.steinberg.vst3.${target}"
      COMPANY_NAME "Uhhyou Plugins")
  elseif(SMTG_WIN)
    target_sources(${target} PRIVATE resource/plug.rc)
  endif()
endfunction()
