#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/EC01/EC01.c"
unsigned short cuenta1 = 0;
unsigned short cuenta2 = 0;
char D7SEG_1[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};

void main() {
 ADCON1 = 0x07;
 TRISB = 0;
 TRISC = 0;
 TRISD = 0;
 PORTC = 0;
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
 if(PORTB.f3 == 0){
 PORTB.f3 = 1;
 cuenta1++;
 PORTD = D7SEG_1[cuenta1];
 if(cuenta1 == 9){
 cuenta1 = 0;
 }
 while((PORTA.f2 == 1) && (PORTA.f3 == 1));
 }
 }
 }

 if(PORTE.f2 == 1){
 PORTB.f4 = 0;
 } else {
 if((PORTA.f5 == 1) && (PORTE.f0 == 1)){
 if(PORTB.f4 == 0){
 PORTB.f4 = 1;
 cuenta2++;
 PORTC = D7SEG_1[cuenta2];
 if(cuenta2 == 9){
 cuenta2 = 0;
 }
 while((PORTA.f5 == 1) && (PORTE.f0 == 1));
 }
 }
 }
 }
 }
}
