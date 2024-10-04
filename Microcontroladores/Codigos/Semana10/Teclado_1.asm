
_teclado4x4:

;Teclado_1.c,2 :: 		void teclado4x4(){
;Teclado_1.c,3 :: 		PORTB = 0x0E; // 00001110
	MOVLW      14
	MOVWF      PORTB+0
;Teclado_1.c,4 :: 		if(PORTB == 0xEE){tecla = 1;} // 11101110
	MOVF       PORTB+0, 0
	XORLW      238
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x40
	MOVLW      1
	MOVWF      _tecla+0
L_teclado4x40:
;Teclado_1.c,5 :: 		if(PORTB == 0xDE){tecla = 2;} // 11011110
	MOVF       PORTB+0, 0
	XORLW      222
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x41
	MOVLW      2
	MOVWF      _tecla+0
L_teclado4x41:
;Teclado_1.c,6 :: 		if(PORTB == 0xBE){tecla = 3;} // 10111110
	MOVF       PORTB+0, 0
	XORLW      190
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x42
	MOVLW      3
	MOVWF      _tecla+0
L_teclado4x42:
;Teclado_1.c,7 :: 		if(PORTB == 0x7E){tecla = 4;} // 01111110
	MOVF       PORTB+0, 0
	XORLW      126
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x43
	MOVLW      4
	MOVWF      _tecla+0
L_teclado4x43:
;Teclado_1.c,8 :: 		PORTB = 0x0D; // 00001101
	MOVLW      13
	MOVWF      PORTB+0
;Teclado_1.c,9 :: 		if(PORTB == 0xED){tecla = 5;} // 11101101
	MOVF       PORTB+0, 0
	XORLW      237
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x44
	MOVLW      5
	MOVWF      _tecla+0
L_teclado4x44:
;Teclado_1.c,10 :: 		if(PORTB == 0xDD){tecla = 6;} // 11011101
	MOVF       PORTB+0, 0
	XORLW      221
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x45
	MOVLW      6
	MOVWF      _tecla+0
L_teclado4x45:
;Teclado_1.c,11 :: 		if(PORTB == 0xBD){tecla = 7;} // 10111101
	MOVF       PORTB+0, 0
	XORLW      189
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x46
	MOVLW      7
	MOVWF      _tecla+0
L_teclado4x46:
;Teclado_1.c,12 :: 		if(PORTB == 0x7D){tecla = 8;} // 01111101
	MOVF       PORTB+0, 0
	XORLW      125
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x47
	MOVLW      8
	MOVWF      _tecla+0
L_teclado4x47:
;Teclado_1.c,13 :: 		PORTB = 0x0B; // 00001011
	MOVLW      11
	MOVWF      PORTB+0
;Teclado_1.c,14 :: 		if(PORTB == 0xEB){tecla = 9;} // 11101011
	MOVF       PORTB+0, 0
	XORLW      235
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x48
	MOVLW      9
	MOVWF      _tecla+0
L_teclado4x48:
;Teclado_1.c,15 :: 		if(PORTB == 0xDB){tecla = 10;} // 11011011
	MOVF       PORTB+0, 0
	XORLW      219
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x49
	MOVLW      10
	MOVWF      _tecla+0
L_teclado4x49:
;Teclado_1.c,16 :: 		if(PORTB == 0xBB){tecla = 11;} // 10111011
	MOVF       PORTB+0, 0
	XORLW      187
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x410
	MOVLW      11
	MOVWF      _tecla+0
L_teclado4x410:
;Teclado_1.c,17 :: 		if(PORTB == 0x7B){tecla = 12;} // 01111011
	MOVF       PORTB+0, 0
	XORLW      123
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x411
	MOVLW      12
	MOVWF      _tecla+0
L_teclado4x411:
;Teclado_1.c,18 :: 		PORTB = 0x07; // 00000111
	MOVLW      7
	MOVWF      PORTB+0
;Teclado_1.c,19 :: 		if(PORTB == 0xE7){tecla = 13;} // 11100111
	MOVF       PORTB+0, 0
	XORLW      231
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x412
	MOVLW      13
	MOVWF      _tecla+0
L_teclado4x412:
;Teclado_1.c,20 :: 		if(PORTB == 0xD7){tecla = 14;} // 11010111
	MOVF       PORTB+0, 0
	XORLW      215
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x413
	MOVLW      14
	MOVWF      _tecla+0
L_teclado4x413:
;Teclado_1.c,21 :: 		if(PORTB == 0xB7){tecla = 15;} // 10110111
	MOVF       PORTB+0, 0
	XORLW      183
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x414
	MOVLW      15
	MOVWF      _tecla+0
L_teclado4x414:
;Teclado_1.c,22 :: 		if(PORTB == 0x77){tecla = 16;} // 01110111
	MOVF       PORTB+0, 0
	XORLW      119
	BTFSS      STATUS+0, 2
	GOTO       L_teclado4x415
	MOVLW      16
	MOVWF      _tecla+0
L_teclado4x415:
;Teclado_1.c,23 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;Teclado_1.c,24 :: 		}
L_end_teclado4x4:
	RETURN
; end of _teclado4x4

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Teclado_1.c,25 :: 		void interrupt(){
;Teclado_1.c,26 :: 		if (INTCON.f0 == 1){
	BTFSS      INTCON+0, 0
	GOTO       L_interrupt16
;Teclado_1.c,27 :: 		teclado4x4();
	CALL       _teclado4x4+0
;Teclado_1.c,28 :: 		INTCON.f0 = 0;
	BCF        INTCON+0, 0
;Teclado_1.c,29 :: 		}
L_interrupt16:
;Teclado_1.c,30 :: 		}
L_end_interrupt:
L__interrupt21:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Teclado_1.c,32 :: 		void main() {
;Teclado_1.c,33 :: 		TRISB = 0xF0;
	MOVLW      240
	MOVWF      TRISB+0
;Teclado_1.c,34 :: 		PORTB = 0;
	CLRF       PORTB+0
;Teclado_1.c,35 :: 		TRISC = 0;
	CLRF       TRISC+0
;Teclado_1.c,36 :: 		PORTC = 0;
	CLRF       PORTC+0
;Teclado_1.c,37 :: 		OPTION_REG.f7 = 0; // habilitamos pull up
	BCF        OPTION_REG+0, 7
;Teclado_1.c,38 :: 		INTCON = 0b10001000; // hab interr. por PORTB
	MOVLW      136
	MOVWF      INTCON+0
;Teclado_1.c,39 :: 		while(1){
L_main17:
;Teclado_1.c,40 :: 		PORTC = tecla;
	MOVF       _tecla+0, 0
	MOVWF      PORTC+0
;Teclado_1.c,41 :: 		}
	GOTO       L_main17
;Teclado_1.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
