
_main:

;EC01.c,5 :: 		void main() {
;EC01.c,6 :: 		ADCON1 = 0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;EC01.c,7 :: 		TRISB = 0;
	CLRF       TRISB+0
;EC01.c,8 :: 		TRISC = 0;
	CLRF       TRISC+0
;EC01.c,9 :: 		TRISD = 0;
	CLRF       TRISD+0
;EC01.c,10 :: 		PORTC = 0;
	CLRF       PORTC+0
;EC01.c,11 :: 		PORTD = 0;
	CLRF       PORTD+0
;EC01.c,12 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01.c,13 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01.c,15 :: 		while(1) {
L_main0:
;EC01.c,16 :: 		if(PORTA.f0 == 1){
	BTFSS      PORTA+0, 0
	GOTO       L_main2
;EC01.c,17 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01.c,18 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01.c,19 :: 		} else {
	GOTO       L_main3
L_main2:
;EC01.c,20 :: 		if(PORTA.f4 == 1){
	BTFSS      PORTA+0, 4
	GOTO       L_main4
;EC01.c,21 :: 		PORTB.f3 = 0;
	BCF        PORTB+0, 3
;EC01.c,22 :: 		} else {
	GOTO       L_main5
L_main4:
;EC01.c,23 :: 		if((PORTA.f2 == 1) && (PORTA.f3 == 1)){
	BTFSS      PORTA+0, 2
	GOTO       L_main8
	BTFSS      PORTA+0, 3
	GOTO       L_main8
L__main29:
;EC01.c,24 :: 		if(PORTB.f3 == 0){
	BTFSC      PORTB+0, 3
	GOTO       L_main9
;EC01.c,25 :: 		PORTB.f3 = 1;
	BSF        PORTB+0, 3
;EC01.c,26 :: 		cuenta1++;
	INCF       _cuenta1+0, 1
;EC01.c,27 :: 		PORTD = D7SEG_1[cuenta1];
	MOVF       _cuenta1+0, 0
	ADDLW      _D7SEG_1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;EC01.c,28 :: 		if(cuenta1 == 9){
	MOVF       _cuenta1+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;EC01.c,29 :: 		cuenta1 = 0;
	CLRF       _cuenta1+0
;EC01.c,30 :: 		}
L_main10:
;EC01.c,31 :: 		while((PORTA.f2 == 1) && (PORTA.f3 == 1));
L_main11:
	BTFSS      PORTA+0, 2
	GOTO       L_main12
	BTFSS      PORTA+0, 3
	GOTO       L_main12
L__main28:
	GOTO       L_main11
L_main12:
;EC01.c,32 :: 		}
L_main9:
;EC01.c,33 :: 		}
L_main8:
;EC01.c,34 :: 		}
L_main5:
;EC01.c,36 :: 		if(PORTE.f2 == 1){
	BTFSS      PORTE+0, 2
	GOTO       L_main15
;EC01.c,37 :: 		PORTB.f4 = 0;
	BCF        PORTB+0, 4
;EC01.c,38 :: 		} else {
	GOTO       L_main16
L_main15:
;EC01.c,39 :: 		if((PORTA.f5 == 1) && (PORTE.f0 == 1)){
	BTFSS      PORTA+0, 5
	GOTO       L_main19
	BTFSS      PORTE+0, 0
	GOTO       L_main19
L__main27:
;EC01.c,40 :: 		if(PORTB.f4 == 0){
	BTFSC      PORTB+0, 4
	GOTO       L_main20
;EC01.c,41 :: 		PORTB.f4 = 1;
	BSF        PORTB+0, 4
;EC01.c,42 :: 		cuenta2++;
	INCF       _cuenta2+0, 1
;EC01.c,43 :: 		PORTC = D7SEG_1[cuenta2];
	MOVF       _cuenta2+0, 0
	ADDLW      _D7SEG_1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;EC01.c,44 :: 		if(cuenta2 == 9){
	MOVF       _cuenta2+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;EC01.c,45 :: 		cuenta2 = 0;
	CLRF       _cuenta2+0
;EC01.c,46 :: 		}
L_main21:
;EC01.c,47 :: 		while((PORTA.f5 == 1) && (PORTE.f0 == 1));
L_main22:
	BTFSS      PORTA+0, 5
	GOTO       L_main23
	BTFSS      PORTE+0, 0
	GOTO       L_main23
L__main26:
	GOTO       L_main22
L_main23:
;EC01.c,48 :: 		}
L_main20:
;EC01.c,49 :: 		}
L_main19:
;EC01.c,50 :: 		}
L_main16:
;EC01.c,51 :: 		}
L_main3:
;EC01.c,52 :: 		}
	GOTO       L_main0
;EC01.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
