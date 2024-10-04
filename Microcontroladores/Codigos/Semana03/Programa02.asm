
_main:

;Programa02.c,3 :: 		void main() {
;Programa02.c,4 :: 		TRISC = 0b11111110;
	MOVLW      254
	MOVWF      TRISC+0
;Programa02.c,5 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa02.c,6 :: 		PORTB = 0;
	CLRF       PORTB+0
;Programa02.c,7 :: 		while(1){
L_main0:
;Programa02.c,8 :: 		if(PORTC.f1 == 0){
	BTFSC      PORTC+0, 1
	GOTO       L_main2
;Programa02.c,9 :: 		PORTB++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Programa02.c,10 :: 		while(PORTC.f1 == 0);
L_main3:
	BTFSC      PORTC+0, 1
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;Programa02.c,11 :: 		}
L_main2:
;Programa02.c,12 :: 		}
	GOTO       L_main0
;Programa02.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
