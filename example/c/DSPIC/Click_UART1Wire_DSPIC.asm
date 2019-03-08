
_systemInit:

;Click_UART1Wire_DSPIC.c,36 :: 		void systemInit()
;Click_UART1Wire_DSPIC.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(__UART1WIRE_UART_CFG), W0
	MOV	W0, W11
	CLR	W10
	CALL	_mikrobus_uartInit
;Click_UART1Wire_DSPIC.c,39 :: 		mikrobus_logInit( _LOG_USBUART_B, 9600 );
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#48, W10
	CALL	_mikrobus_logInit
;Click_UART1Wire_DSPIC.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_Click_UART1Wire_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_UART1Wire_DSPIC.c,41 :: 		Delay_ms( 100 );
	MOV	#3, W8
	MOV	#2261, W7
L_systemInit0:
	DEC	W7
	BRA NZ	L_systemInit0
	DEC	W8
	BRA NZ	L_systemInit0
;Click_UART1Wire_DSPIC.c,42 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_UART1Wire_DSPIC.c,44 :: 		void applicationInit()
;Click_UART1Wire_DSPIC.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(__MIKROBUS1_UART), W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_uart1wire_uartDriverInit
;Click_UART1Wire_DSPIC.c,49 :: 		U2RXIF_bit   = 0;
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
;Click_UART1Wire_DSPIC.c,50 :: 		U2RXIE_bit   = 1;
	BSET	U2RXIE_bit, BitPos(U2RXIE_bit+0)
;Click_UART1Wire_DSPIC.c,53 :: 		uart1wire_reset();
	CALL	_uart1wire_reset
;Click_UART1Wire_DSPIC.c,54 :: 		uart1wire_goToDataMode();
	CALL	_uart1wire_goToDataMode
;Click_UART1Wire_DSPIC.c,55 :: 		Delay_10ms();
	CALL	_Delay_10ms
;Click_UART1Wire_DSPIC.c,56 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOV.B	#__UART1WIRE_SKIP_ROM, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,57 :: 		uart1wire_writeCommand( 0x4E );
	MOV.B	#78, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,58 :: 		uart1wire_writeCommand( 0x00 );
	CLR	W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,59 :: 		uart1wire_writeCommand( 0x00 );
	CLR	W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,60 :: 		uart1wire_writeCommand( 0x60 );
	MOV.B	#96, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,61 :: 		}
L_end_applicationInit:
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:

;Click_UART1Wire_DSPIC.c,63 :: 		void applicationTask()
;Click_UART1Wire_DSPIC.c,66 :: 		uart1wire_reset();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_uart1wire_reset
;Click_UART1Wire_DSPIC.c,67 :: 		uart1wire_goToDataMode();
	CALL	_uart1wire_goToDataMode
;Click_UART1Wire_DSPIC.c,68 :: 		Delay_10ms();
	CALL	_Delay_10ms
;Click_UART1Wire_DSPIC.c,69 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOV.B	#__UART1WIRE_SKIP_ROM, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,70 :: 		uart1wire_writeCommand( 0x44 );
	MOV.B	#68, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,71 :: 		Delay_ms( 750 );
	MOV	#16, W8
	MOV	#16964, W7
L_applicationTask2:
	DEC	W7
	BRA NZ	L_applicationTask2
	DEC	W8
	BRA NZ	L_applicationTask2
;Click_UART1Wire_DSPIC.c,74 :: 		uart1wire_reset();
	CALL	_uart1wire_reset
;Click_UART1Wire_DSPIC.c,75 :: 		uart1wire_goToDataMode();
	CALL	_uart1wire_goToDataMode
;Click_UART1Wire_DSPIC.c,76 :: 		Delay_10ms();
	CALL	_Delay_10ms
;Click_UART1Wire_DSPIC.c,77 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOV.B	#__UART1WIRE_SKIP_ROM, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,78 :: 		uart1wire_writeCommand( 0xBE );
	MOV.B	#190, W10
	CALL	_uart1wire_writeCommand
;Click_UART1Wire_DSPIC.c,79 :: 		Delay_10ms();
	CALL	_Delay_10ms
;Click_UART1Wire_DSPIC.c,81 :: 		uart1wire_readData(&dataBuffer[0], 8);
	MOV.B	#8, W11
	MOV	#lo_addr(_dataBuffer), W10
	CALL	_uart1wire_readData
;Click_UART1Wire_DSPIC.c,83 :: 		Temp = dataBuffer[ 1 ];
	MOV	#lo_addr(_dataBuffer+1), W0
	ZE	[W0], W0
	MOV	W0, _Temp
;Click_UART1Wire_DSPIC.c,84 :: 		Temp = Temp << 8;
	MOV	_Temp, W0
	SL	W0, #8, W1
	MOV	W1, _Temp
;Click_UART1Wire_DSPIC.c,85 :: 		Temp = Temp | dataBuffer[ 0 ];
	MOV	#lo_addr(_dataBuffer), W0
	ZE	[W0], W0
	IOR	W1, W0, W0
	MOV	W0, _Temp
;Click_UART1Wire_DSPIC.c,87 :: 		fTemp = Temp * 0.0625;
	CLR	W1
	CALL	__Long2Float
	MOV	#0, W2
	MOV	#15744, W3
	CALL	__Mul_FP
	MOV	W0, _fTemp
	MOV	W1, _fTemp+2
;Click_UART1Wire_DSPIC.c,88 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr2_Click_UART1Wire_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_UART1Wire_DSPIC.c,89 :: 		FloatToStr(fTemp, demoText);
	MOV	#lo_addr(_demoText), W12
	MOV	_fTemp, W10
	MOV	_fTemp+2, W11
	CALL	_FloatToStr
;Click_UART1Wire_DSPIC.c,90 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(_demoText), W10
	CALL	_mikrobus_logWrite
;Click_UART1Wire_DSPIC.c,92 :: 		Delay_ms( 1000 );
	MOV	#21, W8
	MOV	#22619, W7
L_applicationTask4:
	DEC	W7
	BRA NZ	L_applicationTask4
	DEC	W8
	BRA NZ	L_applicationTask4
;Click_UART1Wire_DSPIC.c,93 :: 		}
L_end_applicationTask:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_UART1Wire_DSPIC.c,95 :: 		void main()
;Click_UART1Wire_DSPIC.c,97 :: 		systemInit();
	CALL	_systemInit
;Click_UART1Wire_DSPIC.c,98 :: 		applicationInit();
	CALL	_applicationInit
;Click_UART1Wire_DSPIC.c,100 :: 		while (1)
L_main6:
;Click_UART1Wire_DSPIC.c,102 :: 		applicationTask();
	CALL	_applicationTask
;Click_UART1Wire_DSPIC.c,103 :: 		}
	GOTO	L_main6
;Click_UART1Wire_DSPIC.c,104 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_UART_Interrupt:
	PUSH	52
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;Click_UART1Wire_DSPIC.c,107 :: 		void UART_Interrupt() iv IVT_ADDR_U2RXINTERRUPT
;Click_UART1Wire_DSPIC.c,109 :: 		if( U2RXIF_bit )
	PUSH	W10
	PUSH	W11
	BTSS	U2RXIF_bit, BitPos(U2RXIF_bit+0)
	GOTO	L_UART_Interrupt8
;Click_UART1Wire_DSPIC.c,111 :: 		readData = uart1wire_readByte();
	CALL	_uart1wire_readByte
	MOV	#lo_addr(_readData), W1
	MOV.B	W0, [W1]
;Click_UART1Wire_DSPIC.c,112 :: 		uart1wire_storage(readData, 1);
	MOV.B	#1, W11
	MOV.B	W0, W10
	CALL	_uart1wire_storage
;Click_UART1Wire_DSPIC.c,113 :: 		U2RXIF_bit = 0;
	BCLR	U2RXIF_bit, BitPos(U2RXIF_bit+0)
;Click_UART1Wire_DSPIC.c,114 :: 		}
L_UART_Interrupt8:
;Click_UART1Wire_DSPIC.c,115 :: 		}
L_end_UART_Interrupt:
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	52
	RETFIE
; end of _UART_Interrupt
