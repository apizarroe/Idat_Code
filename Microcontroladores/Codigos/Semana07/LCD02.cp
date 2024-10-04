#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana07/LCD02.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;
float voltaje;
float temp;
unsigned int entero, decimal;
char texto[4];

void main() {
 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"Voltaje:");

 while(1){
 voltaje = (ADC_Get_Sample(0)*5.0/1024.0);
 entero = voltaje;
 temp = voltaje * 1000 - entero * 1000;
 decimal = temp;
 texto[0] = entero + 48;
 texto[1] = ((decimal/100)%10) + 48;
 texto[2] = ((decimal/10)%10) + 48;
 texto[3] = (decimal%10) + 48;
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Chr_Cp(texto[0]);
 Lcd_Chr_Cp('.');
 Lcd_Chr_Cp(texto[1]);
 Lcd_Chr_Cp(texto[2]);
 Lcd_Chr_Cp(texto[3]);
 delay_ms(200);
 }
}
