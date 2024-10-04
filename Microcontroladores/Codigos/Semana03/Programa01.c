unsigned short i;

void main() {
     TRISB = 0;
     PORTB = 0;
     for(i=0;i<5;i++){
           PORTB = i;
     }
}