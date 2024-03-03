// Alan Sanchez
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 
#pragma config LVP = OFF


#include <xc.h>

void delay1s(void);

#define _XTAL_FREQ 4000000

void main()
{
  static char Eventalarm = 0;
  
  TRISC=0x00; //Configurando el Puerto "C" como Salida.
  OPTION_REG = OPTION_REG & 0x7F; //Activar "Weak Pull-up"
  ANSELH=0x00; //Configurando Entradas Digitales en PORTB.
  PORTB = 0xFF; //Activando Pull-ups
  while (1)
  {
        if(PORTB.RB0) //Alarma encendida.
        {
                      Eventalarm = (Eventalarm | (PORTB & 0x77));
                      PORTC = Eventalarm;
                      //PORTC = PORTB & 0x77; //Enmascaramiento.
                      delay1s(); //Retardo de 1/4 de segundo.
                      PORTC = 0x01; //Alarma activada.
                      delay1s();; //Retardo de 1/4 de segundo.
        }
        else
        {
            //Portc = 0; //Alarma�Apagado --- version inicial
            Eventalarm = 0;
            PORTC = PORTB & 0x76; //Enmascaramiento.             77
        }
  }
}

void delay1s (void)     
{
    long start = 0;
    long end = 3435; // Esto es .25 Para 59 lineas de ensamblador 
    //Calibrar simepre xDDDDDD
    
    for (long i = start; i <= end; i++);
}