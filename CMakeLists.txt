cmake_minimum_required(VERSION 3.28)
include(CMakePrintHelpers)
include(CMakeDependentOption)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
project(bl616_tmpl C ASM)

set(CMAKE_INCLUDE_CURRENT_DIR ON)


option(CONFIG_FS "Enable FS" ON)
cmake_dependent_option(CONFIG_FATFS "Enable FATFS" ON "CONFIG_FS" OFF)
cmake_dependent_option(CONFIG_LITTLEFS "Enable LITTLEFS" ON "CONFIG_FS" OFF)
cmake_dependent_option(CONFIG_ROMFS "Enable ROMFS" ON "CONFIG_FS" OFF)

option(CONFIG_XZ "Enable LZMA support (xz)" ON)
option(CONFIG_LVGL "Enable LVGL graphics lib" ON)
option(CONFIG_MBEDTLS "Enable mbedTLS" OFF)
option(CONFIG_LWIP "Enable LWIP networking support" OFF)

option(CONFIG_USB_DEVICE "Enable USB device" ON)
cmake_dependent_option(CONFIG_USB_HID "Enable USB HID" OFF "CONFIG_USB_DEVICE" OFF)
cmake_dependent_option(CONFIG_USB_CDC "Enable USB CDC" ON "CONFIG_USB_DEVICE" OFF)
cmake_dependent_option(CONFIG_USB_MSC "Enable USB MSC" OFF "CONFIG_USB_DEVICE" OFF)
cmake_dependent_option(CONFIG_USB_AUDIO "Enable USB Audio" OFF "CONFIG_USB_DEVICE" OFF)
cmake_dependent_option(CONFIG_USB_VIDEO "Enable USB Video" OFF "CONFIG_USB_DEVICE" OFF)

option(CONFIG_USB_HOST "Enable USB host" OFF)
cmake_dependent_option(CONFIG_USB_HID_HOST "Enable USB HID host" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_CDC_ACM_HOST "Enable USB CDC host" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_MSC_HOST "Enable USB MSC host" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_AUDIO_HOST "Enable USB Audio host" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_VIDEO_HOST "Enable USB Video host" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_HUB_HOST "Enable USB hub support" ON "CONFIG_USB_HOST" OFF)
cmake_dependent_option(CONFIG_USB_EHCI "Enable USB EHCI support" ON "CONFIG_USB_HOST" OFF)

set(CHIP_NAME "BL616")
set(CHIP bl616)
set(BOARD bl616dk)
set(BL_SDK_BASE ${CMAKE_CURRENT_SOURCE_DIR})


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
        COMMAND ${BL_FLASH_PROGRAM} ${FLASH_ARGS}
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/app
        COMMENT "Flashing ${BIN_FILE} to ${COMX}"
        COMMAND_EXPAND_LISTS
        USES_TERMINAL
)

# hack for cherryusb usb_config.h
include_directories(app)
add_subdirectory(app)

add_subdirectory(components)
add_subdirectory(drivers)
add_subdirectory(bsp)

