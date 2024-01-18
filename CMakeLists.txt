cmake_minimum_required(VERSION 3.28)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(bflb_flash)

project(bl616_tmpl C)

set(CHIP_NAME "BL616")
set(CHIP bl616)
set(BOARD bl616dk)


add_subdirectory(components)
add_subdirectory(drivers)
add_subdirectory(bsp)

add_subdirectory(app)
