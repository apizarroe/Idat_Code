#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana04/Programa03.c"
void interrupt(){
 PORTB.f0 = !PORTB.f0;
 TMR0 = 87;
 INTCON.f2 = 0;
}

void main(){
 TRISB.f0 = 0;
 OPTION_REG = 0b11010111;
 INTCON = 0b10100000;
 TMR0 = 87;
}
