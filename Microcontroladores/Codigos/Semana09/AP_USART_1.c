int D7SEG[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

unsigned short dato;

void main() {
	TXSTA = 0b00100100;
	RCSTA = 0b10010000;
	SPBRG = 25;
	TRISD = 0x00;
	PORTD = 0x00;
	while(1){
		while(TXSTA.f1 == 0);
		TXREG = PORTB;
		if(PIR1.f5==1){
			dato = RCREG;
			PIR1.f5==0;
		}
		
		PORTD = D7SEG[dato];
	}	
}