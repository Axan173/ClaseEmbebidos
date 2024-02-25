// Alan Sanchez
#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 

#include <xc.h>

#define _XTAL_FREQ 4000000

void main(void)
{
    OSCCON = 0x51;
    while (1){
        TRISC  = 0x00;
        PORTC = 0x55;
    }
}