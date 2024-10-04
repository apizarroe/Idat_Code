unsigned short valor;

void main() {
     TRISC = 0b11111110;
     TRISB = 0;
     PORTB = 0;
     while(1){
              if(PORTC.f1 == 0){
                          PORTB++;
                          while(PORTC.f1 == 0);
              }
     }
}