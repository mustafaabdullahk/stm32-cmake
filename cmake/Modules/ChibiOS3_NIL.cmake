SET(CHIBIOS_nil_SEARCH_PATH 
  ${CHIBIOS_ROOT}/os/nil/src
  ${CHIBIOS_ROOT}/os/nil/include
  ${CHIBIOS_ROOT}/os/nil/ports/ARMCMx
  ${CHIBIOS_ROOT}/os/nil/ports/ARMCMx/compilers/GCC
  ${CHIBIOS_ROOT}/os/common/ports/ARMCMx/compilers/GCC
  ${CHIBIOS_ROOT}/os/nil/src
)
SET(CHIBIOS_nil_SEARCH_HEADERS
  nil.h
  nilcore.h
  niltypes.h
)
SET(CHIBIOS_nil_SOURCES  
  crt0.c
  vectors.c
  nilcore.c
  nilcore_v7m.c
  nil.c
  nilcoreasm_v7m.s
)

IF(STM32_FAMILY STREQUAL "F1")
  SET(CHIBIOS_nil_PLATFORM_SEARCH_PATH
    ${CHIBIOS_ROOT}/os/common/ports/ARMCMx/devices/STM32F1xx
    ${CHIBIOS_ROOT}/os/ext/CMSIS/include
    ${CHIBIOS_ROOT}/os/ext/CMSIS/ST
  )
  SET(CHIBIOS_nil_PLATFORM_SEARCH_HEADERS
    core_cm3.h
    stm32f10x.h
    cmparams.h
  )
ENDIF()