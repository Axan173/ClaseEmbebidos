//#include <xc.h>    //Use this to include the device header for your PIC.

#define _XTAL_FREQ 4000000  //4MHz, which is default


volatile char OSTaskEnable = 0;

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

void inittask (void)
{
     //Inicializar Stepper Motor
     TRISD = 0x00; // Solo Los primeros 4 BITS 0 al 3 los otros se quedan en 0
     PORTD &= 0xF0;        // Inicializar los 4 BITS a 0
}

void  task1ms (void)
{
      PORTD.RD5 = ~PORTD.RD5;
      StepperMotorControl(0);





}

void  task10ms (void)
{
      //PORTD.RD5 = ~PORTD.RD5;



}

void  task100ms (void)
{
      //PORTD.RD5 = ~PORTD.RD5;


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
        //PORTD.RD5 = ~PORTD.RD5; //Toggle the LED
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