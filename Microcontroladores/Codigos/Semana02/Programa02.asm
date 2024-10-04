
_main:

;Programa02.c,2 :: 		void main() {
;Programa02.c,3 :: 		TRISA = 0;
	CLRF       TRISA+0
;Programa02.c,4 :: 		PORTA = 0xFF;
	MOVLW      255
	MOVWF      PORTA+0
;Programa02.c,5 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa02.c,6 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;Programa02.c,7 :: 		TRISC = 0;
	CLRF       TRISC+0
;Programa02.c,8 :: 		PORTC = 0b10101010;
	MOVLW      170
	MOVWF      PORTC+0
;Programa02.c,9 :: 		TRISD = 0;
	CLRF       TRISD+0
;Programa02.c,10 :: 		PORTD = 240;
	MOVLW      240
	MOVWF      PORTD+0
;Programa02.c,11 :: 		TRISE = 0;
	CLRF       TRISE+0
;Programa02.c,12 :: 		PORTE.f2 = 1;
	BSF        PORTE+0, 2
;Programa02.c,13 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
