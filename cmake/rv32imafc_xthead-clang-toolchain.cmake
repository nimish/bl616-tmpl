set(CMAKE_SYSTEM_NAME Generic-ELF)
set(CMAKE_SYSTEM_PROCESSOR "rv32imafc_xtheade")
set(CMAKE_C_COMPILER_WORKS TRUE)
set(CMAKE_COLOR_DIAGNOSTICS ON)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_CROSSCOMPILING TRUE)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_C_COMPILER /opt/homebrew/opt/llvm/bin/clang)
set(CMAKE_CXX_COMPILER /opt/homebrew/opt/llvm/bin/clang)


set(CROSS_COMPILE "riscv32-unknown-elf-")
set(RISCV_XUANTIE_PATH /Users/nimish/Projects/xuantie-gnu-toolchain/opt/riscv-xuantie)

set(CMAKE_SYSROOT ${RISCV_XUANTIE_PATH}/riscv32-unknown-elf)
set(CMAKE_FIND_ROOT_PATH ${RISCV_XUANTIE_PATH})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


find_program(CMAKE_OBJCOPY ${CROSS_COMPILE}objcopy)
find_program(CMAKE_OBJDUMP ${CROSS_COMPILE}objdump)
find_program(CMAKE_READELF ${CROSS_COMPILE}readelf)
find_program(CMAKE_NM ${CROSS_COMPILE}nm)
find_program(CMAKE_AR ${CROSS_COMPILE}ar)
find_program(CMAKE_RANLIB ${CROSS_COMPILE}ranlib)
find_program(CMAKE_SIZE ${CROSS_COMPILE}size)
find_program(CMAKE_STRIP ${CROSS_COMPILE}strip)

SET(MARCH "rv32imaf_xtheadcmo_xtheadba_xtheadbb_xtheadbs_xtheadmac_xtheadmemidx")
SET(MABI "ilp32f")

add_compile_definitions(XTHEAD_PREFIX="th.")

add_compile_options(
    --target=riscv32-unknown-elf
    -march=${MARCH}
    -mabi=${MABI}
)
add_link_options(
    --target=riscv32-unknown-elf
    -march=${MARCH}
    -mabi=${MABI}
)

