#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana11/SPI1.c"
unsigned short cuenta;

void main() {

 SPI1_Init();
 TRISD.f0 = 0;
 PORTD.f0 = 1;
 cuenta = 0;
 while(1){
 PORTD.f0 = 0;
 SPI1_Write(cuenta);
 PORTD.f0 = 1;
 cuenta ++;
 delay_ms(100);
 }
}
