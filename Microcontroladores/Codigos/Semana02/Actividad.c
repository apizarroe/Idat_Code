unsigned short var = 5;

void main() {
     TRISC = 0;
     PORTC = 0;
     if(var%2 == 0){
       PORTC.f0 = 1;
     } else {
       PORTC.f2 = 1;
     }
     if(var%5 == 0){
       PORTC.f1 = 1;
     }
}