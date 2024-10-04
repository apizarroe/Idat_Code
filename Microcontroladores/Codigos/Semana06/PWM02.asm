
_main:

;PWM02.c,2 :: 		void main(){
;PWM02.c,3 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM02.c,4 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM02.c,5 :: 		while(1){
L_main0:
;PWM02.c,6 :: 		for (i=0;i<=255;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       _i+0, 0
	SUBLW      255
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;PWM02.c,7 :: 		PWM1_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM02.c,8 :: 		delay_ms(20);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;PWM02.c,6 :: 		for (i=0;i<=255;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;PWM02.c,9 :: 		}
	GOTO       L_main2
L_main3:
;PWM02.c,10 :: 		for (i=255;i>=0;i--){
	MOVLW      255
	MOVWF      _i+0
	CLRF       _i+1
L_main6:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      0
	SUBWF      _i+0, 0
L__main12:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;PWM02.c,11 :: 		PWM1_Set_Duty(i);
	MOVF       _i+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM02.c,12 :: 		delay_ms(20);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;PWM02.c,10 :: 		for (i=255;i>=0;i--){
	MOVLW      1
	SUBWF      _i+0, 1
	BTFSS      STATUS+0, 0
	DECF       _i+1, 1
;PWM02.c,13 :: 		}
	GOTO       L_main6
L_main7:
;PWM02.c,14 :: 		}
	GOTO       L_main0
;PWM02.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
