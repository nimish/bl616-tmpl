if (CONFIG_MQTT)
    add_subdirectory(mqtt)
endif()

if(CONFIG_RTSP)
    add_subdirectory(rtsp)
endif()

