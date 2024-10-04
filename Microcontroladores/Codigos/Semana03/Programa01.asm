
_main:

;Programa01.c,3 :: 		void main() {
;Programa01.c,4 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa01.c,5 :: 		PORTB = 0;
	CLRF       PORTB+0
;Programa01.c,6 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
L_main0:
	MOVLW      5
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main1
;Programa01.c,7 :: 		PORTB = i;
	MOVF       _i+0, 0
	MOVWF      PORTB+0
;Programa01.c,6 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
;Programa01.c,8 :: 		}
	GOTO       L_main0
L_main1:
;Programa01.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
