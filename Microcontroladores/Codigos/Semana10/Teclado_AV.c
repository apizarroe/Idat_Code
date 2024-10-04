// Lcd pinout settings
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

char keypadPort at PORTB;
unsigned short kp, valortecla, valordutty;

void main() {
   Lcd_Init();
   Lcd_Cmd(_LCD_CLEAR);
   Lcd_Cmd(_LCD_CURSOR_OFF);
   Lcd_Out(1, 1, "Porcentaje: 00%");
   PWM1_Init(5000);
   PWM1_Start();
   Keypad_Init();
   while(1){
      do
         kp = Keypad_Key_Click();             // Store key code in kp variable
         while (!kp);
       
         switch (kp) {
         case  1: kp = '7'; break; // 1        // Uncomment this block for keypad4x4
         case  2: kp = '4'; break; // 2
         case  3: kp = '1'; break; // 3
         case  5: kp = '8'; break; // 4
         case  6: kp = '5'; break; // 5
         case  7: kp = '2'; break; // 6
         case  8: kp = '0'; break; // B
         case  9: kp = '9'; break; // 7
         case 10: kp = '6'; break; // 8
         case 11: kp = '3'; break; // 9
         }
      Lcd_Chr(1, 13, kp);
      
      valortecla = kp - 48;
      valordutty = valortecla * 25.5;
      PWM1_Set_Duty(valordutty);
   }
}