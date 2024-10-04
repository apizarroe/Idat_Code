#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/EC03/EC03_1.c"

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

char texto[4];
char txt[7];
unsigned int lectura_ADC;
unsigned int centenas;
unsigned int decenas;
unsigned int unidades;
unsigned int porcentaje;

void main() {
 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1, 3, "Lector 4 - 20 mA");

 Lcd_Out(3, 1, "Aldo Pizarro");
 Lcd_Out(4, 12, "A17202187");

 while(1){
 lectura_ADC = ADC_Get_Sample(0)-98;
 porcentaje = ((lectura_ADC/393.0)*100.0);
 centenas = porcentaje/100;
 decenas = ((porcentaje/10)%10);
 unidades = (porcentaje%10);
 texto[0] = centenas + 48;
 texto[1] = decenas + 48;
 texto[2] = unidades + 48;
 Lcd_Out(2, 1, "Nivel: ");
 Lcd_Chr_Cp(texto[0]);
 Lcd_Chr_Cp(texto[1]);
 Lcd_Chr_Cp(texto[2]);
 Lcd_Chr_Cp('%');

 }

 delay_ms(200);
}
