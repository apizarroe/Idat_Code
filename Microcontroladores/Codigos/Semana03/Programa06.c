unsigned short cuenta = 0;
char D7SEG[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void main() {
	TRISD = 0;
	PORTD = 0;

	while(1){
        if(PORTB.f7 == 0){
            cuenta++;
            if(cuenta == PORTB){
               cuenta = 0;
            }
            PORTD = D7SEG[cuenta];
            delay_ms(600);
        }
	}
}