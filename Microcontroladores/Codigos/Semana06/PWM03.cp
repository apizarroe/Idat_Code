#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana06/PWM03.c"
void main(){
 TRISD.f0 = 0;
 TRISD.f1 = 0;
 PWM1_Init(5000);
 PWM1_Start();
 PORTD = 0b00000010;
 PWM1_Set_Duty(128);
 while(1){
 }
}
