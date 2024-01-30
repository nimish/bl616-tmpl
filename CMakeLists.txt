cmake_minimum_required(VERSION 3.28)
include(CMakePrintHelpers)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
project(bl616_tmpl C ASM)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CHIP_NAME "BL616")
set(CHIP bl616)
set(BOARD bl616dk)
set(BL_SDK_BASE ${CMAKE_CURRENT_SOURCE_DIR})


set(BIN_FILE ${CMAKE_CURRENT_BINARY_DIR}/app/app.bin)
set(ASM_FILE ${CMAKE_CURRENT_BINARY_DIR}/app/app.asm)

set(CONFIG_CHERRYUSB_DEVICE_CDC ON)

include_directories("app/")
add_subdirectory(app)

add_subdirectory(components)
add_subdirectory(drivers)
add_subdirectory(bsp)

set(BL_FW_POST_PROC ${CMAKE_CURRENT_SOURCE_DIR}/tools/bflb_tools/bflb_fw_post_proc/bflb_fw_post_proc-macos)

set(MAP_FILE ${CMAKE_PROJECT_NAME}.map)

set( BL_FLASH_PROGRAM ${BL_SDK_BASE}/tools/bflb_tools/bouffalo_flash_cube/BLFlashCommand-macos)
set( PROTOCOL uart)
set( COMX /dev/cu.usbmodem211201)
set( BAUDRATE 115200)
set( CHIP bl616)
set( FLASH_ARGS
        --interface=${PROTOCOL}
        --baudrate=${BAUDRATE}
        --port=${COMX}
        --chipname=${CHIP}
        --config=${CMAKE_CURRENT_SOURCE_DIR}/flash_prog_config.ini
)

cmake_print_variables(FLASH_ARGS)

add_custom_target(
        flash
        COMMAND ${BL_FW_POST_PROC}
                --chipname=${CHIP}
                --imgfile=$<TARGET_FILE_DIR:app>/$<TARGET_FILE_BASE_NAME:app>.bin
                --brdcfgdir=${CMAKE_CURRENT_SOURCE_DIR}/bsp/board/${BOARD}/config
        COMMAND ${BL_FLASH_PROGRAM} ${FLASH_ARGS}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/app
        COMMENT "Flashing ${BIN_FILE} to ${COMX}"
        COMMAND_EXPAND_LISTS
        USES_TERMINAL
)
