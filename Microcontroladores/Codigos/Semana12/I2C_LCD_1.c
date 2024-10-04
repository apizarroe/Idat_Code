#include "LIB_I2C_LCD.h"

void main() {
	
	I2C1_Init(100000);
	I2C_LCD_Init();
	I2C_LCD_Cmd(_LCD_CLEAR);
	I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	I2C_LCD_Out_Cp("Hola mundo");
	while(1){}

}