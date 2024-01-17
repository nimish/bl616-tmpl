if (CONFIG_FATFS)
    add_subdirectory(fatfs)
endif()

if (CONFIG_LITTLEFS)
    add_subdirectory(littlefs)
endif()

if (CONFIG_ROMFS)
    add_subdirectory(romfs)
endif()
