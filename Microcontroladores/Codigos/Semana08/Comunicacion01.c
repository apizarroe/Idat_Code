void main() {
	TXSTA = 0b00100100;
	RCSTA = 0b10010000;
	SPBRG = 25;
	TXREG = 'A';
	while(TXSTA.f1==0);
	TXREG = 'L';
	while(TXSTA.f1==0);
	TXREG = 'D';
	while(TXSTA.f1==0);
	TXREG = 'O';
	while(TXSTA.f1==0);
	TXREG = ' ';
	while(TXSTA.f1==0);
	TXREG = 'P';
	while(TXSTA.f1==0);
	TXREG = 'I';
	while(TXSTA.f1==0);
	TXREG = 'Z';
	while(TXSTA.f1==0);
	TXREG = 'A';
	while(TXSTA.f1==0);
	TXREG = 'R';
	while(TXSTA.f1==0);
	TXREG = 'R';
	while(TXSTA.f1==0);
	TXREG = 'O';
	while(1){
	}
}