
_main:

;Programa06.c,4 :: 		void main() {
;Programa06.c,5 :: 		TRISD = 0;
	CLRF       TRISD+0
;Programa06.c,6 :: 		PORTD = 0;
	CLRF       PORTD+0
;Programa06.c,8 :: 		while(1){
L_main0:
;Programa06.c,9 :: 		if(PORTB.f7 == 0){
	BTFSC      PORTB+0, 7
	GOTO       L_main2
;Programa06.c,10 :: 		cuenta++;
	INCF       _cuenta+0, 1
;Programa06.c,11 :: 		if(cuenta == PORTB){
	MOVF       _cuenta+0, 0
	XORWF      PORTB+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Programa06.c,12 :: 		cuenta = 0;
	CLRF       _cuenta+0
;Programa06.c,13 :: 		}
L_main3:
;Programa06.c,14 :: 		PORTD = D7SEG[cuenta];
	MOVF       _cuenta+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Programa06.c,15 :: 		delay_ms(600);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Programa06.c,16 :: 		}
L_main2:
;Programa06.c,17 :: 		}
	GOTO       L_main0
;Programa06.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
