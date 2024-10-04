int D7SEG[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
unsigned int lectura_ADC;
float voltaje;
unsigned short entero;
unsigned short decimal;


void main(){
	TRISB = 0;
	TRISD = 0;
	PORTB = 0;
	PORTD = 0;
	ADC_Init();

	while(1){
		lectura_ADC = ADC_Get_Sample(0);
		voltaje = (lectura_ADC * 5.0)/1024.0;
		entero = (int)voltaje % 10;
		decimal = (int)(voltaje * 10) % 10;
		PORTB = D7SEG[entero];
		PORTD = D7SEG[decimal];
	}

}