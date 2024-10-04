
_main:

;Programa04.c,3 :: 		void main() {
;Programa04.c,4 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;Programa04.c,5 :: 		TRISB.f3 = 0;
	BCF        TRISB+0, 3
;Programa04.c,6 :: 		while(1){
L_main0:
;Programa04.c,7 :: 		entrada = PORTA.f1;
	MOVLW      0
	BTFSC      PORTA+0, 1
	MOVLW      1
	MOVWF      _entrada+0
;Programa04.c,8 :: 		PORTB.f3 = entrada;
	BTFSC      _entrada+0, 0
	GOTO       L__main3
	BCF        PORTB+0, 3
	GOTO       L__main4
L__main3:
	BSF        PORTB+0, 3
L__main4:
;Programa04.c,9 :: 		}
	GOTO       L_main0
;Programa04.c,10 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
