add_library(lhal STATIC
    src/bflb_common.c
    src/bflb_adc.c
    src/bflb_acomp.c
    src/bflb_cks.c
    src/bflb_ef_ctrl.c
    src/bflb_gpio.c
    src/bflb_i2c.c
    src/bflb_dma.c
    src/bflb_rtc.c
    src/bflb_sec_aes.c
    src/bflb_sec_sha.c
    src/bflb_sec_trng.c
    src/bflb_spi.c
    src/bflb_timer.c
    src/bflb_uart.c
    src/bflb_wdg.c
    src/bflb_flash.c
    src/flash/bflb_sf_cfg.c
    src/flash/bflb_xip_sflash.c
    src/flash/bflb_sflash.c
    src/flash/bflb_sf_ctrl.c
    src/bflb_dac.c
    src/bflb_emac.c
    src/bflb_ir.c
    src/bflb_mjpeg.c
    src/bflb_pwm_v2.c
    src/bflb_cam.c
    src/bflb_sdio2.c
    src/bflb_i2s.c
    src/bflb_dbi.c
    src/bflb_audac.c
    src/bflb_auadc.c
    src/bflb_platform_dma.c
    src/bflb_wo.c
    # src/bflb_usb_v2.c
    src/bflb_irq.c
    src/bflb_l1c.c
    src/bflb_mtimer.c
    include/arch/risc-v/t-head/rv_hart.c
    include/arch/risc-v/t-head/rv_pmp.c
    config/${CHIP}/device_table.c
)


target_include_directories(lhal PUBLIC
    include
    include/arch
    include/arch/risc-v/t-head
    include/arch/risc-v/t-head/Core/Include
    include/arch/risc-v/t-head/csi_dsp/include
    config/${CHIP}
    src/flash
    )


target_compile_definitions(lhal PUBLIC ${CHIP_NAME})

if(CPU_ID)
    string(TOUPPER ${CPU_ID} CPU_ID_NAME)
    target_compile_definitions(lhal PUBLIC ${CPU_ID_NAME})
endif()

target_compile_definitions(lhal PRIVATE CONFIG_FLASH_2LINE_ENABLE)

target_link_libraries(lhal PUBLIC
    soc
    phyrf

    )
