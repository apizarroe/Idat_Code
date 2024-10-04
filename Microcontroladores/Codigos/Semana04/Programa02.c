void main() {
     TRISD = 0;
	 OPTION_REG = 0b11101111;
	 TMR0 = 0;
	 while(1){
		PORTD = TMR0;
		delay_ms(100);
	 }
}
