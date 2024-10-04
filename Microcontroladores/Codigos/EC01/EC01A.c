unsigned short cuenta = 0;
char D7SEG_1[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
char D7SEG_2[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void main() {
	ADCON1 = 0x07;
	TRISB = 0;
	TRISD = 0;
	PORTD = 0;
	PORTB.f3 = 0;
	PORTB.f4 = 0;

	while(1) {
		if(PORTA.f0 == 1){
			PORTB.f3 = 0;
			PORTB.f4 = 0;
		} else {
			if(PORTA.f4 == 1){
				PORTB.f3 = 0;
			} else {
				if((PORTA.f2 == 1) && (PORTA.f3 == 1)){
					PORTB.f3 = 1;
					cuenta++;
					PORTD = D7SEG_1[cuenta];
					if(cuenta == 9){
						cuenta = 0;
					}
                    while((PORTA.f2 == 1) && (PORTA.f3 == 1));
				}
			}

			if(PORTE.f2 == 1){
				PORTB.f4 = 0;
			} else {
				if((PORTA.f5 == 1) && (PORTE.f0 == 1)){
					PORTB.f4 = 1;
				}
			}

		}
	}
}