//#include <xc.h>    //Use this to include the device header for your PIC.
#include "biblioteca_lcd1.h"
#include "Teclado.h"
#define _XTAL_FREQ 4000000  //4MHz, which is default


volatile char OSTaskEnable = 0;


void ADCConversionLDR(void)
{
      ADCON0.GO_DONE=1; //Inicio de Conversi�n
      while(ADCON0.GO_DONE){}; //TODO quitar esta basura :)

      cuenta = ((ADRESH&0x3)<<8) | (ADRESL&0x00FF);
      if (cuenta > 999) {
          cuenta = 999;
      }


}

void Mangueras()
{
    
}



unsigned char Tecla_Presionada(void)
{     
      unsigned char Filas;    //Filas Teclado
      unsigned char CF;   //Columnas y Filas (0xCF) del Teclado
      volatile unsigned char TP;    //Tecla presionada

      for (Filas=0x01;Filas!=0x10;Filas = Filas << 1)
      {
            Teclado_Out = Filas;    //Filas a puerto
            // TODO QUITAR ESTA BASURA DE DELAY :)
            delay_ms(2);           //Evitar rebote (bounce)
            CF = Teclado_In;         //Lectura del Teclado, Columnas y Filas


            switch (CF)
            {
                case 0x11: return TP=1;  break; //1
                case 0x21: return TP=2;  break; //2
                case 0x41: return TP=3;  break; //3
                case 0x81: return TP=10; break; //A
                case 0x12: return TP=4;  break; //4
                case 0x22: return TP=5;  break; //5
                case 0x42: return TP=6;  break; //6
                case 0x82: return TP=11; break; //B
                case 0x14: return TP=7;  break; //7
                case 0x24: return TP=8;  break; //8
                case 0x44: return TP=9;  break; //9
                case 0x84: return TP=12; break; //C
                case 0x18: return TP=14; break; //E
                case 0x28: return TP=0;  break; //0
                case 0x48: return TP=15; break; //F
                case 0x88: return TP=13; break; //D
            }
      }

      return TP=16;   //Teclado sin Presionar
}

void StepperMotorControl (int direcciongiro) // 0 para derecha 1 para izquierda
{
     static char estadodesecuencia = 5;
     static long cuentadepasos = 0; 

     switch (estadodesecuencia){
            case 0:
              PORTD &= 0xF0;
              PORTD |= 0b1001; // Paso 1
            break;
            case 3:
              PORTD &= 0xF0;
              PORTD |= 0b0011; // Paso 2
            break;
            case 6:
              PORTD &= 0xF0;
              PORTD |= 0b0110; // Paso 3
            break;
            case 9:
              PORTD &= 0xF0;
              PORTD |= 0b1100; // Paso 4
            break;
            default:
            break;
     }
     
     if(direcciongiro == 1)
     {
            estadodesecuencia = (estadodesecuencia < 9)?(estadodesecuencia+1):(0);
     }
     else
     {
            estadodesecuencia = (estadodesecuencia > 0)? (estadodesecuencia-1):(9);
     }

}


void Ancho_Pulso(int ancho)         //Ancho de Pulso
{    
    // De 0 a 1023 partes equivalentes de 0 a 100%
     //La frecuencia en el oscilador es de 4MHZ
     //Se considera la pre-escala de TMR2 1:1
    CCP1CON |=  ((ancho&0x0003)<<4);
    CCPR1L  =   ancho>>2;
} 



void Periodo(int t_useg)   //Per�odo de la se�al
{
     //De 1 useg a 256 usegs
     //La frecuencia en el oscilador es de 4MHZ
     //Se considera la pre-escala de TMR2 1:16
     PR2=(t_useg-1);
}



void displayControl(void)
{
    volatile int i=0;
    volatile static int refreshRate = 0;
    
    if(refreshRate == 5)
    {
        if(i==0){
           LCD_Write(0x04,1,1);
           LCD_Write(0x04,1,5);
           LCD_Write(0x04,1,9);
           LCD_Write(0x04,1,13);

           LCD_Write(0x01,1,3);
           LCD_Write(0x02,1,7);
           LCD_Write(0x03,1,11);
           i++;
        }
        else
        {
           LCD_Write(0x04,1,3);
           LCD_Write(0x04,1,7);
           LCD_Write(0x04,1,11);

           LCD_Write(0x05,1,1);
           LCD_Write(0x06,1,5);
           LCD_Write(0x07,1,9);
           LCD_Write(0x08,1,13);
           i=0;
        }
        LCD_Sprint(&TEXTO1,0,1);
        LCD_Nprint(&cuenta,0,11);
        //cuenta--;
        refreshRate=0;
    }
    
    refreshRate++;
}

void inittask (void)
{
     //Inicializar Stepper Motor
     TRISD = 0x00; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
     PORTD &= 0xF0;        // Inicializar los 4 BITS a 0
     

     //Inicializar el Display
        LCD_set(&LCD_Ctrl_PORT,&LCD_Bus_Data,&LCD_Bus_PORT,&LCD_Ctrl_Data);
        LCD_Reset();
        LCD_Function_Init(true);
        LCD_Function_Init(true);
        LCD_Function_Init(false);
        LCD_Function_Set(NB,NL_2,F5_10);
        LCD_Function_Set(NB,NL_2,F5_10);
        LCD_On_Off(Dsp_ON,Cur_ON,Blk_OFF);
        LCD_Clear();
        LDC_EntryMode_Set(Mode_INC,EntireShift_OFF);
        LCD_Sprint(&TEXTO1,0,1);
        LCD_CGRAM_Set(&FIG1,1);
        LCD_CGRAM_Set(&FIG2,2);
        LCD_CGRAM_Set(&FIG3,3);
        LCD_CGRAM_Set(&FIG4,4);
        LCD_CGRAM_Set(&FIG5,5);
        LCD_CGRAM_Set(&FIG6,6);
        LCD_CGRAM_Set(&FIG7,7);
        LCD_CGRAM_Set(&FIG8,8);
        
     // Inicializacion del ADC

      TRISA.RA0=1; //Bit 0 del Puerto A como entrada 
      ANSEL.RA0=1; //Bit O del Puerto A como entrada analoga.
      
      ADCON0.ADCS1=1; //Selecci�n del Oscilador Interno FRC
      ADCON0.ADCS0=1;             //Selecci�n del canal 0 de forma predeterminada
      
      ADCON1.ADFM=1; //Justificado a la Derecha
                     //Selecci�n predefinada del Vref (VDD a VSS)
      ADCON0.ADON=1; //Encendido del ADC.

      //Inicializacion del Teclado Matricial
      ANSELH=0x00;        //Configurando Entradas Digitales en PORTB.
      Teclado_Dir=0xF0;  //Nibble Alto Entrada | Bajo Salida
                                 //C1 C2 C3 C4 | F1 F2 F3 F4


      // Configuracion del PWM
      

      CCP1CON.P1M1=0;      //PWM Single output, P1A modulada;P1B,P1C y P1D como I/O.
      CCP1CON.P1M0=0;
      CCP1CON.CCP1M3=1;    //Modo PWM P1A,P1C,P1B,P1D activas en Alto.
      CCP1CON.CCP1M2=1;

      PSTRCON.STRB=1;      //P1B activa en RD5
      PSTRCON.STRSYNC=1;   //Steering Sync Bit on next PWM Period

      //Pre-escala del Timer2 1:1
      PIR1.TMR2IF=0;       //Limpieza de la Bandera de interrupci�n del TMR2    
      T2CON.TMR2ON=1;      //Activaci�n del TMR2
      T2CON.T2CKPS1=1;     //Pre-escala 1:16 Prescaler
      T2CON.T2CKPS0=1;     //Pre-escala 1:16 Prescaler
      TRISD.RD5=0;         //Activaci�n de la salida de la terminal
      Periodo(256);

      //Inicializacion LEDs para Mangueras
      TRISE.RC3 = 0x00; // Puerto E BIt 3 como salida para la manguera 1 Agua
      TRISE.RC1 = 0x00; // Puerto E Bit 1 como salida para la manguera 2 Pesticida
      TRISE.RC2 = 0x00; // Puerto E Bit 2 como salida para la manguera 3 Fertilizante
}

void  task1ms (void)
{
      /*TODO*/
      /*NO USAR ESTA FUNCION PUES TENEMOS DELAY Y LO ROMPIMOS*/
      /*QUITAR TODOS LOS DELAYS ANTES DE USAR ESTA FUNCION*/

}

void  task10ms (void)
{
      Mangueras();

}

void  task100ms (void)
{
      //cuenta = Tecla_Presionada();

      //displayControl(); // Tiene un bug que causa que se distorsionen las se�ales
      
      ADCConversionLDR();
      
      Ancho_Pulso(300); // 0 a 1024 donde 1024 es 100% de ancho de pulso
}

//set the configuration bits: internal OSC, everything off except MCLR
//#pragma config FOSC=INTRCIO, WDTE=OFF, PWRTE=OFF, MCLRE=ON, CP=OFF, \
                CPD=OFF, BOREN=OFF, IESO=OFF, FCMEN=OFF

void interrupt()
{

    volatile static int myCount = 0;
    volatile static int Ostickcounter = 0;
    
    
    INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
    TMR0 = 0;               //Load a value of 0 into the timer
                            //This is actually not necessary since the
                            //register will be at 0 anyway after rolling
                            //over

    if(myCount==8)
    {
        Ostickcounter++;
        myCount = 0;
        
        if ((Ostickcounter %1)== 0) //cuenta 1 veces 1ms = 1ms
        {
              OSTaskEnable = OSTaskEnable | 0x1;
        }
        if ((Ostickcounter %10)==0) //cuenta 10 veces 1ms = 10ms
        {
              OSTaskEnable = OSTaskEnable | 0x2;
        }
        if ((Ostickcounter %100)==0)//cuenta 100 veces 1ms = 100ms
        {
              OSTaskEnable = OSTaskEnable | 0x4;
              Ostickcounter = 0;
        }
    }
    else
    {
        myCount++;
    }
    
}

int main()
{
    TRISA = 0xFF;   //set all digital I/O to inputs
    TRISB = 0xFF;
    TRISC = 0xFF;

    ANSEL = 0x00;   //disable all analog ports
    ANSELH = 0x00;

    TRISD.TRISD5 = 0;   //set RD5 as an output


    ///////////////////
    // Timer 0 Setup //
    ///////////////////
    OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
                              //the Watchdog timer (WDT))

    OPTION_REG.PS2 = 0;  //Set the prescaler to 1:1
    OPTION_REG.PS1 = 0;  //Set the prescaler to 1:1
    OPTION_REG.PS0 = 0;  //Set the prescaler to 1:1

    OPTION_REG.T0CS = 0;    //Use the instruction clock (Fcy/4) as the timer
                            //clock. Other option is an external oscillator
                            //or clock on the T0CKI pin.

    INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
    TMR0 = 0;               //Load a value of 0 into the timer
    INTCON.T0IE = 1;        //Enable the Timer 0 interrupt
    INTCON.GIE = 1;         //Set the Global Interrupt Enable

    inittask();
    ///////////////////////
    // Main Program Loop //
    ///////////////////////
    while(1)
    {

     if ((OSTaskEnable & 0x1)!= 0)
     {
          task1ms();
          OSTaskEnable = OSTaskEnable & 0xFE;
     }
     if ((OSTaskEnable & 0x2)!= 0)
     {
          task10ms();
          OSTaskEnable = OSTaskEnable & 0xFD;
          
     }
     if ((OSTaskEnable & 0x4)!= 0)
     {
          task100ms();
          OSTaskEnable = OSTaskEnable & 0xFB;
     }
    }

    return 0;
}