
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;ProyectoFinal.c,10 :: 		void interrupt()
;ProyectoFinal.c,15 :: 		if(myCount==8)
	MOVLW      0
	XORWF      interrupt_myCount_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt6
	MOVLW      8
	XORWF      interrupt_myCount_L0+0, 0
L__interrupt6:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
;ProyectoFinal.c,17 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,18 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,23 :: 		PORTD.RD5 = ~PORTD.RD5; //Toggle the LED
	MOVLW      32
	XORWF      PORTD+0, 1
;ProyectoFinal.c,24 :: 		myCount = 0;
	CLRF       interrupt_myCount_L0+0
	CLRF       interrupt_myCount_L0+1
;ProyectoFinal.c,25 :: 		}
	GOTO       L_interrupt1
L_interrupt0:
;ProyectoFinal.c,28 :: 		myCount++;
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
;ProyectoFinal.c,29 :: 		}
L_interrupt1:
;ProyectoFinal.c,30 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;ProyectoFinal.c,32 :: 		int main()
;ProyectoFinal.c,34 :: 		TRISA = 0xFF;   //set all digital I/O to inputs
	MOVLW      255
	MOVWF      TRISA+0
;ProyectoFinal.c,35 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ProyectoFinal.c,36 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;ProyectoFinal.c,38 :: 		ANSEL = 0x00;   //disable all analog ports
	CLRF       ANSEL+0
;ProyectoFinal.c,39 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;ProyectoFinal.c,41 :: 		TRISD.TRISD5 = 0;   //set RB7 as an output
	BCF        TRISD+0, 5
;ProyectoFinal.c,47 :: 		OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
	BCF        OPTION_REG+0, 3
;ProyectoFinal.c,50 :: 		OPTION_REG.PS2 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 2
;ProyectoFinal.c,51 :: 		OPTION_REG.PS1 = 1;  //Set the prescaler to 1:256
	BSF        OPTION_REG+0, 1
;ProyectoFinal.c,52 :: 		OPTION_REG.PS0 = 0;  //Set the prescaler to 1:256
	BCF        OPTION_REG+0, 0
;ProyectoFinal.c,54 :: 		OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
	BCF        OPTION_REG+0, 5
;ProyectoFinal.c,58 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,59 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,60 :: 		INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
	BSF        INTCON+0, 5
;ProyectoFinal.c,61 :: 		INTCON.GIE = 1;         //Set the Global Interrupt Enable
	BSF        INTCON+0, 7
;ProyectoFinal.c,67 :: 		while(1)
L_main2:
;ProyectoFinal.c,71 :: 		}
	GOTO       L_main2
;ProyectoFinal.c,74 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
