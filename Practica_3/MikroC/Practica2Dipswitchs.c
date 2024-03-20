unsigned int LaCuenta=0;
unsigned char unidades; //Variable para las Unidades
unsigned char decenas; //Variable para las Decenas
unsigned char centenas; //Variable para las Centenas
unsigned char digitos;
unsigned char TABLA[] = {0x77, 0x41, 0x3B, 0x6B, 0x4D, 0x6E, 0x7E, 0x43, 0x7F, 0x6F};
unsigned char Namearray[] = {0x5F,0x5F,0x6E,0x6E ,0x00,0x00,0x00,0x00};
unsigned char ascendente = 1; // Variable para almacenar el modo de conteo: 1 para ascendente, 0 para descendente
unsigned char stop = 0; // Variable para detener el conteo

void mostrar_valores_iniciales(unsigned char veces);
void conteo_up();
void conteo_down();
void multiplexado(unsigned char veces);

#define shift_factor 4   //velocidad de corrimieto 1-8


void main ()
{
    TRISC = 0x00;   // Configurando el Puerto "C" como Salida
    TRISD = 0x00;   // Configurando el Puerto "D" como Salida
    PORTD = 0xF0;
    OPTION_REG = OPTION_REG & 0x7F; // Activar "Weak Pull-up"
    ANSELH = 0x00;  // Configurado de Entradas Digitales en PORTE
    PORTB = 0x07;   // Activar Pull-ups para los botones (incluyendo el botón de parada)

    mostrar_valores_iniciales(200);

    while (1)
    {
        if (PORTB & 0x01) // Botón en B0 presionado, detener conteo
        {
            stop = 1; // Detener el conteo
        }
        else // Si B0 no está presionado
        {
            if (PORTB & 0x02) // Botón en B1 presionado, selección ascendente
            {
                ascendente = 1;
                stop = 0; // Reinicia la bandera de parada
            }
            else // Botón B1 no presionado, selección descendente
            {
                ascendente = 0;
                stop = 0; // Reinicia la bandera de parada
            }
        }

        if (!stop && !(PORTB & 0x01)) // Si no se presiona el botón de parada y B0 no está seleccionado
        {
            if (ascendente)
            {
                conteo_up();
            }
            else
            {
                conteo_down();
            }

            multiplexado(25);  // Multiplexado (1/4 segundo) y Paro
        }
        else // Si se presiona el botón de parada o B0 está seleccionado
        {
            multiplexado(1); // Muestra el número actual sin actualizar

        }
    }
}

void conteo_up()
{
    LaCuenta++;
    centenas = (unsigned char) (LaCuenta / 100);
    decenas = (unsigned char) ((LaCuenta % 100)/10);
    unidades = (unsigned char) ((LaCuenta % 100)%10);
}

void conteo_down()
{
    LaCuenta --;
    centenas = (unsigned char) (LaCuenta / 100);
    decenas = (unsigned char) ((LaCuenta % 100)/10);
    unidades = (unsigned char) ((LaCuenta % 100)%10);
}

void multiplexado(unsigned char veces)
{
    static unsigned char mostre_S = 0;
    static unsigned char mostre_R = 0;
    
    PORTD.RD0 = 0;
    PORTD.RD1 = 0; // Cátodos deshabilitados
    PORTD = PORTD | 0xF0;
    
    if (mostre_S == 1){
         veces = 100;           // Mover de 0 a 255   mas peque mas fast
    }
    
    while (veces)
    {
        if(stop == 1)
        {
            mostre_S = 1;
            PORTC = ~0x6E;   // Decodificación del dígito
            PORTD.RD3 = 1;             // Activación del Cátodo del dígito
            delay_ms(5);
            PORTD.RD3 = 0;
        }
        else if(mostre_S==1) {
            mostre_R = 1;
            PORTC = ~0x1F;   // Decodificación del dígito
            PORTD.RD4 = 0;
            PORTD.RD3 = 1;   // Activación del Cátodo del dígito
            delay_ms(5);
            PORTD.RD3 = 0;
        }
        
        else if (ascendente == 1)
        {
            PORTC = ~0x00;   // Decodificación del dígito
            PORTD.RD4 = 0;
            PORTD.RD5 = 0;
            PORTD.RD3 = 1;             // Activación del Cátodo del dígito
            delay_ms(5);
            PORTD.RD3 = 0;
            mostre_S = 0;
        }
        
        else if (ascendente == 0)
        {
            PORTC = ~0x00;   // Decodificación del dígito
            PORTD.RD6 = 0;
            PORTD.RD7 = 0;
            PORTD.RD3 = 1;             // Activación del Cátodo del dígito
            delay_ms(5);
            PORTD.RD3 = 0;
            mostre_S = 0;
        }
        
        else
        {
            PORTC = ~0x00;   // Decodificación del dígito
            PORTD.RD3 = 1;             // Activación del Cátodo del dígito
            delay_ms(5);
            PORTD.RD3 = 0;
        }
        
        PORTD = PORTD | 0xF0;
        PORTC = ~TABLA[unidades];  // Decodificación de las unidades
        PORTD.RD1 = 1;             // Activación del Cátodo de las unidades
        delay_ms(5);               // Retardo 5 milisegundos
        PORTD.RD1 = 0;

        PORTC = ~TABLA[decenas];   // Decodificación de las decenas
        PORTD.RD0 = 1;             // Activación del Cátodo de las decenas
        delay_ms(5);
        PORTD.RD0 = 0;

        PORTC = ~TABLA[centenas];  // Decodificación de las centenas
        PORTD.RD2 = 1;             // Activación del Cátodo de las centenas
        delay_ms(5);
        PORTD.RD2 = 0;


        
        veces--;
    }
    if (mostre_R == 1) 
    {
       mostre_S = 0;
       mostre_R = 0;
    }
}

void mostrar_valores_iniciales(unsigned char veces)
{
    unsigned char nameshifter = 0;
    unsigned char vecesBU = veces;
    PORTD.RD0 = 0;
    PORTD.RD1 = 0;
    PORTD.RD2 = 0;
    PORTD.RD3 = 0; // Cátodos deshabilitados

    while (veces)
    {
        PORTC = ~0x5F;  // Decodificación de las unidades   5F
        PORTD.RD1 = 1;             // Activación del Cátodo de las unidades
        delay_ms(5);               // Retardo 5 milisegundos
        PORTD.RD1 = 0;

        PORTC = ~0x34;   // Decodificación de las decenas
        PORTD.RD0 = 1;             // Activación del Cátodo de las decenas
        delay_ms(5);
        PORTD.RD0 = 0;

        PORTC = ~0x77;  // Decodificación de las centenas
        PORTD.RD2 = 1;             // Activación del Cátodo de las centenas
        delay_ms(5);
        PORTD.RD2 = 0;

        PORTC = ~0x5D;   // Decodificación del dígito
        PORTD.RD3 = 1;             // Activación del Cátodo del dígito
        delay_ms(5);
        PORTD.RD3 = 0;
        
        veces--;
    }
    
      veces = (unsigned char)(vecesBU/shift_factor);
      
     while (veces)
    {
        PORTC = ~Namearray[3+nameshifter];  // Decodificación de las unidades
        PORTD.RD1 = 1;             // Activación del Cátodo de las unidades
        delay_ms(10);               // Retardo 5 milisegundos
        PORTD.RD1 = 0;

        PORTC = ~Namearray[2+nameshifter];   // Decodificación de las decenas
        PORTD.RD0 = 1;             // Activación del Cátodo de las decenas
        delay_ms(10);
        PORTD.RD0 = 0;

        PORTC = ~Namearray[1+nameshifter];  // Decodificación de las centenas
        PORTD.RD2 = 1;             // Activación del Cátodo de las centenas
        delay_ms(10);
        PORTD.RD2 = 0;

        PORTC = ~Namearray[0+nameshifter];   // Decodificación del dígito
        PORTD.RD3 = 1;             // Activación del Cátodo del dígito
        delay_ms(10);
        PORTD.RD3 = 0;
        
        veces--;
        if ((veces == 0) && (nameshifter < 4) )
        {
           veces = (unsigned char)(vecesBU/shift_factor);
           nameshifter++;
        }
    }
}