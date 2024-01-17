add_library(rfparam STATIC
 Src/rfparam_adapter.c
 Src/rfparam_rftlv.c
)
target_link_libraries(rfparam PUBLIC phyrf soc utils)
target_include_directories(rfparam PUBLIC Inc)
target_compile_definitions(rfparam PUBLIC RFPARAM_BL616)
add_dependencies(rfparam phyrf soc utils)


