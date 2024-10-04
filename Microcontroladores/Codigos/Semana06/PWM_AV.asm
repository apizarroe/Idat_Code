
_main:

;PWM_AV.c,5 :: 		void main(){
;PWM_AV.c,6 :: 		TRISD.f0 = 0;
	BCF        TRISD+0, 0
;PWM_AV.c,7 :: 		TRISD.f1 = 0;
	BCF        TRISD+0, 1
;PWM_AV.c,8 :: 		ADC_Init();
	CALL       _ADC_Init+0
;PWM_AV.c,9 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM_AV.c,10 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM_AV.c,11 :: 		PORTD = 0b00000010;
	MOVLW      2
	MOVWF      PORTD+0
;PWM_AV.c,13 :: 		while(1){
L_main0:
;PWM_AV.c,14 :: 		lectura_ADC = ADC_Get_Sample(6);
	MOVLW      6
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;PWM_AV.c,15 :: 		valor_in = (lectura_ADC)/1024.0;
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
;PWM_AV.c,16 :: 		valor_out = valor_in*255.0;
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
;PWM_AV.c,17 :: 		PWM1_Set_Duty(valor_out);
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_AV.c,18 :: 		}
	GOTO       L_main0
;PWM_AV.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
