cmake_minimum_required(VERSION 3.28)

project(bl616_tmpl C)

set(CHIP_NAME "BL616")
set(CHIP bl616)
set(BOARD bl616dk)

add_executable(bl616_tmpl main.c)
add_subdirectory(components)
add_subdirectory(drivers)
add_subdirectory(bsp)

add_dependencies(bl616_tmpl
    soc
    lhal
    rfparam
 )
