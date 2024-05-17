
_StepperMotorControl:

;ProyectoFinal.c,8 :: 		void StepperMotorControl (int direcciongiro) // 0 para derecha 1 para izquierda
;ProyectoFinal.c,28 :: 		switch (estadodesecuencia){
	GOTO       L_StepperMotorControl0
;ProyectoFinal.c,29 :: 		case 0:
L_StepperMotorControl2:
;ProyectoFinal.c,30 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,31 :: 		PORTD |= 0b1001; // Paso 1
	MOVLW      9
	IORWF      PORTD+0, 1
;ProyectoFinal.c,32 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,33 :: 		case 3:
L_StepperMotorControl3:
;ProyectoFinal.c,34 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,35 :: 		PORTD |= 0b0011; // Paso 2
	MOVLW      3
	IORWF      PORTD+0, 1
;ProyectoFinal.c,36 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,37 :: 		case 6:
L_StepperMotorControl4:
;ProyectoFinal.c,38 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,39 :: 		PORTD |= 0b0110; // Paso 3
	MOVLW      6
	IORWF      PORTD+0, 1
;ProyectoFinal.c,40 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,41 :: 		case 9:
L_StepperMotorControl5:
;ProyectoFinal.c,42 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,43 :: 		PORTD |= 0b1100; // Paso 4
	MOVLW      12
	IORWF      PORTD+0, 1
;ProyectoFinal.c,44 :: 		estadodesecuencia = 0;
	CLRF       StepperMotorControl_estadodesecuencia_L0+0
;ProyectoFinal.c,45 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,46 :: 		default:
L_StepperMotorControl6:
;ProyectoFinal.c,47 :: 		break;
	GOTO       L_StepperMotorControl1
;ProyectoFinal.c,48 :: 		}
L_StepperMotorControl0:
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl2
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl3
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl4
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl5
	GOTO       L_StepperMotorControl6
L_StepperMotorControl1:
;ProyectoFinal.c,50 :: 		estadodesecuencia +=1;
	INCF       StepperMotorControl_estadodesecuencia_L0+0, 1
;ProyectoFinal.c,51 :: 		}
L_end_StepperMotorControl:
	RETURN
; end of _StepperMotorControl

_inittask:

;ProyectoFinal.c,53 :: 		void inittask (void)
;ProyectoFinal.c,56 :: 		TRISD = 0x00; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
	CLRF       TRISD+0
;ProyectoFinal.c,57 :: 		PORTD &= 0xF0;        // Inicializar los 4 BITS a 0
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,58 :: 		}
L_end_inittask:
	RETURN
; end of _inittask

_task1ms:

;ProyectoFinal.c,60 :: 		void  task1ms (void)
;ProyectoFinal.c,62 :: 		PORTD.RD5 = ~PORTD.RD5;
	MOVLW      32
	XORWF      PORTD+0, 1
;ProyectoFinal.c,63 :: 		StepperMotorControl(0);
	CLRF       FARG_StepperMotorControl_direcciongiro+0
	CLRF       FARG_StepperMotorControl_direcciongiro+1
	CALL       _StepperMotorControl+0
;ProyectoFinal.c,69 :: 		}
L_end_task1ms:
	RETURN
; end of _task1ms

_task10ms:

;ProyectoFinal.c,71 :: 		void  task10ms (void)
;ProyectoFinal.c,77 :: 		}
L_end_task10ms:
	RETURN
; end of _task10ms

_task100ms:

;ProyectoFinal.c,79 :: 		void  task100ms (void)
;ProyectoFinal.c,84 :: 		}
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

;ProyectoFinal.c,90 :: 		void interrupt()
;ProyectoFinal.c,97 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,98 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,103 :: 		if(myCount==8)
	MOVLW      0
	XORWF      interrupt_myCount_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt24
	MOVLW      8
	XORWF      interrupt_myCount_L0+0, 0
L__interrupt24:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt7
;ProyectoFinal.c,106 :: 		Ostickcounter++;
	MOVF       interrupt_Ostickcounter_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      interrupt_Ostickcounter_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      interrupt_Ostickcounter_L0+0
	MOVF       R0+1, 0
	MOVWF      interrupt_Ostickcounter_L0+1
;ProyectoFinal.c,107 :: 		myCount = 0;
	CLRF       interrupt_myCount_L0+0
	CLRF       interrupt_myCount_L0+1
;ProyectoFinal.c,111 :: 		OSTaskEnable = OSTaskEnable | 0x1;
	BSF        _OSTaskEnable+0, 0
;ProyectoFinal.c,113 :: 		if ((Ostickcounter %10)==0) //cuenta 10 veces 1ms = 10ms
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       interrupt_Ostickcounter_L0+0, 0
	MOVWF      R0+0
	MOVF       interrupt_Ostickcounter_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt25
	MOVLW      0
	XORWF      R0+0, 0
L__interrupt25:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt9
;ProyectoFinal.c,115 :: 		OSTaskEnable = OSTaskEnable | 0x2;
	BSF        _OSTaskEnable+0, 1
;ProyectoFinal.c,116 :: 		}
L_interrupt9:
;ProyectoFinal.c,117 :: 		if ((Ostickcounter %100)==0)//cuenta 100 veces 1ms = 100ms
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       interrupt_Ostickcounter_L0+0, 0
	MOVWF      R0+0
	MOVF       interrupt_Ostickcounter_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt26
	MOVLW      0
	XORWF      R0+0, 0
L__interrupt26:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt10
;ProyectoFinal.c,119 :: 		OSTaskEnable = OSTaskEnable | 0x4;
	BSF        _OSTaskEnable+0, 2
;ProyectoFinal.c,120 :: 		Ostickcounter = 0;
	CLRF       interrupt_Ostickcounter_L0+0
	CLRF       interrupt_Ostickcounter_L0+1
;ProyectoFinal.c,121 :: 		}
L_interrupt10:
;ProyectoFinal.c,122 :: 		}
	GOTO       L_interrupt11
L_interrupt7:
;ProyectoFinal.c,125 :: 		myCount++;
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
;ProyectoFinal.c,126 :: 		}
L_interrupt11:
;ProyectoFinal.c,128 :: 		}
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

;ProyectoFinal.c,130 :: 		int main()
;ProyectoFinal.c,132 :: 		TRISA = 0xFF;   //set all digital I/O to inputs
	MOVLW      255
	MOVWF      TRISA+0
;ProyectoFinal.c,133 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ProyectoFinal.c,134 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;ProyectoFinal.c,136 :: 		ANSEL = 0x00;   //disable all analog ports
	CLRF       ANSEL+0
;ProyectoFinal.c,137 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;ProyectoFinal.c,139 :: 		TRISD.TRISD5 = 0;   //set RD5 as an output
	BCF        TRISD+0, 5
;ProyectoFinal.c,145 :: 		OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
	BCF        OPTION_REG+0, 3
;ProyectoFinal.c,148 :: 		OPTION_REG.PS2 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 2
;ProyectoFinal.c,149 :: 		OPTION_REG.PS1 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 1
;ProyectoFinal.c,150 :: 		OPTION_REG.PS0 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 0
;ProyectoFinal.c,152 :: 		OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
	BCF        OPTION_REG+0, 5
;ProyectoFinal.c,156 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,157 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,158 :: 		INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
	BSF        INTCON+0, 5
;ProyectoFinal.c,159 :: 		INTCON.GIE = 1;         //Set the Global Interrupt Enable
	BSF        INTCON+0, 7
;ProyectoFinal.c,161 :: 		inittask();
	CALL       _inittask+0
;ProyectoFinal.c,165 :: 		while(1)
L_main12:
;ProyectoFinal.c,168 :: 		if ((OSTaskEnable & 0x1)!= 0)
	MOVLW      1
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;ProyectoFinal.c,170 :: 		task1ms();
	CALL       _task1ms+0
;ProyectoFinal.c,171 :: 		OSTaskEnable = OSTaskEnable & 0xFE;
	MOVLW      254
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,172 :: 		}
L_main14:
;ProyectoFinal.c,173 :: 		if ((OSTaskEnable & 0x2)!= 0)
	MOVLW      2
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
;ProyectoFinal.c,175 :: 		task10ms();
	CALL       _task10ms+0
;ProyectoFinal.c,176 :: 		OSTaskEnable = OSTaskEnable & 0xFD;
	MOVLW      253
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,178 :: 		}
L_main15:
;ProyectoFinal.c,179 :: 		if ((OSTaskEnable & 0x4)!= 0)
	MOVLW      4
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main16
;ProyectoFinal.c,181 :: 		task100ms();
	CALL       _task100ms+0
;ProyectoFinal.c,182 :: 		OSTaskEnable = OSTaskEnable & 0xFB;
	MOVLW      251
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,183 :: 		}
L_main16:
;ProyectoFinal.c,184 :: 		}
	GOTO       L_main12
;ProyectoFinal.c,187 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
