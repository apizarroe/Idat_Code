#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/EC02/Jean.c"
unsigned int lectura_ADC;
char i, e;
void main() {
 TRISB.F0 = 1;
 TRISB.F1 = 1;
 TRISD.F0 = 0;
 TRISD.F1 = 0;
 ADC_Init();
 PWM1_Init(4000);
 PWM2_Init(4000);
 PWM1_Start();
 PWM2_Start();
 PORTD = 0b00000001;

 while (1) {

 if (PORTB.F6) {
 for ( i = e; i <= 255; i++) {
 PWM2_Set_Duty(i);
 delay_ms(38);
 e=i;
 if (i==255) {
 break;
 }
 if (!PORTB.F6) {
 break;
 }
 }
 }
 if (PORTB.F7) {
 for ( e = i; e >= 0; e--) {
 PWM2_Set_Duty(e);
 delay_ms(38);
 i = e;
 if (e==0) {
 break;
 }
 if (!PORTB.F7) {
 break;
 }
 }
 }

 lectura_ADC = ADC_Get_Sample(7);
 PWM1_Set_Duty(lectura_ADC/4);
 }
}
