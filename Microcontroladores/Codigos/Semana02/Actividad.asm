
_main:

;Actividad.c,3 :: 		void main() {
;Actividad.c,4 :: 		TRISC = 0;
	CLRF       TRISC+0
;Actividad.c,5 :: 		PORTC = 0;
	CLRF       PORTC+0
;Actividad.c,6 :: 		if(var%2 == 0){
	MOVLW      1
	ANDWF      _var+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main0
;Actividad.c,7 :: 		PORTC.f0 = 1;
	BSF        PORTC+0, 0
;Actividad.c,8 :: 		} else {
	GOTO       L_main1
L_main0:
;Actividad.c,9 :: 		PORTC.f2 = 1;
	BSF        PORTC+0, 2
;Actividad.c,10 :: 		}
L_main1:
;Actividad.c,11 :: 		if(var%5 == 0){
	MOVLW      5
	MOVWF      R4+0
	MOVF       _var+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Actividad.c,12 :: 		PORTC.f1 = 1;
	BSF        PORTC+0, 1
;Actividad.c,13 :: 		}
L_main2:
;Actividad.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
