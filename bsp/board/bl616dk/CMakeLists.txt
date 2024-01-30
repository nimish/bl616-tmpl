add_library(bl616dk STATIC
    board.c
    fw_header.c
    board_rf.c
    )

target_include_directories(bl616dk PUBLIC .)
target_link_libraries(bl616dk
PUBLIC
    phyrf
    soc
    rfparam
    lhal
    mem
)

target_link_options(bl616dk PUBLIC
    -T${CMAKE_CURRENT_SOURCE_DIR}/bl616_ram.ld
    -ufw_header
)
# set_property(TARGET bl616dk PROPERTY INTERFACE_LINK_DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/bl616_flash.ld)
