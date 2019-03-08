_systemInit:
;Click_UART1Wire_PIC32.c,36 :: 		void systemInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_UART1Wire_PIC32.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R2, hi_addr(__UART1WIRE_UART_CFG+0)
ORI	R2, R2, lo_addr(__UART1WIRE_UART_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_uartInit+0
NOP	
;Click_UART1Wire_PIC32.c,39 :: 		mikrobus_logInit( _LOG_USBUART_B , 9600 );
ORI	R26, R0, 9600
ORI	R25, R0, 48
JAL	_mikrobus_logInit+0
NOP	
;Click_UART1Wire_PIC32.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_UART1Wire_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_UART1Wire_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_UART1Wire_PIC32.c,41 :: 		Delay_ms( 100 );
LUI	R24, 40
ORI	R24, R24, 45226
L_systemInit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_systemInit0
NOP	
;Click_UART1Wire_PIC32.c,42 :: 		}
L_end_systemInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_UART1Wire_PIC32.c,44 :: 		void applicationInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_UART1Wire_PIC32.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(__MIKROBUS1_UART+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_UART+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_uart1wire_uartDriverInit+0
NOP	
;Click_UART1Wire_PIC32.c,49 :: 		U2IP0_bit    = 1;
LUI	R2, BitMask(U2IP0_bit+0)
ORI	R2, R2, BitMask(U2IP0_bit+0)
_SX	
;Click_UART1Wire_PIC32.c,50 :: 		U2IP1_bit    = 1;
LUI	R2, BitMask(U2IP1_bit+0)
ORI	R2, R2, BitMask(U2IP1_bit+0)
_SX	
;Click_UART1Wire_PIC32.c,51 :: 		U2IP2_bit    = 1;
LUI	R2, BitMask(U2IP2_bit+0)
ORI	R2, R2, BitMask(U2IP2_bit+0)
_SX	
;Click_UART1Wire_PIC32.c,52 :: 		U2RXIE_bit   = 1;
LUI	R2, BitMask(U2RXIE_bit+0)
ORI	R2, R2, BitMask(U2RXIE_bit+0)
_SX	
;Click_UART1Wire_PIC32.c,53 :: 		EnableInterrupts();
EI	R30
;Click_UART1Wire_PIC32.c,56 :: 		uart1wire_reset();
JAL	_uart1wire_reset+0
NOP	
;Click_UART1Wire_PIC32.c,57 :: 		uart1wire_goToDataMode();
JAL	_uart1wire_goToDataMode+0
NOP	
;Click_UART1Wire_PIC32.c,58 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;Click_UART1Wire_PIC32.c,59 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
ORI	R25, R0, __UART1WIRE_SKIP_ROM
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,60 :: 		uart1wire_writeCommand( 0x4E );
ORI	R25, R0, 78
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,61 :: 		uart1wire_writeCommand( 0x00 );
MOVZ	R25, R0, R0
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,62 :: 		uart1wire_writeCommand( 0x00 );
MOVZ	R25, R0, R0
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,63 :: 		uart1wire_writeCommand( 0x60 );
ORI	R25, R0, 96
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,64 :: 		}
L_end_applicationInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_UART1Wire_PIC32.c,66 :: 		void applicationTask()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_UART1Wire_PIC32.c,69 :: 		uart1wire_reset();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_uart1wire_reset+0
NOP	
;Click_UART1Wire_PIC32.c,70 :: 		uart1wire_goToDataMode();
JAL	_uart1wire_goToDataMode+0
NOP	
;Click_UART1Wire_PIC32.c,71 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;Click_UART1Wire_PIC32.c,72 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
ORI	R25, R0, __UART1WIRE_SKIP_ROM
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,73 :: 		uart1wire_writeCommand( 0x44 );
ORI	R25, R0, 68
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,74 :: 		Delay_ms( 750 );
LUI	R24, 305
ORI	R24, R24, 11519
L_applicationTask2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask2
NOP	
NOP	
;Click_UART1Wire_PIC32.c,77 :: 		uart1wire_reset();
JAL	_uart1wire_reset+0
NOP	
;Click_UART1Wire_PIC32.c,78 :: 		uart1wire_goToDataMode();
JAL	_uart1wire_goToDataMode+0
NOP	
;Click_UART1Wire_PIC32.c,79 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;Click_UART1Wire_PIC32.c,80 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
ORI	R25, R0, __UART1WIRE_SKIP_ROM
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,81 :: 		uart1wire_writeCommand( 0xBE );
ORI	R25, R0, 190
JAL	_uart1wire_writeCommand+0
NOP	
;Click_UART1Wire_PIC32.c,82 :: 		Delay_10ms();
JAL	_Delay_10ms+0
NOP	
;Click_UART1Wire_PIC32.c,84 :: 		uart1wire_readData(&dataBuffer[0], 8);
ORI	R26, R0, 8
LUI	R25, hi_addr(_dataBuffer+0)
ORI	R25, R25, lo_addr(_dataBuffer+0)
JAL	_uart1wire_readData+0
NOP	
;Click_UART1Wire_PIC32.c,86 :: 		Temp = dataBuffer[ 1 ];
LBU	R2, Offset(_dataBuffer+1)(GP)
SH	R2, Offset(_Temp+0)(GP)
;Click_UART1Wire_PIC32.c,87 :: 		Temp = Temp << 8;
LHU	R2, Offset(_Temp+0)(GP)
SLL	R3, R2, 8
SH	R3, Offset(_Temp+0)(GP)
;Click_UART1Wire_PIC32.c,88 :: 		Temp = Temp | dataBuffer[ 0 ];
LBU	R2, Offset(_dataBuffer+0)(GP)
OR	R2, R3, R2
SH	R2, Offset(_Temp+0)(GP)
;Click_UART1Wire_PIC32.c,90 :: 		fTemp = Temp * 0.0625;
ANDI	R4, R2, 65535
JAL	__Unsigned16IntToFloat+0
NOP	
LUI	R4, 15744
ORI	R4, R4, 0
MOVZ	R6, R2, R0
JAL	__Mul_FP+0
NOP	
SW	R2, Offset(_fTemp+0)(GP)
;Click_UART1Wire_PIC32.c,91 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr2_Click_UART1Wire_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_UART1Wire_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_UART1Wire_PIC32.c,92 :: 		FloatToStr(fTemp, demoText);
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
LW	R25, Offset(_fTemp+0)(GP)
JAL	_FloatToStr+0
NOP	
;Click_UART1Wire_PIC32.c,93 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_UART1Wire_PIC32.c,95 :: 		Delay_ms( 1000 );
LUI	R24, 406
ORI	R24, R24, 59050
L_applicationTask4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask4
NOP	
;Click_UART1Wire_PIC32.c,96 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_UART1Wire_PIC32.c,98 :: 		void main()
;Click_UART1Wire_PIC32.c,100 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_UART1Wire_PIC32.c,101 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_UART1Wire_PIC32.c,103 :: 		while (1)
L_main6:
;Click_UART1Wire_PIC32.c,105 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_UART1Wire_PIC32.c,106 :: 		}
J	L_main6
NOP	
;Click_UART1Wire_PIC32.c,107 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_RX_ISR:
;Click_UART1Wire_PIC32.c,110 :: 		void RX_ISR()iv IVT_UART_2 ilevel 7 ics ICS_SRS
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;Click_UART1Wire_PIC32.c,112 :: 		if( IFS1 & ( 1 << U2RXIF ))
LW	R2, Offset(IFS1+0)(GP)
ANDI	R2, R2, 512
BNE	R2, R0, L__RX_ISR16
NOP	
J	L_RX_ISR8
NOP	
L__RX_ISR16:
;Click_UART1Wire_PIC32.c,114 :: 		readData = uart1wire_readByte();
JAL	_uart1wire_readByte+0
NOP	
SB	R2, Offset(_readData+0)(GP)
;Click_UART1Wire_PIC32.c,115 :: 		uart1wire_storage(readData, 1);
ORI	R26, R0, 1
ANDI	R25, R2, 255
JAL	_uart1wire_storage+0
NOP	
;Click_UART1Wire_PIC32.c,116 :: 		U2RXIF_bit = 0;
LUI	R2, BitMask(U2RXIF_bit+0)
ORI	R2, R2, BitMask(U2RXIF_bit+0)
_SX	
;Click_UART1Wire_PIC32.c,117 :: 		}
L_RX_ISR8:
;Click_UART1Wire_PIC32.c,118 :: 		}
L_end_RX_ISR:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _RX_ISR
