// Alan Sanchez
#pragma config FOSC = HS
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 
#pragma config LVP = OFF

#include <xc.h>

#define _XTAL_FREQ 4000000

void main(void)
{
    //OSCCON = 0x51;
    TRISC=0X00;
    OPTION_REG = OPTION_REG & 0X7F;
    ANSELH=0X00;
    PORTB=0XFF;
  
    
    while(1)
    {
        PORTC=PORTB;
    }
}