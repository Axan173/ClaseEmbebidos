//Alan Sanchez --- LED BLINK 
#include <xc.h>
void main(void) {
    
    asm("BSF STATUS, 0x5"); //Ingreso Banco de Memoria 1
    asm("BCF STATUS, 0x6");
    asm("CLRF 0x186");      //Trisb limpio
    asm("REPETIR: BCF STATUS, 0x5"); // Volver banco de Memotia 0
    asm("BCF STATUS, 0x6"); 
    asm("BSF 0x106, 0x0"); //Bit Set PortB Bit 0 Cambia a Valor 1
    
    //DELAY  
    asm("MOVLW 0x02");
    asm("MOVWF 0x10D");  
    asm("MOVLW 0xF4");  
    asm("MOVWF 0x10C"); 
    asm("RESTA: DECFSZ 0x10C, 1");  
    asm("GOTO RESTA");   
    asm("RESTAALTA: DECFSZ 0xD, 1");
    asm("GOTO RESTA");
    asm("GOTO TOGGLE");
     //DELAY

    asm("TOGGLE: BCF STATUS, 0x5"); //Ingreso Banco de Memoria 0 (Por si acaso)
    asm("BCF STATUS, 0x6");
    asm("BCF 0x106, 0x0"); //Bit Clear PortB Bit 0 en 0
       
    //DELAY
    asm("MOVLW 0x02");
    asm("MOVWF 0x10D");
    asm("MOVLW 0xF4");
    asm("MOVWF 0x10C");
    asm("RESTA2: DECFSZ 0x10C, 1");
    asm("GOTO RESTA2");
    asm("RESTAALTA2: DECFSZ 0xD, 1");
    asm("GOTO RESTA2");
    asm("GOTO REPETIR");
    //DELAY
}
