add_library(libc STATIC
    printf.c
    snprintf.c
    sprintf.c
    vsnprintf.c
    vsprintf.c
    # sscanf.c
    nuttx/libc/stdlib/lib_abs.c
    nuttx/libc/stdlib/lib_atof.c
    nuttx/libc/stdlib/lib_atoi.c
    nuttx/libc/stdlib/lib_atol.c
    nuttx/libc/stdlib/lib_atoll.c
    nuttx/libc/stdlib/lib_bsearch.c
    nuttx/libc/stdlib/lib_checkbase.c
    nuttx/libc/stdlib/lib_itoa.c
    nuttx/libc/stdlib/lib_llabs.c
    nuttx/libc/stdlib/lib_lldiv.c
    nuttx/libc/stdlib/lib_qsort.c
    nuttx/libc/stdlib/lib_strtod.c
    nuttx/libc/stdlib/lib_strtof.c
    nuttx/libc/stdlib/lib_strtol.c
    nuttx/libc/stdlib/lib_strtold.c
    nuttx/libc/stdlib/lib_strtoll.c
    nuttx/libc/stdlib/lib_strtoull.c
    nuttx/libc/string/lib_ffs.c
    nuttx/libc/string/lib_ffsl.c
    nuttx/libc/string/lib_ffsll.c
    nuttx/libc/string/lib_fls.c
    nuttx/libc/string/lib_flsl.c
    nuttx/libc/string/lib_flsll.c
    nuttx/libc/string/lib_index.c
    nuttx/libc/string/lib_memccpy.c
    nuttx/libc/string/lib_memchr.c
    nuttx/libc/string/lib_memcmp.c
    nuttx/libc/string/lib_memmove.c
    nuttx/libc/string/lib_memrchr.c
    nuttx/libc/string/lib_memset.c
    nuttx/libc/string/lib_stpcpy.c
    nuttx/libc/string/lib_stpncpy.c
    nuttx/libc/string/lib_strcasecmp.c
    nuttx/libc/string/lib_strcasestr.c
    nuttx/libc/string/lib_strcat.c
    nuttx/libc/string/lib_strchr.c
    nuttx/libc/string/lib_strcmp.c
    nuttx/libc/string/lib_strcspn.c
    nuttx/libc/string/lib_strdup.c
    nuttx/libc/string/lib_strnlen.c
    nuttx/libc/string/lib_strpbrk.c
    nuttx/libc/string/lib_strrchr.c
    nuttx/libc/string/lib_strsep.c
    nuttx/libc/string/lib_strspn.c
    nuttx/libc/string/lib_strstr.c
    nuttx/libc/string/lib_strtok.c
    nuttx/libc/string/lib_strtokr.c
    # nuttx/libc/string/lib_isbasedigit.c
    # nuttx/libc/string/lib_skipspace.c
    nuttx/libc/string/lib_vikmemcpy.c
)
target_compile_definitions(libc PRIVATE
    CONFIG_LIBC_FLOAT=1
    CONFIG_LIBC_FLOAT_EX=1
    CONFIG_LIBC_LONG_LONG=1
)
# target_link_options(libc PUBLIC -Wl,-wrap,sscanf)
# use custom apis first, if not exist, then use builtin apis
target_compile_options(libc PRIVATE -fno-builtin)

target_link_libraries(libc PUBLIC lhal)

target_include_directories(libc PRIVATE .)
