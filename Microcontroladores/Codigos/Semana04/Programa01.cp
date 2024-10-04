#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana04/Programa01.c"
void interrupt(){
 PORTC.f0 = !PORTC.f0;
 INTCON.f1 = 0;
}

void main() {
 TRISC.f0 = 0;
 PORTC.f1 = 0;
 INTCON = 0b10010000;
 OPTION_REG = 0b00111111;
 while(1){

 }
}
