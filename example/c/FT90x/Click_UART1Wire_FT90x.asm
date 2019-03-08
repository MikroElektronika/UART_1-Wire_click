_systemInit:
;Click_UART1Wire_FT90x.c,36 :: 		void systemInit()
;Click_UART1Wire_FT90x.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
LDK.L	R0, #__UART1WIRE_UART_CFG+0
MOVE.L	R1, R0
LDK.L	R0, #0
CALL	_mikrobus_uartInit+0
;Click_UART1Wire_FT90x.c,39 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
LDK.L	R1, #9600
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_UART1Wire_FT90x.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
LDK.L	R0, #?lstr1_Click_UART1Wire_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_UART1Wire_FT90x.c,41 :: 		Delay_ms( 100 );
LPM.L	R28, #3333331
NOP	
L_systemInit0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_systemInit0
JMP	$+8
	#3333331
NOP	
NOP	
;Click_UART1Wire_FT90x.c,42 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_UART1Wire_FT90x.c,44 :: 		void applicationInit()
;Click_UART1Wire_FT90x.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
LDK.L	R1, #__MIKROBUS1_UART+0
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_uart1wire_uartDriverInit+0
;Click_UART1Wire_FT90x.c,49 :: 		UART2_FCR |= ( 1 << FIFO_EN ) | ( 1 << RCVR_RST );
LDA.B	R0, UART2_FCR+0
OR.L	R0, R0, #3
STA.B	UART2_FCR+0, R0
;Click_UART1Wire_FT90x.c,50 :: 		UART2_INT_ENABLE |= ( 1 << RX_AVL_EN );
LDA.B	R0, UART2_INT_ENABLE+0
OR.L	R0, R0, #1
STA.B	UART2_INT_ENABLE+0, R0
;Click_UART1Wire_FT90x.c,51 :: 		IRQ_CTRL &= ~( 1 << GLOBAL_INTERRUPT_MASK );;
LDA.L	R1, IRQ_CTRL+0
LDK.L	R0, #2147483647
LDL.L	R0, R0, #2147483647
AND.L	R0, R1, R0
STA.L	IRQ_CTRL+0, R0
;Click_UART1Wire_FT90x.c,54 :: 		uart1wire_reset();
CALL	_uart1wire_reset+0
;Click_UART1Wire_FT90x.c,55 :: 		uart1wire_goToDataMode();
CALL	_uart1wire_goToDataMode+0
;Click_UART1Wire_FT90x.c,56 :: 		Delay_10ms();
CALL	_Delay_10ms+0
;Click_UART1Wire_FT90x.c,57 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
LDK.L	R0, __UART1WIRE_SKIP_ROM
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,58 :: 		uart1wire_writeCommand( 0x4E );
LDK.L	R0, #78
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,59 :: 		uart1wire_writeCommand( 0x00 );
LDK.L	R0, #0
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,60 :: 		uart1wire_writeCommand( 0x00 );
LDK.L	R0, #0
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,61 :: 		uart1wire_writeCommand( 0x60 );
LDK.L	R0, #96
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,62 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_UART1Wire_FT90x.c,64 :: 		void applicationTask()
;Click_UART1Wire_FT90x.c,67 :: 		uart1wire_reset();
CALL	_uart1wire_reset+0
;Click_UART1Wire_FT90x.c,68 :: 		uart1wire_goToDataMode();
CALL	_uart1wire_goToDataMode+0
;Click_UART1Wire_FT90x.c,69 :: 		Delay_10ms();
CALL	_Delay_10ms+0
;Click_UART1Wire_FT90x.c,70 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
LDK.L	R0, __UART1WIRE_SKIP_ROM
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,71 :: 		uart1wire_writeCommand( 0x44 );
LDK.L	R0, #68
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,72 :: 		Delay_ms( 750 );
LPM.L	R28, #24999998
NOP	
L_applicationTask2:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask2
JMP	$+8
	#24999998
NOP	
;Click_UART1Wire_FT90x.c,75 :: 		uart1wire_reset();
CALL	_uart1wire_reset+0
;Click_UART1Wire_FT90x.c,76 :: 		uart1wire_goToDataMode();
CALL	_uart1wire_goToDataMode+0
;Click_UART1Wire_FT90x.c,77 :: 		Delay_10ms();
CALL	_Delay_10ms+0
;Click_UART1Wire_FT90x.c,78 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
LDK.L	R0, __UART1WIRE_SKIP_ROM
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,79 :: 		uart1wire_writeCommand( 0xBE );
LDK.L	R0, #190
CALL	_uart1wire_writeCommand+0
;Click_UART1Wire_FT90x.c,80 :: 		Delay_10ms();
CALL	_Delay_10ms+0
;Click_UART1Wire_FT90x.c,82 :: 		uart1wire_readData(&dataBuffer[0], 8);
LDK.L	R1, #8
LDK.L	R0, #_dataBuffer+0
CALL	_uart1wire_readData+0
;Click_UART1Wire_FT90x.c,84 :: 		Temp = dataBuffer[ 1 ];
LDA.B	R0, _dataBuffer+1
STA.S	_Temp+0, R0
;Click_UART1Wire_FT90x.c,85 :: 		Temp = Temp << 8;
LDA.S	R0, _Temp+0
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
STA.S	_Temp+0, R1
;Click_UART1Wire_FT90x.c,86 :: 		Temp = Temp | dataBuffer[ 0 ];
LDA.B	R0, _dataBuffer+0
OR.L	R0, R1, R0
BEXTU.L	R0, R0, #0
STA.S	_Temp+0, R0
;Click_UART1Wire_FT90x.c,88 :: 		fTemp = Temp * 0.0625;
BEXTU.L	R4, R0, #0
CALL	__Unsigned16IntToFloat+0
MOVE.L	R4, R0
LDK.L	R6, #1031798784
LDL.L	R6, R6, #1031798784
CALL	__Mul_FP+0
STA.L	_fTemp+0, R0
;Click_UART1Wire_FT90x.c,89 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
LDK.L	R0, #?lstr2_Click_UART1Wire_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_UART1Wire_FT90x.c,90 :: 		FloatToStr(fTemp, demoText);
LDA.L	R0, _fTemp+0
LDK.L	R1, #_demoText+0
CALL	_FloatToStr+0
;Click_UART1Wire_FT90x.c,91 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
LDK.L	R1, #2
LDK.L	R0, #_demoText+0
CALL	_mikrobus_logWrite+0
;Click_UART1Wire_FT90x.c,93 :: 		Delay_ms( 1000 );
LPM.L	R28, #33333331
NOP	
L_applicationTask4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask4
JMP	$+8
	#33333331
NOP	
NOP	
;Click_UART1Wire_FT90x.c,94 :: 		}
L_end_applicationTask:
RETURN	
; end of _applicationTask
_main:
;Click_UART1Wire_FT90x.c,96 :: 		void main()
LDK.L	SP, #43605
;Click_UART1Wire_FT90x.c,98 :: 		systemInit();
CALL	_systemInit+0
;Click_UART1Wire_FT90x.c,99 :: 		applicationInit();
CALL	_applicationInit+0
;Click_UART1Wire_FT90x.c,101 :: 		while (1)
L_main6:
;Click_UART1Wire_FT90x.c,103 :: 		applicationTask();
CALL	_applicationTask+0
;Click_UART1Wire_FT90x.c,104 :: 		}
JMP	L_main6
;Click_UART1Wire_FT90x.c,105 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
_UART_Interrupt:
;Click_UART1Wire_FT90x.c,108 :: 		void UART_Interrupt() iv IVT_UART2_IRQ ics ICS_AUTO
;Click_UART1Wire_FT90x.c,110 :: 		if( UART2_LSR & ( 1 << DATA_RDY ) )
LDA.B	R0, UART2_LSR+0
AND.L	R0, R0, #1
CMP.B	R0, #0
JMPC	R30, Z, #1, L_UART_Interrupt8
;Click_UART1Wire_FT90x.c,112 :: 		readData = uart1wire_readByte();
CALL	_uart1wire_readByte+0
STA.B	_readData+0, R0
;Click_UART1Wire_FT90x.c,113 :: 		uart1wire_storage(readData, 1);
LDK.L	R1, #1
CALL	_uart1wire_storage+0
;Click_UART1Wire_FT90x.c,114 :: 		}
L_UART_Interrupt8:
;Click_UART1Wire_FT90x.c,115 :: 		}
L_end_UART_Interrupt:
RETI	
; end of _UART_Interrupt
