add_library(easyflash4 STATIC
    src/easyflash.c
    src/ef_env.c
    src/ef_env_legacy_wl.c
    src/ef_env_legacy.c
    src/ef_port.c
    src/ef_utils.c
    src/easyflash_cli.c
)

target_include_directories(easyflash4 PUBLIC inc)
target_compile_definitions(easyflash4 PUBLIC CONFIG_EASYFLASH4)

if(CONFIG_CLI_CMD_ENABLE)
    target_compile_definitions(easyflash4 PUBLIC CONFIG_CLI_CMD_ENABLE)
endif()
