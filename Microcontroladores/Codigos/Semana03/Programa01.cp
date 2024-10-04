#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana03/Programa01.c"
unsigned short i;

void main() {
 TRISB = 0;
 PORTB = 0;
 for(i=0;i<5;i++){
 PORTB = i;
 }
}
