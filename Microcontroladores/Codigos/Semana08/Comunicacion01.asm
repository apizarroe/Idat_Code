
_main:

;Comunicacion01.c,1 :: 		void main() {
;Comunicacion01.c,2 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;Comunicacion01.c,3 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;Comunicacion01.c,4 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;Comunicacion01.c,5 :: 		TXREG = 'A';
	MOVLW      65
	MOVWF      TXREG+0
;Comunicacion01.c,6 :: 		while(TXSTA.f1==0);
L_main0:
	BTFSC      TXSTA+0, 1
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;Comunicacion01.c,7 :: 		TXREG = 'L';
	MOVLW      76
	MOVWF      TXREG+0
;Comunicacion01.c,8 :: 		while(TXSTA.f1==0);
L_main2:
	BTFSC      TXSTA+0, 1
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;Comunicacion01.c,9 :: 		TXREG = 'D';
	MOVLW      68
	MOVWF      TXREG+0
;Comunicacion01.c,10 :: 		while(TXSTA.f1==0);
L_main4:
	BTFSC      TXSTA+0, 1
	GOTO       L_main5
	GOTO       L_main4
L_main5:
;Comunicacion01.c,11 :: 		TXREG = 'O';
	MOVLW      79
	MOVWF      TXREG+0
;Comunicacion01.c,12 :: 		while(TXSTA.f1==0);
L_main6:
	BTFSC      TXSTA+0, 1
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;Comunicacion01.c,13 :: 		TXREG = ' ';
	MOVLW      32
	MOVWF      TXREG+0
;Comunicacion01.c,14 :: 		while(TXSTA.f1==0);
L_main8:
	BTFSC      TXSTA+0, 1
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;Comunicacion01.c,15 :: 		TXREG = 'P';
	MOVLW      80
	MOVWF      TXREG+0
;Comunicacion01.c,16 :: 		while(TXSTA.f1==0);
L_main10:
	BTFSC      TXSTA+0, 1
	GOTO       L_main11
	GOTO       L_main10
L_main11:
;Comunicacion01.c,17 :: 		TXREG = 'I';
	MOVLW      73
	MOVWF      TXREG+0
;Comunicacion01.c,18 :: 		while(TXSTA.f1==0);
L_main12:
	BTFSC      TXSTA+0, 1
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;Comunicacion01.c,19 :: 		TXREG = 'Z';
	MOVLW      90
	MOVWF      TXREG+0
;Comunicacion01.c,20 :: 		while(TXSTA.f1==0);
L_main14:
	BTFSC      TXSTA+0, 1
	GOTO       L_main15
	GOTO       L_main14
L_main15:
;Comunicacion01.c,21 :: 		TXREG = 'A';
	MOVLW      65
	MOVWF      TXREG+0
;Comunicacion01.c,22 :: 		while(TXSTA.f1==0);
L_main16:
	BTFSC      TXSTA+0, 1
	GOTO       L_main17
	GOTO       L_main16
L_main17:
;Comunicacion01.c,23 :: 		TXREG = 'R';
	MOVLW      82
	MOVWF      TXREG+0
;Comunicacion01.c,24 :: 		while(TXSTA.f1==0);
L_main18:
	BTFSC      TXSTA+0, 1
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;Comunicacion01.c,25 :: 		TXREG = 'R';
	MOVLW      82
	MOVWF      TXREG+0
;Comunicacion01.c,26 :: 		while(TXSTA.f1==0);
L_main20:
	BTFSC      TXSTA+0, 1
	GOTO       L_main21
	GOTO       L_main20
L_main21:
;Comunicacion01.c,27 :: 		TXREG = 'O';
	MOVLW      79
	MOVWF      TXREG+0
;Comunicacion01.c,28 :: 		while(1){
L_main22:
;Comunicacion01.c,29 :: 		}
	GOTO       L_main22
;Comunicacion01.c,30 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
