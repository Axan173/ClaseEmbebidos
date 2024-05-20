/* 
-------------------------------------------------------- 
Laboratorio #14 "I2C Driver (i2c.h)" 
-------------------------------------------------------- 
*/ 
/* Asignaci�n de terminales y puerto*/ 
#define SCL_Dir TRISC.RC3 
#define SDA_Dir TRISC.RC4 
#define SCL PORTC.RC3 
#define SDA PORTC.RC4 
/* Bits de Configuraci�n */ 
#define Slave_Mode_10bits_SS  0x0F //I2C Slave Mode, 10 bit addrs + Start + Stop 
#define Slave_Mode_7bits_SS   0x0E //I2C Slave Mode, 7 bit addrs + Start + Stop 
#define Master_Mode_Firmware  0x0E //I2C Firmware Controlled Master Mode(Slave_Idle) 
#define Master_Mode_Clock     0x08 //I2C Master Mode, clock definido en SSPADD 
#define Slave_Mode_10bits     0x07 //I2C Slave Mode, 10 bit addrs 
#define Slave_Mode_7bits      0x06 //I2C Slave Mode, 7 bit addrs 
/* Velocidad de I2C */ 
#define FOSC 4000000     //Hz 
#define I2C_Speed 100000      //Hz 
#define SSPADD_Speed    ((FOSC/(4*I2C_Speed))-1) //Velocidad del I2C 
/* Direcci�n del DS1307 */ #define DS1307_ID 0x68 //Direcci�n del DS1307  (ver DataSheet) 
#define R 1 //Read 
#define W 0 //Write 
#define DS1307_R ((DS1307_ID<<1) + R) //Lectura del DS1307 
#define DS1307_W ((DS1307_ID<<1) + W) //Escritura del DS1307 
/* Acknowledge */ 
#define ACK    0 //Acknowledge ACK = 0, Recibido 
#define NACK   1 //No Acknowledge ACK = 1 
void I2C_init(void); 
void I2C_port(void); 
void I2C_wait(void); 
void I2C_start(void); 
void I2C_restart(void); 
void I2C_stop(void); 
void I2C_write(unsigned char Data); 
unsigned char I2C_read(unsigned char Ack);
