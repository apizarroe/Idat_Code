
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Programa03.c,1 :: 		void interrupt(){
;Programa03.c,2 :: 		PORTB.f0 = !PORTB.f0;
	MOVLW      1
	XORWF      PORTB+0, 1
;Programa03.c,3 :: 		TMR0 = 87;
	MOVLW      87
	MOVWF      TMR0+0
;Programa03.c,4 :: 		INTCON.f2 =  0;
	BCF        INTCON+0, 2
;Programa03.c,5 :: 		}
L_end_interrupt:
L__interrupt1:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Programa03.c,7 :: 		void main(){
;Programa03.c,8 :: 		TRISB.f0 = 0;
	BCF        TRISB+0, 0
;Programa03.c,9 :: 		OPTION_REG = 0b11010111;
	MOVLW      215
	MOVWF      OPTION_REG+0
;Programa03.c,10 :: 		INTCON = 0b10100000;
	MOVLW      160
	MOVWF      INTCON+0
;Programa03.c,11 :: 		TMR0 = 87;
	MOVLW      87
	MOVWF      TMR0+0
;Programa03.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
