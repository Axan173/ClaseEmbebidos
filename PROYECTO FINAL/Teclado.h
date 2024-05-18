#define Teclado_Out   PORTB   //Puerto nibble bajo, Filas 
#define Teclado_In      PORTB   //Lectura del Columnas y Filas "CF" 
#define Teclado_Dir    TRISB    //Configuraci�n del Puerto, nibble bajo como salida (Filas) 
   //nibble alto como entrada (Columnas) 
unsigned char Tecla_Presionada();   //Prototipado de la funci�n Teclado 