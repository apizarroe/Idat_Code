
_main:

;Programa01.c,5 :: 		void main() {
;Programa01.c,6 :: 		cuenta = 255;
	MOVLW      255
	MOVWF      _cuenta+0
	CLRF       _cuenta+1
;Programa01.c,7 :: 		letra = 'F';
	MOVLW      70
	MOVWF      _letra+0
;Programa01.c,8 :: 		pi = 3.14;
	MOVLW      195
	MOVWF      _pi+0
	MOVLW      245
	MOVWF      _pi+1
	MOVLW      72
	MOVWF      _pi+2
	MOVLW      128
	MOVWF      _pi+3
;Programa01.c,9 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
