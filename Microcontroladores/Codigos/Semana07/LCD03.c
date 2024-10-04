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
float voltaje;
char texto[10];

void main() {
     ADC_Init();
     Lcd_Init();
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Cmd(_LCD_CURSOR_OFF);
	 Lcd_Out(1,1,"Voltaje:");
     while(1){
		 voltaje = (ADC_Get_Sample(0)*5.0/1024.0); //2.123
		 FloatToStr(voltaje,texto);
		 Lcd_Out(2, 1, texto);
		 delay_ms(200);
     }
}
