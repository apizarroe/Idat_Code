
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Programa01.c,1 :: 		void interrupt(){
;Programa01.c,2 :: 		PORTC.f0 = !PORTC.f0;
	MOVLW      1
	XORWF      PORTC+0, 1
;Programa01.c,3 :: 		INTCON.f1 =  0;
	BCF        INTCON+0, 1
;Programa01.c,4 :: 		}
L_end_interrupt:
L__interrupt3:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Programa01.c,6 :: 		void main() {
;Programa01.c,7 :: 		TRISC.f0 = 0;
	BCF        TRISC+0, 0
;Programa01.c,8 :: 		PORTC.f1 = 0;
	BCF        PORTC+0, 1
;Programa01.c,9 :: 		INTCON = 0b10010000;
	MOVLW      144
	MOVWF      INTCON+0
;Programa01.c,10 :: 		OPTION_REG = 0b00111111;
	MOVLW      63
	MOVWF      OPTION_REG+0
;Programa01.c,11 :: 		while(1){
L_main0:
;Programa01.c,13 :: 		}
	GOTO       L_main0
;Programa01.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
