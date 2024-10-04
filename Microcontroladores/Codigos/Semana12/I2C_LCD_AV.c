#include "LIB_I2C_LCD.h"

void main() {

	I2C1_Init(100000);
	I2C1_Start();
	I2C1_Wr(0xA0); //Memoria: 1010000 0
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
	I2C_LCD_Cmd(_LCD_CLEAR);
	I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	I2C_LCD_Out_Cp("Listo");
	while(1){}

}