add_library(soc STATIC
    startup/start.S
    startup/vector.S
    startup/riscv_fpu.S
    startup/start_load.c
    startup/system_bl616.c
    startup/interrupt.c

    src/bl616_clock.c
    src/bl616_common.c
    src/bl616_ef_cfg.c
    src/bl616_sdh.c
    src/bl616_tzc_sec.c
    src/bl616_psram.c
    src/bl616_pm.c

    port/bl616_clock.c
)


# if(CONFIG_ROMAPI)
#     target_compile_definitions(soc PUBLIC BFLB_USE_ROM_DRIVER)
#     target_sources(soc PRIVATE
#         src/bl616_romapi_e907.c
#         src/bl616_romapi_patch.c
#     )
# else()
    target_sources(soc PRIVATE
        src/bl616_glb_gpio.c
        src/bl616_glb.c
        src/bl616_hbn.c
        src/bl616_l1c.c
        src/bl616_pds.c
        src/bl616_aon.c
    )
# endif()

target_sources(soc PRIVATE
    src/bl616_mfg_efuse.c
    src/bl616_mfg_flash.c
    src/bl616_mfg_media.c
)

target_include_directories(soc PUBLIC
    include
    include/hardware
)

target_link_libraries(soc PUBLIC lhal)


target_compile_definitions(soc PUBLIC
    ARCH_RISCV
    BFLB_USE_HAL_DRIVER
    CONFIG_IRQ_NUM=80
    )
