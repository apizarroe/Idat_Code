#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana08/Comunicacion03.c"
void main(){
 TXSTA = 0b00100100;
 RCSTA = 0b10010000;
 SPBRG = 25;
 TRISB.f0 = 0;
 while(1){
 if(PIR1.f5==1){
 if(RCREG == 'A'){
 PORTB.f0=1;
 }
 if(RCREG == 'a'){
 PORTB.f0=0;
 }
 PIR1.f5 = 0;
 }
 }
}
