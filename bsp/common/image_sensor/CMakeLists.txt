add_library(image_sensor STATIC
    image_sensor.c
)
target_include_directories(image_sensor PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(image_sensor PUBLIC lhal)
add_dependencies(image_sensor lhal)
