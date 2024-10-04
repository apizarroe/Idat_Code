
_main:

;Programa05.c,3 :: 		void main() {
;Programa05.c,4 :: 		TRISB.f0 = 0;
	BCF        TRISB+0, 0
;Programa05.c,5 :: 		while(1){
L_main0:
;Programa05.c,6 :: 		valorPuerto = PORTD;
	MOVF       PORTD+0, 0
	MOVWF      _valorPuerto+0
;Programa05.c,7 :: 		vdelay_ms(valorPuerto);
	MOVF       _valorPuerto+0, 0
	MOVWF      FARG_VDelay_ms_Time_ms+0
	CLRF       FARG_VDelay_ms_Time_ms+1
	CALL       _VDelay_ms+0
;Programa05.c,8 :: 		PORTB.f0 = !PORTB.f0;
	MOVLW      1
	XORWF      PORTB+0, 1
;Programa05.c,9 :: 		}
	GOTO       L_main0
;Programa05.c,10 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
