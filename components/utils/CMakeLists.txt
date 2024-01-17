add_library(utils STATIC
    log/log.c)

target_link_libraries(utils PUBLIC lhal)
target_include_directories(utils PUBLIC log)
add_dependencies(utils lhal)

target_compile_definitions(utils
    PUBLIC
        CONFIG_LOG_NCOLOR=1
        CONFIG_LOG_LEVEL=3
        # CONFIG_LOG_DISABLE
        # CONFIG_ASSERT_DISABLE
        # CONFIG_LOG_POOL_SIZE=${CONFIG_LOG_POOL_SIZE}
)


if(CONFIG_BFLOG)
    target_compile_definitions(utils PUBLIC CONFIG_BFLOG)
    target_sources(utils PRIVATE log/bflog/bflog.c)
    target_include_directories(utils PUBLIC log/bflog)
    if(CONFIG_FREERTOS)
        target_sources(utils PRIVATE log/log_freertos.c)
    endif()
    if(CONFIG_BFLOG_DEBUG)
        target_compile_definitions(utils PUBLIC CONFIG_BFLOG_DEBUG)
    endif()
endif()

# ring_buffer
target_sources(utils PRIVATE ring_buffer/ring_buffer.c)
target_include_directories(utils PUBLIC ring_buffer)

# bflb block pool debug enable
if (CONFIG_BFLB_BLOCK_POOL_DEBUG)
    target_compile_definitions(utils PUBLIC CONFIG_BFLB_BLOCK_POOL_DEBUG)
endif()

# bflb block pool mutex
if (CONFIG_BFLB_BLOCK_POOL_MTX_TIMEOUT)
    target_compile_definitions(utils PUBLIC CONFIG_BFLB_BLOCK_POOL_MTX_TIMEOUT=${CONFIG_BFLB_BLOCK_POOL_MTX_TIMEOUT})
endif()

# bflb block pool
target_sources(utils PRIVATE bflb_block_pool/bflb_block_pool.c)
target_include_directories(utils PUBLIC bflb_block_pool)


#cjson
target_sources(utils PRIVATE cjson/cJSON.c)
target_include_directories(utils PUBLIC cjson)

# math
target_sources(utils PRIVATE math/src/utils_base64.c math/src/utils_crc.c math/src/utils_hex.c)
target_include_directories(utils PUBLIC math/include)

# timestamp

if(DEFINED CONFIG_TIMEZONE)
    target_compile_definitions(utils PUBLIC BFLB_TIMESTAMP_TIMEZONE=${CONFIG_TIMEZONE})
else()
    target_compile_definitions(utils PUBLIC BFLB_TIMESTAMP_TIMEZONE=8)
endif()

target_sources(utils PRIVATE bflb_timestamp/bflb_timestamp.c)
target_include_directories(utils PUBLIC bflb_timestamp)

# getopt
target_sources(utils PRIVATE getopt/utils_getopt.c)
target_include_directories(utils PUBLIC getopt)


# coredump
if(CONFIG_COREDUMP)
    target_compile_definitions(utils PUBLIC CONFIG_COREDUMP)
    target_sources(coredump/bflb_coredump.c)
    target_include_directories(coredump)
endif()

# partition
if(CONFIG_PARTITION)
    target_sources(utils PRIVATE partition/partition.c)
    target_include_directories(utils PUBLIC partition)
endif()

# blmtd
if(CONFIG_BFLB_MTD)
    target_sources(utils PRIVATE bflb_mtd/bflb_mtd.c bflb_mtd/bflb_boot2.c)
    target_include_directories(utils PUBLIC bflb_mtd/include)
endif()

# ota
if(CONFIG_BFLB_OTA)
    target_sources(utils PRIVATE bflb_ota/bflb_ota.c bflb_ota/utils_sha256.c)
    target_include_directories(utils PUBLIC bflb_ota)
endif()
