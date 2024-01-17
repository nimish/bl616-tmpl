
file(GLOB_RECURSE LVGL_SOURCES "./*.c")

add_library(lvgl STATIC ${LVGL_SOURCES})
target_include_directories(lvgl PUBLIC . port)
