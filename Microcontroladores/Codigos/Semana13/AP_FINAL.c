#include "LIB_I2C_LCD.h"
unsigned int NivelMaximo, NivelMinimo,NivelActual;
char EstadoBomba = '0', txtporcentaje[4], OrdenValvula, EstadoValvula = '0';
int PorcentajeNivel;

long map(long x, long in_min, long in_max, long out_min, long out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void interrupt(){
     if(INTCON.f1 == 1){  //parada de emergencia
         //PWM1_Set_Duty(0);
         PWM1_Stop();
         PORTC.f2 = 0;
         TRISC.f2 = 1;
         while(1);
     }

}

void controlBomba(){
     if(NivelActual <= NivelMinimo){
        PWM1_Set_Duty(192);
        EstadoBomba = '1';
     }
     if(NivelActual >= NivelMaximo){
        PWM1_Set_Duty(0);
        EstadoBomba = '0';
     }
}
void controlValvula(){
          if (UART1_Data_Ready() == 1) {
             OrdenValvula = UART1_Read();
             if(OrdenValvula == '1'){
                 PORTD.f0 = 1;
                 EstadoValvula = '1';
             }
             if(OrdenValvula == '0'){
                 PORTD.f0 = 0;
                 EstadoValvula = '0';
             }
           }
}
void plantillaLCD(){
    I2C_Lcd_Out(1,3,"CONTROL DE TANQUE");
    I2C_Lcd_Out(2,1,"NIVEL ACTUAL: 000%");
    I2C_Lcd_Out(3,1,"ESTADO BOMBA:");
    I2C_Lcd_Out(4,1,"ESTADO VALVULA:");
}
void llenarDatosLCD(){
     PorcentajeNivel =  map(NivelActual, NivelMinimo, NivelMaximo, 0, 100);
     if(NivelActual < NivelMinimo){
        PorcentajeNivel = 0;
     }
     ByteToStr(PorcentajeNivel, txtporcentaje);
     I2C_Lcd_Out(2,15,txtporcentaje);
     
     
    if(EstadoBomba == '1'){
        I2C_Lcd_Out(3,15," ON");
    }
    if(EstadoBomba == '0'){
        I2C_Lcd_Out(3,15,"OFF");
    }
    if(EstadoValvula == '1'){
        I2C_Lcd_Out(4,17," ON");
    }
    if(EstadoValvula == '0'){
        I2C_Lcd_Out(4,17,"OFF");
    }


}

void enviarDatosUART(){
// Escriba el programa de la actividad virtual

}

void main() {
    TRISD.f0 = 0;
    PORTD.f0 = 0;
    ADC_Init();
    PWM1_Init(5000);
    PWM1_Start();
    INTCON = 0b10010000;
    I2C1_Init(100000);
    I2C_LCD_Init();
    I2C_LCD_Cmd(_LCD_CLEAR);
    I2C_LCD_Cmd(_LCD_CURSOR_OFF);
    UART1_Init(9600);
    plantillaLCD();
    
    while(1){
          NivelMaximo = ADC_Get_Sample(0);
          NivelMinimo = ADC_Get_Sample(1);
          NivelActual = ADC_Get_Sample(2);
          controlBomba();
          llenarDatosLCD();
          controlValvula();
          enviarDatosUART();


    }
}