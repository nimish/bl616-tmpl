add_library(
    fatfs STATIC
    diskio.c
    ff.c
    ffsystem.c
    ffunicode.c
    diskio.c
)
target_include_directories(fatfs PUBLIC . port)
target_compile_definitions(fatfs PUBLIC CONFIG_FATFS)

# fatfs use sdcard over sdio
if(CONFIG_FATFS_SDH_SDCARD)
    target_compile_definitions(fatfs PUBLIC CONFIG_FATFS_SDH_SDCARD)
    target_sources(fatfs PRIVATE port/fatfs_sdh_sdcard.c)
endif()

# fatfs use usb host
if(CONFIG_FATFS_USBH)
    target_compile_definitions(fatfs PUBLIC CONFIG_FATFS_USBH)
    target_sources(fatfs PRIVATE port/fatfs_usbh.c)
endif()
