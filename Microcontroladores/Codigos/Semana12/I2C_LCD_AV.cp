#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana12/I2C_LCD_AV.c"
#line 1 "c:/users/aldo pizarro/desktop/idat_clases/cicloiv/microcontroladores/proyectos/semana12/lib_i2c_lcd.h"
#line 40 "c:/users/aldo pizarro/desktop/idat_clases/cicloiv/microcontroladores/proyectos/semana12/lib_i2c_lcd.h"
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
#line 3 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana12/I2C_LCD_AV.c"
void main() {

 I2C1_Init(100000);
 I2C1_Start();
 I2C1_Wr(0xA0);
 I2C1_Wr(0x10);
 I2C1_Wr('A');
 I2C1_Wr('L');
 I2C1_Wr('D');
 I2C1_Wr('O');
 I2C1_Wr(' ');
 I2C1_Wr('P');
 I2C1_Wr('I');
 I2C1_Wr('Z');
 I2C1_Wr('A');
 I2C1_Wr('R');
 I2C1_Wr('R');
 I2C1_Wr('O');
 I2C1_Stop();

 I2C_LCD_Init();
 I2C_LCD_Cmd( 0x01 );
 I2C_LCD_Cmd( 0x0C );
 I2C_LCD_Out_Cp("Listo");
 while(1){}

}
