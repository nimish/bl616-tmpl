add_library(touch STATIC
    ft6x36_i2c.c
    gt911_i2c.c
    touch.c
)
target_include_directories(touch PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)
