set(CMAKE_SYSTEM_NAME Generic-ELF)
set(CMAKE_SYSTEM_PROCESSOR "rv32imafc")
set(CMAKE_COLOR_DIAGNOSTICS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_C_STANDARD 23)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CROSS_COMPILE "riscv64-unknown-elf-")
set(RISCV_XUANTIE_PATH /opt/homebrew/bin )

set(CMAKE_SYSROOT ${RISCV_XUANTIE_PATH}/riscv32-unknown-elf)
set(CMAKE_FIND_ROOT_PATH ${RISCV_XUANTIE_PATH})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

find_program(CMAKE_C_COMPILER NAMES ${CROSS_COMPILE}gcc)
find_program(CMAKE_CXX_COMPILER NAMES ${CROSS_COMPILE}g++)
find_program(CMAKE_OBJCOPY NAMES ${CROSS_COMPILE}objcopy)
find_program(CMAKE_OBJDUMP NAMES ${CROSS_COMPILE}objdump)

SET(MARCH "rv32imafc_zifencei_xtheadcmo_xtheadba_xtheadbb_xtheadbs_xtheadmac_xtheadmemidx")
# SET(MCPU "e907")
SET(MABI "ilp32f")


set(CMAKE_LINK_LIBRARY_USING_WHOLE_ARCHIVE_SUPPORTED True)
set(CMAKE_LINK_LIBRARY_USING_WHOLE_ARCHIVE
"-Wl,--whole-archive" "<LINK_ITEM>" "-Wl,--no-whole-archive"
)

add_compile_options(
    -march=${MARCH}
    -mabi=${MABI}
    -Os
    -Wall
    -ffunction-sections
    -fdata-sections
    -DXTHEAD_PREFIX="th."
)

add_link_options(
    -march=${MARCH}
    -mabi=${MABI}
    -Xlinker -Map=${CMAKE_PROJECT_NAME}.map
    -Wl,--print-memory-usage
    -Wl,--cref
    -Wl,--gc-sections
    -nostartfiles
    -fms-extensions
    -ffunction-sections
    -fdata-sections
    --specs=nano.specs
)
