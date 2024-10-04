/*
LIBRERÍA PARA LECTURA DE SENSOR DE TEMPERATURA Y HUMEDAD DHT22

INSTRUCCIONES:
ADJUNTAR EL PRESENTE ARCHIVO AL INICIO DEL PROGRAMA CON #include "DHT22.h"

DECLARAR 2 VARIABLES TIPO INT, UNA PARA ALMACENAR LA TEMPERATURA Y OTRA PARA
HUMEDAD.
LEER EL SENSOR CON: dht22_read(&"VARIABLE PARA TEMP", &"VARIABLE PARA HUME");

EJEMPLO:
char message[] = "00.0";
int humidity, temperature;
void main(){
while(1){
    dht22_read(&humidity, &temperature);
    Lcd_Out(1,1,"HUMIDITY:");
    Lcd_Out(2,1,"TEMP:");
    message[0] = humidity/100 + 48;
    message[1] = humidity/10%10 + 48;
    message[3] = humidity%10 + 48;
    Lcd_Out(1,11, message);
    Lcd_Out(1,16,"%");
    message[0] = temperature/100 + 48;
    message[1] = temperature/10%10 + 48;
    message[3] = temperature%10 + 48;
    Lcd_Out(2,11, message);
    Lcd_Chr_CP(223);
    Lcd_Out(2,16,"C");
    Delay_ms(1000);  // wait a second
  }//while(1)
}

*/

#define DHT22_PIN         RB1_bit
#define DHT22_PIN_DIR     TRISB1_bit
#include <stdint.h>

uint8_t dht22_read_byte()
{
  uint8_t i = 8, dht22_byte = 0;
  while(i--)
  {
    while( !DHT22_PIN );
    Delay_us(40);
    if( DHT22_PIN )
    {
      dht22_byte |= (1 << i);   // set bit i
      while( DHT22_PIN );
    }
  }
  return(dht22_byte);
}
// read humidity (in hundredths rH%) and temperature (in hundredths °Celsius) from sensor
void dht22_read(uint16_t *dht22_humi, int16_t *dht22_temp)
{
  // send start signal
  DHT22_PIN     = 0;   // connection pin output low
  DHT22_PIN_DIR = 0;   // configure connection pin as output
  Delay_ms(25);        // wait 25 ms
  DHT22_PIN     = 1;   // connection pin output high
  Delay_us(30);        // wait 30 us
  DHT22_PIN_DIR = 1;   // configure connection pin as input
  // check sensor response
  while( DHT22_PIN );
  while(!DHT22_PIN );
  while( DHT22_PIN );
  // read data
  *dht22_humi = dht22_read_byte();  // read humidity byte 1
  *dht22_humi = (*dht22_humi << 8) | dht22_read_byte();  // read humidity byte 2
  *dht22_temp = dht22_read_byte();  // read temperature byte 1
  *dht22_temp = (*dht22_temp << 8) | dht22_read_byte();  // read temperature byte 2
  dht22_read_byte();               // read checksum (skipped)
  if(*dht22_temp & 0x8000)// if temperature is negative
  {
    *dht22_temp &= 0x7FFF;
    *dht22_temp *= -1;
  }
}