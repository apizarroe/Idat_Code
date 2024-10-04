
_main:

;PWM03.c,1 :: 		void main(){
;PWM03.c,2 :: 		TRISD.f0 = 0;
	BCF        TRISD+0, 0
;PWM03.c,3 :: 		TRISD.f1 = 0;
	BCF        TRISD+0, 1
;PWM03.c,4 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM03.c,5 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM03.c,6 :: 		PORTD = 0b00000010;
	MOVLW      2
	MOVWF      PORTD+0
;PWM03.c,7 :: 		PWM1_Set_Duty(128);
	MOVLW      128
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM03.c,8 :: 		while(1){
L_main0:
;PWM03.c,9 :: 		}
	GOTO       L_main0
;PWM03.c,10 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
