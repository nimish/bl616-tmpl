add_library(audio STATIC)
target_sources(audio PRIVATE audio.c)
target_include_directories(audio PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

if(CONFIG_BSP_ES8388)
    target_sources(audio PRIVATE i2s_codec/es8388_i2s.c)
    target_include_directories(audio PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/i2s_codec)
endif()
