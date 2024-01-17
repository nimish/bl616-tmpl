
add_library(lcd STATIC
    lcd.c
    font.c
    mipi_dbi/bl_mipi_dbi.c
    mipi_dbi/ili9488_dbi.c
    mipi_dbi/ili9486_dbi.c
    mipi_dbi/ili9341_dbi.c
    mipi_dbi/nt35510_dbi.c
    mipi_dbi/st7796_dbi.c
    spi/bl_spi_hard_4.c
    spi/ili9341_spi.c
    spi/ili9488_spi.c
    spi/st7796_spi.c
    spi/st7789v_spi.c
)
target_include_directories(lcd PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/mipi_dbi
    ${CMAKE_CURRENT_SOURCE_DIR}/spi
)

target_link_libraries(lcd PUBLIC lhal)
add_dependencies(lcd lhal)
