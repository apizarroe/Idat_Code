
_main:

;Comunicacion02.c,1 :: 		void main(){
;Comunicacion02.c,2 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;Comunicacion02.c,3 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;Comunicacion02.c,4 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;Comunicacion02.c,5 :: 		while(1){
L_main0:
;Comunicacion02.c,6 :: 		if(PIR1.f5==1){
	BTFSS      PIR1+0, 5
	GOTO       L_main2
;Comunicacion02.c,7 :: 		TXREG = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      TXREG+0
;Comunicacion02.c,8 :: 		PIR1.f5 = 0;
	BCF        PIR1+0, 5
;Comunicacion02.c,9 :: 		}
L_main2:
;Comunicacion02.c,10 :: 		}
	GOTO       L_main0
;Comunicacion02.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
