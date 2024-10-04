int dutty = 200;
unsigned int lectura_ADC;
float valor_in;
float valor_out;

void interrupt(){
	PORTB.f2 = !PORTB.f2;
	TMR0 = 87;
	INTCON.f2 =  0;
}

void main(){

	TRISD = 0;
	PORTD = 0;
	ADC_Init();
 	PWM1_Init(4000);
	PWM2_Init(4000);
	PWM1_Start();
	PWM2_Start();
	PWM1_Set_Duty(dutty);

    TRISB.f2 = 0;
	OPTION_REG = 0b11010111;
	TMR0 = 87;

	
	while(1){
		if(PORTB.f0 == 1 || PORTB.f1 == 1){
			PORTD = 0b00000101;
			INTCON = 0b10100000;
		} else {
			PORTD = 0b00000000;
			INTCON = 0b00000000;
		}
		if(PORTB.f7 == 1){
			if (dutty<=255){
				PWM1_Set_Duty(dutty);
				dutty = dutty + 1;
				delay_ms(10);
			}
		}
		if(PORTB.f6 == 1){
			if (dutty>=128){
				PWM1_Set_Duty(dutty);
				dutty = dutty - 1;
				delay_ms(10);
			}
		}
        lectura_ADC = ADC_Get_Sample(1);
		valor_in = (lectura_ADC)/1024.0;
		valor_out = valor_in*255.0;
		PWM2_Set_Duty(valor_out);
	}
}