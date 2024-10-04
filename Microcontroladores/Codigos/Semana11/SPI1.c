//Se crea la variable cuenta
unsigned short cuenta;     //0 - 255

void main() {
	//Se inicializa el modulo SPI
    SPI1_Init();
    TRISD.f0 = 0;
    PORTD.f0 = 1;
    cuenta = 0;
    while(1){
         PORTD.f0 = 0;
         SPI1_Write(cuenta);
         PORTD.f0 = 1;
         cuenta ++;
         delay_ms(100);
    }
}