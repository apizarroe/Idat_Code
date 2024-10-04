#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/EC04/ProyectoFinal.c"
#line 1 "c:/users/aldo pizarro/desktop/idat_clases/cicloiv/microcontroladores/proyectos/ec04/lib_i2c_lcd.h"
#line 40 "c:/users/aldo pizarro/desktop/idat_clases/cicloiv/microcontroladores/proyectos/ec04/lib_i2c_lcd.h"
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
#line 3 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/EC04/ProyectoFinal.c"
unsigned short kp, flg_llenado=0, flg_fin=0, flg_temp_limite=0;
unsigned int peso_ingresado = 0, peso_ADC, lectura_peso_ADC, lectura_electrodo_ADC, lectura_temp_ADC;
float peso_carbon, peso_silicio;
int dutty = 128, i = 0, miles = 0, cent = 0, dec = 0, und = 0, pot_elect = 0;
char cadena[4], txtpeso[4];
char keypadPort at PORTB;
char test;

void controlVelocidadFaja(){
 PWM1_Start();
 PWM1_Set_Duty(dutty);
 if(PORTD.f2 == 1){
 if (dutty<255){
 PWM1_Set_Duty(dutty);
 dutty = dutty + 1;
 delay_ms(1);
 }
 }
 if(PORTD.f3 == 1){
 if (dutty>0){
 PWM1_Set_Duty(dutty);
 dutty = dutty - 1;
 delay_ms(1);
 }
 }
}

void ingresoPeso(){
 do
 kp = Keypad_Key_Click();
 while (!kp);

 if(kp == 4){
 for(i=1; i<5; i++){
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
 I2C_Lcd_Chr(1, i+9, kp);
 cadena[i-1] = kp;
 if(i == 1){
 miles = kp-48;
 }
 if(i == 2){
 cent = kp-48;
 }
 if(i == 3){
 dec = kp-48;
 }
 if(i == 4){
 und = kp-48;
 }
 }
 peso_ingresado = miles*1000+cent*100+dec*10+und;
 if(peso_ingresado <= 500 | peso_ingresado >= 2000){
 I2C_LCD_Out(1,1,"Lote de: 0000Kg");
 peso_ingresado = 0;
 }
 peso_silicio = (peso_ingresado/4)*3;
 peso_carbon = (peso_ingresado/4)*1;
 }
}

void llenado_Horno(){
 if(flg_llenado == 0){
 lectura_peso_ADC = ADC_Get_Sample(1);
 peso_ADC = lectura_peso_ADC * 2;
 IntToStr(peso_ADC, txtpeso);
 I2C_Lcd_Out(2,9,txtpeso);
 if(peso_ADC < peso_silicio){
 PORTD.f0=1;
 } else {
 PORTD.f0=0;
 }
 if(peso_ADC > peso_silicio & peso_ADC < peso_ingresado){
 PORTD.f1=1;
 } else {
 PORTD.f1=0;
 }
 if(peso_ADC > peso_ingresado){
 flg_llenado = 1;
 }
 }
}

void control_Electrodo(){
 lectura_electrodo_ADC = ADC_Get_Sample(0);
 pot_elect = (lectura_electrodo_ADC/1024.0)*255.0;
 PWM2_Start();
 PWM2_Set_Duty(pot_elect);
 lectura_temp_ADC = ADC_Get_Sample(2);
 if(lectura_temp_ADC >= 750){
 flg_temp_limite = 1;
 }
}

void vaciado_Material(){
 PWM2_Set_Duty(0);

 PORTC.f5 = 0;
 PORTD.f5 = 1;
 controlVelocidadFaja();

 if(PORTD.f6 == 1){
 flg_fin = 1;
 }
}

void main() {

 TRISC = 0b00000000;
 PORTC = 0b10100000;
 TRISD = 0b01011100;
 PORTD = 0b00000000;

 PWM1_Init(5000);
 PWM2_Init(5000);

 I2C1_Init(100000);
 I2C1_Start();

 I2C_LCD_Init();
 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Cmd( 0x0C );

 I2C_LCD_Out(1,1,"Lote de: 0000Kg");
 I2C_LCD_Out(2,1,"Actual:   0000Kg");

 Keypad_Init();
 ADC_Init();

 while(1){
 ingresoPeso();

 while(1){
 if(peso_ingresado != 0){
 llenado_Horno();

 if(PORTD.f4 == 1 & flg_llenado == 1){
 control_Electrodo();
 if(flg_temp_limite == 1){
 vaciado_Material();
 }

 if(PORTD.f6 == 0 & flg_fin == 1){
 PWM1_Set_Duty(0);

 PORTC.f7 = 0;
 PORTD.f5 = 0;
 flg_llenado = 0;
 flg_temp_limite = 0;
 flg_fin = 0;
 peso_ingresado = 0;
 PORTC = 0b10100000;
 break;
 }
 }
 }
 }
 }

}
