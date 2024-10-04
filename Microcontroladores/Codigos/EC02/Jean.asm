
_main:

;Jean.c,3 :: 		void main() {
;Jean.c,4 :: 		TRISB.F0 = 1;
	BSF        TRISB+0, 0
;Jean.c,5 :: 		TRISB.F1 = 1;
	BSF        TRISB+0, 1
;Jean.c,6 :: 		TRISD.F0 = 0;
	BCF        TRISD+0, 0
;Jean.c,7 :: 		TRISD.F1 = 0;
	BCF        TRISD+0, 1
;Jean.c,8 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Jean.c,9 :: 		PWM1_Init(4000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Jean.c,10 :: 		PWM2_Init(4000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Jean.c,11 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Jean.c,12 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Jean.c,13 :: 		PORTD = 0b00000001;
	MOVLW      1
	MOVWF      PORTD+0
;Jean.c,15 :: 		while (1) {
L_main0:
;Jean.c,17 :: 		if (PORTB.F6) {
	BTFSS      PORTB+0, 6
	GOTO       L_main2
;Jean.c,18 :: 		for ( i = e; i <= 255; i++) {
	MOVF       _e+0, 0
	MOVWF      _i+0
L_main3:
	MOVF       _i+0, 0
	SUBLW      255
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;Jean.c,19 :: 		PWM2_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Jean.c,20 :: 		delay_ms(38);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;Jean.c,21 :: 		e=i;
	MOVF       _i+0, 0
	MOVWF      _e+0
;Jean.c,22 :: 		if (i==255) {
	MOVF       _i+0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;Jean.c,23 :: 		break;
	GOTO       L_main4
;Jean.c,24 :: 		}
L_main7:
;Jean.c,25 :: 		if (!PORTB.F6) {
	BTFSC      PORTB+0, 6
	GOTO       L_main8
;Jean.c,26 :: 		break;
	GOTO       L_main4
;Jean.c,27 :: 		}
L_main8:
;Jean.c,18 :: 		for ( i = e; i <= 255; i++) {
	INCF       _i+0, 1
;Jean.c,28 :: 		}
	GOTO       L_main3
L_main4:
;Jean.c,29 :: 		}
L_main2:
;Jean.c,30 :: 		if (PORTB.F7) {
	BTFSS      PORTB+0, 7
	GOTO       L_main9
;Jean.c,31 :: 		for ( e = i; e >= 0; e--) {
	MOVF       _i+0, 0
	MOVWF      _e+0
L_main10:
	MOVLW      0
	SUBWF      _e+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main11
;Jean.c,32 :: 		PWM2_Set_Duty(e);
	MOVF       _e+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;Jean.c,33 :: 		delay_ms(38);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;Jean.c,34 :: 		i = e;
	MOVF       _e+0, 0
	MOVWF      _i+0
;Jean.c,35 :: 		if (e==0) {
	MOVF       _e+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;Jean.c,36 :: 		break;
	GOTO       L_main11
;Jean.c,37 :: 		}
L_main14:
;Jean.c,38 :: 		if (!PORTB.F7) {
	BTFSC      PORTB+0, 7
	GOTO       L_main15
;Jean.c,39 :: 		break;
	GOTO       L_main11
;Jean.c,40 :: 		}
L_main15:
;Jean.c,31 :: 		for ( e = i; e >= 0; e--) {
	DECF       _e+0, 1
;Jean.c,41 :: 		}
	GOTO       L_main10
L_main11:
;Jean.c,42 :: 		}
L_main9:
;Jean.c,44 :: 		lectura_ADC = ADC_Get_Sample(7);
	MOVLW      7
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;Jean.c,45 :: 		PWM1_Set_Duty(lectura_ADC/4);
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Jean.c,46 :: 		}
	GOTO       L_main0
;Jean.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
