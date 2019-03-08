#line 1 "D:/Clicks_git/UART_1-Wire_Click/SW/example/c/ARM/TIVA/Click_UART1Wire_TIVA.c"
#line 1 "d:/clicks_git/uart_1-wire_click/sw/example/c/arm/tiva/click_uart1wire_types.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 1 "d:/clicks_git/uart_1-wire_click/sw/example/c/arm/tiva/click_uart1wire_config.h"
#line 1 "d:/clicks_git/uart_1-wire_click/sw/example/c/arm/tiva/click_uart1wire_types.h"
#line 22 "d:/clicks_git/uart_1-wire_click/sw/example/c/arm/tiva/click_uart1wire_config.h"
const uint32_t _UART1WIRE_UART_CFG[ 6 ] =
{
 9600,
 0,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT,
 _UART_HIGH_SPEED
};
#line 1 "d:/clicks_git/uart_1-wire_click/sw/library/__uart1wire_driver.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 57 "d:/clicks_git/uart_1-wire_click/sw/library/__uart1wire_driver.h"
extern const uint8_t _UART1WIRE_COMMAND_MODE;
extern const uint8_t _UART1WIRE_DATA_MODE ;
extern const uint8_t _UART1WIRE_RESET ;
extern const uint8_t _UART1WIRE_SKIP_ROM ;
extern const uint8_t _UART1WIRE_READ_SEQ ;
#line 77 "d:/clicks_git/uart_1-wire_click/sw/library/__uart1wire_driver.h"
void uart1wire_uartDriverInit( const uint8_t*  gpioObj,  const uint8_t*  uartObj);



void uart1wire_gpioDriverInit( const uint8_t*  gpioObj);



void uart1wire_writeCommand(uint8_t input);

uint8_t uart1wire_readByte();

void uart1wire_goToCommandMode();

void uart1wire_goToDataMode();

void uart1wire_reset();

void uart1wire_storage(uint8_t _data, uint8_t flag);

void uart1wire_readData(uint8_t *buf, uint8_t nData);
#line 30 "D:/Clicks_git/UART_1-Wire_Click/SW/example/c/ARM/TIVA/Click_UART1Wire_TIVA.c"
uint8_t readData;
uint8_t dataBuffer[ 10 ] = {0};
uint16_t Temp;
float fTemp;
char demoText[ 50 ];

void systemInit()
{
 mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
 mikrobus_logInit( _LOG_USBUART_B, 9600 );
 mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
 Delay_ms( 100 );
}

void applicationInit()
{
 uart1wire_uartDriverInit( ( const uint8_t* )&_MIKROBUS1_GPIO, ( const uint8_t* )&_MIKROBUS1_UART );


 UART_IM_RXIM_UART5_IM_bit = 1;
 NVIC_IntEnable(IVT_INT_UART5);
 EnableInterrupts();


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

 uart1wire_reset();
 uart1wire_goToDataMode();
 Delay_10ms();
 uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
 uart1wire_writeCommand( 0x44 );
 Delay_ms( 750 );


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


void UART5_RX_ISR()iv IVT_INT_UART5 ics ICS_AUTO
{
 readData = uart1wire_readByte();
 uart1wire_storage(readData, 1);
}
