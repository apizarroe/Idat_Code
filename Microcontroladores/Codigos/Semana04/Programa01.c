void interrupt(){
	PORTC.f0 = !PORTC.f0;
	INTCON.f1 =  0;
}

void main() {
     TRISC.f0 = 0;
     PORTC.f1 = 0;
     INTCON = 0b10010000;
	 OPTION_REG = 0b00111111;
	 while(1){
		//NADA
	 }
}