char caracter;
char txt[4];
int D7SEG[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
int entero;
float voltaje;
unsigned int lectura_ADC;

void main(){
        TXSTA = 0b00100100;
        RCSTA = 0b10010000;
        SPBRG = 25;
        TRISB = 0;
        PORTB = 0;
        ADC_Init();

        while(1){
                if(PIR1.f5==1){
                        TXREG = RCREG;
                        caracter = RCREG;
                        if((caracter >=76 && caracter<=83)||(caracter >=108 && caracter<=115)){
							if(caracter == 76){PORTB.f0 = 1;}
							if(caracter == 77){PORTB.f1 = 1;}
							if(caracter == 78){PORTB.f2 = 1;}
							if(caracter == 79){PORTB.f3 = 1;}
							if(caracter == 80){PORTB.f4 = 1;}
							if(caracter == 81){PORTB.f5 = 1;}
							if(caracter == 82){PORTB.f6 = 1;}
							if(caracter == 83){PORTB.f7 = 1;}
							
							if(caracter == 108){PORTB.f0 = 0;}
							if(caracter == 109){PORTB.f1 = 0;}
							if(caracter == 110){PORTB.f2 = 0;}
							if(caracter == 111){PORTB.f3 = 0;}
							if(caracter == 112){PORTB.f4 = 0;}
							if(caracter == 113){PORTB.f5 = 0;}
							if(caracter == 114){PORTB.f6 = 0;}
							if(caracter == 115){PORTB.f7 = 0;}
                        }
                        PIR1.f5 = 0;
                }

				lectura_ADC = ADC_Get_Sample(3);
				txt[0] = ((lectura_ADC/1000)%10) + 48;
				txt[1] = ((lectura_ADC/100)%10) + 48;
				txt[2] = ((lectura_ADC/10)%10) + 48;
				txt[3] = (lectura_ADC%10) + 48;

				TXREG = txt[0];
				while(TXSTA.f1 == 0);
				TXREG = txt[1];
				while(TXSTA.f1 == 0);
				TXREG = txt[2];
				while(TXSTA.f1 == 0);
				TXREG = txt[3];
				while(TXSTA.f1 == 0);
				TXREG = 10;
				while(TXSTA.f1 == 0);
				TXREG = 13;
				while(TXSTA.f1 == 0);

                delay_ms(1000);
        }
}