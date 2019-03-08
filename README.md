![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# UART1Wire Click

- **CIC Prefix**  : UART1WIRE
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : jun 2018.

---

### Software Support

We provide a library for the UART1Wire Click on our [LibStock](https://libstock.mikroe.com/projects/view/2439/uart-1-wire-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library initializes and defines the UART bus driver and drivers that offer a choice for writing data on UART.
The library includes function for read n data and functions for go to Command/Data mode.
The user also has the function for reset chip and storage read data.


Key functions :

- ``` void uart1wire_writeCommand(uint8_t input) ``` - Functions for write one byte on UART
- ``` uint8_t uart1wire_readByte() ``` - Functions for read byte from UART 
- ``` void uart1wire_goToCommandMode() ``` - Functions for go to command mode
- ``` void uart1wire_goToDataMode()  ``` - Functions for go to data mode
- ``` void uart1wire_readData(uint8_t *buf, uint8_t nData)  ``` - Functions for read data

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes UART module
- Application Initialization - Initializes Driver init, interrupt routine and init thermo 2 click
- Application Task - (code snippet) -  Reads the temperature from the Thermo 2 click board and logs data to UART. 
                                       Connection between Thermo 2 and UART 1 Wire is made through 1- Wire interface. 
                                       You can place thermo 2 click on mikrobus 2 socket and use side headers to make connection between click boards.


```.c
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
```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2439/uart-1-wire-click) page.

Other mikroE Libraries used in the example:

- UART
- Conversions

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
