_systemInit:
;Click_UART1Wire_STM.c,38 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_STM.c,40 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
MOVW	R0, #lo_addr(__UART1WIRE_UART_CFG+0)
MOVT	R0, #hi_addr(__UART1WIRE_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_UART1Wire_STM.c,41 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
MOVW	R1, #9600
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_UART1Wire_STM.c,42 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_UART1Wire_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_UART1Wire_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_UART1Wire_STM.c,43 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_UART1Wire_STM.c,44 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_UART1Wire_STM.c,46 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_STM.c,48 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_uart1wire_uartDriverInit+0
;Click_UART1Wire_STM.c,51 :: 		RXNEIE_USART3_CR1_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RXNEIE_USART3_CR1_bit+0)
MOVT	R0, #hi_addr(RXNEIE_USART3_CR1_bit+0)
_SX	[R0, ByteOffset(RXNEIE_USART3_CR1_bit+0)]
;Click_UART1Wire_STM.c,52 :: 		NVIC_IntEnable(IVT_INT_USART3);
MOVW	R0, #55
BL	_NVIC_IntEnable+0
;Click_UART1Wire_STM.c,55 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_STM.c,56 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_STM.c,57 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_STM.c,58 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,59 :: 		uart1wire_writeCommand( 0x4E );
MOVS	R0, #78
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,60 :: 		uart1wire_writeCommand( 0x00 );
MOVS	R0, #0
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,61 :: 		uart1wire_writeCommand( 0x00 );
MOVS	R0, #0
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,62 :: 		uart1wire_writeCommand( 0x60 );
MOVS	R0, #96
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,63 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_UART1Wire_STM.c,65 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_STM.c,68 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_STM.c,69 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_STM.c,70 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_STM.c,71 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,72 :: 		uart1wire_writeCommand( 0x44 );
MOVS	R0, #68
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,73 :: 		Delay_ms( 750 );
MOVW	R7, #21567
MOVT	R7, #137
NOP
NOP
L_applicationTask2:
SUBS	R7, R7, #1
BNE	L_applicationTask2
NOP
NOP
NOP
;Click_UART1Wire_STM.c,76 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_STM.c,77 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_STM.c,78 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_STM.c,79 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,80 :: 		uart1wire_writeCommand( 0xBE );
MOVS	R0, #190
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_STM.c,81 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_STM.c,83 :: 		uart1wire_readData(&dataBuffer[0], 8);
MOVS	R1, #8
MOVW	R0, #lo_addr(_dataBuffer+0)
MOVT	R0, #hi_addr(_dataBuffer+0)
BL	_uart1wire_readData+0
;Click_UART1Wire_STM.c,85 :: 		Temp = dataBuffer[ 1 ];
MOVW	R0, #lo_addr(_dataBuffer+1)
MOVT	R0, #hi_addr(_dataBuffer+1)
LDRB	R0, [R0, #0]
MOVW	R2, #lo_addr(_Temp+0)
MOVT	R2, #hi_addr(_Temp+0)
STRH	R0, [R2, #0]
;Click_UART1Wire_STM.c,86 :: 		Temp = Temp << 8;
MOV	R0, R2
LDRH	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
STRH	R1, [R2, #0]
;Click_UART1Wire_STM.c,87 :: 		Temp = Temp | dataBuffer[ 0 ];
MOVW	R0, #lo_addr(_dataBuffer+0)
MOVT	R0, #hi_addr(_dataBuffer+0)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
UXTH	R0, R0
STRH	R0, [R2, #0]
;Click_UART1Wire_STM.c,89 :: 		fTemp = Temp * 0.0625;
BL	__UnsignedIntegralToFloat+0
MOV	R2, #1031798784
BL	__Mul_FP+0
MOVW	R1, #lo_addr(_fTemp+0)
MOVT	R1, #hi_addr(_fTemp+0)
STR	R0, [R1, #0]
;Click_UART1Wire_STM.c,90 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr2_Click_UART1Wire_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_UART1Wire_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_UART1Wire_STM.c,91 :: 		FloatToStr(fTemp, demoText);
MOVW	R0, #lo_addr(_fTemp+0)
MOVT	R0, #hi_addr(_fTemp+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_UART1Wire_STM.c,92 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_UART1Wire_STM.c,94 :: 		Delay_ms( 1000 );
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_UART1Wire_STM.c,95 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_UART1Wire_STM.c,97 :: 		void main()
;Click_UART1Wire_STM.c,99 :: 		systemInit();
BL	_systemInit+0
;Click_UART1Wire_STM.c,100 :: 		applicationInit();
BL	_applicationInit+0
;Click_UART1Wire_STM.c,102 :: 		while (1)
L_main6:
;Click_UART1Wire_STM.c,104 :: 		applicationTask();
BL	_applicationTask+0
;Click_UART1Wire_STM.c,105 :: 		}
IT	AL
BAL	L_main6
;Click_UART1Wire_STM.c,106 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_UART3_Interrupt:
;Click_UART1Wire_STM.c,109 :: 		void UART3_Interrupt() iv IVT_INT_USART3 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_STM.c,111 :: 		readData = uart1wire_readByte();
BL	_uart1wire_readByte+0
MOVW	R1, #lo_addr(_readData+0)
MOVT	R1, #hi_addr(_readData+0)
STRB	R0, [R1, #0]
;Click_UART1Wire_STM.c,112 :: 		uart1wire_storage(readData, 1);
MOVS	R1, #1
BL	_uart1wire_storage+0
;Click_UART1Wire_STM.c,113 :: 		}
L_end_UART3_Interrupt:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART3_Interrupt
