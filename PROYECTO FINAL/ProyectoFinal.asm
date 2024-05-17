
_StepperMotorControl:

;ProyectoFinal.c,8 :: 		void StepperMotorControl (int direcciongiro) // 0 para derecha 1 para izquierda
;ProyectoFinal.c,13 :: 		switch (estadodesecuencia){
	GOTO       L_StepperMotorControl0
;ProyectoFinal.c,14 :: 		case 0:
L_StepperMotorControl2:
;ProyectoFinal.c,15 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,16 :: 		PORTD = PORTD | 0b1001;
	MOVLW      9
	IORWF      PORTD+0, 1
;ProyectoFinal.c,17 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,18 :: 		case 1:
L_StepperMotorControl3:
;ProyectoFinal.c,19 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,20 :: 		PORTD = PORTD | 0b0011; // Paso 2
	MOVLW      3
	IORWF      PORTD+0, 1
;ProyectoFinal.c,21 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,22 :: 		case 2:
L_StepperMotorControl4:
;ProyectoFinal.c,23 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,24 :: 		PORTD = PORTD | 0b0110; // Paso 3
	MOVLW      6
	IORWF      PORTD+0, 1
;ProyectoFinal.c,25 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,26 :: 		case 3:
L_StepperMotorControl5:
;ProyectoFinal.c,27 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,28 :: 		PORTD = PORTD | 0b1100; // Paso 4
	MOVLW      12
	IORWF      PORTD+0, 1
;ProyectoFinal.c,29 :: 		estadodesecuencia = 0;
	CLRF       StepperMotorControl_estadodesecuencia_L0+0
;ProyectoFinal.c,31 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,32 :: 		default:
L_StepperMotorControl6:
;ProyectoFinal.c,34 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,35 :: 		}
L_StepperMotorControl0:
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl2
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl3
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl4
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl5
	GOTO       L_StepperMotorControl6
L_StepperMotorControl1:
;ProyectoFinal.c,36 :: 		}
L_end_StepperMotorControl:
	RETURN
; end of _StepperMotorControl

_inittask:

;ProyectoFinal.c,38 :: 		void inittask (void)
;ProyectoFinal.c,41 :: 		TRISD = TRISD & 0xF0; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
	MOVLW      240
	ANDWF      TRISD+0, 1
;ProyectoFinal.c,42 :: 		}
L_end_inittask:
	RETURN
; end of _inittask

_task1ms:

;ProyectoFinal.c,44 :: 		void  task1ms (void)
;ProyectoFinal.c,51 :: 		}
L_end_task1ms:
	RETURN
; end of _task1ms

_task10ms:

;ProyectoFinal.c,59 :: 		void  task10ms (void)
;ProyectoFinal.c,61 :: 		StepperMotorControl(0);
	CLRF       FARG_StepperMotorControl_direcciongiro+0
	CLRF       FARG_StepperMotorControl_direcciongiro+1
	CALL       _StepperMotorControl+0
;ProyectoFinal.c,64 :: 		}
L_end_task10ms:
	RETURN
; end of _task10ms

_task100ms:

;ProyectoFinal.c,70 :: 		void  task100ms (void)
;ProyectoFinal.c,74 :: 		}
L_end_task100ms:
	RETURN
; end of _task100ms

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ProyectoFinal.c,80 :: 		void interrupt()
;ProyectoFinal.c,85 :: 		if(myCount==8)
	MOVLW      0
	XORWF      interrupt_myCount_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt24
	MOVLW      8
	XORWF      interrupt_myCount_L0+0, 0
L__interrupt24:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
;ProyectoFinal.c,87 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,88 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,93 :: 		PORTD.RD5 = ~PORTD.RD5; //Toggle the LED
	MOVLW      32
	XORWF      PORTD+0, 1
;ProyectoFinal.c,94 :: 		Ostickcounter ++;
	MOVF       ProyectoFinal_Ostickcounter+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      ProyectoFinal_Ostickcounter+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ProyectoFinal_Ostickcounter+0
	MOVF       R0+1, 0
	MOVWF      ProyectoFinal_Ostickcounter+1
;ProyectoFinal.c,95 :: 		myCount = 0;
	CLRF       interrupt_myCount_L0+0
	CLRF       interrupt_myCount_L0+1
;ProyectoFinal.c,96 :: 		}
	GOTO       L_interrupt8
L_interrupt7:
;ProyectoFinal.c,99 :: 		myCount++;
	MOVF       interrupt_myCount_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      interrupt_myCount_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      interrupt_myCount_L0+0
	MOVF       R0+1, 0
	MOVWF      interrupt_myCount_L0+1
;ProyectoFinal.c,100 :: 		}
L_interrupt8:
;ProyectoFinal.c,101 :: 		}
L_end_interrupt:
L__interrupt23:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;ProyectoFinal.c,103 :: 		int main()
;ProyectoFinal.c,105 :: 		TRISA = 0xFF;   //set all digital I/O to inputs
	MOVLW      255
	MOVWF      TRISA+0
;ProyectoFinal.c,106 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ProyectoFinal.c,107 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;ProyectoFinal.c,109 :: 		ANSEL = 0x00;   //disable all analog ports
	CLRF       ANSEL+0
;ProyectoFinal.c,110 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;ProyectoFinal.c,112 :: 		TRISD.TRISD5 = 0;   //set RB7 as an output
	BCF        TRISD+0, 5
;ProyectoFinal.c,118 :: 		OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
	BCF        OPTION_REG+0, 3
;ProyectoFinal.c,121 :: 		OPTION_REG.PS2 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 2
;ProyectoFinal.c,122 :: 		OPTION_REG.PS1 = 1;  //Set the prescaler to 1:256
	BSF        OPTION_REG+0, 1
;ProyectoFinal.c,123 :: 		OPTION_REG.PS0 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 0
;ProyectoFinal.c,125 :: 		OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
	BCF        OPTION_REG+0, 5
;ProyectoFinal.c,129 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,130 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,131 :: 		INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
	BSF        INTCON+0, 5
;ProyectoFinal.c,132 :: 		INTCON.GIE = 1;         //Set the Global Interrupt Enable
	BSF        INTCON+0, 7
;ProyectoFinal.c,134 :: 		inittask();
	CALL       _inittask+0
;ProyectoFinal.c,138 :: 		while(1)
L_main9:
;ProyectoFinal.c,141 :: 		if ((Ostickcounter %2)== 0) //cuenta 2 veces 500us = 1ms
	MOVLW      2
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       ProyectoFinal_Ostickcounter+0, 0
	MOVWF      R0+0
	MOVF       ProyectoFinal_Ostickcounter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVLW      0
	XORWF      R0+0, 0
L__main26:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
;ProyectoFinal.c,143 :: 		task1ms();
	CALL       _task1ms+0
;ProyectoFinal.c,144 :: 		}
	GOTO       L_main12
L_main11:
;ProyectoFinal.c,145 :: 		else if ((Ostickcounter %20)==0) //cuenta 20 veces 500us = 10ms
	MOVLW      20
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       ProyectoFinal_Ostickcounter+0, 0
	MOVWF      R0+0
	MOVF       ProyectoFinal_Ostickcounter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      0
	XORWF      R0+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
;ProyectoFinal.c,147 :: 		task10ms();
	CALL       _task10ms+0
;ProyectoFinal.c,149 :: 		}
	GOTO       L_main14
L_main13:
;ProyectoFinal.c,150 :: 		else if ((Ostickcounter %200)==0)//cuenta 200 veces 500us = 100ms
	MOVLW      200
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       ProyectoFinal_Ostickcounter+0, 0
	MOVWF      R0+0
	MOVF       ProyectoFinal_Ostickcounter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      0
	XORWF      R0+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;ProyectoFinal.c,152 :: 		task100ms();
	CALL       _task100ms+0
;ProyectoFinal.c,153 :: 		Ostickcounter = 0;
	CLRF       ProyectoFinal_Ostickcounter+0
	CLRF       ProyectoFinal_Ostickcounter+1
;ProyectoFinal.c,154 :: 		}
	GOTO       L_main16
L_main15:
;ProyectoFinal.c,155 :: 		else { }
L_main16:
L_main14:
L_main12:
;ProyectoFinal.c,156 :: 		}
	GOTO       L_main9
;ProyectoFinal.c,159 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
