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
    OSCCON = 0x31;
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
    asm("MOVLW 0xA1");
    asm("MOVWF 0x71");
    asm("MOVLW 0x02");
    asm("MOVWF 0x70");	
    asm("RESTA2: DECFSZ 0x70, 1");
    asm("GOTO RESTA2");
    asm("RESTAALTA2: DECFSZ 0x71, 1");
    asm("GOTO RESTA2");
}