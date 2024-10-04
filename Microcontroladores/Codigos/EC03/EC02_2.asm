
_main:

;EC02_2.c,8 :: 		void main(){
;EC02_2.c,9 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;EC02_2.c,10 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;EC02_2.c,11 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;EC02_2.c,12 :: 		TRISB = 0;
	CLRF       TRISB+0
;EC02_2.c,13 :: 		PORTB = 0;
	CLRF       PORTB+0
;EC02_2.c,14 :: 		ADC_Init();
	CALL       _ADC_Init+0
;EC02_2.c,16 :: 		while(1){
L_main0:
;EC02_2.c,17 :: 		if(PIR1.f5==1){
	BTFSS      PIR1+0, 5
	GOTO       L_main2
;EC02_2.c,18 :: 		TXREG = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      TXREG+0
;EC02_2.c,19 :: 		caracter = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _caracter+0
;EC02_2.c,20 :: 		if((caracter >=76 && caracter<=83)||(caracter >=108 && caracter<=115)){
	MOVLW      76
	SUBWF      _caracter+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main41
	MOVF       _caracter+0, 0
	SUBLW      83
	BTFSS      STATUS+0, 0
	GOTO       L__main41
	GOTO       L__main39
L__main41:
	MOVLW      108
	SUBWF      _caracter+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main40
	MOVF       _caracter+0, 0
	SUBLW      115
	BTFSS      STATUS+0, 0
	GOTO       L__main40
	GOTO       L__main39
L__main40:
	GOTO       L_main9
L__main39:
;EC02_2.c,21 :: 		if(caracter == 76){PORTB.f0 = 1;}
	MOVF       _caracter+0, 0
	XORLW      76
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	BSF        PORTB+0, 0
L_main10:
;EC02_2.c,22 :: 		if(caracter == 77){PORTB.f1 = 1;}
	MOVF       _caracter+0, 0
	XORLW      77
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	BSF        PORTB+0, 1
L_main11:
;EC02_2.c,23 :: 		if(caracter == 78){PORTB.f2 = 1;}
	MOVF       _caracter+0, 0
	XORLW      78
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	BSF        PORTB+0, 2
L_main12:
;EC02_2.c,24 :: 		if(caracter == 79){PORTB.f3 = 1;}
	MOVF       _caracter+0, 0
	XORLW      79
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	BSF        PORTB+0, 3
L_main13:
;EC02_2.c,25 :: 		if(caracter == 80){PORTB.f4 = 1;}
	MOVF       _caracter+0, 0
	XORLW      80
	BTFSS      STATUS+0, 2
	GOTO       L_main14
	BSF        PORTB+0, 4
L_main14:
;EC02_2.c,26 :: 		if(caracter == 81){PORTB.f5 = 1;}
	MOVF       _caracter+0, 0
	XORLW      81
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	BSF        PORTB+0, 5
L_main15:
;EC02_2.c,27 :: 		if(caracter == 82){PORTB.f6 = 1;}
	MOVF       _caracter+0, 0
	XORLW      82
	BTFSS      STATUS+0, 2
	GOTO       L_main16
	BSF        PORTB+0, 6
L_main16:
;EC02_2.c,28 :: 		if(caracter == 83){PORTB.f7 = 1;}
	MOVF       _caracter+0, 0
	XORLW      83
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	BSF        PORTB+0, 7
L_main17:
;EC02_2.c,30 :: 		if(caracter == 108){PORTB.f0 = 0;}
	MOVF       _caracter+0, 0
	XORLW      108
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	BCF        PORTB+0, 0
L_main18:
;EC02_2.c,31 :: 		if(caracter == 109){PORTB.f1 = 0;}
	MOVF       _caracter+0, 0
	XORLW      109
	BTFSS      STATUS+0, 2
	GOTO       L_main19
	BCF        PORTB+0, 1
L_main19:
;EC02_2.c,32 :: 		if(caracter == 110){PORTB.f2 = 0;}
	MOVF       _caracter+0, 0
	XORLW      110
	BTFSS      STATUS+0, 2
	GOTO       L_main20
	BCF        PORTB+0, 2
L_main20:
;EC02_2.c,33 :: 		if(caracter == 111){PORTB.f3 = 0;}
	MOVF       _caracter+0, 0
	XORLW      111
	BTFSS      STATUS+0, 2
	GOTO       L_main21
	BCF        PORTB+0, 3
L_main21:
;EC02_2.c,34 :: 		if(caracter == 112){PORTB.f4 = 0;}
	MOVF       _caracter+0, 0
	XORLW      112
	BTFSS      STATUS+0, 2
	GOTO       L_main22
	BCF        PORTB+0, 4
L_main22:
;EC02_2.c,35 :: 		if(caracter == 113){PORTB.f5 = 0;}
	MOVF       _caracter+0, 0
	XORLW      113
	BTFSS      STATUS+0, 2
	GOTO       L_main23
	BCF        PORTB+0, 5
L_main23:
;EC02_2.c,36 :: 		if(caracter == 114){PORTB.f6 = 0;}
	MOVF       _caracter+0, 0
	XORLW      114
	BTFSS      STATUS+0, 2
	GOTO       L_main24
	BCF        PORTB+0, 6
L_main24:
;EC02_2.c,37 :: 		if(caracter == 115){PORTB.f7 = 0;}
	MOVF       _caracter+0, 0
	XORLW      115
	BTFSS      STATUS+0, 2
	GOTO       L_main25
	BCF        PORTB+0, 7
L_main25:
;EC02_2.c,38 :: 		}
L_main9:
;EC02_2.c,39 :: 		PIR1.f5 = 0;
	BCF        PIR1+0, 5
;EC02_2.c,40 :: 		}
L_main2:
;EC02_2.c,42 :: 		lectura_ADC = ADC_Get_Sample(3);
	MOVLW      3
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       FLOC__main+1, 0
	MOVWF      _lectura_ADC+1
;EC02_2.c,43 :: 		txt[0] = ((lectura_ADC/1000)%10) + 48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+0
;EC02_2.c,44 :: 		txt[1] = ((lectura_ADC/100)%10) + 48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+1
;EC02_2.c,45 :: 		txt[2] = ((lectura_ADC/10)%10) + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+2
;EC02_2.c,46 :: 		txt[3] = (lectura_ADC%10) + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+0, 0
	MOVWF      R0+0
	MOVF       FLOC__main+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _txt+3
;EC02_2.c,48 :: 		TXREG = txt[0];
	MOVF       _txt+0, 0
	MOVWF      TXREG+0
;EC02_2.c,49 :: 		while(TXSTA.f1 == 0);
L_main26:
	BTFSC      TXSTA+0, 1
	GOTO       L_main27
	GOTO       L_main26
L_main27:
;EC02_2.c,50 :: 		TXREG = txt[1];
	MOVF       _txt+1, 0
	MOVWF      TXREG+0
;EC02_2.c,51 :: 		while(TXSTA.f1 == 0);
L_main28:
	BTFSC      TXSTA+0, 1
	GOTO       L_main29
	GOTO       L_main28
L_main29:
;EC02_2.c,52 :: 		TXREG = txt[2];
	MOVF       _txt+2, 0
	MOVWF      TXREG+0
;EC02_2.c,53 :: 		while(TXSTA.f1 == 0);
L_main30:
	BTFSC      TXSTA+0, 1
	GOTO       L_main31
	GOTO       L_main30
L_main31:
;EC02_2.c,54 :: 		TXREG = txt[3];
	MOVF       _txt+3, 0
	MOVWF      TXREG+0
;EC02_2.c,55 :: 		while(TXSTA.f1 == 0);
L_main32:
	BTFSC      TXSTA+0, 1
	GOTO       L_main33
	GOTO       L_main32
L_main33:
;EC02_2.c,56 :: 		TXREG = 10;
	MOVLW      10
	MOVWF      TXREG+0
;EC02_2.c,57 :: 		while(TXSTA.f1 == 0);
L_main34:
	BTFSC      TXSTA+0, 1
	GOTO       L_main35
	GOTO       L_main34
L_main35:
;EC02_2.c,58 :: 		TXREG = 13;
	MOVLW      13
	MOVWF      TXREG+0
;EC02_2.c,59 :: 		while(TXSTA.f1 == 0);
L_main36:
	BTFSC      TXSTA+0, 1
	GOTO       L_main37
	GOTO       L_main36
L_main37:
;EC02_2.c,61 :: 		delay_ms(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;EC02_2.c,62 :: 		}
	GOTO       L_main0
;EC02_2.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
