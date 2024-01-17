
add_library(romfs STATIC
    bflb_romfs.c
)

target_include_directories(romfs PUBLIC
    .
)

target_compile_definitions(romfs PUBLIC
    CONFIG_ROMFS
)
