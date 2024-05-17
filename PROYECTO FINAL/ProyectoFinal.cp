#line 1 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"





volatile char OSTaskEnable = 0;

void StepperMotorControl (int direcciongiro)
{
 static char estadodesecuencia = 0;
 static long cuentadepasos = 0;
#line 28 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
 switch (estadodesecuencia){
 case 0:
 PORTD &= 0xF0;
 PORTD |= 0b1001;
 break;
 case 1:
 PORTD &= 0xF0;
 PORTD |= 0b0011;
 break;
 case 2:
 PORTD &= 0xF0;
 PORTD |= 0b0110;
 break;
 case 3:
 PORTD &= 0xF0;
 PORTD |= 0b1100;
 estadodesecuencia = 0;
 break;
 default:
 estadodesecuencia = 0;
 break;
 }
 estadodesecuencia++;
}

void inittask (void)
{

 TRISD = 0x00;
 PORTD &= 0xF0;
}

void task1ms (void)
{






}

void task10ms (void)
{




}

void task100ms (void)
{
 PORTD.RD5 = ~PORTD.RD5;
 StepperMotorControl(0);

}
#line 89 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
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
 TRISA = 0xFF;
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
