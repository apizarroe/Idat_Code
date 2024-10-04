unsigned short direccion = 0, ACK = 1;

void main() {
	I2C1_Init(100000);
	while(1){
		while(ACK != 0){
			I2C1_Start();
			ACK = I2C1_Wr(direccion);
			I2C1_Stop();
			direccion++;
			delay_ms(1);
		}
	}
}