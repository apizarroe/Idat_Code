unsigned short valorPuerto;

void main() {
	TRISB.f0 = 0;
	while(1){
		valorPuerto = PORTD;
		vdelay_ms(valorPuerto);
		PORTB.f0 = !PORTB.f0;
	}
}