/*
Example for UART1Wire Click

    Date          : jun 2018.
    Author        : Katarina Perendic

Test configuration AVR :
    
    MCU              : ATMEGA32
    Dev. Board       : EasyAVR v7 
    AVR Compiler ver : v7.0.1.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes UART module
- Application Initialization - Initializes Driver init, interrupt routine and init thermo 2 click
- Application Task - (code snippet) -  Reads the temperature from the Thermo 2 click board and logs data to UART. 
                                       Connection between Thermo 2 and UART 1 Wire is made through 1- Wire interface. 
                                       You can place thermo 2 click on mikrobus 2 socket and use side headers to make connection between click boards.

*/

#include "Click_UART1Wire_types.h"
#include "Click_UART1Wire_config.h"

uint8_t readData;
uint8_t dataBuffer[ 10 ] = {0};
uint16_t Temp;
float fTemp;
char demoText[ 50 ];

void systemInit()
{
    mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
    mikrobus_logInit( _LOG_USBUART, 9600 );
    mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
    Delay_ms( 100 );
}

void applicationInit()
{
    uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );

    // Interrupt init
    UCSRB |= ( 1 << RXCIE );
    SREG  |= ( 1 << SREG_I );

    /* Init THERMO 2 click */
    uart1wire_reset();
    uart1wire_goToDataMode();
    Delay_10ms();
    uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
    uart1wire_writeCommand( 0x4E );
    uart1wire_writeCommand( 0x00 );
    uart1wire_writeCommand( 0x00 );
    uart1wire_writeCommand( 0x60 );
}

void applicationTask()
{
    /* Start converzion */
    uart1wire_reset();
    uart1wire_goToDataMode();
    Delay_10ms();
    uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
    uart1wire_writeCommand( 0x44 );
    Delay_ms( 750 );

    /* Start reading temperature */
    uart1wire_reset();
    uart1wire_goToDataMode();
    Delay_10ms();
    uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
    uart1wire_writeCommand( 0xBE );
    Delay_10ms();

    uart1wire_readData(&dataBuffer[0], 8);

    Temp = dataBuffer[ 1 ];
    Temp = Temp << 8;
    Temp = Temp | dataBuffer[ 0 ];

    fTemp = Temp * 0.0625;
    mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
    FloatToStr(fTemp, demoText);
    mikrobus_logWrite(demoText, _LOG_LINE);

    Delay_ms( 1000 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
            applicationTask();
    }
}

/* INTERRUPT */
void UART_Interrupt()iv IVT_ADDR_USART__RXC ics ICS_AUTO
{
    readData = uart1wire_readByte();
    uart1wire_storage(readData, 1);
}