unsigned int cuenta;

void enviar_DAC(unsigned int valor_enviar){
    unsigned short temporal;
	//DESDE: 000000000000
	//HASTA: 111111111111
    temporal = (valor_enviar >> 8) & 0x0F;
	//0000ABCDABCDABCD >> 0000ABCD & 00001111 = 0000ABCD
    temporal |= 0x30;
	//0000ABCD + 00110000 = 0011ABCD
	
	//Se remite los 8 bits delanteros
    SPI1_Write(temporal);
    temporal = valor_enviar;
	//Se remite los 8 bits posteriores
    SPI1_Write(temporal);
}

void main() {
    SPI1_Init();
    TRISD.f0 = 0;
    PORTD.f0 = 1;
    cuenta = 0;
    while(1){
         PORTD.f0 = 0;
         enviar_DAC(cuenta);
         PORTD.f0 = 1;
         cuenta ++;
         if(cuenta > 4095){
            cuenta = 0;
         }

    }
}