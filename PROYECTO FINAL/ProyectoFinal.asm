
_LCD_set:

;biblioteca_lcd1.h,190 :: 		void LCD_set(unsigned char *LCD_Ctrl_PORT,unsigned char *LCD_Bus_Data,unsigned char *LCD_Bus_PORT,unsigned char *LCD_Ctrl_Data){ //*****  CONDICION INICIAL EN EL PUERTO PARA EL LCD    ****
;biblioteca_lcd1.h,191 :: 		ANSEL=0;
	CLRF       ANSEL+0
;biblioteca_lcd1.h,192 :: 		myLCD_Bus_Data&=(0<<RS|0<<RW|0<<E);
	MOVLW      0
	ANDWF      ProyectoFinal_myLCD_Bus_Data+0, 1
;biblioteca_lcd1.h,193 :: 		myLCD_Bus_Data=(1<<DB5|1<<DL);
	MOVLW      48
	MOVWF      ProyectoFinal_myLCD_Bus_Data+0
;biblioteca_lcd1.h,194 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      FARG_LCD_set_PORTC+0
;biblioteca_lcd1.h,195 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,196 :: 		*LCD_Ctrl_PORT&=(0<<RS|0<<RW|0<<E);
	MOVF       FARG_LCD_set_TRISC+0, 0
	MOVWF      FSR
	MOVLW      0
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	MOVF       FARG_LCD_set_TRISC+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;biblioteca_lcd1.h,197 :: 		*LCD_Bus_PORT=0;
	MOVF       FARG_LCD_set_TRISC+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;biblioteca_lcd1.h,199 :: 		}
L_end_LCD_set:
	RETURN
; end of _LCD_set

_LCD_Reset:

;biblioteca_lcd1.h,201 :: 		void LCD_Reset(void){         //Funci�n de Reset
;biblioteca_lcd1.h,203 :: 		delay_ms(50);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_LCD_Reset0:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Reset0
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Reset0
	NOP
;biblioteca_lcd1.h,204 :: 		}
L_end_LCD_Reset:
	RETURN
; end of _LCD_Reset

_LCD_Function_Init:

;biblioteca_lcd1.h,206 :: 		void LCD_Function_Init(unsigned char lcd_dl){
;biblioteca_lcd1.h,207 :: 		DB=(1<<DB5)|(lcd_dl<<DB4);
	MOVF       FARG_LCD_Function_Init_lcd_dl+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	BSF        R0+0, 5
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,208 :: 		myLCD_Bus_Data=(DB&0xf0)|(myLCD_Bus_Data&0x0f);
	MOVLW      240
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVLW      15
	ANDWF      ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      ProyectoFinal_myLCD_Bus_Data+0
;biblioteca_lcd1.h,209 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,210 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,212 :: 		myLCD_Bus_Data |= (1<<E);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,213 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,214 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,215 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_LCD_Function_Init1:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Function_Init1
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Function_Init1
;biblioteca_lcd1.h,216 :: 		myLCD_Bus_Data &=~((1<<E));
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,217 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,218 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,219 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_LCD_Function_Init2:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Function_Init2
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Function_Init2
;biblioteca_lcd1.h,220 :: 		}
L_end_LCD_Function_Init:
	RETURN
; end of _LCD_Function_Init

_LCD_Function_Set:

;biblioteca_lcd1.h,222 :: 		void LCD_Function_Set(unsigned char Data_Lenght,unsigned char NumL,unsigned char Font){ //Configuraci�n del LCD
;biblioteca_lcd1.h,229 :: 		DB = (1<<DB5)|(Data_Lenght<<DB4)|(NumL<<DB3)|(Font<<DB2);
	MOVF       FARG_LCD_Function_Set_Data_Lenght+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      32
	IORWF      R0+0, 0
	MOVWF      R3+0
	MOVLW      3
	MOVWF      R2+0
	MOVF       FARG_LCD_Function_Set_NumL+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
L__LCD_Function_Set88:
	BTFSC      STATUS+0, 2
	GOTO       L__LCD_Function_Set89
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__LCD_Function_Set88
L__LCD_Function_Set89:
	MOVF       R0+0, 0
	IORWF      R3+0, 1
	MOVF       FARG_LCD_Function_Set_Font+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R3+0, 0
	IORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,230 :: 		LCD_Enable(DB);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,231 :: 		}
L_end_LCD_Function_Set:
	RETURN
; end of _LCD_Function_Set

_LCD_On_Off:

;biblioteca_lcd1.h,232 :: 		void LCD_On_Off(unsigned char dsp_on_off,unsigned char cur_on_off,unsigned char blk_on_off){        //Activaci�n del LCD
;biblioteca_lcd1.h,239 :: 		DB= (1<<DB3)|(dsp_on_off<<DB2)|(cur_on_off<<DB1)|(blk_on_off<<DB0);
	MOVF       FARG_LCD_On_Off_dsp_on_off+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      8
	IORWF      R0+0, 0
	MOVWF      R3+0
	MOVF       FARG_LCD_On_Off_cur_on_off+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      R3+0, 0
	MOVWF      R2+0
	MOVF       FARG_LCD_On_Off_blk_on_off+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
	IORWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,240 :: 		LCD_Enable(DB);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,241 :: 		}
L_end_LCD_On_Off:
	RETURN
; end of _LCD_On_Off

_LCD_Clear:

;biblioteca_lcd1.h,243 :: 		void LCD_Clear(void){  //Limpiar el Display /******* Clear Display **********
;biblioteca_lcd1.h,246 :: 		DB=0x01;
	MOVLW      1
	MOVWF      _DB+0
;biblioteca_lcd1.h,247 :: 		}
L_end_LCD_Clear:
	RETURN
; end of _LCD_Clear

_LDC_EntryMode_Set:

;biblioteca_lcd1.h,249 :: 		void LDC_EntryMode_Set(unsigned char Mode_in_dec,unsigned char EnterShift_on_off){ //Movimiento del Cursor
;biblioteca_lcd1.h,256 :: 		DB=(1<<DB2)|(Mode_in_dec<<DB1)|(EnterShift_on_off<<DB0);
	MOVF       FARG_LDC_EntryMode_Set_Mode_in_dec+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      4
	IORWF      R0+0, 0
	MOVWF      _DB+0
	MOVF       FARG_LDC_EntryMode_Set_EnterShift_on_off+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R0+0, 0
	IORWF      _DB+0, 1
;biblioteca_lcd1.h,257 :: 		}
L_end_LDC_EntryMode_Set:
	RETURN
; end of _LDC_EntryMode_Set

_LCD_DDRAM_Set:

;biblioteca_lcd1.h,259 :: 		void LCD_DDRAM_Set(unsigned char fila,unsigned char columna) {         //Direcci�n de Inicio en la segunda L�nea en el LCD
;biblioteca_lcd1.h,263 :: 		DB= SET_CURSOR_DDRAM[fila][columna];
	MOVF       FARG_LCD_DDRAM_Set_fila+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      _SET_CURSOR_DDRAM+0
	ADDWF      R0+0, 1
	MOVF       FARG_LCD_DDRAM_Set_columna+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,264 :: 		LCD_Enable(DB);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,265 :: 		}
L_end_LCD_DDRAM_Set:
	RETURN
; end of _LCD_DDRAM_Set

_LCD_Enable:

;biblioteca_lcd1.h,267 :: 		void LCD_Enable(unsigned char DB_){         //Se�al de Habilitaci�n
;biblioteca_lcd1.h,273 :: 		myLCD_Bus_Data=(DB_&0xF0)|(myLCD_Bus_Data&0x0F);
	MOVLW      240
	ANDWF      FARG_LCD_Enable_DB_+0, 0
	MOVWF      R1+0
	MOVLW      15
	ANDWF      ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      ProyectoFinal_myLCD_Bus_Data+0
;biblioteca_lcd1.h,274 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,275 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,278 :: 		myLCD_Bus_Data |= (1<<E);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,279 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,280 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,281 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LCD_Enable3:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Enable3
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Enable3
	NOP
	NOP
;biblioteca_lcd1.h,282 :: 		myLCD_Bus_Data &=~((1<<E));
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,283 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,284 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,285 :: 		delay_ms(2);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_LCD_Enable4:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Enable4
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Enable4
	NOP
	NOP
;biblioteca_lcd1.h,287 :: 		myLCD_Bus_Data=(DB_&0x0F)<<4|(myLCD_Bus_Data&0x0F);
	MOVLW      15
	ANDWF      FARG_LCD_Enable_DB_+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R1+0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	RLF        R1+0, 1
	BCF        R1+0, 0
	MOVLW      15
	ANDWF      ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 0
	MOVWF      ProyectoFinal_myLCD_Bus_Data+0
;biblioteca_lcd1.h,288 :: 		myLCD_Bus_Data|=(1<<E);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,289 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,290 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,291 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_LCD_Enable5:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Enable5
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Enable5
;biblioteca_lcd1.h,292 :: 		myLCD_Bus_Data&=~(1<<E);
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 2
;biblioteca_lcd1.h,293 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,294 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,295 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_LCD_Enable6:
	DECFSZ     R13+0, 1
	GOTO       L_LCD_Enable6
	DECFSZ     R12+0, 1
	GOTO       L_LCD_Enable6
;biblioteca_lcd1.h,297 :: 		}
L_end_LCD_Enable:
	RETURN
; end of _LCD_Enable

_LCD_Nprint:

;biblioteca_lcd1.h,299 :: 		void LCD_Nprint(unsigned int *valor,int x,int y) {
;biblioteca_lcd1.h,300 :: 		LCD_DDRAM_Set(x,y);
	MOVF       FARG_LCD_Nprint_x+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_fila+0
	MOVF       FARG_LCD_Nprint_y+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_columna+0
	CALL       _LCD_DDRAM_Set+0
;biblioteca_lcd1.h,301 :: 		centenas = (*valor / 100)+'0';
	MOVF       FARG_LCD_Nprint_valor+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FLOC__LCD_Nprint+0
	MOVF       FLOC__LCD_Nprint+0, 0
	MOVWF      _centenas+0
;biblioteca_lcd1.h,302 :: 		decenas = ((*valor%100)/ 10)+'0';
	MOVF       FARG_LCD_Nprint_valor+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _decenas+0
;biblioteca_lcd1.h,303 :: 		unidades = ((*valor%100)% 10)+'0';
	MOVF       FARG_LCD_Nprint_valor+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _unidades+0
;biblioteca_lcd1.h,304 :: 		myLCD_Bus_Data |= (1 << RS); // RS en alto para enviar datos
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,305 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,306 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,307 :: 		if(centenas!=(0+'0')){
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_Nprint96
	MOVLW      48
	XORWF      FLOC__LCD_Nprint+0, 0
L__LCD_Nprint96:
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_Nprint7
;biblioteca_lcd1.h,308 :: 		DB=centenas; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
	MOVF       _centenas+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,309 :: 		LCD_Enable(DB);
	MOVF       _centenas+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,310 :: 		}
	GOTO       L_LCD_Nprint8
L_LCD_Nprint7:
;biblioteca_lcd1.h,313 :: 		LCD_Enable(32);
	MOVLW      32
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,314 :: 		}
L_LCD_Nprint8:
;biblioteca_lcd1.h,315 :: 		if(decenas!=(0+'0') || centenas!=(0+'0')){
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_Nprint97
	MOVLW      48
	XORWF      _decenas+0, 0
L__LCD_Nprint97:
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_Nprint80
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_Nprint98
	MOVLW      48
	XORWF      _centenas+0, 0
L__LCD_Nprint98:
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_Nprint80
	GOTO       L_LCD_Nprint11
L__LCD_Nprint80:
;biblioteca_lcd1.h,316 :: 		DB=decenas; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
	MOVF       _decenas+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,317 :: 		LCD_Enable(DB);
	MOVF       _decenas+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,318 :: 		}
	GOTO       L_LCD_Nprint12
L_LCD_Nprint11:
;biblioteca_lcd1.h,321 :: 		LCD_Enable(32);
	MOVLW      32
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,322 :: 		}
L_LCD_Nprint12:
;biblioteca_lcd1.h,323 :: 		DB=unidades; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
	MOVF       _unidades+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,324 :: 		LCD_Enable(DB);
	MOVF       _unidades+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,325 :: 		myLCD_Bus_Data &= ~(1 << RS); // RS en bajo al finalizar el env�o de datos while (i!=10)   {
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,326 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,327 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,328 :: 		}
L_end_LCD_Nprint:
	RETURN
; end of _LCD_Nprint

_LCD_Sprint:

;biblioteca_lcd1.h,330 :: 		void LCD_Sprint(unsigned char *string_buffer,int x,int y){
;biblioteca_lcd1.h,331 :: 		unsigned char i=0;
	CLRF       LCD_Sprint_i_L0+0
;biblioteca_lcd1.h,332 :: 		LCD_DDRAM_Set(x,y);
	MOVF       FARG_LCD_Sprint_x+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_fila+0
	MOVF       FARG_LCD_Sprint_y+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_columna+0
	CALL       _LCD_DDRAM_Set+0
;biblioteca_lcd1.h,333 :: 		myLCD_Bus_Data |=(1<<RS);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,334 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,335 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,336 :: 		while((string_buffer[i]!='\n')){
L_LCD_Sprint13:
	MOVF       LCD_Sprint_i_L0+0, 0
	ADDWF      FARG_LCD_Sprint_string_buffer+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_LCD_Sprint14
;biblioteca_lcd1.h,337 :: 		DB=string_buffer[i];
	MOVF       LCD_Sprint_i_L0+0, 0
	ADDWF      FARG_LCD_Sprint_string_buffer+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,338 :: 		LCD_Enable(DB);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,339 :: 		i++;
	INCF       LCD_Sprint_i_L0+0, 1
;biblioteca_lcd1.h,340 :: 		}
	GOTO       L_LCD_Sprint13
L_LCD_Sprint14:
;biblioteca_lcd1.h,341 :: 		myLCD_Bus_Data &=~(1<<RS);
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,342 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,343 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,344 :: 		}
L_end_LCD_Sprint:
	RETURN
; end of _LCD_Sprint

_LCD_CGRAM_Set:

;biblioteca_lcd1.h,346 :: 		void LCD_CGRAM_Set(unsigned char *patron,unsigned char address){
;biblioteca_lcd1.h,351 :: 		DB=0x40|(address<<3);
	MOVF       FARG_LCD_CGRAM_Set_address+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,352 :: 		myLCD_Bus_Data |=(0<<RS);
;biblioteca_lcd1.h,353 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,354 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,355 :: 		LCD_Enable(DB);
	MOVF       R2+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,356 :: 		for(i=0;i<kfig;i++){
	CLRF       LCD_CGRAM_Set_i_L0+0
	CLRF       LCD_CGRAM_Set_i_L0+1
L_LCD_CGRAM_Set15:
	MOVLW      128
	XORWF      LCD_CGRAM_Set_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__LCD_CGRAM_Set101
	MOVLW      16
	SUBWF      LCD_CGRAM_Set_i_L0+0, 0
L__LCD_CGRAM_Set101:
	BTFSC      STATUS+0, 0
	GOTO       L_LCD_CGRAM_Set16
;biblioteca_lcd1.h,357 :: 		myLCD_Bus_Data |=(1<<RS);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,358 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,359 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,360 :: 		DB=patron[i];
	MOVF       LCD_CGRAM_Set_i_L0+0, 0
	ADDWF      FARG_LCD_CGRAM_Set_patron+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _DB+0
;biblioteca_lcd1.h,361 :: 		LCD_Enable(DB);
	MOVF       R0+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,356 :: 		for(i=0;i<kfig;i++){
	INCF       LCD_CGRAM_Set_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       LCD_CGRAM_Set_i_L0+1, 1
;biblioteca_lcd1.h,362 :: 		}
	GOTO       L_LCD_CGRAM_Set15
L_LCD_CGRAM_Set16:
;biblioteca_lcd1.h,363 :: 		myLCD_Bus_Data &=~(1<<RS);
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,364 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,365 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,366 :: 		}
L_end_LCD_CGRAM_Set:
	RETURN
; end of _LCD_CGRAM_Set

_LCD_Write:

;biblioteca_lcd1.h,368 :: 		void LCD_Write(unsigned char *string_buffer,int x,int y){
;biblioteca_lcd1.h,369 :: 		LCD_DDRAM_Set(x,y);
	MOVF       FARG_LCD_Write_x+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_fila+0
	MOVF       FARG_LCD_Write_y+0, 0
	MOVWF      FARG_LCD_DDRAM_Set_columna+0
	CALL       _LCD_DDRAM_Set+0
;biblioteca_lcd1.h,370 :: 		myLCD_Bus_Data |=(1<<RS);
	BSF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,371 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,372 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,373 :: 		LCD_Enable(string_buffer);
	MOVF       FARG_LCD_Write_string_buffer+0, 0
	MOVWF      FARG_LCD_Enable_DB_+0
	CALL       _LCD_Enable+0
;biblioteca_lcd1.h,374 :: 		myLCD_Bus_Data &=~(1<<RS);
	BCF        ProyectoFinal_myLCD_Bus_Data+0, 0
;biblioteca_lcd1.h,375 :: 		PORTC = myLCD_Bus_Data;
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      PORTC+0
;biblioteca_lcd1.h,376 :: 		PORTA = ((myLCD_Bus_Data) >> 2);
	MOVF       ProyectoFinal_myLCD_Bus_Data+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTA+0
;biblioteca_lcd1.h,377 :: 		}
L_end_LCD_Write:
	RETURN
; end of _LCD_Write

_ADCConversionLDR:

;ProyectoFinal.c,20 :: 		void ADCConversionLDR(void)
;ProyectoFinal.c,22 :: 		ADCON0.GO_DONE=1; //Inicio de Conversi�n
	BSF        ADCON0+0, 1
;ProyectoFinal.c,23 :: 		while(ADCON0.GO_DONE){}; //TODO quitar esta basura :)
L_ADCConversionLDR18:
	BTFSS      ADCON0+0, 1
	GOTO       L_ADCConversionLDR19
	GOTO       L_ADCConversionLDR18
L_ADCConversionLDR19:
;ProyectoFinal.c,25 :: 		cuenta = ((ADRESH&0x3)<<8) | (ADRESL&0x00FF);
	MOVLW      3
	ANDWF      ADRESH+0, 0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R1+1
	CLRF       R1+0
	MOVLW      255
	ANDWF      ADRESL+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	MOVLW      0
	IORWF      R1+1, 1
	MOVF       R1+0, 0
	MOVWF      _cuenta+0
	MOVF       R1+1, 0
	MOVWF      _cuenta+1
;ProyectoFinal.c,26 :: 		if (cuenta > 999) {
	MOVF       R1+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__ADCConversionLDR104
	MOVF       R1+0, 0
	SUBLW      231
L__ADCConversionLDR104:
	BTFSC      STATUS+0, 0
	GOTO       L_ADCConversionLDR20
;ProyectoFinal.c,27 :: 		cuenta = 999;
	MOVLW      231
	MOVWF      _cuenta+0
	MOVLW      3
	MOVWF      _cuenta+1
;ProyectoFinal.c,28 :: 		}
L_ADCConversionLDR20:
;ProyectoFinal.c,31 :: 		}
L_end_ADCConversionLDR:
	RETURN
; end of _ADCConversionLDR

_Mangueras:

;ProyectoFinal.c,33 :: 		void Mangueras()
;ProyectoFinal.c,35 :: 		PORTE.RE0 = 1; // Manguera 1
	BSF        PORTE+0, 0
;ProyectoFinal.c,36 :: 		PORTE.RE1 = 1; // Manguera 2
	BSF        PORTE+0, 1
;ProyectoFinal.c,37 :: 		PORTE.RE2 = 1; // Manguera 3
	BSF        PORTE+0, 2
;ProyectoFinal.c,38 :: 		}
L_end_Mangueras:
	RETURN
; end of _Mangueras

_I2C_init:

;ProyectoFinal.c,41 :: 		void I2C_init(void) /* Inicializa I2C */
;ProyectoFinal.c,43 :: 		I2C_port(); //Configuración de Dirección de Terminales
	CALL       _I2C_port+0
;ProyectoFinal.c,44 :: 		SSPCON |= Master_Mode_Clock;    //Modo Maestro con Control del Reloj
	BSF        SSPCON+0, 3
;ProyectoFinal.c,45 :: 		SSPCON.SSPEN =1; //Habilita el Módulo MSSP en modo I2C
	BSF        SSPCON+0, 5
;ProyectoFinal.c,46 :: 		SSPADD = SSPADD_Speed; //Velocidad del I2C
	MOVLW      9
	MOVWF      SSPADD+0
;ProyectoFinal.c,47 :: 		SSPSTAT.SMP = 1; //Control de Velocidad Inhabilitado
	BSF        SSPSTAT+0, 7
;ProyectoFinal.c,48 :: 		}
L_end_I2C_init:
	RETURN
; end of _I2C_init

_I2C_port:

;ProyectoFinal.c,50 :: 		void I2C_port(void) /* Configura puerto para I2C */
;ProyectoFinal.c,52 :: 		SCL_Dir = 1; //Salida de Reloj
	BSF        TRISC+0, 3
;ProyectoFinal.c,53 :: 		SDA_Dir = 1; //Entrada/Salida de Reloj
	BSF        TRISC+0, 4
;ProyectoFinal.c,54 :: 		}
L_end_I2C_port:
	RETURN
; end of _I2C_port

_I2C_wait:

;ProyectoFinal.c,56 :: 		void I2C_wait(void) /* Espera a que las funciones terminen */
;ProyectoFinal.c,58 :: 		while( SSPSTAT.R_W | SSPCON2.ACKEN | SSPCON2.RCEN | SSPCON2.PEN | SSPCON2.RSEN | SSPCON2.SEN);
L_I2C_wait21:
	BTFSC      SSPSTAT+0, 2
	GOTO       L__I2C_wait109
	BTFSC      SSPCON2+0, 4
	GOTO       L__I2C_wait109
	BCF        3, 0
	GOTO       L__I2C_wait110
L__I2C_wait109:
	BSF        3, 0
L__I2C_wait110:
	BTFSC      3, 0
	GOTO       L__I2C_wait111
	BTFSC      SSPCON2+0, 3
	GOTO       L__I2C_wait111
	BCF        112, 0
	GOTO       L__I2C_wait112
L__I2C_wait111:
	BSF        112, 0
L__I2C_wait112:
	BTFSC      112, 0
	GOTO       L__I2C_wait113
	BTFSC      SSPCON2+0, 2
	GOTO       L__I2C_wait113
	BCF        3, 0
	GOTO       L__I2C_wait114
L__I2C_wait113:
	BSF        3, 0
L__I2C_wait114:
	BTFSC      3, 0
	GOTO       L__I2C_wait115
	BTFSC      SSPCON2+0, 1
	GOTO       L__I2C_wait115
	BCF        112, 0
	GOTO       L__I2C_wait116
L__I2C_wait115:
	BSF        112, 0
L__I2C_wait116:
	BTFSC      112, 0
	GOTO       L__I2C_wait117
	BTFSC      SSPCON2+0, 0
	GOTO       L__I2C_wait117
	BCF        3, 0
	GOTO       L__I2C_wait118
L__I2C_wait117:
	BSF        3, 0
L__I2C_wait118:
	BTFSS      3, 0
	GOTO       L_I2C_wait22
	GOTO       L_I2C_wait21
L_I2C_wait22:
;ProyectoFinal.c,59 :: 		return;
;ProyectoFinal.c,60 :: 		}
L_end_I2C_wait:
	RETURN
; end of _I2C_wait

_I2C_start:

;ProyectoFinal.c,62 :: 		void I2C_start(void)
;ProyectoFinal.c,64 :: 		SSPCON2.SEN = 1; //Inicia comunicación
	BSF        SSPCON2+0, 0
;ProyectoFinal.c,65 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,66 :: 		}
L_end_I2C_start:
	RETURN
; end of _I2C_start

_I2C_restart:

;ProyectoFinal.c,68 :: 		void I2C_restart(void)
;ProyectoFinal.c,70 :: 		SSPCON2.RSEN = 1; //Reinicia comunicación
	BSF        SSPCON2+0, 1
;ProyectoFinal.c,71 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,72 :: 		}
L_end_I2C_restart:
	RETURN
; end of _I2C_restart

_I2C_stop:

;ProyectoFinal.c,74 :: 		void I2C_stop(void)
;ProyectoFinal.c,76 :: 		SSPCON2.PEN = 1; //Paro de comunicación
	BSF        SSPCON2+0, 2
;ProyectoFinal.c,77 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,78 :: 		}
L_end_I2C_stop:
	RETURN
; end of _I2C_stop

_I2C_write:

;ProyectoFinal.c,80 :: 		void I2C_write(unsigned char AData)
;ProyectoFinal.c,82 :: 		SSPBUF = AData;     //DirecciÛn o Dato al SSPBUF
	MOVF       FARG_I2C_write_AData+0, 0
	MOVWF      SSPBUF+0
;ProyectoFinal.c,83 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,84 :: 		}
L_end_I2C_write:
	RETURN
; end of _I2C_write

_I2C_read:

;ProyectoFinal.c,86 :: 		unsigned char I2C_read(unsigned char ack)
;ProyectoFinal.c,89 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,90 :: 		SSPCON2.RCEN = 1; //Inicia recepciÛn
	BSF        SSPCON2+0, 3
;ProyectoFinal.c,91 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,92 :: 		buffer = SSPBUF;
	MOVF       SSPBUF+0, 0
	MOVWF      I2C_read_buffer_L0+0
;ProyectoFinal.c,93 :: 		I2C_wait();
	CALL       _I2C_wait+0
;ProyectoFinal.c,94 :: 		SSPCON2.ACKDT = ack; //Recibe el Acknowledge
	BTFSC      FARG_I2C_read_ack+0, 0
	GOTO       L__I2C_read124
	BCF        SSPCON2+0, 5
	GOTO       L__I2C_read125
L__I2C_read124:
	BSF        SSPCON2+0, 5
L__I2C_read125:
;ProyectoFinal.c,95 :: 		SSPCON2.ACKEN = 1; //Habilita el envÌo del Acknowledge
	BSF        SSPCON2+0, 4
;ProyectoFinal.c,96 :: 		return buffer;
	MOVF       I2C_read_buffer_L0+0, 0
	MOVWF      R0+0
;ProyectoFinal.c,97 :: 		}
L_end_I2C_read:
	RETURN
; end of _I2C_read

_I2C_DS1307W:

;ProyectoFinal.c,101 :: 		void I2C_DS1307W(void)
;ProyectoFinal.c,104 :: 		I2C_init(); //Configuración I2C
	CALL       _I2C_init+0
;ProyectoFinal.c,105 :: 		I2C_start(); //Inicio Comunicación
	CALL       _I2C_start+0
;ProyectoFinal.c,106 :: 		I2C_write(DS1307_W);  //Dirección + Write
	MOVLW      208
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,107 :: 		I2C_write(0x00);      //Dirección Inicial (Inicia Puntero del Esclavo)
	CLRF       FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,108 :: 		I2C_write(Seg);    //Escritura de Segundos (00-59)
	MOVF       _Seg+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,109 :: 		I2C_write(Min);    //Escritura de Minutos (00-59)
	MOVF       _Min+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,110 :: 		I2C_write(Hour);      //Escritura de Horas (00-23)
	MOVF       _Hour+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,111 :: 		I2C_write(Day); //Escritura de Día de la Semana (01-07, Dom-Lun)
	MOVF       _Day+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,112 :: 		I2C_write(Date);      //Escritura de Día del Mes (00-31)
	MOVF       _Date+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,113 :: 		I2C_write(Month);     //Escritura de Mes (01-12)
	MOVF       _Month+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,114 :: 		I2C_write(Year);      //Escritura de A–o (00-99, 2000-2099)
	MOVF       _Year+0, 0
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,115 :: 		I2C_stop();
	CALL       _I2C_stop+0
;ProyectoFinal.c,116 :: 		}
L_end_I2C_DS1307W:
	RETURN
; end of _I2C_DS1307W

_I2C_DS1307R:

;ProyectoFinal.c,121 :: 		void I2C_DS1307R(void)
;ProyectoFinal.c,123 :: 		I2C_start(); //Inicio Comunicación
	CALL       _I2C_start+0
;ProyectoFinal.c,124 :: 		I2C_write(DS1307_W);   //Dirección + Write
	MOVLW      208
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,125 :: 		I2C_write(0x00); //Dirección Inicial(Inicia Puntero del Esclavo)
	CLRF       FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,126 :: 		I2C_restart(); //Reinicio de Comunicación
	CALL       _I2C_restart+0
;ProyectoFinal.c,127 :: 		I2C_write(DS1307_R);   //Dirección + Read
	MOVLW      209
	MOVWF      FARG_I2C_write_AData+0
	CALL       _I2C_write+0
;ProyectoFinal.c,128 :: 		Seg = I2C_read(ACK);   //Lectura de Segundos
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Seg+0
;ProyectoFinal.c,129 :: 		Min = I2C_read(ACK);   //Lectura de Minutos
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Min+0
;ProyectoFinal.c,130 :: 		Hour = I2C_read(ACK);  //Lectura de Horas
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Hour+0
;ProyectoFinal.c,131 :: 		Day = I2C_read(ACK);  //Lectura de Día (Domingo...S‡bado)
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Day+0
;ProyectoFinal.c,132 :: 		Date = I2C_read(ACK);  //Lectura de Día del Mes
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Date+0
;ProyectoFinal.c,133 :: 		Month = I2C_read(ACK); //Lectura de MES (Enero...Diciembre)
	CLRF       FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Month+0
;ProyectoFinal.c,134 :: 		Year = I2C_read(NACK); //Lectura de Año
	MOVLW      1
	MOVWF      FARG_I2C_read_ack+0
	CALL       _I2C_read+0
	MOVF       R0+0, 0
	MOVWF      _Year+0
;ProyectoFinal.c,135 :: 		I2C_stop();            //Fin de Comunicación
	CALL       _I2C_stop+0
;ProyectoFinal.c,136 :: 		}
L_end_I2C_DS1307R:
	RETURN
; end of _I2C_DS1307R

_Tecla_Presionada:

;ProyectoFinal.c,138 :: 		unsigned char Tecla_Presionada(void)
;ProyectoFinal.c,144 :: 		for (Filas=0x01;Filas!=0x10;Filas = Filas << 1)
	MOVLW      1
	MOVWF      R1+0
L_Tecla_Presionada23:
	MOVF       R1+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada24
;ProyectoFinal.c,146 :: 		Teclado_Out = Filas;    //Filas a puerto
	MOVF       R1+0, 0
	MOVWF      PORTB+0
;ProyectoFinal.c,148 :: 		delay_ms(2);           //Evitar rebote (bounce)
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Tecla_Presionada26:
	DECFSZ     R13+0, 1
	GOTO       L_Tecla_Presionada26
	DECFSZ     R12+0, 1
	GOTO       L_Tecla_Presionada26
	NOP
	NOP
;ProyectoFinal.c,149 :: 		CF = Teclado_In;         //Lectura del Teclado, Columnas y Filas
	MOVF       PORTB+0, 0
	MOVWF      R2+0
;ProyectoFinal.c,152 :: 		switch (CF)
	GOTO       L_Tecla_Presionada27
;ProyectoFinal.c,154 :: 		case 0x11: return TP=1;  break; //1
L_Tecla_Presionada29:
	MOVLW      1
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,155 :: 		case 0x21: return TP=2;  break; //2
L_Tecla_Presionada30:
	MOVLW      2
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,156 :: 		case 0x41: return TP=3;  break; //3
L_Tecla_Presionada31:
	MOVLW      3
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,157 :: 		case 0x81: return TP=10; break; //A
L_Tecla_Presionada32:
	MOVLW      10
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,158 :: 		case 0x12: return TP=4;  break; //4
L_Tecla_Presionada33:
	MOVLW      4
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,159 :: 		case 0x22: return TP=5;  break; //5
L_Tecla_Presionada34:
	MOVLW      5
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,160 :: 		case 0x42: return TP=6;  break; //6
L_Tecla_Presionada35:
	MOVLW      6
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,161 :: 		case 0x82: return TP=11; break; //B
L_Tecla_Presionada36:
	MOVLW      11
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,162 :: 		case 0x14: return TP=7;  break; //7
L_Tecla_Presionada37:
	MOVLW      7
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,163 :: 		case 0x24: return TP=8;  break; //8
L_Tecla_Presionada38:
	MOVLW      8
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,164 :: 		case 0x44: return TP=9;  break; //9
L_Tecla_Presionada39:
	MOVLW      9
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,165 :: 		case 0x84: return TP=12; break; //C
L_Tecla_Presionada40:
	MOVLW      12
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,166 :: 		case 0x18: return TP=14; break; //E
L_Tecla_Presionada41:
	MOVLW      14
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,167 :: 		case 0x28: return TP=0;  break; //0
L_Tecla_Presionada42:
	CLRF       R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,168 :: 		case 0x48: return TP=15; break; //F
L_Tecla_Presionada43:
	MOVLW      15
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,169 :: 		case 0x88: return TP=13; break; //D
L_Tecla_Presionada44:
	MOVLW      13
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	GOTO       L_end_Tecla_Presionada
;ProyectoFinal.c,170 :: 		}
L_Tecla_Presionada27:
	MOVF       R2+0, 0
	XORLW      17
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada29
	MOVF       R2+0, 0
	XORLW      33
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada30
	MOVF       R2+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada31
	MOVF       R2+0, 0
	XORLW      129
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada32
	MOVF       R2+0, 0
	XORLW      18
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada33
	MOVF       R2+0, 0
	XORLW      34
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada34
	MOVF       R2+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada35
	MOVF       R2+0, 0
	XORLW      130
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada36
	MOVF       R2+0, 0
	XORLW      20
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada37
	MOVF       R2+0, 0
	XORLW      36
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada38
	MOVF       R2+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada39
	MOVF       R2+0, 0
	XORLW      132
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada40
	MOVF       R2+0, 0
	XORLW      24
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada41
	MOVF       R2+0, 0
	XORLW      40
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada42
	MOVF       R2+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada43
	MOVF       R2+0, 0
	XORLW      136
	BTFSC      STATUS+0, 2
	GOTO       L_Tecla_Presionada44
;ProyectoFinal.c,144 :: 		for (Filas=0x01;Filas!=0x10;Filas = Filas << 1)
	RLF        R1+0, 1
	BCF        R1+0, 0
;ProyectoFinal.c,171 :: 		}
	GOTO       L_Tecla_Presionada23
L_Tecla_Presionada24:
;ProyectoFinal.c,173 :: 		return TP=16;   //Teclado sin Presionar
	MOVLW      16
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      R0+0
;ProyectoFinal.c,174 :: 		}
L_end_Tecla_Presionada:
	RETURN
; end of _Tecla_Presionada

_StepperMotorControl:

;ProyectoFinal.c,176 :: 		void StepperMotorControl (int direcciongiro) // 0 para derecha 1 para izquierda
;ProyectoFinal.c,181 :: 		switch (estadodesecuencia){
	GOTO       L_StepperMotorControl45
;ProyectoFinal.c,182 :: 		case 0:
L_StepperMotorControl47:
;ProyectoFinal.c,183 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,184 :: 		PORTD |= 0b1001; // Paso 1
	MOVLW      9
	IORWF      PORTD+0, 1
;ProyectoFinal.c,185 :: 		break;
	GOTO       L_StepperMotorControl46
;ProyectoFinal.c,186 :: 		case 3:
L_StepperMotorControl48:
;ProyectoFinal.c,187 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,188 :: 		PORTD |= 0b0011; // Paso 2
	MOVLW      3
	IORWF      PORTD+0, 1
;ProyectoFinal.c,189 :: 		break;
	GOTO       L_StepperMotorControl46
;ProyectoFinal.c,190 :: 		case 6:
L_StepperMotorControl49:
;ProyectoFinal.c,191 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,192 :: 		PORTD |= 0b0110; // Paso 3
	MOVLW      6
	IORWF      PORTD+0, 1
;ProyectoFinal.c,193 :: 		break;
	GOTO       L_StepperMotorControl46
;ProyectoFinal.c,194 :: 		case 9:
L_StepperMotorControl50:
;ProyectoFinal.c,195 :: 		PORTD &= 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,196 :: 		PORTD |= 0b1100; // Paso 4
	MOVLW      12
	IORWF      PORTD+0, 1
;ProyectoFinal.c,197 :: 		break;
	GOTO       L_StepperMotorControl46
;ProyectoFinal.c,198 :: 		default:
L_StepperMotorControl51:
;ProyectoFinal.c,199 :: 		break;
	GOTO       L_StepperMotorControl46
;ProyectoFinal.c,200 :: 		}
L_StepperMotorControl45:
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl47
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl48
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl49
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_StepperMotorControl50
	GOTO       L_StepperMotorControl51
L_StepperMotorControl46:
;ProyectoFinal.c,202 :: 		if(direcciongiro == 1)
	MOVLW      0
	XORWF      FARG_StepperMotorControl_direcciongiro+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__StepperMotorControl130
	MOVLW      1
	XORWF      FARG_StepperMotorControl_direcciongiro+0, 0
L__StepperMotorControl130:
	BTFSS      STATUS+0, 2
	GOTO       L_StepperMotorControl52
;ProyectoFinal.c,204 :: 		estadodesecuencia = (estadodesecuencia < 9)?(estadodesecuencia+1):(0);
	MOVLW      9
	SUBWF      StepperMotorControl_estadodesecuencia_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_StepperMotorControl53
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	ADDLW      1
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
	GOTO       L_StepperMotorControl54
L_StepperMotorControl53:
	CLRF       R1+0
	CLRF       R1+1
L_StepperMotorControl54:
	MOVF       R1+0, 0
	MOVWF      StepperMotorControl_estadodesecuencia_L0+0
;ProyectoFinal.c,205 :: 		}
	GOTO       L_StepperMotorControl55
L_StepperMotorControl52:
;ProyectoFinal.c,208 :: 		estadodesecuencia = (estadodesecuencia > 0)? (estadodesecuencia-1):(9);
	MOVF       StepperMotorControl_estadodesecuencia_L0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_StepperMotorControl56
	MOVLW      1
	SUBWF      StepperMotorControl_estadodesecuencia_L0+0, 0
	MOVWF      R3+0
	MOVLW      0
	MOVWF      R3+1
	GOTO       L_StepperMotorControl57
L_StepperMotorControl56:
	MOVLW      9
	MOVWF      R3+0
	MOVLW      0
	MOVWF      R3+1
L_StepperMotorControl57:
	MOVF       R3+0, 0
	MOVWF      StepperMotorControl_estadodesecuencia_L0+0
;ProyectoFinal.c,209 :: 		}
L_StepperMotorControl55:
;ProyectoFinal.c,211 :: 		}
L_end_StepperMotorControl:
	RETURN
; end of _StepperMotorControl

_Ancho_Pulso:

;ProyectoFinal.c,214 :: 		void Ancho_Pulso(int ancho)         //Ancho de Pulso
;ProyectoFinal.c,219 :: 		CCP1CON |=  ((ancho&0x0003)<<4);
	MOVLW      3
	ANDWF      FARG_Ancho_Pulso_ancho+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	IORWF      CCP1CON+0, 1
;ProyectoFinal.c,220 :: 		CCPR1L  =   ancho>>2;
	MOVF       FARG_Ancho_Pulso_ancho+0, 0
	MOVWF      R0+0
	MOVF       FARG_Ancho_Pulso_ancho+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	BTFSC      R0+1, 6
	BSF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      CCPR1L+0
;ProyectoFinal.c,221 :: 		}
L_end_Ancho_Pulso:
	RETURN
; end of _Ancho_Pulso

_Periodo:

;ProyectoFinal.c,225 :: 		void Periodo(int t_useg)   //Per�odo de la se�al
;ProyectoFinal.c,230 :: 		PR2=(t_useg-1);
	DECF       FARG_Periodo_t_useg+0, 0
	MOVWF      PR2+0
;ProyectoFinal.c,231 :: 		}
L_end_Periodo:
	RETURN
; end of _Periodo

_displayControl:

;ProyectoFinal.c,235 :: 		void displayControl(void)
;ProyectoFinal.c,241 :: 		if(refreshRate == 2 && displayStateMachine == 0)
	MOVLW      0
	XORWF      displayControl_refreshRate_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__displayControl134
	MOVLW      2
	XORWF      displayControl_refreshRate_L0+0, 0
L__displayControl134:
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl60
	MOVF       displayControl_displayStateMachine_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl60
L__displayControl83:
;ProyectoFinal.c,244 :: 		LCD_Write(0x04,1,1);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      1
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,245 :: 		LCD_Write(0x04,1,5);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      5
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,246 :: 		LCD_Write(0x04,1,9);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      9
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,247 :: 		LCD_Write(0x04,1,13);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      13
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,249 :: 		LCD_Write(0x01,1,3);
	MOVLW      1
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      3
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,250 :: 		LCD_Write(0x02,1,7);
	MOVLW      2
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      7
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,251 :: 		LCD_Write(0x03,1,11);
	MOVLW      3
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      11
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,253 :: 		refreshRate=0;
	CLRF       displayControl_refreshRate_L0+0
	CLRF       displayControl_refreshRate_L0+1
;ProyectoFinal.c,254 :: 		displayStateMachine = 1;
	MOVLW      1
	MOVWF      displayControl_displayStateMachine_L0+0
;ProyectoFinal.c,255 :: 		}
	GOTO       L_displayControl61
L_displayControl60:
;ProyectoFinal.c,256 :: 		else if(refreshRate == 2 && displayStateMachine == 1)
	MOVLW      0
	XORWF      displayControl_refreshRate_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__displayControl135
	MOVLW      2
	XORWF      displayControl_refreshRate_L0+0, 0
L__displayControl135:
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl64
	MOVF       displayControl_displayStateMachine_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl64
L__displayControl82:
;ProyectoFinal.c,258 :: 		LCD_Write(0x04,1,3);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      3
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,259 :: 		LCD_Write(0x04,1,7);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      7
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,260 :: 		LCD_Write(0x04,1,11);
	MOVLW      4
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      11
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,262 :: 		LCD_Write(0x05,1,1);
	MOVLW      5
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      1
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,263 :: 		LCD_Write(0x06,1,5);
	MOVLW      6
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      5
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,264 :: 		LCD_Write(0x07,1,9);
	MOVLW      7
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      9
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,265 :: 		LCD_Write(0x08,1,13);
	MOVLW      8
	MOVWF      FARG_LCD_Write_string_buffer+0
	MOVLW      1
	MOVWF      FARG_LCD_Write_x+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_x+1
	MOVLW      13
	MOVWF      FARG_LCD_Write_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Write_y+1
	CALL       _LCD_Write+0
;ProyectoFinal.c,267 :: 		refreshRate=0;
	CLRF       displayControl_refreshRate_L0+0
	CLRF       displayControl_refreshRate_L0+1
;ProyectoFinal.c,268 :: 		displayStateMachine = 2;
	MOVLW      2
	MOVWF      displayControl_displayStateMachine_L0+0
;ProyectoFinal.c,269 :: 		}
	GOTO       L_displayControl65
L_displayControl64:
;ProyectoFinal.c,270 :: 		else if(refreshRate == 2 && displayStateMachine == 2)
	MOVLW      0
	XORWF      displayControl_refreshRate_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__displayControl136
	MOVLW      2
	XORWF      displayControl_refreshRate_L0+0, 0
L__displayControl136:
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl68
	MOVF       displayControl_displayStateMachine_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_displayControl68
L__displayControl81:
;ProyectoFinal.c,273 :: 		LCD_Nprint(&cuenta2,0,1);
	MOVLW      _cuenta2+0
	MOVWF      FARG_LCD_Nprint_valor+0
	CLRF       FARG_LCD_Nprint_x+0
	CLRF       FARG_LCD_Nprint_x+1
	MOVLW      1
	MOVWF      FARG_LCD_Nprint_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Nprint_y+1
	CALL       _LCD_Nprint+0
;ProyectoFinal.c,274 :: 		LCD_Nprint(&cuenta,0,11);
	MOVLW      _cuenta+0
	MOVWF      FARG_LCD_Nprint_valor+0
	CLRF       FARG_LCD_Nprint_x+0
	CLRF       FARG_LCD_Nprint_x+1
	MOVLW      11
	MOVWF      FARG_LCD_Nprint_y+0
	MOVLW      0
	MOVWF      FARG_LCD_Nprint_y+1
	CALL       _LCD_Nprint+0
;ProyectoFinal.c,276 :: 		refreshRate=0;
	CLRF       displayControl_refreshRate_L0+0
	CLRF       displayControl_refreshRate_L0+1
;ProyectoFinal.c,277 :: 		displayStateMachine = 0;
	CLRF       displayControl_displayStateMachine_L0+0
;ProyectoFinal.c,278 :: 		}
	GOTO       L_displayControl69
L_displayControl68:
;ProyectoFinal.c,281 :: 		}
L_displayControl69:
L_displayControl65:
L_displayControl61:
;ProyectoFinal.c,283 :: 		refreshRate++;
	MOVF       displayControl_refreshRate_L0+0, 0
	ADDLW      1
	MOVWF      R0+0
	MOVLW      0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      displayControl_refreshRate_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      displayControl_refreshRate_L0+0
	MOVF       R0+1, 0
	MOVWF      displayControl_refreshRate_L0+1
;ProyectoFinal.c,284 :: 		}
L_end_displayControl:
	RETURN
; end of _displayControl

_inittask:

;ProyectoFinal.c,286 :: 		void inittask (void)
;ProyectoFinal.c,289 :: 		TRISD = 0x00; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
	CLRF       TRISD+0
;ProyectoFinal.c,290 :: 		PORTD &= 0xF0;        // Inicializar los 4 BITS a 0
	MOVLW      240
	ANDWF      PORTD+0, 1
;ProyectoFinal.c,294 :: 		LCD_set(&LCD_Ctrl_PORT,&LCD_Bus_Data,&LCD_Bus_PORT,&LCD_Ctrl_Data);
	MOVLW      TRISC+0
	MOVWF      FARG_LCD_set_TRISC+0
	MOVLW      PORTC+0
	MOVWF      FARG_LCD_set_PORTC+0
	MOVLW      TRISC+0
	MOVWF      FARG_LCD_set_TRISC+0
	MOVLW      PORTC+0
	MOVWF      FARG_LCD_set_PORTC+0
	CALL       _LCD_set+0
;ProyectoFinal.c,295 :: 		LCD_Reset();
	CALL       _LCD_Reset+0
;ProyectoFinal.c,296 :: 		LCD_Function_Init(true);
	MOVLW      1
	MOVWF      FARG_LCD_Function_Init_lcd_dl+0
	CALL       _LCD_Function_Init+0
;ProyectoFinal.c,297 :: 		LCD_Function_Init(true);
	MOVLW      1
	MOVWF      FARG_LCD_Function_Init_lcd_dl+0
	CALL       _LCD_Function_Init+0
;ProyectoFinal.c,298 :: 		LCD_Function_Init(false);
	CLRF       FARG_LCD_Function_Init_lcd_dl+0
	CALL       _LCD_Function_Init+0
;ProyectoFinal.c,299 :: 		LCD_Function_Set(NB,NL_2,F5_10);
	CLRF       FARG_LCD_Function_Set_Data_Lenght+0
	MOVLW      1
	MOVWF      FARG_LCD_Function_Set_NumL+0
	MOVLW      1
	MOVWF      FARG_LCD_Function_Set_Font+0
	CALL       _LCD_Function_Set+0
;ProyectoFinal.c,300 :: 		LCD_Function_Set(NB,NL_2,F5_10);
	CLRF       FARG_LCD_Function_Set_Data_Lenght+0
	MOVLW      1
	MOVWF      FARG_LCD_Function_Set_NumL+0
	MOVLW      1
	MOVWF      FARG_LCD_Function_Set_Font+0
	CALL       _LCD_Function_Set+0
;ProyectoFinal.c,301 :: 		LCD_On_Off(Dsp_ON,Cur_ON,Blk_OFF);
	MOVLW      1
	MOVWF      FARG_LCD_On_Off_dsp_on_off+0
	MOVLW      1
	MOVWF      FARG_LCD_On_Off_cur_on_off+0
	CLRF       FARG_LCD_On_Off_blk_on_off+0
	CALL       _LCD_On_Off+0
;ProyectoFinal.c,302 :: 		LCD_Clear();
	CALL       _LCD_Clear+0
;ProyectoFinal.c,303 :: 		LDC_EntryMode_Set(Mode_INC,EntireShift_OFF);
	MOVLW      1
	MOVWF      FARG_LDC_EntryMode_Set_Mode_in_dec+0
	CLRF       FARG_LDC_EntryMode_Set_EnterShift_on_off+0
	CALL       _LDC_EntryMode_Set+0
;ProyectoFinal.c,305 :: 		LCD_CGRAM_Set(&FIG1,1);
	MOVLW      _FIG1+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      1
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,306 :: 		LCD_CGRAM_Set(&FIG2,2);
	MOVLW      _FIG2+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      2
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,307 :: 		LCD_CGRAM_Set(&FIG3,3);
	MOVLW      _FIG3+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      3
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,308 :: 		LCD_CGRAM_Set(&FIG4,4);
	MOVLW      _FIG4+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      4
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,309 :: 		LCD_CGRAM_Set(&FIG5,5);
	MOVLW      _FIG5+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      5
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,310 :: 		LCD_CGRAM_Set(&FIG6,6);
	MOVLW      _FIG6+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      6
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,311 :: 		LCD_CGRAM_Set(&FIG7,7);
	MOVLW      _FIG7+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      7
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,312 :: 		LCD_CGRAM_Set(&FIG8,8);
	MOVLW      _FIG8+0
	MOVWF      FARG_LCD_CGRAM_Set_patron+0
	MOVLW      8
	MOVWF      FARG_LCD_CGRAM_Set_address+0
	CALL       _LCD_CGRAM_Set+0
;ProyectoFinal.c,316 :: 		TRISA.RA0=1; //Bit 0 del Puerto A como entrada
	BSF        TRISA+0, 0
;ProyectoFinal.c,317 :: 		ANSEL.RA0=1; //Bit O del Puerto A como entrada analoga.
	BSF        ANSEL+0, 0
;ProyectoFinal.c,319 :: 		ADCON0.ADCS1=1; //Selecci�n del Oscilador Interno FRC
	BSF        ADCON0+0, 7
;ProyectoFinal.c,320 :: 		ADCON0.ADCS0=1;             //Selecci�n del canal 0 de forma predeterminada
	BSF        ADCON0+0, 6
;ProyectoFinal.c,322 :: 		ADCON1.ADFM=1; //Justificado a la Derecha
	BSF        ADCON1+0, 7
;ProyectoFinal.c,324 :: 		ADCON0.ADON=1; //Encendido del ADC.
	BSF        ADCON0+0, 0
;ProyectoFinal.c,327 :: 		ANSELH=0x00;        //Configurando Entradas Digitales en PORTB.
	CLRF       ANSELH+0
;ProyectoFinal.c,328 :: 		Teclado_Dir=0xF0;  //Nibble Alto Entrada | Bajo Salida
	MOVLW      240
	MOVWF      TRISB+0
;ProyectoFinal.c,335 :: 		CCP1CON.P1M1=0;      //PWM Single output, P1A modulada;P1B,P1C y P1D como I/O.
	BCF        CCP1CON+0, 7
;ProyectoFinal.c,336 :: 		CCP1CON.P1M0=0;
	BCF        CCP1CON+0, 6
;ProyectoFinal.c,337 :: 		CCP1CON.CCP1M3=1;    //Modo PWM P1A,P1C,P1B,P1D activas en Alto.
	BSF        CCP1CON+0, 3
;ProyectoFinal.c,338 :: 		CCP1CON.CCP1M2=1;
	BSF        CCP1CON+0, 2
;ProyectoFinal.c,341 :: 		PSTRCON.STRA=0;      //P1A as port pin
	BCF        PSTRCON+0, 0
;ProyectoFinal.c,342 :: 		PSTRCON.STRB=1;      //P1B activa en RD5
	BSF        PSTRCON+0, 1
;ProyectoFinal.c,343 :: 		PSTRCON.STRC=0;      //P1C as port pin
	BCF        PSTRCON+0, 2
;ProyectoFinal.c,344 :: 		PSTRCON.STRD=0;      //P1D as port pin
	BCF        PSTRCON+0, 3
;ProyectoFinal.c,346 :: 		PSTRCON.STRSYNC=1;   //Steering Sync Bit on next PWM Period
	BSF        PSTRCON+0, 4
;ProyectoFinal.c,349 :: 		PIR1.TMR2IF=0;       //Limpieza de la Bandera de interrupci�n del TMR2
	BCF        PIR1+0, 1
;ProyectoFinal.c,350 :: 		T2CON.TMR2ON=1;      //Activaci�n del TMR2
	BSF        T2CON+0, 2
;ProyectoFinal.c,351 :: 		T2CON.T2CKPS1=1;     //Pre-escala 1:16 Prescaler
	BSF        T2CON+0, 1
;ProyectoFinal.c,352 :: 		T2CON.T2CKPS0=1;     //Pre-escala 1:16 Prescaler
	BSF        T2CON+0, 0
;ProyectoFinal.c,353 :: 		TRISD.RD5=0;         //Activaci�n de la salida de la terminal
	BCF        TRISD+0, 5
;ProyectoFinal.c,354 :: 		Periodo(256);
	MOVLW      0
	MOVWF      FARG_Periodo_t_useg+0
	MOVLW      1
	MOVWF      FARG_Periodo_t_useg+1
	CALL       _Periodo+0
;ProyectoFinal.c,357 :: 		TRISE.RE3 = 0x00; // Puerto E BIt 3 como salida para la manguera 1 Agua
	BCF        TRISE+0, 3
;ProyectoFinal.c,358 :: 		TRISE.RE1 = 0x00; // Puerto E Bit 1 como salida para la manguera 2 Pesticida
	BCF        TRISE+0, 1
;ProyectoFinal.c,359 :: 		TRISE.RE2 = 0x00; // Puerto E Bit 2 como salida para la manguera 3 Fertilizante
	BCF        TRISE+0, 2
;ProyectoFinal.c,363 :: 		I2C_DS1307W(); //Inicializa el DS1307
	CALL       _I2C_DS1307W+0
;ProyectoFinal.c,366 :: 		}
L_end_inittask:
	RETURN
; end of _inittask

_task1ms:

;ProyectoFinal.c,368 :: 		void  task1ms (void)
;ProyectoFinal.c,374 :: 		StepperMotorControl(1);
	MOVLW      1
	MOVWF      FARG_StepperMotorControl_direcciongiro+0
	MOVLW      0
	MOVWF      FARG_StepperMotorControl_direcciongiro+1
	CALL       _StepperMotorControl+0
;ProyectoFinal.c,376 :: 		}
L_end_task1ms:
	RETURN
; end of _task1ms

_task10ms:

;ProyectoFinal.c,378 :: 		void  task10ms (void)
;ProyectoFinal.c,382 :: 		}
L_end_task10ms:
	RETURN
; end of _task10ms

_task100ms:

;ProyectoFinal.c,384 :: 		void  task100ms (void)
;ProyectoFinal.c,386 :: 		cuenta2 = Tecla_Presionada();
	CALL       _Tecla_Presionada+0
	MOVF       R0+0, 0
	MOVWF      _cuenta2+0
	CLRF       _cuenta2+1
;ProyectoFinal.c,388 :: 		displayControl(); // Tiene un bug que causa que se distorsionen las se�ales
	CALL       _displayControl+0
;ProyectoFinal.c,390 :: 		ADCConversionLDR();
	CALL       _ADCConversionLDR+0
;ProyectoFinal.c,392 :: 		Ancho_Pulso(300); // 0 a 1024 donde 1024 es 100% de ancho de pulso
	MOVLW      44
	MOVWF      FARG_Ancho_Pulso_ancho+0
	MOVLW      1
	MOVWF      FARG_Ancho_Pulso_ancho+1
	CALL       _Ancho_Pulso+0
;ProyectoFinal.c,394 :: 		Mangueras();
	CALL       _Mangueras+0
;ProyectoFinal.c,396 :: 		I2C_DS1307R();
	CALL       _I2C_DS1307R+0
;ProyectoFinal.c,397 :: 		}
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

;ProyectoFinal.c,403 :: 		void interrupt()
;ProyectoFinal.c,410 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,411 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,416 :: 		if(myCount==8)
	MOVLW      0
	XORWF      interrupt_myCount_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt143
	MOVLW      8
	XORWF      interrupt_myCount_L0+0, 0
L__interrupt143:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt70
;ProyectoFinal.c,418 :: 		Ostickcounter++;
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
;ProyectoFinal.c,419 :: 		myCount = 0;
	CLRF       interrupt_myCount_L0+0
	CLRF       interrupt_myCount_L0+1
;ProyectoFinal.c,423 :: 		OSTaskEnable = OSTaskEnable | 0x1;
	BSF        _OSTaskEnable+0, 0
;ProyectoFinal.c,425 :: 		if ((Ostickcounter %10)==0) //cuenta 10 veces 1ms = 10ms
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
	GOTO       L__interrupt144
	MOVLW      0
	XORWF      R0+0, 0
L__interrupt144:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt72
;ProyectoFinal.c,427 :: 		OSTaskEnable = OSTaskEnable | 0x2;
	BSF        _OSTaskEnable+0, 1
;ProyectoFinal.c,428 :: 		}
L_interrupt72:
;ProyectoFinal.c,429 :: 		if ((Ostickcounter %100)==0)//cuenta 100 veces 1ms = 100ms
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
	GOTO       L__interrupt145
	MOVLW      0
	XORWF      R0+0, 0
L__interrupt145:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt73
;ProyectoFinal.c,431 :: 		OSTaskEnable = OSTaskEnable | 0x4;
	BSF        _OSTaskEnable+0, 2
;ProyectoFinal.c,432 :: 		Ostickcounter = 0;
	CLRF       interrupt_Ostickcounter_L0+0
	CLRF       interrupt_Ostickcounter_L0+1
;ProyectoFinal.c,433 :: 		}
L_interrupt73:
;ProyectoFinal.c,434 :: 		}
	GOTO       L_interrupt74
L_interrupt70:
;ProyectoFinal.c,437 :: 		myCount++;
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
;ProyectoFinal.c,438 :: 		}
L_interrupt74:
;ProyectoFinal.c,440 :: 		}
L_end_interrupt:
L__interrupt142:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;ProyectoFinal.c,442 :: 		int main()
;ProyectoFinal.c,444 :: 		TRISA = 0xC3;   //set all digital I/O to inputs
	MOVLW      195
	MOVWF      TRISA+0
;ProyectoFinal.c,445 :: 		TRISB = 0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;ProyectoFinal.c,446 :: 		TRISC = 0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;ProyectoFinal.c,448 :: 		ANSEL = 0x00;   //disable all analog ports
	CLRF       ANSEL+0
;ProyectoFinal.c,449 :: 		ANSELH = 0x00;
	CLRF       ANSELH+0
;ProyectoFinal.c,451 :: 		TRISD.TRISD5 = 0;   //set RD5 as an output
	BCF        TRISD+0, 5
;ProyectoFinal.c,457 :: 		OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
	BCF        OPTION_REG+0, 3
;ProyectoFinal.c,460 :: 		OPTION_REG.PS2 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 2
;ProyectoFinal.c,461 :: 		OPTION_REG.PS1 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 1
;ProyectoFinal.c,462 :: 		OPTION_REG.PS0 = 0;  //Set the prescaler to 1:1
	BCF        OPTION_REG+0, 0
;ProyectoFinal.c,464 :: 		OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
	BCF        OPTION_REG+0, 5
;ProyectoFinal.c,468 :: 		INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
	BCF        INTCON+0, 2
;ProyectoFinal.c,469 :: 		TMR0 = 0;               //Load a value of 0 into the timer
	CLRF       TMR0+0
;ProyectoFinal.c,470 :: 		INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
	BSF        INTCON+0, 5
;ProyectoFinal.c,471 :: 		INTCON.GIE = 1;         //Set the Global Interrupt Enable
	BSF        INTCON+0, 7
;ProyectoFinal.c,473 :: 		inittask();
	CALL       _inittask+0
;ProyectoFinal.c,477 :: 		while(1)
L_main75:
;ProyectoFinal.c,480 :: 		if ((OSTaskEnable & 0x1)!= 0)
	MOVLW      1
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main77
;ProyectoFinal.c,482 :: 		task1ms();
	CALL       _task1ms+0
;ProyectoFinal.c,483 :: 		OSTaskEnable = OSTaskEnable & 0xFE;
	MOVLW      254
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,484 :: 		}
L_main77:
;ProyectoFinal.c,485 :: 		if ((OSTaskEnable & 0x2)!= 0)
	MOVLW      2
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main78
;ProyectoFinal.c,487 :: 		task10ms();
	CALL       _task10ms+0
;ProyectoFinal.c,488 :: 		OSTaskEnable = OSTaskEnable & 0xFD;
	MOVLW      253
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,490 :: 		}
L_main78:
;ProyectoFinal.c,491 :: 		if ((OSTaskEnable & 0x4)!= 0)
	MOVLW      4
	ANDWF      _OSTaskEnable+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main79
;ProyectoFinal.c,493 :: 		task100ms();
	CALL       _task100ms+0
;ProyectoFinal.c,494 :: 		OSTaskEnable = OSTaskEnable & 0xFB;
	MOVLW      251
	ANDWF      _OSTaskEnable+0, 1
;ProyectoFinal.c,495 :: 		}
L_main79:
;ProyectoFinal.c,496 :: 		}
	GOTO       L_main75
;ProyectoFinal.c,499 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
