unsigned int lectura_ADC;


void main(){
	ADC_Init();
	TRISB = 0;
	TRISD.f4 = 0;
	TRISD.f5 = 0;

	while(1){
		lectura_ADC = ADC_Get_Sample(3);
		PORTB = lectura_ADC;

		//11 1111 1111
		PORTD = (lectura_ADC >> 4);
		delay_ms(100);
	}

}