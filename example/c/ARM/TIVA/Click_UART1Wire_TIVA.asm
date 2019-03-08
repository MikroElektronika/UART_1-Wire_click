_systemInit:
;Click_UART1Wire_TIVA.c,36 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_TIVA.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
MOVW	R0, #lo_addr(__UART1WIRE_UART_CFG+0)
MOVT	R0, #hi_addr(__UART1WIRE_UART_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_uartInit+0
;Click_UART1Wire_TIVA.c,39 :: 		mikrobus_logInit( _LOG_USBUART_B, 9600 );
MOVW	R1, #9600
MOVS	R0, #48
BL	_mikrobus_logInit+0
;Click_UART1Wire_TIVA.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_UART1Wire_TIVA+0)
MOVT	R0, #hi_addr(?lstr1_Click_UART1Wire_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_UART1Wire_TIVA.c,41 :: 		Delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_UART1Wire_TIVA.c,42 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_UART1Wire_TIVA.c,44 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_TIVA.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
MOVW	R1, #lo_addr(__MIKROBUS1_UART+0)
MOVT	R1, #hi_addr(__MIKROBUS1_UART+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_uart1wire_uartDriverInit+0
;Click_UART1Wire_TIVA.c,49 :: 		UART_IM_RXIM_UART5_IM_bit = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(UART_IM_RXIM_UART5_IM_bit+0)
MOVT	R0, #hi_addr(UART_IM_RXIM_UART5_IM_bit+0)
_SX	[R0, ByteOffset(UART_IM_RXIM_UART5_IM_bit+0)]
;Click_UART1Wire_TIVA.c,50 :: 		NVIC_IntEnable(IVT_INT_UART5);
MOVW	R0, #74
BL	_NVIC_IntEnable+0
;Click_UART1Wire_TIVA.c,51 :: 		EnableInterrupts();
BL	_EnableInterrupts+0
;Click_UART1Wire_TIVA.c,54 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_TIVA.c,55 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_TIVA.c,56 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_TIVA.c,57 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,58 :: 		uart1wire_writeCommand( 0x4E );
MOVS	R0, #78
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,59 :: 		uart1wire_writeCommand( 0x00 );
MOVS	R0, #0
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,60 :: 		uart1wire_writeCommand( 0x00 );
MOVS	R0, #0
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,61 :: 		uart1wire_writeCommand( 0x60 );
MOVS	R0, #96
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,62 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_UART1Wire_TIVA.c,64 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_TIVA.c,67 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_TIVA.c,68 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_TIVA.c,69 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_TIVA.c,70 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,71 :: 		uart1wire_writeCommand( 0x44 );
MOVS	R0, #68
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,72 :: 		Delay_ms( 750 );
MOVW	R7, #50046
MOVT	R7, #457
NOP
NOP
L_applicationTask2:
SUBS	R7, R7, #1
BNE	L_applicationTask2
NOP
NOP
NOP
;Click_UART1Wire_TIVA.c,75 :: 		uart1wire_reset();
BL	_uart1wire_reset+0
;Click_UART1Wire_TIVA.c,76 :: 		uart1wire_goToDataMode();
BL	_uart1wire_goToDataMode+0
;Click_UART1Wire_TIVA.c,77 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_TIVA.c,78 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
MOVS	R0, __UART1WIRE_SKIP_ROM
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,79 :: 		uart1wire_writeCommand( 0xBE );
MOVS	R0, #190
BL	_uart1wire_writeCommand+0
;Click_UART1Wire_TIVA.c,80 :: 		Delay_10ms();
BL	_Delay_10ms+0
;Click_UART1Wire_TIVA.c,82 :: 		uart1wire_readData(&dataBuffer[0], 8);
MOVS	R1, #8
MOVW	R0, #lo_addr(_dataBuffer+0)
MOVT	R0, #hi_addr(_dataBuffer+0)
BL	_uart1wire_readData+0
;Click_UART1Wire_TIVA.c,84 :: 		Temp = dataBuffer[ 1 ];
MOVW	R0, #lo_addr(_dataBuffer+1)
MOVT	R0, #hi_addr(_dataBuffer+1)
LDRB	R0, [R0, #0]
MOVW	R2, #lo_addr(_Temp+0)
MOVT	R2, #hi_addr(_Temp+0)
STRH	R0, [R2, #0]
;Click_UART1Wire_TIVA.c,85 :: 		Temp = Temp << 8;
MOV	R0, R2
LDRH	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
STRH	R1, [R2, #0]
;Click_UART1Wire_TIVA.c,86 :: 		Temp = Temp | dataBuffer[ 0 ];
MOVW	R0, #lo_addr(_dataBuffer+0)
MOVT	R0, #hi_addr(_dataBuffer+0)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
UXTH	R0, R0
STRH	R0, [R2, #0]
;Click_UART1Wire_TIVA.c,88 :: 		fTemp = Temp * 0.0625;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOV	R0, #1031798784
VMOV	S0, R0
VMUL.F32	S0, S1, S0
MOVW	R0, #lo_addr(_fTemp+0)
MOVT	R0, #hi_addr(_fTemp+0)
VSTR	#1, S0, [R0, #0]
;Click_UART1Wire_TIVA.c,89 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr2_Click_UART1Wire_TIVA+0)
MOVT	R0, #hi_addr(?lstr2_Click_UART1Wire_TIVA+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_UART1Wire_TIVA.c,90 :: 		FloatToStr(fTemp, demoText);
MOVW	R0, #lo_addr(_fTemp+0)
MOVT	R0, #hi_addr(_fTemp+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_UART1Wire_TIVA.c,91 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_UART1Wire_TIVA.c,93 :: 		Delay_ms( 1000 );
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_applicationTask4:
SUBS	R7, R7, #1
BNE	L_applicationTask4
NOP
NOP
NOP
;Click_UART1Wire_TIVA.c,94 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_UART1Wire_TIVA.c,96 :: 		void main()
;Click_UART1Wire_TIVA.c,98 :: 		systemInit();
BL	_systemInit+0
;Click_UART1Wire_TIVA.c,99 :: 		applicationInit();
BL	_applicationInit+0
;Click_UART1Wire_TIVA.c,101 :: 		while (1)
L_main6:
;Click_UART1Wire_TIVA.c,103 :: 		applicationTask();
BL	_applicationTask+0
;Click_UART1Wire_TIVA.c,104 :: 		}
IT	AL
BAL	L_main6
;Click_UART1Wire_TIVA.c,105 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_UART5_RX_ISR:
;Click_UART1Wire_TIVA.c,108 :: 		void UART5_RX_ISR()iv IVT_INT_UART5 ics ICS_AUTO
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_UART1Wire_TIVA.c,110 :: 		readData = uart1wire_readByte();
BL	_uart1wire_readByte+0
MOVW	R1, #lo_addr(_readData+0)
MOVT	R1, #hi_addr(_readData+0)
STRB	R0, [R1, #0]
;Click_UART1Wire_TIVA.c,111 :: 		uart1wire_storage(readData, 1);
MOVS	R1, #1
BL	_uart1wire_storage+0
;Click_UART1Wire_TIVA.c,112 :: 		}
L_end_UART5_RX_ISR:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _UART5_RX_ISR
