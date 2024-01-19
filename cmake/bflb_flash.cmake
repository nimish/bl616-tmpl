

set(BL_FW_POST_PROC ${BL_SDK_BASE}/tools/bflb_tools/bflb_fw_post_proc/bflb_fw_post_proc-macos)

set(BL_FW_POST_PROC_CONFIG --chipname=${CHIP} --imgfile=${BIN_FILE})

# if(BOARD_DIR)
# list(APPEND BL_FW_POST_PROC_CONFIG --brdcfgdir=${BOARD_DIR}/${BOARD}/config)
# else()
# list(APPEND BL_FW_POST_PROC_CONFIG --brdcfgdir=${BL_SDK_BASE}/bsp/board/${BOARD}/config)
# endif()

# if(CONFIG_AES_KEY)
# list(APPEND BL_FW_POST_PROC_CONFIG --key=${CONFIG_AES_KEY})
# endif()

# if(CONFIG_AES_IV)
# list(APPEND BL_FW_POST_PROC_CONFIG --iv=${CONFIG_AES_IV})
# endif()

# if(CONFIG_PUBLIC_KEY)
# list(APPEND BL_FW_POST_PROC_CONFIG --publickey=${CONFIG_PUBLIC_KEY})
# endif()

# if(CONFIG_PRIVATE_KEY)
# list(APPEND BL_FW_POST_PROC_CONFIG --privatekey=${CONFIG_PRIVATE_KEY})
# endif()


add_custom_target(combine
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        BYPRODUCTS ${BIN_FILE} ${ASM_FILE}
        DEPENDS app
        COMMAND ${BL_FW_POST_PROC} ${BL_FW_POST_PROC_CONFIG}
)



        set( BL_FLASH_PROGRAM ${BL_SDK_BASE}/tools/bflb_tools/bouffalo_flash_cube/BLFlashCommand-macos)

set(command_flash ${BL_FLASH_PROGRAM} --interface=uart --baudrate=${BAUDRATE} --port=${COMX} --chipname=${CHIP} --cpu_id=$(CPU_ID) --config=flash_prog_cfg.ini)

add_custom_command(
        flash
)
