
_main:

;PWM01.c,1 :: 		void main(){
;PWM01.c,2 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM01.c,3 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM01.c,4 :: 		PWM1_Set_Duty(161);
	MOVLW      161
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM01.c,5 :: 		while(1){
L_main0:
;PWM01.c,6 :: 		}
	GOTO       L_main0
;PWM01.c,7 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
