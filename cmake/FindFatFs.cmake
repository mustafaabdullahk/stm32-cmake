set(FatFs_ROOT ${STM32_CUBE_${FAMILY}_PATH}/Middlewares/Third_Party/FatFs)

set(MSG_PREFIX "stm32-FindFatFs |")

if(FatFs_ROOT MATCHES "FatFs_ROOT-NOTFOUND")
    message(WARNING "${MSG_PREFIX} FatFs root foolder not found. FatFs might not be supported")
endif()

set(FATFS_DIR ${FatFs_ROOT})

set(FatFs_SOURCE_PATH ${STM32_CUBE_${FAMILY}_PATH}/Middlewares/Third_Party/FatFs/src)

message("fatfs source path-----> ${FatFs_SOURCE_PATH}")


if(FatFs_SOURCE_PATH MATCHES "FatFs_SOURCE_PATH-NOTFOUND")
    message(WARNING "${MSG_PREFIX} FatFs filelist CMake file not found. Build might fail")
endif()

if(IS_DIRECTORY "${FatFs_SOURCE_PATH}")
    set(FatFs_INCLUDE_DIR "${FatFs_SOURCE_PATH}")
else()
    message(WARNING "${MSG_PREFIX} FatFs include directory not found. Build might fail")
endif()

if(IS_DIRECTORY "${FatFs_SOURCE_PATH}")
    set(FatFs_SYS_SOURCES "${FatFs_SOURCE_PATH}/option/unicode.c"
                          "${FatFs_ROOT}/src/option/syscall.c"
                          "${FatFs_SOURCE_PATH}/diskio.c"
                          "${FatFs_SOURCE_PATH}/ff_gen_drv.c"
                          "${FatFs_SOURCE_PATH}/ff.c")
else()
    message(WARNING "${MSG_PREFIX} FatFs system include directory not found. Build might fail")
endif()

if(NOT (TARGET FatFs))
    add_library(FatFs INTERFACE IMPORTED)
    target_sources(FatFs INTERFACE ${FatFs_SYS_SOURCES})
    target_include_directories(FatFs INTERFACE ${FatFs_INCLUDE_DIR}
    )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FatFs
    REQUIRED_VARS FatFs_ROOT FatFs_INCLUDE_DIR FatFs_SYS_SOURCES
    FOUND_VAR FatFs_FOUND
    HANDLE_COMPONENTS
)