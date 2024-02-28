// Alan Sanchez
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 
#pragma config LVP = OFF
#pragma config MCLRE = OFF
#pragma config BOREN = OFF

#include <xc.h>

void delay1s(void);

#define _XTAL_FREQ 4000000
const unsigned char numcor = 1;

void main(void)
{
    unsigned char controlflag = 0;
    OSCCON = 0x51;
    TRISC  = 0x00;
    PORTC = 0x01;
    while (1){
        TRISC  = 0x00;
        delay1s();
        PORTC = (PORTC << numcor);
        PORTC = (controlflag ) ?  (PORTC & 0xFE):(PORTC | numcor);
        if (PORTC == 0xFF){
            controlflag = 1; 
        }else if (PORTC == 0x00) {
            controlflag = 0;
            
        } else {
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