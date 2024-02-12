#pragma config FOSC = XT
#pragma config WDTE = OFF
#pragma config PWRTE = OFF
#pragma config CP = OFF 

//Paso 2
#include <xc.h>

//Paso 3
#define _XTAL_FREQ 4000000

//Paso 4
    void main(void) {
    
    // Hacer que todas las entradas sean digitales y no analogas    
    asm("BSF STATUS, 0x5");
    asm("BSF STATUS, 0x6");
    asm("CLRF ANSEL"); //TRISC todo en ceros para que PORTC sea salida
        
    asm("BSF STATUS, 0x5");
    asm("BCF STATUS, 0x6");
    asm("MOVLW 0xFF");
    asm(" MOVWF 0x189"); //TRISA todo en 1's para que PORTA sean entradas
    asm("CLRF 0x187"); //TRISC todo en ceros para que PORTC sea salida
    
    // Siguientes 4 lineas: Inicializar el valor del puerto C con un 0x9
    asm("BCF STATUS, 0x5"); 
    asm("BCF STATUS, 0x6");
    asm(" MOVLW 0x9");
    asm(" MOVWF 0x107");
    
    asm("REPETIR_Ciclo: BCF STATUS, 0x5");
    asm("BCF STATUS, 0x6");
    
    asm(" MOVLW 0x1"); // Cuando sea PORTE.b0=1 es ASC, cuando sea PORTE.b0=0 es DESC
    asm(" ANDWF 0x109, 0"); // AND de PORTE con 0x1 que esta en W
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO DESCENDENTE");    
    asm(" GOTO ASCENDENTE");
    
    
    asm(" ASCENDENTE: MOVLW 0x9");
    asm(" SUBWF 0x107, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO01_ASC");    
    asm(" GOTO CASO00_ASC");
    
    //asm("CASO00_ASC: INCF 0x107, 1");
    asm(" CASO00_ASC: MOVLW 0x0");
    asm(" MOVWF 0x107");
    asm(" GOTO DELAY");
    
    asm("CASO01_ASC: INCF 0x107, 1");
    asm(" GOTO DELAY");
    
    
    asm(" DESCENDENTE: MOVF 0x107, 0");//Tomar EL registro C y poner el contenido en W 
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO01_DESC");    
    asm(" GOTO CASO00_DESC");
    
    //asm("CASO00: INCF 0x107, 1");
    asm(" CASO00_DESC: MOVLW 0x9");
    asm(" MOVWF 0x107");
    asm(" GOTO DELAY");
    
    asm("CASO01_DESC: DECF 0x107, 1");
    asm(" GOTO DELAY");
    
    
    //delay starts
    asm("DELAY: MOVLW 0x02");
    asm("MOVWF 0x10D");
    asm("MOVLW 0xF4");
    asm("MOVWF 0x10C");	
    asm("RESTA2: DECFSZ 0x10C, 1");
    asm("GOTO RESTA2");
    asm("RESTAALTA2: DECFSZ 0xD, 1");
    asm("GOTO RESTA2");
    // delay ends
     
        
    //////////////////////////////////////////////////////////////////    
        
    //Todos los pines de B a salida
    asm("BSF STATUS, 0x5");
    asm("BCF STATUS, 0x6");
    //Limpia todo el puerto B
    asm("CLRF 0x186");
    
    //mivar1
    asm("BCF STATUS, 0x5");
    asm("BCF STATUS, 0x6");
    asm("MOVF 0x107, 0");//Tomar EL registro C y poner el contenido en W
    asm(" BCF STATUS, 0x5");
    asm(" MOVWF 0x121");
    
    //salida
    asm(" CLRF 0x106");
    
    //if 0
    asm(" MOVF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO1");
    asm(" GOTO ASIGNAR0");
    
    asm(" ASIGNAR0: MOVLW 0x7E");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
    //if 1
    asm(" CASO1: DECF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO2");
    asm(" GOTO ASIGNAR1");
    
    asm(" ASIGNAR1: MOVLW 0x30");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
    
    //if 2
    asm(" CASO2: MOVLW 0x2");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO3");
    asm(" GOTO ASIGNAR2");
    
    asm(" ASIGNAR2: MOVLW 0x6D");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");

    //if 3
    asm(" CASO3: MOVLW 0x3");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO4");
    asm(" GOTO ASIGNAR3");
    
    asm(" ASIGNAR3: MOVLW 0x79");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");

    //if 4
    asm(" CASO4: MOVLW 0x4");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO5");
    asm(" GOTO ASIGNAR4");
    
    asm(" ASIGNAR4: MOVLW 0x33");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");

    //if 5
    asm(" CASO5: MOVLW 0x5");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO6");
    asm(" GOTO ASIGNAR5");
    
    asm(" ASIGNAR5: MOVLW 0x5B");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
        
    //if 6 //////////////
    asm(" CASO6: MOVLW 0x6");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO7");
    asm(" GOTO ASIGNAR6");
    
    asm(" ASIGNAR6: MOVLW 0x5F");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
    
    //if 7
    asm(" CASO7: MOVLW 0x7");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO8");
    asm(" GOTO ASIGNAR7");
    
    asm(" ASIGNAR7: MOVLW 0x70");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
   //if 8
    asm(" CASO8: MOVLW 0x8");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO CASO9");
    asm(" GOTO ASIGNAR8");
    
    asm(" ASIGNAR8: MOVLW 0x7F");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
    //if 9
    asm(" CASO9: MOVLW 0x9");
    asm(" XORWF 0x121, 0");
    asm(" BTFSS 0x103, 0x2");
    asm(" GOTO REPETIR_Ciclo");
    asm(" GOTO ASIGNAR9");
    
    asm(" ASIGNAR9: MOVLW 0x73");
    asm(" MOVWF 0x106");
    asm(" GOTO REPETIR_Ciclo");
    
    
    //go back to rotate a bit
    asm("GOTO REPETIR_Ciclo");    
}