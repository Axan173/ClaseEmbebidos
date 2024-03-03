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
TRISC=0x00;
//Configurando el Puerto "C" como Salida.
OPTION_REG= OPTION_REG & 0x7F; //Activar "Weak Pull-up" ANSELH=0x00;
//Configurando Entradas Digitales en PORTB.
PORTB=0XFF;
//Activando Pull-ups
while (1) { 

if(PORTB.RB0) //Alarma encendida.
{

PORTC=PORTB&0x77; //Enmascaramiento.
delay_ms(250); //Retardo de 1/4 de segundo.
PORTC=0x01; //Alarma activada.
delay_ms(250); //Retardo de 1/4 de segundo.
} 
else {
Portc = 0; //Alarma Apagada

}}}