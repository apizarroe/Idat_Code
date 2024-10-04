
_main:

;Programa01.c,1 :: 		void main() {
;Programa01.c,2 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa01.c,3 :: 		PORTB = 0x99;
	MOVLW      153
	MOVWF      PORTB+0
;Programa01.c,4 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
