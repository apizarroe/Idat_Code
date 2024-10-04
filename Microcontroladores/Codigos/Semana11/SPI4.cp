#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana11/SPI4.c"
unsigned int dato;
unsigned short DipSwitch;

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
 TRISD = 0;
 PORTD.f0 = 0;
 enviar_DAC(410);
 PORTD.f0 = 1;
 PORTD.f1 = 0;
 enviar_DAC(820);
 PORTD.f1 = 1;
 PORTD.f2 = 0;
 enviar_DAC(1229);
 PORTD.f2 = 1;
 PORTD.f3 = 0;
 enviar_DAC(1639);
 PORTD.f3 = 1;
 PORTD.f4 = 0;
 enviar_DAC(2048);
 PORTD.f4 = 1;
}
