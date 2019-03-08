
_systemInit:

;Click_UART1Wire_AVR.c,36 :: 		void systemInit()
;Click_UART1Wire_AVR.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R16, #lo_addr(__UART1WIRE_UART_CFG+0)
	LDI        R17, hi_addr(__UART1WIRE_UART_CFG+0)
	MOV        R3, R16
	MOV        R4, R17
	CLR        R2
	CALL       _mikrobus_uartInit+0
;Click_UART1Wire_AVR.c,39 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	LDI        R27, 128
	MOV        R3, R27
	LDI        R27, 37
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_UART1Wire_AVR.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_UART1Wire_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_UART1Wire_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_UART1Wire_AVR.c,41 :: 		Delay_ms( 100 );
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_systemInit0:
	DEC        R16
	BRNE       L_systemInit0
	DEC        R17
	BRNE       L_systemInit0
	DEC        R18
	BRNE       L_systemInit0
;Click_UART1Wire_AVR.c,42 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_UART1Wire_AVR.c,44 :: 		void applicationInit()
;Click_UART1Wire_AVR.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, #lo_addr(__MIKROBUS1_UART+0)
	MOV        R4, R27
	LDI        R27, hi_addr(__MIKROBUS1_UART+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _uart1wire_uartDriverInit+0
;Click_UART1Wire_AVR.c,49 :: 		UCSRB |= ( 1 << RXCIE );
	IN         R27, UCSRB+0
	SBR        R27, 128
	OUT        UCSRB+0, R27
;Click_UART1Wire_AVR.c,50 :: 		SREG  |= ( 1 << SREG_I );
	IN         R16, SREG+0
	ORI        R16, 128
	OUT        SREG+0, R16
;Click_UART1Wire_AVR.c,53 :: 		uart1wire_reset();
	CALL       _uart1wire_reset+0
;Click_UART1Wire_AVR.c,54 :: 		uart1wire_goToDataMode();
	CALL       _uart1wire_goToDataMode+0
;Click_UART1Wire_AVR.c,55 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;Click_UART1Wire_AVR.c,56 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	LDI        R27, __UART1WIRE_SKIP_ROM
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,57 :: 		uart1wire_writeCommand( 0x4E );
	LDI        R27, 78
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,58 :: 		uart1wire_writeCommand( 0x00 );
	CLR        R2
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,59 :: 		uart1wire_writeCommand( 0x00 );
	CLR        R2
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,60 :: 		uart1wire_writeCommand( 0x60 );
	LDI        R27, 96
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,61 :: 		}
L_end_applicationInit:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:

;Click_UART1Wire_AVR.c,63 :: 		void applicationTask()
;Click_UART1Wire_AVR.c,66 :: 		uart1wire_reset();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	CALL       _uart1wire_reset+0
;Click_UART1Wire_AVR.c,67 :: 		uart1wire_goToDataMode();
	CALL       _uart1wire_goToDataMode+0
;Click_UART1Wire_AVR.c,68 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;Click_UART1Wire_AVR.c,69 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	LDI        R27, __UART1WIRE_SKIP_ROM
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,70 :: 		uart1wire_writeCommand( 0x44 );
	LDI        R27, 68
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,71 :: 		Delay_ms( 750 );
	LDI        R18, 31
	LDI        R17, 113
	LDI        R16, 31
L_applicationTask2:
	DEC        R16
	BRNE       L_applicationTask2
	DEC        R17
	BRNE       L_applicationTask2
	DEC        R18
	BRNE       L_applicationTask2
	NOP
;Click_UART1Wire_AVR.c,74 :: 		uart1wire_reset();
	CALL       _uart1wire_reset+0
;Click_UART1Wire_AVR.c,75 :: 		uart1wire_goToDataMode();
	CALL       _uart1wire_goToDataMode+0
;Click_UART1Wire_AVR.c,76 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;Click_UART1Wire_AVR.c,77 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	LDI        R27, __UART1WIRE_SKIP_ROM
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,78 :: 		uart1wire_writeCommand( 0xBE );
	LDI        R27, 190
	MOV        R2, R27
	CALL       _uart1wire_writeCommand+0
;Click_UART1Wire_AVR.c,79 :: 		Delay_10ms();
	CALL       _Delay_10ms+0
;Click_UART1Wire_AVR.c,81 :: 		uart1wire_readData(&dataBuffer[0], 8);
	LDI        R27, 8
	MOV        R4, R27
	LDI        R27, #lo_addr(_dataBuffer+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_dataBuffer+0)
	MOV        R3, R27
	CALL       _uart1wire_readData+0
;Click_UART1Wire_AVR.c,83 :: 		Temp = dataBuffer[ 1 ];
	LDS        R16, _dataBuffer+1
	STS        _Temp+0, R16
	LDI        R27, 0
	STS        _Temp+1, R27
;Click_UART1Wire_AVR.c,84 :: 		Temp = Temp << 8;
	LDS        R16, _Temp+0
	LDS        R17, _Temp+1
	MOV        R19, R16
	CLR        R18
	STS        _Temp+0, R18
	STS        _Temp+1, R19
;Click_UART1Wire_AVR.c,85 :: 		Temp = Temp | dataBuffer[ 0 ];
	LDS        R16, _dataBuffer+0
	LDI        R17, 0
	OR         R16, R18
	OR         R17, R19
	STS        _Temp+0, R16
	STS        _Temp+1, R17
;Click_UART1Wire_AVR.c,87 :: 		fTemp = Temp * 0.0625;
	LDI        R18, 0
	MOV        R19, R18
	CALL       _float_ulong2fp+0
	LDI        R20, 0
	LDI        R21, 0
	LDI        R22, 128
	LDI        R23, 61
	CALL       _float_fpmul1+0
	STS        _fTemp+0, R16
	STS        _fTemp+1, R17
	STS        _fTemp+2, R18
	STS        _fTemp+3, R19
;Click_UART1Wire_AVR.c,88 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_UART1Wire_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_UART1Wire_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_UART1Wire_AVR.c,89 :: 		FloatToStr(fTemp, demoText);
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R7, R27
	LDS        R2, _fTemp+0
	LDS        R3, _fTemp+1
	LDS        R4, _fTemp+2
	LDS        R5, _fTemp+3
	CALL       _FloatToStr+0
;Click_UART1Wire_AVR.c,90 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_UART1Wire_AVR.c,92 :: 		Delay_ms( 1000 );
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_applicationTask4:
	DEC        R16
	BRNE       L_applicationTask4
	DEC        R17
	BRNE       L_applicationTask4
	DEC        R18
	BRNE       L_applicationTask4
;Click_UART1Wire_AVR.c,93 :: 		}
L_end_applicationTask:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_UART1Wire_AVR.c,95 :: 		void main()
;Click_UART1Wire_AVR.c,97 :: 		systemInit();
	CALL       _systemInit+0
;Click_UART1Wire_AVR.c,98 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_UART1Wire_AVR.c,100 :: 		while (1)
L_main6:
;Click_UART1Wire_AVR.c,102 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_UART1Wire_AVR.c,103 :: 		}
	JMP        L_main6
;Click_UART1Wire_AVR.c,104 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_UART_Interrupt:
	PUSH       R30
	PUSH       R31
	PUSH       R27
	IN         R27, SREG+0
	PUSH       R27

;Click_UART1Wire_AVR.c,107 :: 		void UART_Interrupt() iv IVT_ADDR_USART__RXC ics ICS_AUTO
;Click_UART1Wire_AVR.c,109 :: 		readData = uart1wire_readByte();
	PUSH       R2
	PUSH       R3
	CALL       _uart1wire_readByte+0
	STS        _readData+0, R16
;Click_UART1Wire_AVR.c,110 :: 		uart1wire_storage(readData, 1);
	LDI        R27, 1
	MOV        R3, R27
	MOV        R2, R16
	CALL       _uart1wire_storage+0
;Click_UART1Wire_AVR.c,111 :: 		}
L_end_UART_Interrupt:
	POP        R3
	POP        R2
	POP        R27
	OUT        SREG+0, R27
	POP        R27
	POP        R31
	POP        R30
	RETI
; end of _UART_Interrupt
