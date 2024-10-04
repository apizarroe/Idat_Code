#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana10/Teclado_2.c"

sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;


sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char keypadPort at PORTB;
unsigned short kp;

void main() {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 1, "Tecla:");
 Keypad_Init();
 while(1){
 do
 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp) {
 case 1: kp = '7'; break;
 case 2: kp = '4'; break;
 case 3: kp = '1'; break;
 case 5: kp = '8'; break;
 case 6: kp = '5'; break;
 case 7: kp = '2'; break;
 case 8: kp = '0'; break;
 case 9: kp = '9'; break;
 case 10: kp = '6'; break;
 case 11: kp = '3'; break;
 }
 Lcd_Chr(2, 1, kp);
 }
}
