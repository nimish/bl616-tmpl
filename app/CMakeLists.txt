add_executable(app
    main.c
    cdc_acm_template.c
)

target_link_libraries(app PUBLIC
soc lhal rfparam cherryusb bl616dk libc
    )

add_dependencies(app
    soc
    lhal
    rfparam
    cherryusb
    bl616dk
 )

set(BIN_FILE $<TARGET_FILE_DIR:app>/$<TARGET_FILE_BASE_NAME:app>.bin)
configure_file(flash_prog_config.ini.in flash_prog_config.ini.in @ONLY)
file(GENERATE
        OUTPUT flash_prog_config.ini
        INPUT  ${CMAKE_CURRENT_BINARY_DIR}/flash_prog_config.ini.in
)

set(BL_FW_POST_PROC ${PROJECT_SOURCE_DIR}/tools/bflb_tools/bflb_fw_post_proc/bflb_fw_post_proc-macos)

add_custom_command(
    TARGET app POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:app> $<TARGET_FILE_BASE_NAME:app>.bin
    COMMAND ${CMAKE_OBJDUMP} -d -S $<TARGET_FILE:app> > $<TARGET_FILE_BASE_NAME:app>.asm
    COMMAND ${BL_FW_POST_PROC}
        --chipname=${CHIP}
        --imgfile=$<TARGET_FILE_DIR:app>/$<TARGET_FILE_BASE_NAME:app>.bin
        --brdcfgdir=${PROJECT_SOURCE_DIR}/bsp/board/${BOARD}/config
    COMMENT "Generate ${BIN_FILE} and ${ASM_FILE} + post process"
    WORKING_DIRECTORY $<TARGET_FILE_DIR:app>
    BYPRODUCTS  app.bin
                app.asm
                app.xz
                app.bin.ota
                app.xz.ota
                efusedata_mask.bin
                efusedata.bin
                efusedata_raw.bin
                partition.bin
                boot2_bl616_isp_release_v8.1.1.bin
                mfg_bl616_gu_214e807d5_v2.43.bin
    COMMAND_EXPAND_LISTS
    USES_TERMINAL
)

