unsigned int dato;
unsigned short DipSwitch;

void enviar_DAC(unsigned int valor_enviar){
    unsigned short temporal;
    temporal = (valor_enviar >> 8) & 0x0F;
    temporal |= 0x30;
    SPI1_Write(temporal);
    temporal = valor_enviar;
    SPI1_Write(temporal);
}

void main() {
    SPI1_Init();
    TRISD = 0;
    PORTD = 0xFF;
	while(1){
		DipSwitch = (PORTB >> 6);
		//ZYABCDEF >> 000000ZY
		dato = (PORTB & 0x3F) * 64;
		//ZYABCDEF & 00111111 * 1000000 = ABCDEF000000
		switch(DipSwitch){
			case 0:
			PORTD.f0 = 0;
			enviar_DAC(dato);
			PORTD.f0 = 1;
			break;
			case 1:
			PORTD.f1 = 0;
			enviar_DAC(dato);
			PORTD.f1 = 1;
			break;
			case 2:
			PORTD.f2 = 0;
			enviar_DAC(dato);
			PORTD.f2 = 1;
			break;
		}
	}
}