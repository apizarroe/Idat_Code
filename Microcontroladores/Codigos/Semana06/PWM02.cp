#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana06/PWM02.c"
int i;
void main(){
 PWM1_Init(5000);
 PWM1_Start();
 while(1){
 for (i=0;i<=255;i++){
 PWM1_Set_Duty(i);
 delay_ms(20);
 }
 for (i=255;i>=0;i--){
 PWM1_Set_Duty(i);
 delay_ms(20);
 }
 }
}
