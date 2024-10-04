
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;EC02.c,6 :: 		void interrupt(){
;EC02.c,7 :: 		PORTB.f2 = !PORTB.f2;
	MOVLW      4
	XORWF      PORTB+0, 1
;EC02.c,8 :: 		TMR0 = 87;
	MOVLW      87
	MOVWF      TMR0+0
;EC02.c,9 :: 		INTCON.f2 =  0;
	BCF        INTCON+0, 2
;EC02.c,10 :: 		}
L_end_interrupt:
L__interrupt14:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;EC02.c,12 :: 		void main(){
;EC02.c,14 :: 		TRISD = 0;
	CLRF       TRISD+0
;EC02.c,15 :: 		PORTD = 0;
	CLRF       PORTD+0
;EC02.c,16 :: 		ADC_Init();
	CALL       _ADC_Init+0
;EC02.c,17 :: 		PWM1_Init(4000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;EC02.c,18 :: 		PWM2_Init(4000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;EC02.c,19 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;EC02.c,20 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;EC02.c,21 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;EC02.c,23 :: 		TRISB.f2 = 0;
	BCF        TRISB+0, 2
;EC02.c,24 :: 		OPTION_REG = 0b11010111;
	MOVLW      215
	MOVWF      OPTION_REG+0
;EC02.c,25 :: 		TMR0 = 87;
	MOVLW      87
	MOVWF      TMR0+0
;EC02.c,28 :: 		while(1){
L_main0:
;EC02.c,29 :: 		if(PORTB.f0 == 1 || PORTB.f1 == 1){
	BTFSC      PORTB+0, 0
	GOTO       L__main12
	BTFSC      PORTB+0, 1
	GOTO       L__main12
	GOTO       L_main4
L__main12:
;EC02.c,30 :: 		PORTD = 0b00000101;
	MOVLW      5
	MOVWF      PORTD+0
;EC02.c,31 :: 		INTCON = 0b10100000;
	MOVLW      160
	MOVWF      INTCON+0
;EC02.c,32 :: 		} else {
	GOTO       L_main5
L_main4:
;EC02.c,33 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;EC02.c,34 :: 		INTCON = 0b00000000;
	CLRF       INTCON+0
;EC02.c,35 :: 		}
L_main5:
;EC02.c,36 :: 		if(PORTB.f7 == 1){
	BTFSS      PORTB+0, 7
	GOTO       L_main6
;EC02.c,37 :: 		if (dutty<=255){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _dutty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVF       _dutty+0, 0
	SUBLW      255
L__main16:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;EC02.c,38 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;EC02.c,39 :: 		dutty = dutty + 1;
	INCF       _dutty+0, 1
	BTFSC      STATUS+0, 2
	INCF       _dutty+1, 1
;EC02.c,40 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;EC02.c,41 :: 		}
L_main7:
;EC02.c,42 :: 		}
L_main6:
;EC02.c,43 :: 		if(PORTB.f6 == 1){
	BTFSS      PORTB+0, 6
	GOTO       L_main9
;EC02.c,44 :: 		if (dutty>=128){
	MOVLW      128
	XORWF      _dutty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      128
	SUBWF      _dutty+0, 0
L__main17:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
;EC02.c,45 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;EC02.c,46 :: 		dutty = dutty - 1;
	MOVLW      1
	SUBWF      _dutty+0, 1
	BTFSS      STATUS+0, 0
	DECF       _dutty+1, 1
;EC02.c,47 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
	NOP
;EC02.c,48 :: 		}
L_main10:
;EC02.c,49 :: 		}
L_main9:
;EC02.c,50 :: 		lectura_ADC = ADC_Get_Sample(1);
	MOVLW      1
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;EC02.c,51 :: 		valor_in = (lectura_ADC)/1024.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor_in+0
	MOVF       R0+1, 0
	MOVWF      _valor_in+1
	MOVF       R0+2, 0
	MOVWF      _valor_in+2
	MOVF       R0+3, 0
	MOVWF      _valor_in+3
;EC02.c,52 :: 		valor_out = valor_in*255.0;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _valor_out+0
	MOVF       R0+1, 0
	MOVWF      _valor_out+1
	MOVF       R0+2, 0
	MOVWF      _valor_out+2
	MOVF       R0+3, 0
	MOVWF      _valor_out+3
;EC02.c,53 :: 		PWM2_Set_Duty(valor_out);
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;EC02.c,54 :: 		}
	GOTO       L_main0
;EC02.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
