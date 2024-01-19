add_executable(app main.c
    cdc_acm_template.c
)

target_include_directories(app PUBLIC .)


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

add_custom_command(TARGET app POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} -Obinary $<TARGET_FILE:app> ${BIN_FILE}
    COMMAND ${CMAKE_OBJDUMP} -d -S $<TARGET_FILE:app>> ${ASM_FILE}
    COMMENT "Generate ${BIN_FILE}\r\n"
)
