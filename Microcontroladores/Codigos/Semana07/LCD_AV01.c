#include "DHT22.h"

// Lcd pinout settings
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

char message[] = "00.0";
int humidity, temperature;
void main(){
Lcd_Init();
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
