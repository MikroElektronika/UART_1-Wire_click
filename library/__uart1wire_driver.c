/*
    __uart1wire_driver.c

-----------------------------------------------------------------------------

  This file is part of mikroSDK.

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

#include "__uart1wire_driver.h"
#include "__uart1wire_hal.c"

/* ------------------------------------------------------------------- MACROS */

const uint8_t _UART1WIRE_COMMAND_MODE = 0xE3;
const uint8_t _UART1WIRE_DATA_MODE    = 0xE1;
const uint8_t _UART1WIRE_RESET        = 0xC1;
const uint8_t _UART1WIRE_SKIP_ROM     = 0xCC;
const uint8_t _UART1WIRE_READ_SEQ     = 0xFF;

/* ---------------------------------------------------------------- VARIABLES */

#ifdef   __UART1WIRE_DRV_I2C__
static uint8_t _slaveAddress;
#endif

static uint8_t _readData;
static uint8_t _readyFlag = 0;


/* -------------------------------------------- PRIVATE FUNCTION DECLARATIONS */



/* --------------------------------------------- PRIVATE FUNCTION DEFINITIONS */



/* --------------------------------------------------------- PUBLIC FUNCTIONS */

#ifdef   __UART1WIRE_DRV_SPI__

void uart1wire_spiDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P spiObj)
{
    hal_spiMap( (T_HAL_P)spiObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __UART1WIRE_DRV_I2C__

void uart1wire_i2cDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P i2cObj, uint8_t slave)
{
    _slaveAddress = slave;
    hal_i2cMap( (T_HAL_P)i2cObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif
#ifdef   __UART1WIRE_DRV_UART__

void uart1wire_uartDriverInit(T_UART1WIRE_P gpioObj, T_UART1WIRE_P uartObj)
{
    hal_uartMap( (T_HAL_P)uartObj );
    hal_gpioMap( (T_HAL_P)gpioObj );
}

#endif

/* ----------------------------------------------------------- IMPLEMENTATION */

void uart1wire_writeCommand(uint8_t input)
{
    hal_uartWrite( input );
}

uint8_t uart1wire_readByte()
{
    return hal_uartRead();
}

void uart1wire_goToCommandMode()
{
    hal_uartWrite( _UART1WIRE_COMMAND_MODE );
}

void uart1wire_goToDataMode()
{
    hal_uartWrite( _UART1WIRE_DATA_MODE );
}

void uart1wire_reset()
{
   hal_uartWrite( _UART1WIRE_COMMAND_MODE );
   Delay_1ms();
   Delay_1ms();
   hal_uartWrite( _UART1WIRE_RESET );
}

void uart1wire_storage(uint8_t _data, uint8_t flag)
{
    _readData = _data;
    _readyFlag = flag;
}

void uart1wire_readData(uint8_t *buf, uint8_t nData)
{
    uint8_t cnt;
    
    for(cnt = 0; cnt < nData; cnt++)
    {
        _readyFlag = 0;
        hal_uartWrite(_UART1WIRE_READ_SEQ);
        while(1)
        {
            if(_readyFlag == 1)
            {
                buf[ cnt ] = _readData;
                break;
            }
        }
        Delay_10ms();
    }
}





/* -------------------------------------------------------------------------- */
/*
  __uart1wire_driver.c

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