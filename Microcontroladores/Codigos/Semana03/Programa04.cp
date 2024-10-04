#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana03/Programa04.c"
unsigned short entrada = 0;

void main() {
 ADCON1 = 0x07;
 TRISB.f3 = 0;
 while(1){
 entrada = PORTA.f1;
 PORTB.f3 = entrada;
 }
}
