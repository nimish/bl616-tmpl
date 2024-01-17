
# lcd driver
if(CONFIG_BSP_LCD)
    add_subdirectory(lcd)
    add_library(common::lcd ALIAS lcd)
endif()

# audio driver
if (CONFIG_AUDIO)
 add_subdirectory(audio)
 add_library(common::audio ALIAS audio)
endif()

# ethernet driver
if (CONFIG_ETHERNET)
 add_subdirectory(ethernet)
 add_library(common::ethernet ALIAS ethernet)
endif()

# image sensor driver
if (CONFIG_IMAGE_SENSOR)
 add_subdirectory(image_sensor)
 add_library(common::image_sensor ALIAS image_sensor)

endif()

# sd card driver
if (CONFIG_BSP_SDH_SDCARD)
 add_subdirectory(sdcard)
 add_library(common::sdcard ALIAS sdcard)
endif()

# touch driver
if (CONFIG_TOUCH)
 add_subdirectory(touch)
 add_library(common::touch ALIAS touch)
endif()

