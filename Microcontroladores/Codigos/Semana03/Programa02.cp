#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana03/Programa02.c"
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
