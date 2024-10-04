#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana11/SPI2.c"
unsigned int cuenta;

void enviar_DAC(unsigned int valor_enviar){
 unsigned short temporal;
 temporal = (valor_enviar >> 8) & 0x0F;
 temporal |= 0x30;
 SPI1_Write(temporal);
 temporal = valor_enviar;
 SPI1_Write(temporal);
}

void main() {
 SPI1_Init();
 TRISD.f0 = 0;
 PORTD.f0 = 1;
 cuenta = 0;
 while(1){
 PORTD.f0 = 0;
 enviar_DAC(cuenta);
 PORTD.f0 = 1;
 cuenta ++;
 if(cuenta > 4095){
 cuenta = 0;
 }

 }
}
