#line 1 "D:/Users/Circuito/Desktop/PIC2023-III/Semana 13/AP_FINAL.c"
#line 1 "d:/users/circuito/desktop/pic2023-iii/semana 13/lib_i2c_lcd.h"
#line 40 "d:/users/circuito/desktop/pic2023-iii/semana 13/lib_i2c_lcd.h"
void I2C_LCD_Cmd(char out_char) {

 char byte;

 byte = out_char & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();

 byte.F0 = 0;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 byte = (out_char << 4) & 0xF0;

 byte.F0 = 0;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 I2C1_stop();

 if(out_char == 0x01)Delay_ms(2);
}

void I2C_LCD_Chr(char row, char column, char out_char) {

 char byte;

 switch(row){

 case 1:
 I2C_LCD_Cmd(0x80 + (column - 1));
 break;
 case 2:
 I2C_LCD_Cmd(0xC0 + (column - 1));
 break;
 case 3:
 I2C_LCD_Cmd(0x94 + (column - 1));
 break;
 case 4:
 I2C_LCD_Cmd(0xD4 + (column - 1));
 break;
 };

 byte = out_char & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();

 byte.F0 = 1;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 byte = (out_char << 4) & 0xF0;

 byte.F0 = 1;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 I2C1_stop();
}

void I2C_LCD_Chr_Cp(char out_char) {

 char byte;

 byte = out_char & 0xF0;

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();

 byte.F0 = 1;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 byte = (out_char << 4) & 0xF0;

 byte.F0 = 1;
 byte.F2 = 1;
 byte.F3 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 I2C1_stop();
}


void I2C_LCD_Init() {

 char byte;

 Delay_ms(150);

 I2C1_Start();
 I2C1_Is_Idle();
 I2C1_Wr( 0x4E );
 I2C1_Is_Idle();

 Delay_ms(30);

 byte = 0x30;
 byte.F3 = 1;

 byte.F2 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 Delay_ms(30);

 byte.F2 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 Delay_ms(30);

 byte.F2 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 Delay_ms(20);

 byte = 0x20;
 byte.F3 = 1;

 byte.F2 = 1;
 I2C1_Wr(byte);
 I2C1_Is_Idle();
 byte.F2 = 0;
 I2C1_Wr(byte);
 I2C1_Is_Idle();

 Delay_ms(10);

 I2C_LCD_Cmd(0x28);
 I2C_LCD_Cmd(0x06);
}

void I2C_LCD_Out(char row, char col, char *text) {
 while(*text)
 I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
 while(*text)
 I2C_LCD_Chr_Cp(*text++);
}
#line 2 "D:/Users/Circuito/Desktop/PIC2023-III/Semana 13/AP_FINAL.c"
unsigned int NivelMaximo, NivelMinimo,NivelActual;
char EstadoBomba = '0', txtporcentaje[4], OrdenValvula, EstadoValvula = '0';
int PorcentajeNivel;

long map(long x, long in_min, long in_max, long out_min, long out_max) {
 return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void interrupt(){
 if(INTCON.f1 == 1){

 PWM1_Stop();
 PORTC.f2 = 0;
 TRISC.f2 = 1;
 while(1);
 }

}

void controlBomba(){
 if(NivelActual <= NivelMinimo){
 PWM1_Set_Duty(192);
 EstadoBomba = '1';
 }
 if(NivelActual >= NivelMaximo){
 PWM1_Set_Duty(0);
 EstadoBomba = '0';
 }
}
void controlValvula(){
 if (UART1_Data_Ready() == 1) {
 OrdenValvula = UART1_Read();
 if(OrdenValvula == '1'){
 PORTD.f0 = 1;
 EstadoValvula = '1';
 }
 if(OrdenValvula == '0'){
 PORTD.f0 = 0;
 EstadoValvula = '0';
 }
 }
}
void plantillaLCD(){
 I2C_Lcd_Out(1,3,"CONTROL DE TANQUE");
 I2C_Lcd_Out(2,1,"NIVEL ACTUAL: 000%");
 I2C_Lcd_Out(3,1,"ESTADO BOMBA:");
 I2C_Lcd_Out(4,1,"ESTADO VALVULA:");
}
void llenarDatosLCD(){
 PorcentajeNivel = map(NivelActual, NivelMinimo, NivelMaximo, 0, 100);
 if(NivelActual < NivelMinimo){
 PorcentajeNivel = 0;
 }
 ByteToStr(PorcentajeNivel, txtporcentaje);
 I2C_Lcd_Out(2,15,txtporcentaje);


 if(EstadoBomba == '1'){
 I2C_Lcd_Out(3,15," ON");
 }
 if(EstadoBomba == '0'){
 I2C_Lcd_Out(3,15,"OFF");
 }
 if(EstadoValvula == '1'){
 I2C_Lcd_Out(4,17," ON");
 }
 if(EstadoValvula == '0'){
 I2C_Lcd_Out(4,17,"OFF");
 }


}

void enviarDatosUART(){


}

void main() {
 TRISD.f0 = 0;
 PORTD.f0 = 0;
 ADC_Init();
 PWM1_Init(5000);
 PWM1_Start();
 INTCON = 0b10010000;
 I2C1_Init(100000);
 I2C_LCD_Init();
 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Cmd( 0x0C );
 UART1_Init(9600);
 plantillaLCD();

 while(1){
 NivelMaximo = ADC_Get_Sample(0);
 NivelMinimo = ADC_Get_Sample(1);
 NivelActual = ADC_Get_Sample(2);
 controlBomba();
 llenarDatosLCD();
 controlValvula();
 enviarDatosUART();


 }
}
