void main() {
        TRISC.f5 = 0;
        PORTC.f5 = 0;
        UART1_Init(9600);
        PORTC.f5 = 1;
        UART1_Write_Text("Aldo Pizarro");
        while(UART1_Tx_Idle() == 0){
        } //or while(UART1_Tx_Idle() == 0);
        PORTC.f5 = 0;
        while(1){
        }
}