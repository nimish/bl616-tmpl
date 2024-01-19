cmake_minimum_required(VERSION 3.28)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

set(CHIP_NAME "BL616")
set(CHIP bl616)
set(BOARD bl616dk)
set(BL_SDK_BASE ${CMAKE_CURRENT_SOURCE_DIR})


project(bl616_tmpl C)

set(BIN_FILE ${CMAKE_CURRENT_BINARY_DIR}/app/app.bin)
set(ASM_FILE ${CMAKE_CURRENT_BINARY_DIR}/app/app.asm)

set(CONFIG_CHERRYUSB_DEVICE_CDC ON)

include_directories(app/)

add_subdirectory(components)
add_subdirectory(drivers)
add_subdirectory(bsp)

add_subdirectory(app)


set(BL_FW_POST_PROC ${CMAKE_CURRENT_SOURCE_DIR}/tools/bflb_tools/bflb_fw_post_proc/bflb_fw_post_proc-macos)


message(STATUS "BL_FW_POST_PROC: ${BL_FW_POST_PROC}")
add_custom_command(
        OUTPUT ${BIN_FILE}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/app
        COMMAND ${BL_FW_POST_PROC}
            --chipname=${CHIP}
            --imgfile=${BIN_FILE}
            --brdcfgdir=${CMAKE_CURRENT_SOURCE_DIR}/bsp/board/${BOARD}/config
        )



set( BL_FLASH_PROGRAM ${BL_SDK_BASE}/tools/bflb_tools/bouffalo_flash_cube/BLFlashCommand-macos)
set( PROTOCOL uart)
set( COMX /dev/cu.usbmodem211201)
set( BAUDRATE 115200)
set( CHIP bl616)
set (FLASH_ARGS
--interface=${PROTOCOL}
--baudrate=${BAUDRATE}
--port=${COMX}
--chipname=${CHIP}
--config=${CMAKE_CURRENT_SOURCE_DIR}/flash_prog_cfg.ini

)
add_custom_target(
        flash
        DEPENDS ${BIN_FILE}
        COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/tools/bflb_tools/bouffalo_flash_cube/BLFlashCommand-macos ${FLASH_ARGS}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/app
        COMMENT "Flashing ${BIN_FILE} to ${COMX}"
        VERBATIM
)
