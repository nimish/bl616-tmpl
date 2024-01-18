add_executable(bl616_tmpl main.c)

target_link_libraries(bl616_tmpl PUBLIC
soc lhal rfparam
    )

add_dependencies(bl616_tmpl
    soc
    lhal
    rfparam
 )
