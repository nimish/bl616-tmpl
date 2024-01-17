add_library(sdcard STATIC sdh_sdcard.c)
target_include_directories(sdcard PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_link_libraries(sdcard PUBLIC lhal)
add_dependencies(sdcard lhal)
