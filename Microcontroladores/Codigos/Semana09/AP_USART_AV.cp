#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana09/AP_USART_AV.c"
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

unsigned short direccion = 0;
unsigned short Trama[4];
unsigned short dato, i;
void main() {
 UART1_Init(9600);
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 TRISC.f5 = 0;
 PORTC.f5 = 0;

 OPTION_REG.f7 = 0;


 direccion = (PORTB & 0b00000111) + 48;

 Lcd_Out(1, 3, "Direccion: ");
 Lcd_Chr_Cp(direccion);

 while(1){

 if (UART1_Data_Ready() == 1) {

 dato = UART1_Read();
 if(dato == '$'){
 Trama[0] = dato;
 for(i=1; i<=3;i++){

 while(UART1_Data_Ready() == 0){}

 Trama[i] = UART1_Read();
 }
 }
 }

 if(Trama[1] == direccion){
 Lcd_Chr(2, 1, Trama[2]);
 }
 }
}
