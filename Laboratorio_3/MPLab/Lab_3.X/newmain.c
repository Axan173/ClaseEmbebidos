// Alan Sanchez
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 

#include <xc.h>

void delay1s(void);

#define _XTAL_FREQ 4000000

void main(void)
{
    OSCCON = 0x51;
    while (1){
        TRISC  = 0x00;
        PORTC = 0x01;
        
        delay1s();
        PORTC = 0x00;
        
        delay1s();
    }
}

void delay1s (void)     
{
    

    long start = 0;
    long end = 3435; // Esto es .25 Para 59 lineas de ensamblador 
    //Calibrar simepre xDDDDDD

    for (long i = start; i <= end; i++);
}