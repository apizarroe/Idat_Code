#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana06/PWM_AV.c"
unsigned int lectura_ADC;
float valor_in;
float valor_out;

void main(){
 TRISD.f0 = 0;
 TRISD.f1 = 0;
 ADC_Init();
 PWM1_Init(5000);
 PWM1_Start();
 PORTD = 0b00000010;

 while(1){
 lectura_ADC = ADC_Get_Sample(6);
 valor_in = (lectura_ADC)/1024.0;
 valor_out = valor_in*255.0;
 PWM1_Set_Duty(valor_out);
 }

}
