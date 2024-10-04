#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana04/Programa02.c"
void main() {
 TRISD = 0;
 OPTION_REG = 0b11101111;
 TMR0 = 0;
 while(1){
 PORTD = TMR0;
 delay_ms(100);
 }
}
