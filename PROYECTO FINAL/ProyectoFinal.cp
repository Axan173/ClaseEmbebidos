#line 1 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"





volatile static int Ostickcounter = 0;

void StepperMotorControl (int direcciongiro)
{
 static char estadodesecuencia = 0;
 static long cuentadepasos = 0;

 switch (estadodesecuencia){
 case 0:
 PORTD = PORTD & 0xF0;
 PORTD = PORTD | 0b1001;
 break;
 case 1:
 PORTD = PORTD & 0xF0;
 PORTD = PORTD | 0b0011;
 break;
 case 2:
 PORTD = PORTD & 0xF0;
 PORTD = PORTD | 0b0110;
 break;
 case 3:
 PORTD = PORTD & 0xF0;
 PORTD = PORTD | 0b1100;
 estadodesecuencia = 0;

 break;
 default:

 break;
 }
}

void inittask (void)
{

 TRISD = TRISD & 0xF0;
}

void task1ms (void)
{





}







void task10ms (void)
{
 StepperMotorControl(0);


}





void task100ms (void)
{


}
#line 80 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
void interrupt()
{

 volatile static int myCount = 0;

 if(myCount==8)
 {
 INTCON.T0IF = 0;
 TMR0 = 0;




 PORTD.RD5 = ~PORTD.RD5;
 Ostickcounter ++;
 myCount = 0;
 }
 else
 {
 myCount++;
 }
}

int main()
{
 TRISA = 0xFF;
 TRISB = 0xFF;
 TRISC = 0xFF;

 ANSEL = 0x00;
 ANSELH = 0x00;

 TRISD.TRISD5 = 0;





 OPTION_REG.PSA = 0;


 OPTION_REG.PS2 = 0;
 OPTION_REG.PS1 = 1;
 OPTION_REG.PS0 = 0;

 OPTION_REG.T0CS = 0;



 INTCON.T0IF = 0;
 TMR0 = 0;
 INTCON.T0IE = 1;
 INTCON.GIE = 1;

 inittask();



 while(1)
 {

 if ((Ostickcounter %2)== 0)
 {
 task1ms();
 }
 else if ((Ostickcounter %20)==0)
 {
 task10ms();

 }
 else if ((Ostickcounter %200)==0)
 {
 task100ms();
 Ostickcounter = 0;
 }
 else { }
 }

 return 0;
}
