sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D7 at RD7_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D4 at RD4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D7_Direction at TRISD7_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D4_Direction at TRISD4_bit;

unsigned short direccion = 0;
unsigned short Trama[4];
unsigned short dato, i;
void main() {
    UART1_Init(9600);
    Lcd_Init();
    Lcd_Cmd(_LCD_CLEAR);
    Lcd_Cmd(_LCD_CURSOR_OFF);
    TRISC.f5 = 0;
    PORTC.f5 = 0;
	//Registro de Seleccion de Resistencia Pull-Up
    OPTION_REG.f7 = 0;
	//Para la direccion solo se considera los 3 ultimos bits
	//Se convierte en ASCII
    direccion = (PORTB & 0b00000111) + 48;

    Lcd_Out(1, 3, "Direccion: ");
    Lcd_Chr_Cp(direccion);

    while(1){
	   //Se verifica si el Registro de datos esta en '1'
       if (UART1_Data_Ready() == 1) {
		  //Se lee bit x bit
          dato = UART1_Read();
          if(dato == '$'){
              Trama[0] = dato;
              for(i=1; i<=3;i++){
				  //Mientras no llegue un dato esperamos
                  while(UART1_Data_Ready() == 0){}
					   //Se lee el resto de la trama
                       Trama[i] = UART1_Read();
                  }
          }
       }
       // ya tenemos la trama
       if(Trama[1] == direccion){
           Lcd_Chr(2, 1, Trama[2]);
       }
    }
}