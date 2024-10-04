void main() {
	I2C1_Init(100000);
	I2C1_Start();
	I2C1_Wr(0xA0); //Memoria: 1010000 0
	I2C1_Wr(0x20);
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
	
}