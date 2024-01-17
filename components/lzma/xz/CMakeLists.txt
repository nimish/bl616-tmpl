add_library(xz STATIC xz_crc32.c xz_dec_lzma2.c xz_dec_stream.c xz_decompress.c xz_port.c)
target_include_directories(xz PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
