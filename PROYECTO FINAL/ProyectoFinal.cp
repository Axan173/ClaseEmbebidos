#line 1 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
#line 10 "C:/gitRepos/ClaseEmbebidos/PROYECTO FINAL/ProyectoFinal.c"
void interrupt()
{

 volatile static int myCount = 0;

 if(myCount==8)
 {
 INTCON.T0IF = 0;
 TMR0 = 0;




 PORTD.RD5 = ~PORTD.RD5;
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





 while(1)
 {


 }

 return 0;
}
