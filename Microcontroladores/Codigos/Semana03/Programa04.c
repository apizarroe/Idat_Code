unsigned short entrada = 0;

void main() {
     ADCON1 = 0x07;
     TRISB.f3 = 0;
     while(1){
        entrada = PORTA.f1;
        PORTB.f3 = entrada;
     }
}