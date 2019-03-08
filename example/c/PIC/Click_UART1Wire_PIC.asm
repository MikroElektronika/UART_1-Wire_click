
_systemInit:

;Click_UART1Wire_PIC.c,36 :: 		void systemInit()
;Click_UART1Wire_PIC.c,38 :: 		mikrobus_uartInit( _MIKROBUS1, &_UART1WIRE_UART_CFG[0] );
	CLRF        FARG_mikrobus_uartInit_bus+0 
	MOVLW       __UART1WIRE_UART_CFG+0
	MOVWF       FARG_mikrobus_uartInit_cfg+0 
	MOVLW       hi_addr(__UART1WIRE_UART_CFG+0)
	MOVWF       FARG_mikrobus_uartInit_cfg+1 
	MOVLW       higher_addr(__UART1WIRE_UART_CFG+0)
	MOVWF       FARG_mikrobus_uartInit_cfg+2 
	CALL        _mikrobus_uartInit+0, 0
;Click_UART1Wire_PIC.c,39 :: 		mikrobus_logInit( _MIKROBUS3, 9600 );
	MOVLW       2
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_UART1Wire_PIC.c,40 :: 		mikrobus_logWrite(" --- System init --- ", _LOG_LINE);
	MOVLW       ?lstr1_Click_UART1Wire_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_UART1Wire_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_UART1Wire_PIC.c,41 :: 		Delay_ms( 100 );
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_systemInit0:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit0
	DECFSZ      R12, 1, 1
	BRA         L_systemInit0
	DECFSZ      R11, 1, 1
	BRA         L_systemInit0
	NOP
;Click_UART1Wire_PIC.c,42 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_UART1Wire_PIC.c,44 :: 		void applicationInit()
;Click_UART1Wire_PIC.c,46 :: 		uart1wire_uartDriverInit( (T_UART1WIRE_P)&_MIKROBUS1_GPIO, (T_UART1WIRE_P)&_MIKROBUS1_UART );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_uart1wire_uartDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_uart1wire_uartDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_uart1wire_uartDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_UART+0
	MOVWF       FARG_uart1wire_uartDriverInit_uartObj+0 
	MOVLW       hi_addr(__MIKROBUS1_UART+0)
	MOVWF       FARG_uart1wire_uartDriverInit_uartObj+1 
	MOVLW       higher_addr(__MIKROBUS1_UART+0)
	MOVWF       FARG_uart1wire_uartDriverInit_uartObj+2 
	CALL        _uart1wire_uartDriverInit+0, 0
;Click_UART1Wire_PIC.c,49 :: 		RC1IE_bit    = 1;
	BSF         RC1IE_bit+0, BitPos(RC1IE_bit+0) 
;Click_UART1Wire_PIC.c,50 :: 		RC1IF_bit    = 0;
	BCF         RC1IF_bit+0, BitPos(RC1IF_bit+0) 
;Click_UART1Wire_PIC.c,51 :: 		PEIE_bit     = 1;
	BSF         PEIE_bit+0, BitPos(PEIE_bit+0) 
;Click_UART1Wire_PIC.c,52 :: 		GIE_bit      = 1;
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;Click_UART1Wire_PIC.c,55 :: 		uart1wire_reset();
	CALL        _uart1wire_reset+0, 0
;Click_UART1Wire_PIC.c,56 :: 		uart1wire_goToDataMode();
	CALL        _uart1wire_goToDataMode+0, 0
;Click_UART1Wire_PIC.c,57 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Click_UART1Wire_PIC.c,58 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOVLW       __UART1WIRE_SKIP_ROM
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,59 :: 		uart1wire_writeCommand( 0x4E );
	MOVLW       78
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,60 :: 		uart1wire_writeCommand( 0x00 );
	CLRF        FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,61 :: 		uart1wire_writeCommand( 0x00 );
	CLRF        FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,62 :: 		uart1wire_writeCommand( 0x60 );
	MOVLW       96
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,63 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_UART1Wire_PIC.c,65 :: 		void applicationTask()
;Click_UART1Wire_PIC.c,68 :: 		uart1wire_reset();
	CALL        _uart1wire_reset+0, 0
;Click_UART1Wire_PIC.c,69 :: 		uart1wire_goToDataMode();
	CALL        _uart1wire_goToDataMode+0, 0
;Click_UART1Wire_PIC.c,70 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Click_UART1Wire_PIC.c,71 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOVLW       __UART1WIRE_SKIP_ROM
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,72 :: 		uart1wire_writeCommand( 0x44 );
	MOVLW       68
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,73 :: 		Delay_ms( 750 );
	MOVLW       61
	MOVWF       R11, 0
	MOVLW       225
	MOVWF       R12, 0
	MOVLW       63
	MOVWF       R13, 0
L_applicationTask1:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask1
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask1
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask1
	NOP
	NOP
;Click_UART1Wire_PIC.c,76 :: 		uart1wire_reset();
	CALL        _uart1wire_reset+0, 0
;Click_UART1Wire_PIC.c,77 :: 		uart1wire_goToDataMode();
	CALL        _uart1wire_goToDataMode+0, 0
;Click_UART1Wire_PIC.c,78 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Click_UART1Wire_PIC.c,79 :: 		uart1wire_writeCommand(_UART1WIRE_SKIP_ROM);
	MOVLW       __UART1WIRE_SKIP_ROM
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,80 :: 		uart1wire_writeCommand( 0xBE );
	MOVLW       190
	MOVWF       FARG_uart1wire_writeCommand_input+0 
	CALL        _uart1wire_writeCommand+0, 0
;Click_UART1Wire_PIC.c,81 :: 		Delay_10ms();
	CALL        _Delay_10ms+0, 0
;Click_UART1Wire_PIC.c,83 :: 		uart1wire_readData(&dataBuffer[0], 8);
	MOVLW       _dataBuffer+0
	MOVWF       FARG_uart1wire_readData_buf+0 
	MOVLW       hi_addr(_dataBuffer+0)
	MOVWF       FARG_uart1wire_readData_buf+1 
	MOVLW       8
	MOVWF       FARG_uart1wire_readData_nData+0 
	CALL        _uart1wire_readData+0, 0
;Click_UART1Wire_PIC.c,85 :: 		Temp = dataBuffer[ 1 ];
	MOVF        _dataBuffer+1, 0 
	MOVWF       _Temp+0 
	MOVLW       0
	MOVWF       _Temp+1 
;Click_UART1Wire_PIC.c,86 :: 		Temp = Temp << 8;
	MOVF        _Temp+0, 0 
	MOVWF       R1 
	CLRF        R0 
	MOVF        R0, 0 
	MOVWF       _Temp+0 
	MOVF        R1, 0 
	MOVWF       _Temp+1 
;Click_UART1Wire_PIC.c,87 :: 		Temp = Temp | dataBuffer[ 0 ];
	MOVF        _dataBuffer+0, 0 
	IORWF       R0, 1 
	MOVLW       0
	IORWF       R1, 1 
	MOVF        R0, 0 
	MOVWF       _Temp+0 
	MOVF        R1, 0 
	MOVWF       _Temp+1 
;Click_UART1Wire_PIC.c,89 :: 		fTemp = Temp * 0.0625;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _fTemp+0 
	MOVF        R1, 0 
	MOVWF       _fTemp+1 
	MOVF        R2, 0 
	MOVWF       _fTemp+2 
	MOVF        R3, 0 
	MOVWF       _fTemp+3 
;Click_UART1Wire_PIC.c,90 :: 		mikrobus_logWrite(" Temperature : ", _LOG_TEXT);
	MOVLW       ?lstr2_Click_UART1Wire_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_UART1Wire_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_UART1Wire_PIC.c,91 :: 		FloatToStr(fTemp, demoText);
	MOVF        _fTemp+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _fTemp+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _fTemp+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _fTemp+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _demoText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_UART1Wire_PIC.c,92 :: 		mikrobus_logWrite(demoText, _LOG_LINE);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_UART1Wire_PIC.c,94 :: 		Delay_ms( 1000 );
	MOVLW       82
	MOVWF       R11, 0
	MOVLW       43
	MOVWF       R12, 0
	MOVLW       0
	MOVWF       R13, 0
L_applicationTask2:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask2
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask2
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask2
	NOP
;Click_UART1Wire_PIC.c,95 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_UART1Wire_PIC.c,97 :: 		void main()
;Click_UART1Wire_PIC.c,99 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_UART1Wire_PIC.c,100 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_UART1Wire_PIC.c,102 :: 		while (1)
L_main3:
;Click_UART1Wire_PIC.c,104 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_UART1Wire_PIC.c,105 :: 		}
	GOTO        L_main3
;Click_UART1Wire_PIC.c,106 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;Click_UART1Wire_PIC.c,109 :: 		void interrupt()
;Click_UART1Wire_PIC.c,111 :: 		if( RC1IF_bit == 1 )
	BTFSS       RC1IF_bit+0, BitPos(RC1IF_bit+0) 
	GOTO        L_interrupt5
;Click_UART1Wire_PIC.c,113 :: 		readData = uart1wire_readByte();
	CALL        _uart1wire_readByte+0, 0
	MOVF        R0, 0 
	MOVWF       _readData+0 
;Click_UART1Wire_PIC.c,114 :: 		uart1wire_storage(readData, 1);
	MOVF        R0, 0 
	MOVWF       FARG_uart1wire_storage__data+0 
	MOVLW       1
	MOVWF       FARG_uart1wire_storage_flag+0 
	CALL        _uart1wire_storage+0, 0
;Click_UART1Wire_PIC.c,115 :: 		}
L_interrupt5:
;Click_UART1Wire_PIC.c,116 :: 		}
L_end_interrupt:
L__interrupt11:
	RETFIE      1
; end of _interrupt
