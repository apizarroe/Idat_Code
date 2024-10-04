//Se requiere generar un arreglo de trama + 1
unsigned short Trama[5];
unsigned short dato1 = 0;
unsigned short dato2 = 0;
short i = 0;

void main() {
        UART1_Init(9600);
        PORTB = 0b00000000;
		Trama[0] = '$';
		Trama[3] = ';';
        
        while(1){
                dato1 = PORTB.f0 + 48;
                Trama[1] = '1';
                Trama[2] = dato1;                
                //UART1_Write_Text(Trama);
                for(i=0; i<=5; i++){
					UART1_Write(Trama[i]);
                }
                
                delay_ms(100);

                dato2 = PORTB.f1 + 48;
                Trama[1] = '2';
                Trama[2] = dato2;
				//UART1_Write_Text(Trama);
				for(i=0; i<=5; i++){
					UART1_Write(Trama[i]);
                }
                
                delay_ms(100);
        }

}