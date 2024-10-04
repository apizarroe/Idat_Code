#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana09/AP_USART_2.c"
void main() {
 TRISC.f5 = 0;
 PORTC.f5 = 0;
 UART1_Init(9600);
 PORTC.f5 = 1;
 UART1_Write_Text("Aldo Pizarro");
 while(UART1_Tx_Idle() == 0){
 }
 PORTC.f5 = 0;
 while(1){
 }
}
