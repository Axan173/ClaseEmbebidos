//Definir la cantidad de bits que se usar�
#define L_4Bits
//#define L_8Bits

//Definir bits para el texto de la pantalla
#define   DB0  0   //Bit Cero del Data Bus
#define   DB1  1   //Bit Uno del Data Bus
#define   DB2  2   //Bit Dos del Data Bus
#define   DB3  3   //Bit Tres del Data Bus
#define   DB4  4   //Bit Cuatro del Data Bus
#define   DB5  5   //Bit Cinco del Data Bus
#define   DB6  6   //Bit Seis del Data Bus
#define   DB7  7   //Bit Siete del Data Bus

//Definir para la visualizaci�n del display
#define   F    2   //Matrix
#define   NL   3   //N Lines

//Definir bits para la configuraci�n de la pantalla
#define   RS   0   //Bit Select register del LCD
#define   RW   1   //Bit Read/Write del LCD
#define   E    2   //Bit Enable
#define   DL   4   //Selcciona el tipo de comunicaci�n

//Configuraci�n de la Pantalla en el Function Set
#define  NL_2  1   //Selecciona el n�mero de l�neas  1=2 l�neas
#define  NL_1  0   //                                0=1 l�nea
#define  F5_8  0   //Selecciona el tama�o de la matriz 0=5x8
#define  F5_10 1   //                                 1=5x10

//Configuraci�n de la pantalla en On Off
#define Dsp_OFF 0   //Display apagado
#define Dsp_ON  1   //Display encendido
#define Cur_OFF 0   //Cursor apagado
#define Cur_ON  1   //Cursor encendido
#define Blk_OFF 0   //Parpadeo apagado
#define Blk_ON  1   //Parpadeo encendido

//Configuraci�n de la pantalla para Entry Mode Set
#define Mode_INC 1  //Modo incremento
#define Mode_DEC 0  //Modo decremento
#define EntireShift_ON   1    //Entire Shift activado
#define EntireShift_OFF  0    //Entire Shift desactivado

#define true 1
#define false 0

//Definir los puertos y TRIS a manipular
#ifdef L_4Bits
  #define LCD_Ctrl_PORT TRISC    // seleccion si es entrada o salida en el puerto C
  #define LCD_Ctrl_Data PORTC //habilitar el puerto C
  #define LCD_Bus_PORT TRISC  // seleccion si es entrada o salida en el puerto
  #define LCD_Bus_Data PORTC    //habilitar el puerto C
  #define NB  0   //                              0=4 bits
#else
  #define LCD_Ctrl_PORT TRISE    // seleccion si es entrada o salida en el puerto E
  #define LCD_Ctrl_Data PORTE //habilitar el puerto E
  #define LCD_Bus_PORT TRISD  // seleccion si es entrada o salida en el puerto
  #define LCD_Bus_Data PORTD    //habilitar el puerto D
  #define NB  1   //Selecciona el n�mero de bits  1 =8 bits
#endif

//Figura 1
#define F1 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F2 (0<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(0<<DB0)
#define F3 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F4 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F5 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F6 (0<<DB4)|(0<<DB3)|(1<<DB2)|(0<<DB1)|(0<<DB0)
#define F7 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F8 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 2
#define F9  (0<<DB4)|(0<<DB3)|(1<<DB2)|(0<<DB1)|(0<<DB0)
#define F10 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F11 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F12 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F13 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F14 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F15 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F16 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 3
#define F17 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F18 (1<<DB4)|(0<<DB3)|(1<<DB2)|(0<<DB1)|(1<<DB0)
#define F19 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F20 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F21 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F22 (0<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(0<<DB0)
#define F23 (1<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F24 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 4
#define F25 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F26 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F27 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F28 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F29 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F30 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F31 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F32 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 5
#define F33 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F34 (0<<DB4)|(0<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F35 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F36 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F37 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F38 (0<<DB4)|(0<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F39 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F40 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 6
#define F41 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F42 (0<<DB4)|(0<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F43 (0<<DB4)|(0<<DB3)|(1<<DB2)|(0<<DB1)|(1<<DB0)
#define F44 (0<<DB4)|(1<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F45 (0<<DB4)|(1<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F46 (0<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F47 (1<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F48 (1<<DB4)|(1<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 7
#define F49 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F50 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F51 (1<<DB4)|(0<<DB3)|(1<<DB2)|(0<<DB1)|(1<<DB0)
#define F52 (1<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F53 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F54 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F55 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)
#define F56 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

//Figura 8
#define F57 (0<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(0<<DB0)
#define F58 (1<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F59 (1<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(1<<DB0)
#define F60 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F61 (1<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F62 (1<<DB4)|(1<<DB3)|(0<<DB2)|(1<<DB1)|(1<<DB0)
#define F63 (1<<DB4)|(1<<DB3)|(1<<DB2)|(1<<DB1)|(1<<DB0)
#define F64 (0<<DB4)|(0<<DB3)|(0<<DB2)|(0<<DB1)|(0<<DB0)

#define figs 2
#define kfig (8*figs)

unsigned int cuenta=999;
unsigned char DB;   //Variable para el manejo de Instrucciones
unsigned char unidades=0;  //Variable para las Unidades
unsigned char decenas=0;  //Variable para las Decenas
unsigned char centenas=0;  //Variable para las Centenas
volatile static unsigned char myLCD_Bus_Data;  //Variable para el manejo de Datos
volatile unsigned char TEXTO1[]={" CONTEO:  \n"};
unsigned char SET_CURSOR_DDRAM[2][16]={{0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F},{0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF}};
unsigned char FIG1[]={F1,F2,F3,F4,F5,F6,F7,F8};
unsigned char FIG2[]={F9,F10,F11,F12,F13,F14,F15,F16};
unsigned char FIG3[]={F17,F18,F19,F20,F21,F22,F23,F24};
unsigned char FIG4[]={F25,F26,F27,F28,F29,F30,F31,F32}; //empty
unsigned char FIG5[]={F33,F34,F35,F36,F37,F38,F39,F40};
unsigned char FIG6[]={F41,F42,F43,F44,F45,F46,F47,F48};
unsigned char FIG7[]={F49,F50,F51,F52,F53,F54,F55,F56};
unsigned char FIG8[]={F57,F58,F59,F60,F61,F62,F63,F64};

 /******** CONFIGURACI�N DE TERMINALES *********
| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | M�dulo de LCD GND VCC  VO  RS  RW   E  DB0 DB1 DB2  DB3  DB4  DB5  DB6  DB7
     RE0 RE1 RE2 RD0 RD1 RD2 RD3 RD4 RD5 RD6  RD7  Terminales DEL MICRO
*/

void LCD_set(unsigned char *LCD_Ctrl_PORT,unsigned char *LCD_Bus_Data);
void LCD_Reset(void);  //Funci�n de Reset
void LCD_Function_Init(unsigned char lcd_dl);
void LCD_Function_Set(unsigned char Data_Lenght,unsigned char NumL,unsigned char Font);
void LCD_On_Off(unsigned char dsp_on_off,unsigned char cur_on_off,unsigned char blk_on_off);  //Activaci�n del LCD
void LCD_Clear(void);   //Limpiar el Display
void LDC_EntryMode_Set(unsigned char Mode_in_dec,unsigned char EnterShift_on_off);  //Movimiento del Cursor
void LCD_DDRAM_Set(unsigned char fila,unsigned char columna);  //Direcci�n de Inicio en el LCD
void LCD_Enable(unsigned char DB_);   //Se�al de Habilitaci�n
void LCD_Cadena1(int x, int y);//olatile unsigned char TEXTO1[]);  //Funci�n para imprimir cadena
void delay_ms(unsigned int msegs);  //Funci�n de delay_msegs
void LCD_Nprint(unsigned int *contador,int x, int y);
void LCD_Sprint(unsigned char *string_buffer,int x,int y);
void LCD_CGRAM_Set(unsigned char *patron,unsigned char *address);
void LCD_Write(unsigned char *string_buffer,int x,int y);
void LCD_Init_Figure(void);





void LCD_set(unsigned char *LCD_Ctrl_PORT,unsigned char *LCD_Bus_Data,unsigned char *LCD_Bus_PORT,unsigned char *LCD_Ctrl_Data){ //*****  CONDICION INICIAL EN EL PUERTO PARA EL LCD    ****
        ANSEL=0;
        myLCD_Bus_Data&=(0<<RS|0<<RW|0<<E);
        myLCD_Bus_Data=(1<<DB5|1<<DL);
        PORTC = myLCD_Bus_Data;
        PORTA = ((myLCD_Bus_Data) >> 2);
        *LCD_Ctrl_PORT&=(0<<RS|0<<RW|0<<E);
        *LCD_Bus_PORT=0;
        //delay_ms(50);
}

void LCD_Reset(void){         //Funci�n de Reset
        //Tiempo de Inicializaci�n Interna del M�dulo de LCD
        delay_ms(50);
}

void LCD_Function_Init(unsigned char lcd_dl){
     DB=(1<<DB5)|(lcd_dl<<DB4);
     myLCD_Bus_Data=(DB&0xf0)|(myLCD_Bus_Data&0x0f);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     //LCDBusPort=DB;
     myLCD_Bus_Data |= (1<<E);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(1);
     myLCD_Bus_Data &=~((1<<E));
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(1);
}

void LCD_Function_Set(unsigned char Data_Lenght,unsigned char NumL,unsigned char Font){ //Configuraci�n del LCD
/****** CONFIGURACI�N DEL LCD ********
 RS RW DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
 0   0   0   0   1   1   NL   F   �   �
 NL=0 Modo de 1 Linea      F=0 Matriz de 5x8 pixeles
NL=1 Modo de 2 Lineas   F=1 Matriz de 5x10 pixeles
*/
        DB = (1<<DB5)|(Data_Lenght<<DB4)|(NumL<<DB3)|(Font<<DB2);
        LCD_Enable(DB);
}
void LCD_On_Off(unsigned char dsp_on_off,unsigned char cur_on_off,unsigned char blk_on_off){        //Activaci�n del LCD
/***** Display ON/OFF Control *********
 /* RS RW  DB7  DB6  DB5    DB4   DB3  DB2 DB1 DB0
  0    0   0    0     0      0     1    DSP CUR BLK
  DSP=0 Display Off   CUR=0 Cursor Off   BLK=0 blink Off
  DSP=1 Display On   CUR=1 cursor On          BLK=1 blink On */

        DB= (1<<DB3)|(dsp_on_off<<DB2)|(cur_on_off<<DB1)|(blk_on_off<<DB0);
        LCD_Enable(DB);
}

 void LCD_Clear(void){  //Limpiar el Display /******* Clear Display **********
   /*RS RW DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
    0   0   0   0   0   0     0   0   0   1 */
        DB=0x01;
}

void LDC_EntryMode_Set(unsigned char Mode_in_dec,unsigned char EnterShift_on_off){ //Movimiento del Cursor
/******* Entry Mode Set *********
RS RW DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
 0   0   0   0   0   0   0   1   ID   SH
 ID=0 Decrement Mode SH=0 Entire Shift Off
ID=1 Increment Mode SH=1 Entire Shift On
*/
        DB=(1<<DB2)|(Mode_in_dec<<DB1)|(EnterShift_on_off<<DB0);
}

 void LCD_DDRAM_Set(unsigned char fila,unsigned char columna) {         //Direcci�n de Inicio en la segunda L�nea en el LCD
 /******* Direcci�n RAM **********
  RS RW DB7 DB6 DB5 DB4 DB3 DB2 DB1 DB0
  0   0   1   1   0   0   0   0   0   0 */
      DB= SET_CURSOR_DDRAM[fila][columna];
      LCD_Enable(DB);
}

void LCD_Enable(unsigned char DB_){         //Se�al de Habilitaci�n
#ifdef L_8Bits
     LCD_Bus_Data=DB_;
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
#else
     myLCD_Bus_Data=(DB_&0xF0)|(myLCD_Bus_Data&0x0F);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
#endif
//     LCD_Bus_Data=DB_;
     myLCD_Bus_Data |= (1<<E);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(2);
     myLCD_Bus_Data &=~((1<<E));
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(2);
#ifndef L_8Bits
     myLCD_Bus_Data=(DB_&0x0F)<<4|(myLCD_Bus_Data&0x0F);
     myLCD_Bus_Data|=(1<<E);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(1);
     myLCD_Bus_Data&=~(1<<E);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     delay_ms(1);
#endif
}

void LCD_Nprint(unsigned int *valor,int x,int y) {
    LCD_DDRAM_Set(x,y);
    centenas = (*valor / 100)+'0';
    decenas = ((*valor%100)/ 10)+'0';
    unidades = ((*valor%100)% 10)+'0';
    myLCD_Bus_Data |= (1 << RS); // RS en alto para enviar datos
    PORTC = myLCD_Bus_Data;
    PORTA = ((myLCD_Bus_Data) >> 2);
    if(centenas!=(0+'0')){
       DB=centenas; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
       LCD_Enable(DB);
    }
    else
    {
     LCD_Enable(32);
    }
    if(decenas!=(0+'0') || centenas!=(0+'0')){
       DB=decenas; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
       LCD_Enable(DB);
    }
    else
     {
          LCD_Enable(32);
     }
    DB=unidades; // Extrae el �ltimo d�gito y convi�rtelo a caracter ASCII
    LCD_Enable(DB);
    myLCD_Bus_Data &= ~(1 << RS); // RS en bajo al finalizar el env�o de datos while (i!=10)   {
    PORTC = myLCD_Bus_Data;
    PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_Sprint(unsigned char *string_buffer,int x,int y){
     unsigned char i=0;
     LCD_DDRAM_Set(x,y);
     myLCD_Bus_Data |=(1<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     while((string_buffer[i]!='\n')){
           DB=string_buffer[i];
           LCD_Enable(DB);
           i++;
     }
     myLCD_Bus_Data &=~(1<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_CGRAM_Set(unsigned char *patron,unsigned char address){
     //unsigned char mskadd=*address&0x07;    //Aisla los 4 bits menos significativos
     //unsigned char comm=0x40|(mskadd<<3);
     //LCD_Write(0x40|(address*8));//&comm,0,0);
     int i;
     DB=0x40|(address<<3);
     myLCD_Bus_Data |=(0<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     LCD_Enable(DB);
     for(i=0;i<kfig;i++){
             myLCD_Bus_Data |=(1<<RS);
             PORTC = myLCD_Bus_Data;
             PORTA = ((myLCD_Bus_Data) >> 2);
             DB=patron[i];
             LCD_Enable(DB);
     }
     myLCD_Bus_Data &=~(1<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_Write(unsigned char *string_buffer,int x,int y){
     LCD_DDRAM_Set(x,y);
     myLCD_Bus_Data |=(1<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     LCD_Enable(string_buffer);
     myLCD_Bus_Data &=~(1<<RS);
     PORTC = myLCD_Bus_Data;
     PORTA = ((myLCD_Bus_Data) >> 2);
     }