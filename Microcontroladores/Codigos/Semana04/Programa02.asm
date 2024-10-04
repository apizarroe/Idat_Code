
_main:

;Programa02.c,1 :: 		void main() {
;Programa02.c,2 :: 		TRISD = 0;
	CLRF       TRISD+0
;Programa02.c,3 :: 		OPTION_REG = 0b11101111;
	MOVLW      239
	MOVWF      OPTION_REG+0
;Programa02.c,4 :: 		TMR0 = 0;
	CLRF       TMR0+0
;Programa02.c,5 :: 		while(1){
L_main0:
;Programa02.c,6 :: 		PORTD = TMR0;
	MOVF       TMR0+0, 0
	MOVWF      PORTD+0
;Programa02.c,7 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Programa02.c,8 :: 		}
	GOTO       L_main0
;Programa02.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
