//#include <xc.h>    //Use this to include the device header for your PIC.

#define _XTAL_FREQ 4000000  //4MHz, which is default


volatile static int Ostickcounter = 0;

void StepperMotorControl (int direcciongiro) // 0 para derecha 1 para izquierda
{
     static char estadodesecuencia = 0;
     static long cuentadepasos = 0; 

     switch (estadodesecuencia){
            case 0:
                   PORTD = PORTD & 0xF0;
                   PORTD = PORTD | 0b1001;
            break;
            case 1:
                   PORTD = PORTD & 0xF0;
                   PORTD = PORTD | 0b0011; // Paso 2
            break;
            case 2:
                   PORTD = PORTD & 0xF0;
                   PORTD = PORTD | 0b0110; // Paso 3
            break;
            case 3:
                   PORTD = PORTD & 0xF0;
                   PORTD = PORTD | 0b1100; // Paso 4
                   estadodesecuencia = 0;
                   
            break;
            default:
            
            break;
     }
}

void inittask (void)
{
     //Inicializar Stepper Motor
     TRISD = TRISD & 0xF0; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
}

void  task1ms (void)
{





}







void  task10ms (void)
{
      StepperMotorControl(0);


}





void  task100ms (void)
{


}

//set the configuration bits: internal OSC, everything off except MCLR
//#pragma config FOSC=INTRCIO, WDTE=OFF, PWRTE=OFF, MCLRE=ON, CP=OFF, \
                CPD=OFF, BOREN=OFF, IESO=OFF, FCMEN=OFF

void interrupt()
{

    volatile static int myCount = 0;

    if(myCount==8)
    {
        INTCON.T0IF = 0;        //Clear the Timer 0 interrupt flag
        TMR0 = 0;               //Load a value of 0 into the timer
                                //This is actually not necessary since the
                                //register will be at 0 anyway after rolling
                                //over

        PORTD.RD5 = ~PORTD.RD5; //Toggle the LED
        Ostickcounter ++;
        myCount = 0;
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

    TRISD.TRISD5 = 0;   //set RB7 as an output


    ///////////////////
    // Timer 0 Setup //
    ///////////////////
    OPTION_REG.PSA = 0;       //Prescaler assigned to Timer 0 (other option is to
                              //the Watchdog timer (WDT))

    OPTION_REG.PS2 = 0;  //Set the prescaler to 1:256
    OPTION_REG.PS1 = 1;  //Set the prescaler to 1:256
    OPTION_REG.PS0 = 0;  //Set the prescaler to 1:256

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

     if ((Ostickcounter %2)== 0) //cuenta 2 veces 500us = 1ms
     {
          task1ms();
     }
     else if ((Ostickcounter %20)==0) //cuenta 20 veces 500us = 10ms
     {
          task10ms();
          
     }
     else if ((Ostickcounter %200)==0)//cuenta 200 veces 500us = 100ms
     {
          task100ms();
          Ostickcounter = 0;
     }
     else { }
    }

    return 0;
}