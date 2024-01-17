add_library(cherryusb STATIC core/usbd_core.c)
target_include_directories(cherryusb PUBLIC
    common
    osal
    core
)

target_compile_definitions(cherryusb PUBLIC CONFIG_CHERRYUSB)
# target_sources(cherryusb PRIVATE core/usbd_core.c)
target_compile_definitions(cherryusb PUBLIC CONFIG_USB_ALIGN_SIZE=32 CONFIG_USB_HS)





if(CONFIG_CHERRYUSB_DEVICE_CDC)
    target_include_directories(cherryusb PUBLIC class/cdc)
    target_sources(cherryusb PRIVATE class/cdc/usbd_cdc.c)
endif()
if(CONFIG_CHERRYUSB_DEVICE_HID)
    target_include_directories(cherryusb PUBLIC class/hid)
    target_sources(cherryusb PRIVATE class/hid/usbd_hid.c)
endif()
if(CONFIG_CHERRYUSB_DEVICE_MSC)
    target_include_directories(cherryusb PUBLIC class/msc)
    target_sources(cherryusb PRIVATE class/msc/usbd_msc.c)
endif()
if(CONFIG_CHERRYUSB_DEVICE_AUDIO)
    target_include_directories(cherryusb PUBLIC class/audio)
    target_sources(cherryusb PRIVATE class/audio/usbd_audio.c)
endif()
if(CONFIG_CHERRYUSB_DEVICE_VIDEO)
    target_include_directories(cherryusb PUBLIC class/video)
    target_sources(cherryusb PRIVATE class/video/usbd_video.c)
endif()


