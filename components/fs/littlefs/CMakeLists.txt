add_library(littlefs STATIC
    littlefs/lfs_util.c
    littlefs/lfs.c
    port/lfs_xip_flash.c
)

target_include_directories(littlefs PUBLIC
    littlefs
    port
)

target_compile_definitions(littlefs PUBLIC
    CONFIG_LITTLEFS
)

if(CONFIG_FREERTOS)
    target_compile_definitions(littlefs PUBLIC
        LFS_THREADSAFE
    )
endif()

if(CONFIG_LITTLEFS_KV_EASYFLASH)
    target_sources(littlefs PRIVATE
        easyflash_port/lfs_easyflash.c
    )
    target_include_directories(littlefs PUBLIC
        easyflash_port
    )
endif()

if(CONFIG_LITTLEFS_FLASH_ADDRESS)
    target_compile_definitions(littlefs PUBLIC
        CONFIG_LITTLEFS_FLASH_ADDRESS=${CONFIG_LITTLEFS_FLASH_ADDRESS}
    )
endif()

if(CONFIG_LITTLEFS_BD)
    target_sources(littlefs PRIVATE
            littlefs/bd/lfs_filebd.c.c
            littlefs/bd/lfs_rambd.c.c
            littlefs/bd/lfs_testbd.c.c)
    target_include_directories(littlefs PUBLIC littlefs/bd)
endif()
