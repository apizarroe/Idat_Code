
_main:

;EC01A.c,5 :: 		void main() {
;EC01A.c,6 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;EC01A.c,7 :: 		TRISB = 0;
	CLRF       TRISB+0
;EC01A.c,8 :: 		TRISD = 0;
	CLRF       TRISD+0
;EC01A.c,9 :: 		PORTD = 0;
	CLRF       PORTD+0
;EC01A.c,10 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01A.c,11 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01A.c,13 :: 		while(1) {
L_main0:
;EC01A.c,14 :: 		if(PORTA.f0 == 1){
	BTFSS      PORTA+0, 0
	GOTO       L_main2
;EC01A.c,15 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01A.c,16 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01A.c,17 :: 		} else {
	GOTO       L_main3
L_main2:
;EC01A.c,18 :: 		if(PORTA.f4 == 1){
	BTFSS      PORTA+0, 4
	GOTO       L_main4
;EC01A.c,19 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01A.c,20 :: 		} else {
	GOTO       L_main5
L_main4:
;EC01A.c,21 :: 		if((PORTA.f2 == 1) && (PORTA.f3 == 1)){
	BTFSS      PORTA+0, 2
	GOTO       L_main8
	BTFSS      PORTA+0, 3
	GOTO       L_main8
L__main21:
;EC01A.c,22 :: 		PORTB.f3 = 1;
	BSF        PORTB+0, 3
;EC01A.c,23 :: 		cuenta++;
	INCF       _cuenta+0, 1
;EC01A.c,24 :: 		PORTD = D7SEG_1[cuenta];
	MOVF       _cuenta+0, 0
	ADDLW      _D7SEG_1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EC01A.c,25 :: 		if(cuenta == 9){
	MOVF       _cuenta+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;EC01A.c,26 :: 		cuenta = 0;
	CLRF       _cuenta+0
;EC01A.c,27 :: 		}
L_main9:
;EC01A.c,28 :: 		while((PORTA.f2 == 1) && (PORTA.f3 == 1));
L_main10:
	BTFSS      PORTA+0, 2
	GOTO       L_main11
	BTFSS      PORTA+0, 3
	GOTO       L_main11
L__main20:
	GOTO       L_main10
L_main11:
;EC01A.c,29 :: 		}
L_main8:
;EC01A.c,30 :: 		}
L_main5:
;EC01A.c,32 :: 		if(PORTE.f2 == 1){
	BTFSS      PORTE+0, 2
	GOTO       L_main14
;EC01A.c,33 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01A.c,34 :: 		} else {
	GOTO       L_main15
L_main14:
;EC01A.c,35 :: 		if((PORTA.f5 == 1) && (PORTE.f0 == 1)){
	BTFSS      PORTA+0, 5
	GOTO       L_main18
	BTFSS      PORTE+0, 0
	GOTO       L_main18
L__main19:
;EC01A.c,36 :: 		PORTB.f4 = 1;
	BSF        PORTB+0, 4
;EC01A.c,37 :: 		}
L_main18:
;EC01A.c,38 :: 		}
L_main15:
;EC01A.c,40 :: 		}
L_main3:
;EC01A.c,41 :: 		}
	GOTO       L_main0
;EC01A.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
