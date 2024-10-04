
_main:

;Comunicacion03.c,1 :: 		void main(){
;Comunicacion03.c,2 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;Comunicacion03.c,3 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;Comunicacion03.c,4 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;Comunicacion03.c,5 :: 		TRISB.f0 = 0;
	BCF        TRISB+0, 0
;Comunicacion03.c,6 :: 		while(1){
L_main0:
;Comunicacion03.c,7 :: 		if(PIR1.f5==1){
	BTFSS      PIR1+0, 5
	GOTO       L_main2
;Comunicacion03.c,8 :: 		if(RCREG == 'A'){
	MOVF       RCREG+0, 0
	XORLW      65
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;Comunicacion03.c,9 :: 		PORTB.f0=1;
	BSF        PORTB+0, 0
;Comunicacion03.c,10 :: 		}
L_main3:
;Comunicacion03.c,11 :: 		if(RCREG == 'a'){
	MOVF       RCREG+0, 0
	XORLW      97
	BTFSS      STATUS+0, 2
	GOTO       L_main4
;Comunicacion03.c,12 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;Comunicacion03.c,13 :: 		}
L_main4:
;Comunicacion03.c,14 :: 		PIR1.f5 = 0;
	BCF        PIR1+0, 5
;Comunicacion03.c,15 :: 		}
L_main2:
;Comunicacion03.c,16 :: 		}
	GOTO       L_main0
;Comunicacion03.c,17 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
