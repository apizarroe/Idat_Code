#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana05/ProgramaActividadVirt.c"
char D7SEG[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x67};
unsigned short unidad;
unsigned short decena;
unsigned int lectura_ADC;
float voltaje;

void main() {
 TRISB = 0;
 TRISD = 0;
 PORTB = 0;
 PORTD = 0;
 ADC_Init();
 while(1){
 lectura_ADC = ADC_Get_Sample(0);
 voltaje = (lectura_ADC*30.0)/1024.0;
 unidad = (int)voltaje % 10;
 decena = (int)(voltaje / 10) % 10;
 PORTB = D7SEG[decena];
 PORTD = D7SEG[unidad];
 }

}
