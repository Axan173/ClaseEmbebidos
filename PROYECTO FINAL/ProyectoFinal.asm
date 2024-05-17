
_task1ms:

;ProyectoFinal.c,6 :: 		void  task1ms (void)
;ProyectoFinal.c,13 :: 		}
L_end_task1ms:
	RETURN
; end of _task1ms

_task10ms:

;ProyectoFinal.c,21 :: 		void  task10ms (void)
;ProyectoFinal.c,26 :: 		}
L_end_task10ms:
	RETURN
; end of _task10ms

_task100ms:

;ProyectoFinal.c,32 :: 		void  task100ms (void)
;ProyectoFinal.c,36 :: 		}
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

;ProyectoFinal.c,42 :: 		void interrupt()
;ProyectoFinal.c,47 :: 		if(myCount==8)
	MOVLW      0
	XORWF      interrupt_myCount_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt15
	MOVLW      8
	XORWF      interrupt_myCount_L0+0, 0
L__interrupt15:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
;ProyectoFinal.c,49 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,50 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,55 :: 		PORTD.RD5 = ~PORTD.RD5; //Toggle the LED
	MOVLW      32
	XORWF      PORTD+0, 1
;ProyectoFinal.c,56 :: 		Ostickcounter ++;
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
;ProyectoFinal.c,57 :: 		myCount = 0;
	CLRF       interrupt_myCount_L0+0
	CLRF       interrupt_myCount_L0+1
;ProyectoFinal.c,58 :: 		}
	GOTO       L_interrupt1
L_interrupt0:
;ProyectoFinal.c,61 :: 		myCount++;
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
;ProyectoFinal.c,62 :: 		}
L_interrupt1:
;ProyectoFinal.c,63 :: 		}
L_end_interrupt:
L__interrupt14:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;ProyectoFinal.c,65 :: 		int main()
;ProyectoFinal.c,67 :: 		TRISA = 0xFF;   //set all digital I/O to inputs
	MOVLW      255
	MOVWF      TRISA+0
;ProyectoFinal.c,68 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ProyectoFinal.c,69 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;ProyectoFinal.c,71 :: 		ANSEL = 0x00;   //disable all analog ports
	CLRF       ANSEL+0
;ProyectoFinal.c,72 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;ProyectoFinal.c,74 :: 		TRISD.TRISD5 = 0;   //set RB7 as an output
	BCF        TRISD+0, 5
;ProyectoFinal.c,80 :: 		OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
	BCF        OPTION_REG+0, 3
;ProyectoFinal.c,83 :: 		OPTION_REG.PS2 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 2
;ProyectoFinal.c,84 :: 		OPTION_REG.PS1 = 1;  //Set the prescaler to 1:256
	BSF        OPTION_REG+0, 1
;ProyectoFinal.c,85 :: 		OPTION_REG.PS0 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 0
;ProyectoFinal.c,87 :: 		OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
	BCF        OPTION_REG+0, 5
;ProyectoFinal.c,91 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,92 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,93 :: 		INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
	BSF        INTCON+0, 5
;ProyectoFinal.c,94 :: 		INTCON.GIE = 1;         //Set the Global Interrupt Enable
	BSF        INTCON+0, 7
;ProyectoFinal.c,100 :: 		while(1)
L_main2:
;ProyectoFinal.c,103 :: 		if ((Ostickcounter %2)== 0) //cuenta 2 veces 500us = 1ms
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
	GOTO       L__main17
	MOVLW      0
	XORWF      R0+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;ProyectoFinal.c,105 :: 		task1ms();
	CALL       _task1ms+0
;ProyectoFinal.c,106 :: 		}
	GOTO       L_main5
L_main4:
;ProyectoFinal.c,107 :: 		else if ((Ostickcounter %20)==0) //cuenta 20 veces 500us = 10ms
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
	GOTO       L__main18
	MOVLW      0
	XORWF      R0+0, 0
L__main18:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;ProyectoFinal.c,109 :: 		task10ms();
	CALL       _task10ms+0
;ProyectoFinal.c,110 :: 		}
	GOTO       L_main7
L_main6:
;ProyectoFinal.c,111 :: 		else if ((Ostickcounter %200)==0)//cuenta 200 veces 500us = 100ms
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
	GOTO       L__main19
	MOVLW      0
	XORWF      R0+0, 0
L__main19:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;ProyectoFinal.c,113 :: 		task100ms();
	CALL       _task100ms+0
;ProyectoFinal.c,114 :: 		Ostickcounter = 0;
	CLRF       ProyectoFinal_Ostickcounter+0
	CLRF       ProyectoFinal_Ostickcounter+1
;ProyectoFinal.c,115 :: 		}
	GOTO       L_main9
L_main8:
;ProyectoFinal.c,116 :: 		else { }
L_main9:
L_main7:
L_main5:
;ProyectoFinal.c,117 :: 		}
	GOTO       L_main2
;ProyectoFinal.c,120 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
