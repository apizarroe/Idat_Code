#include "LIB_I2C_LCD.h"

unsigned short kp, flg_llenado=0, flg_fin=0, flg_temp_limite=0;
unsigned int peso_ingresado = 0, peso_ADC, lectura_peso_ADC, lectura_electrodo_ADC, lectura_temp_ADC;
float peso_carbon, peso_silicio;
int dutty = 128, i = 0, miles = 0, cent = 0, dec = 0, und = 0, pot_elect = 0;
char cadena[4], txtpeso[4]; 
char keypadPort at PORTB;
char test;

void controlVelocidadFaja(){
	PWM1_Start();
	PWM1_Set_Duty(dutty);
	if(PORTD.f2 == 1){
		if (dutty<255){
			PWM1_Set_Duty(dutty);
			dutty = dutty + 1;
			delay_ms(1);
		}
	}
	if(PORTD.f3 == 1){
		if (dutty>0){
			PWM1_Set_Duty(dutty);
			dutty = dutty - 1;
			delay_ms(1);
		}
	}
}

void ingresoPeso(){
	do
		kp = Keypad_Key_Click();
	while (!kp);
	
	if(kp == 4){
		for(i=1; i<5; i++){
			do
				kp = Keypad_Key_Click();
			while (!kp);
			   
			switch (kp) {
				case  1: kp = '7'; break; // 1
				case  2: kp = '4'; break; // 2
				case  3: kp = '1'; break; // 3
				case  5: kp = '8'; break; // 4
				case  6: kp = '5'; break; // 5
				case  7: kp = '2'; break; // 6
				case  8: kp = '0'; break; // B
				case  9: kp = '9'; break; // 7
				case 10: kp = '6'; break; // 8
				case 11: kp = '3'; break; // 9
			}
			I2C_Lcd_Chr(1, i+9, kp);
			cadena[i-1] = kp;
			if(i == 1){
				miles = kp-48;
			}
			if(i == 2){
				cent = kp-48;
			}
			if(i == 3){
				dec = kp-48;
			}
			if(i == 4){
				und = kp-48;
			}
		}
		peso_ingresado = miles*1000+cent*100+dec*10+und;		  
		if(peso_ingresado <= 500 | peso_ingresado >= 2000){
			I2C_LCD_Out(1,1,"Lote de: 0000Kg");
			peso_ingresado = 0;
		}
		peso_silicio = (peso_ingresado/4)*3;
		peso_carbon = (peso_ingresado/4)*1;
	}
}

void llenado_Horno(){
	if(flg_llenado == 0){
		lectura_peso_ADC = ADC_Get_Sample(1);
		peso_ADC = lectura_peso_ADC * 2;
		IntToStr(peso_ADC, txtpeso);
		I2C_Lcd_Out(2,9,txtpeso);
		if(peso_ADC < peso_silicio){
			PORTD.f0=1;
		} else {
			PORTD.f0=0;
		}
		if(peso_ADC > peso_silicio & peso_ADC < peso_ingresado){
			PORTD.f1=1;
		} else {
			PORTD.f1=0;
		}
		if(peso_ADC > peso_ingresado){
		flg_llenado = 1;
		}
	}
}

void control_Electrodo(){
	lectura_electrodo_ADC = ADC_Get_Sample(0);
	pot_elect = (lectura_electrodo_ADC/1024.0)*255.0;
	PWM2_Start();
	PWM2_Set_Duty(pot_elect);
	lectura_temp_ADC = ADC_Get_Sample(2);
	if(lectura_temp_ADC >= 750){
		flg_temp_limite = 1;
	}
}

void vaciado_Material(){
	PWM2_Set_Duty(0);
	//PWM2_Stop(); //Intente hacer Stop pero no detiene
	PORTC.f5 = 0;
	PORTD.f5 = 1;
	controlVelocidadFaja();
	//Se debe activar el sensor inferior para levantar este flag
	if(PORTD.f6 == 1){
		flg_fin = 1;
	}
}

void main() {
	
	TRISC = 0b00000000;
	PORTC = 0b10100000;
	TRISD = 0b01011100;
	PORTD = 0b00000000;
	
 	PWM1_Init(5000);	
	PWM2_Init(5000);
	
	I2C1_Init(100000);
	I2C1_Start();
	
	I2C_LCD_Init();
	I2C_LCD_Cmd(_LCD_CLEAR);
	I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	
	I2C_LCD_Out(1,1,"Lote de: 0000Kg");
	I2C_LCD_Out(2,1,"Actual:   0000Kg");

	Keypad_Init();
	ADC_Init();
	
	while(1){
		ingresoPeso();
		
		while(1){
			if(peso_ingresado != 0){
				llenado_Horno();
				
				if(PORTD.f4 == 1 & flg_llenado == 1){
					control_Electrodo();
					if(flg_temp_limite == 1){
						vaciado_Material();
					}
					//Cuando se desactiva el sensor y con el flag levantado se apaga todo
					if(PORTD.f6 == 0 & flg_fin == 1){
						PWM1_Set_Duty(0);
						//PWM1_Stop(); //Intente hacer Stop pero no detiene
						PORTC.f7 = 0;
						PORTD.f5 = 0;
						flg_llenado = 0;
						flg_temp_limite = 0;
						flg_fin = 0;
						peso_ingresado = 0;
						PORTC = 0b10100000;
						break;
					}
				}
			}
		}
	}
	
}