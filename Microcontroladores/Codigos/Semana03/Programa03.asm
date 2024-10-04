
_main:

;Programa03.c,3 :: 		void main() {
;Programa03.c,4 :: 		TRISC = 0b11111110;
	MOVLW      254
	MOVWF      TRISC+0
;Programa03.c,5 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa03.c,6 :: 		PORTB = 0;
	CLRF       PORTB+0
;Programa03.c,7 :: 		while(1){
L_main0:
;Programa03.c,8 :: 		if(PORTC.f1 == 0){
	BTFSC      PORTC+0, 1
	GOTO       L_main2
;Programa03.c,9 :: 		PORTB.f0 = 1;
	BSF        PORTB+0, 0
;Programa03.c,10 :: 		while(PORTC.f1 == 0);
L_main3:
	BTFSC      PORTC+0, 1
	GOTO       L_main4
	GOTO       L_main3
L_main4:
;Programa03.c,11 :: 		}
L_main2:
;Programa03.c,12 :: 		if(PORTC.f2 == 0){
	BTFSC      PORTC+0, 2
	GOTO       L_main5
;Programa03.c,13 :: 		PORTB.f0 = 0;
	BCF        PORTB+0, 0
;Programa03.c,14 :: 		while(PORTC.f1 == 0);
L_main6:
	BTFSC      PORTC+0, 1
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;Programa03.c,15 :: 		}
L_main5:
;Programa03.c,16 :: 		}
	GOTO       L_main0
;Programa03.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
