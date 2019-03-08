/*
    __uart1wire_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __uart1wire_driver.h
@brief    UART1Wire Driver
@mainpage UART1Wire Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   UART1WIRE
@brief      UART1Wire Click Driver
@{

| Global Library Prefix | **UART1WIRE** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **jun 2018.**      |
| Developer             | **Katarina Perendic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _UART1WIRE_H_
#define _UART1WIRE_H_

/** 
 * @macro T_UART1WIRE_P
 * @brief Driver Abstract type 
 */
#define T_UART1WIRE_P    const uint8_t*

/** @defgroup UART1WIRE_COMPILE Compilation Config */              /** @{ */

//  #define   __UART1WIRE_DRV_SPI__                            /**<     @macro __UART1WIRE_DRV_SPI__  @brief SPI driver selector */
//  #define   __UART1WIRE_DRV_I2C__                            /**<     @macro __UART1WIRE_DRV_I2C__  @brief I2C driver selector */                                          
  #define   __UART1WIRE_DRV_UART__                           /**<     @macro __UART1WIRE_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup UART1WIRE_VAR Variables */                           /** @{ */

extern const uint8_t _UART1WIRE_COMMAND_MODE;
extern const uint8_t _UART1WIRE_DATA_MODE   ;
extern const uint8_t _UART1WIRE_RESET       ;
extern const uint8_t _UART1WIRE_SKIP_ROM    ;
extern const uint8_t _UART1WIRE_READ_SEQ    ;

                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup UART1WIRE_INIT Driver Initialization */              /** @{ */

#ifdef   __UART1WIRE_DRV_SPI__
void uart1wire_spiDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P spiObj);
#endif
#ifdef   __UART1WIRE_DRV_I2C__
void uart1wire_i2cDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P i2cObj, uint8_t slave);
#endif
#ifdef   __UART1WIRE_DRV_UART__
void uart1wire_uartDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void uart1wire_gpioDriverInit(T_UART1WIRE_P gpioObj);
                                                                       /** @} */
/** @defgroup UART1WIRE_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Functions for write one byte on UART
 *
 * @param[in] input  Data which be written on UART
 */
void uart1wire_writeCommand(uint8_t input);

/**
 * @brief Functions for read byte from UART
 *
 * @retval one byte data which is read from UART
 */
uint8_t uart1wire_readByte();

/**
 * @brief Functions for go to command mode
 */
void uart1wire_goToCommandMode();

/**
 * @brief Functions for go to data mode
 */
void uart1wire_goToDataMode();

/**
 * @brief Functions for generate reset pulse
 */
void uart1wire_reset();

/**
 * @brief Functions for storage read data
 *
 * @param[in] _data  data to be saved
 * @param[in] flag   flag - status read data
 */
void uart1wire_storage(uint8_t _data, uint8_t flag);

/**
 * @brief Functions for read data
 *
 * @param[in] buf     Buffer in which the read data will be stored
 * @param[in] nData   Number of bytes read
 */
void uart1wire_readData(uint8_t *buf, uint8_t nData);





                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_UART1Wire_STM.c
    @example Click_UART1Wire_TIVA.c
    @example Click_UART1Wire_CEC.c
    @example Click_UART1Wire_KINETIS.c
    @example Click_UART1Wire_MSP.c
    @example Click_UART1Wire_PIC.c
    @example Click_UART1Wire_PIC32.c
    @example Click_UART1Wire_DSPIC.c
    @example Click_UART1Wire_AVR.c
    @example Click_UART1Wire_FT90x.c
    @example Click_UART1Wire_STM.mbas
    @example Click_UART1Wire_TIVA.mbas
    @example Click_UART1Wire_CEC.mbas
    @example Click_UART1Wire_KINETIS.mbas
    @example Click_UART1Wire_MSP.mbas
    @example Click_UART1Wire_PIC.mbas
    @example Click_UART1Wire_PIC32.mbas
    @example Click_UART1Wire_DSPIC.mbas
    @example Click_UART1Wire_AVR.mbas
    @example Click_UART1Wire_FT90x.mbas
    @example Click_UART1Wire_STM.mpas
    @example Click_UART1Wire_TIVA.mpas
    @example Click_UART1Wire_CEC.mpas
    @example Click_UART1Wire_KINETIS.mpas
    @example Click_UART1Wire_MSP.mpas
    @example Click_UART1Wire_PIC.mpas
    @example Click_UART1Wire_PIC32.mpas
    @example Click_UART1Wire_DSPIC.mpas
    @example Click_UART1Wire_AVR.mpas
    @example Click_UART1Wire_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __uart1wire_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */