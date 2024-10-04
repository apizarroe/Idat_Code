#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana08/Comunicacion02.c"
void main(){
 TXSTA = 0b00100100;
 RCSTA = 0b10010000;
 SPBRG = 25;
 while(1){
 if(PIR1.f5==1){
 TXREG = RCREG;
 PIR1.f5 = 0;
 }
 }
}
