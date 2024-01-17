add_library(ethernet STATIC)
target_sources(ethernet PRIVATE
    ethernet_phy.c
    phy8201f.c
    phy8720.c
    $<$<BOOL:CONFIG_LWIP>:ethernetif.c>
)

target_include_directories(ethernet PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
