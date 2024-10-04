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
        ADC_Init();
        
        while(1){
                if(PIR1.f5==1){
                        TXREG = RCREG;
                        caracter = RCREG;
                        if(caracter >=48 && caracter<=57){
                                entero = caracter - 48;
                                PORTB = D7SEG[entero];
                        }
                        PIR1.f5 = 0;
                }
                
				lectura_ADC = ADC_Get_Sample(0);
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
				
                delay_ms(500);
        }
}