#line 1 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
#line 1 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
#line 146 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
unsigned int cuenta=999;
unsigned int cuenta2=999;
unsigned char DB;
unsigned char unidades=0;
unsigned char decenas=0;
unsigned char centenas=0;
volatile static unsigned char myLCD_Bus_Data;
volatile unsigned char TEXTO1[]={" CONTEO:  \n"};
unsigned char SET_CURSOR_DDRAM[2][16]={{0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F},{0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF}};
unsigned char FIG1[]={ (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(0<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(1<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG2[]={ (0<< 4 )|(0<< 3 )|(1<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG3[]={ (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(0<< 3 )|(1<< 2 )|(0<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(0<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG4[]={ (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG5[]={ (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG6[]={ (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(1<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG7[]={ (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (1<< 4 )|(0<< 3 )|(1<< 2 )|(0<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
unsigned char FIG8[]={ (0<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(0<< 0 ) , (1<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (1<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(0<< 2 )|(1<< 1 )|(1<< 0 ) , (1<< 4 )|(1<< 3 )|(1<< 2 )|(1<< 1 )|(1<< 0 ) , (0<< 4 )|(0<< 3 )|(0<< 2 )|(0<< 1 )|(0<< 0 ) };
#line 169 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
void LCD_set(unsigned char * TRISC ,unsigned char * PORTC );
void LCD_Reset(void);
void LCD_Function_Init(unsigned char lcd_dl);
void LCD_Function_Set(unsigned char Data_Lenght,unsigned char NumL,unsigned char Font);
void LCD_On_Off(unsigned char dsp_on_off,unsigned char cur_on_off,unsigned char blk_on_off);
void LCD_Clear(void);
void LDC_EntryMode_Set(unsigned char Mode_in_dec,unsigned char EnterShift_on_off);
void LCD_DDRAM_Set(unsigned char fila,unsigned char columna);
void LCD_Enable(unsigned char DB_);
void LCD_Cadena1(int x, int y);
void delay_ms(unsigned int msegs);
void LCD_Nprint(unsigned int *contador,int x, int y);
void LCD_Sprint(unsigned char *string_buffer,int x,int y);
void LCD_CGRAM_Set(unsigned char *patron,unsigned char *address);
void LCD_Write(unsigned char *string_buffer,int x,int y);
void LCD_Init_Figure(void);





void LCD_set(unsigned char * TRISC ,unsigned char * PORTC ,unsigned char * TRISC ,unsigned char * PORTC ){
 ANSEL=0;
 myLCD_Bus_Data&=(0<< 0 |0<< 1 |0<< 2 );
 myLCD_Bus_Data=(1<< 5 |1<< 4 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 * TRISC &=(0<< 0 |0<< 1 |0<< 2 );
 * TRISC =0;

}

void LCD_Reset(void){

 delay_ms(50);
}

void LCD_Function_Init(unsigned char lcd_dl){
 DB=(1<< 5 )|(lcd_dl<< 4 );
 myLCD_Bus_Data=(DB&0xf0)|(myLCD_Bus_Data&0x0f);
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);

 myLCD_Bus_Data |= (1<< 2 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(1);
 myLCD_Bus_Data &=~((1<< 2 ));
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(1);
}

void LCD_Function_Set(unsigned char Data_Lenght,unsigned char NumL,unsigned char Font){
#line 229 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
 DB = (1<< 5 )|(Data_Lenght<< 4 )|(NumL<< 3 )|(Font<< 2 );
 LCD_Enable(DB);
}
void LCD_On_Off(unsigned char dsp_on_off,unsigned char cur_on_off,unsigned char blk_on_off){
#line 239 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
 DB= (1<< 3 )|(dsp_on_off<< 2 )|(cur_on_off<< 1 )|(blk_on_off<< 0 );
 LCD_Enable(DB);
}

 void LCD_Clear(void){
#line 246 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
 DB=0x01;
}

void LDC_EntryMode_Set(unsigned char Mode_in_dec,unsigned char EnterShift_on_off){
#line 256 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
 DB=(1<< 2 )|(Mode_in_dec<< 1 )|(EnterShift_on_off<< 0 );
}

 void LCD_DDRAM_Set(unsigned char fila,unsigned char columna) {
#line 263 "c:/gitrepos/claseembebidos/proyecto final/biblioteca_lcd1.h"
 DB= SET_CURSOR_DDRAM[fila][columna];
 LCD_Enable(DB);
}

void LCD_Enable(unsigned char DB_){





 myLCD_Bus_Data=(DB_&0xF0)|(myLCD_Bus_Data&0x0F);
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);


 myLCD_Bus_Data |= (1<< 2 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(2);
 myLCD_Bus_Data &=~((1<< 2 ));
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(2);

 myLCD_Bus_Data=(DB_&0x0F)<<4|(myLCD_Bus_Data&0x0F);
 myLCD_Bus_Data|=(1<< 2 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(1);
 myLCD_Bus_Data&=~(1<< 2 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 delay_ms(1);

}

void LCD_Nprint(unsigned int *valor,int x,int y) {
 LCD_DDRAM_Set(x,y);
 centenas = (*valor / 100)+'0';
 decenas = ((*valor%100)/ 10)+'0';
 unidades = ((*valor%100)% 10)+'0';
 myLCD_Bus_Data |= (1 <<  0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 if(centenas!=(0+'0')){
 DB=centenas;
 LCD_Enable(DB);
 }
 else
 {
 LCD_Enable(32);
 }
 if(decenas!=(0+'0') || centenas!=(0+'0')){
 DB=decenas;
 LCD_Enable(DB);
 }
 else
 {
 LCD_Enable(32);
 }
 DB=unidades;
 LCD_Enable(DB);
 myLCD_Bus_Data &= ~(1 <<  0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_Sprint(unsigned char *string_buffer,int x,int y){
 unsigned char i=0;
 LCD_DDRAM_Set(x,y);
 myLCD_Bus_Data |=(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 while((string_buffer[i]!='\n')){
 DB=string_buffer[i];
 LCD_Enable(DB);
 i++;
 }
 myLCD_Bus_Data &=~(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_CGRAM_Set(unsigned char *patron,unsigned char address){



 int i;
 DB=0x40|(address<<3);
 myLCD_Bus_Data |=(0<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 LCD_Enable(DB);
 for(i=0;i< (8* 2 ) ;i++){
 myLCD_Bus_Data |=(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 DB=patron[i];
 LCD_Enable(DB);
 }
 myLCD_Bus_Data &=~(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
}

void LCD_Write(unsigned char *string_buffer,int x,int y){
 LCD_DDRAM_Set(x,y);
 myLCD_Bus_Data |=(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 LCD_Enable(string_buffer);
 myLCD_Bus_Data &=~(1<< 0 );
 PORTC = myLCD_Bus_Data;
 PORTA = ((myLCD_Bus_Data) >> 2);
 }
#line 1 "c:/gitrepos/claseembebidos/proyecto final/teclado.h"




unsigned char Tecla_Presionada();
#line 1 "c:/gitrepos/claseembebidos/proyecto final/i2c.h"
#line 30 "c:/gitrepos/claseembebidos/proyecto final/i2c.h"
void I2C_init(void);
void I2C_port(void);
void I2C_wait(void);
void I2C_start(void);
void I2C_restart(void);
void I2C_stop(void);
void I2C_write(unsigned char Data);
unsigned char I2C_read(unsigned char Ack);
#line 9 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
volatile char OSTaskEnable = 0;
unsigned char Seg = 0x50;
unsigned char Min = 0x59;
unsigned char Hour = 0x23;
unsigned char Day = 0x22;
unsigned char Date = 0x28;
unsigned char Month = 0x05;
unsigned char Year = 0x24;
unsigned char TDay = 0x00;


void ADCConversionLDR(void)
{
 ADCON0.GO_DONE=1;
 while(ADCON0.GO_DONE){};

 cuenta = ((ADRESH&0x3)<<8) | (ADRESL&0x00FF);
 if (cuenta > 999) {
 cuenta = 999;
 }


}

void Mangueras()
{
 PORTE.RE0 = 1;
 PORTE.RE1 = 1;
 PORTE.RE2 = 1;
}


void I2C_init(void)
{
 I2C_port();
 SSPCON |=  0x08 ;
 SSPCON.SSPEN =1;
 SSPADD =  (( 4000000 /(4* 100000 ))-1) ;
 SSPSTAT.SMP = 1;
}

void I2C_port(void)
{
  TRISC.RC3  = 1;
  TRISC.RC4  = 1;
}

void I2C_wait(void)
{
 while( SSPSTAT.R_W | SSPCON2.ACKEN | SSPCON2.RCEN | SSPCON2.PEN | SSPCON2.RSEN | SSPCON2.SEN);
 return;
}

void I2C_start(void)
{
 SSPCON2.SEN = 1;
 I2C_wait();
}

void I2C_restart(void)
{
 SSPCON2.RSEN = 1;
 I2C_wait();
}

void I2C_stop(void)
{
 SSPCON2.PEN = 1;
 I2C_wait();
}

void I2C_write(unsigned char AData)
{
 SSPBUF = AData;
 I2C_wait();
}

unsigned char I2C_read(unsigned char ack)
{
 unsigned char buffer;
 I2C_wait();
 SSPCON2.RCEN = 1;
 I2C_wait();
 buffer = SSPBUF;
 I2C_wait();
 SSPCON2.ACKDT = ack;
 SSPCON2.ACKEN = 1;
 return buffer;
}



void I2C_DS1307W(void)
{

 I2C_init();
 I2C_start();
 I2C_write( (( 0x68 <<1) + 0 ) );
 I2C_write(0x00);
 I2C_write(Seg);
 I2C_write(Min);
 I2C_write(Hour);
 I2C_write(Day);
 I2C_write(Date);
 I2C_write(Month);
 I2C_write(Year);
 I2C_stop();
}




void I2C_DS1307R(void)
{
 I2C_start();
 I2C_write( (( 0x68 <<1) + 0 ) );
 I2C_write(0x00);
 I2C_restart();
 I2C_write( (( 0x68 <<1) + 1 ) );
 Seg = I2C_read( 0 );
 Min = I2C_read( 0 );
 Hour = I2C_read( 0 );
 Day = I2C_read( 0 );
 Date = I2C_read( 0 );
 Month = I2C_read( 0 );
 Year = I2C_read( 1 );
 I2C_stop();
}

unsigned char Tecla_Presionada(void)
{
 unsigned char Filas;
 unsigned char CF;
 volatile unsigned char TP;

 for (Filas=0x01;Filas!=0x10;Filas = Filas << 1)
 {
  PORTB  = Filas;

 delay_ms(2);
 CF =  PORTB ;


 switch (CF)
 {
 case 0x11: return TP=1; break;
 case 0x21: return TP=2; break;
 case 0x41: return TP=3; break;
 case 0x81: return TP=10; break;
 case 0x12: return TP=4; break;
 case 0x22: return TP=5; break;
 case 0x42: return TP=6; break;
 case 0x82: return TP=11; break;
 case 0x14: return TP=7; break;
 case 0x24: return TP=8; break;
 case 0x44: return TP=9; break;
 case 0x84: return TP=12; break;
 case 0x18: return TP=14; break;
 case 0x28: return TP=0; break;
 case 0x48: return TP=15; break;
 case 0x88: return TP=13; break;
 }
 }

 return TP=16;
}

void StepperMotorControl (int direcciongiro)
{
 static char estadodesecuencia = 5;
 static long cuentadepasos = 0;

 switch (estadodesecuencia){
 case 0:
 PORTD &= 0xF0;
 PORTD |= 0b1001;
 break;
 case 3:
 PORTD &= 0xF0;
 PORTD |= 0b0011;
 break;
 case 6:
 PORTD &= 0xF0;
 PORTD |= 0b0110;
 break;
 case 9:
 PORTD &= 0xF0;
 PORTD |= 0b1100;
 break;
 default:
 break;
 }

 if(direcciongiro == 1)
 {
 estadodesecuencia = (estadodesecuencia < 9)?(estadodesecuencia+1):(0);
 }
 else
 {
 estadodesecuencia = (estadodesecuencia > 0)? (estadodesecuencia-1):(9);
 }

}


void Ancho_Pulso(int ancho)
{



 CCP1CON |= ((ancho&0x0003)<<4);
 CCPR1L = ancho>>2;
}



void Periodo(int t_useg)
{



 PR2=(t_useg-1);
}



void displayControl(void)
{

 volatile static int refreshRate = 0;
 volatile static unsigned char displayStateMachine = 0;

 if(refreshRate == 2 && displayStateMachine == 0)
 {

 LCD_Write(0x04,1,1);
 LCD_Write(0x04,1,5);
 LCD_Write(0x04,1,9);
 LCD_Write(0x04,1,13);

 LCD_Write(0x01,1,3);
 LCD_Write(0x02,1,7);
 LCD_Write(0x03,1,11);

 refreshRate=0;
 displayStateMachine = 1;
 }
 else if(refreshRate == 2 && displayStateMachine == 1)
 {
 LCD_Write(0x04,1,3);
 LCD_Write(0x04,1,7);
 LCD_Write(0x04,1,11);

 LCD_Write(0x05,1,1);
 LCD_Write(0x06,1,5);
 LCD_Write(0x07,1,9);
 LCD_Write(0x08,1,13);

 refreshRate=0;
 displayStateMachine = 2;
 }
 else if(refreshRate == 2 && displayStateMachine == 2)
 {

 LCD_Nprint(&cuenta2,0,1);
 LCD_Nprint(&cuenta,0,11);

 refreshRate=0;
 displayStateMachine = 0;
 }
 else
 {
 }

 refreshRate++;
}

void inittask (void)
{

 TRISD = 0x00;
 PORTD &= 0xF0;



 LCD_set(& TRISC ,& PORTC ,& TRISC ,& PORTC );
 LCD_Reset();
 LCD_Function_Init( 1 );
 LCD_Function_Init( 1 );
 LCD_Function_Init( 0 );
 LCD_Function_Set( 0 , 1 , 1 );
 LCD_Function_Set( 0 , 1 , 1 );
 LCD_On_Off( 1 , 1 , 0 );
 LCD_Clear();
 LDC_EntryMode_Set( 1 , 0 );

 LCD_CGRAM_Set(&FIG1,1);
 LCD_CGRAM_Set(&FIG2,2);
 LCD_CGRAM_Set(&FIG3,3);
 LCD_CGRAM_Set(&FIG4,4);
 LCD_CGRAM_Set(&FIG5,5);
 LCD_CGRAM_Set(&FIG6,6);
 LCD_CGRAM_Set(&FIG7,7);
 LCD_CGRAM_Set(&FIG8,8);



 TRISA.RA0=1;
 ANSEL.RA0=1;

 ADCON0.ADCS1=1;
 ADCON0.ADCS0=1;

 ADCON1.ADFM=1;

 ADCON0.ADON=1;


 ANSELH=0x00;
  TRISB =0xF0;






 CCP1CON.P1M1=0;
 CCP1CON.P1M0=0;
 CCP1CON.CCP1M3=1;
 CCP1CON.CCP1M2=1;


 PSTRCON.STRA=0;
 PSTRCON.STRB=1;
 PSTRCON.STRC=0;
 PSTRCON.STRD=0;

 PSTRCON.STRSYNC=1;


 PIR1.TMR2IF=0;
 T2CON.TMR2ON=1;
 T2CON.T2CKPS1=1;
 T2CON.T2CKPS0=1;
 TRISD.RD5=0;
 Periodo(256);


 TRISE.RE3 = 0x00;
 TRISE.RE1 = 0x00;
 TRISE.RE2 = 0x00;



 I2C_DS1307W();


}

void task1ms (void)
{




 StepperMotorControl(1);

}

void task10ms (void)
{


}

void task100ms (void)
{
 cuenta2 = Tecla_Presionada();

 displayControl();

 ADCConversionLDR();

 Ancho_Pulso(300);

 Mangueras();

 I2C_DS1307R();
}
#line 403 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
void interrupt()
{

 volatile static int myCount = 0;
 volatile static int Ostickcounter = 0;


 INTCON.T0IF = 0;
 TMR0 = 0;




 if(myCount==8)
 {
 Ostickcounter++;
 myCount = 0;

 if ((Ostickcounter %1)== 0)
 {
 OSTaskEnable = OSTaskEnable | 0x1;
 }
 if ((Ostickcounter %10)==0)
 {
 OSTaskEnable = OSTaskEnable | 0x2;
 }
 if ((Ostickcounter %100)==0)
 {
 OSTaskEnable = OSTaskEnable | 0x4;
 Ostickcounter = 0;
 }
 }
 else
 {
 myCount++;
 }

}

int main()
{
 TRISA = 0xC3;
 TRISB = 0xFF;
 TRISC = 0xFF;

 ANSEL = 0x00;
 ANSELH = 0x00;

 TRISD.TRISD5 = 0;





 OPTION_REG.PSA = 0;


 OPTION_REG.PS2 = 0;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 0;

 OPTION_REG.T0CS = 0;



 INTCON.T0IF = 0;
 TMR0 = 0;
 INTCON.T0IE = 1;
 INTCON.GIE = 1;

 inittask();



 while(1)
 {

 if ((OSTaskEnable & 0x1)!= 0)
 {
 task1ms();
 OSTaskEnable = OSTaskEnable & 0xFE;
 }
 if ((OSTaskEnable & 0x2)!= 0)
 {
 task10ms();
 OSTaskEnable = OSTaskEnable & 0xFD;

 }
 if ((OSTaskEnable & 0x4)!= 0)
 {
 task100ms();
 OSTaskEnable = OSTaskEnable & 0xFB;
 }
 }

 return 0;
}
