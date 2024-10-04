
_main:

;Comunicacion_AV.c,8 :: 		void main(){
;Comunicacion_AV.c,9 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;Comunicacion_AV.c,10 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;Comunicacion_AV.c,11 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;Comunicacion_AV.c,12 :: 		TRISB = 0;
	CLRF       TRISB+0
;Comunicacion_AV.c,13 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Comunicacion_AV.c,15 :: 		while(1){
L_main0:
;Comunicacion_AV.c,16 :: 		if(PIR1.f5==1){
	BTFSS      PIR1+0, 5
	GOTO       L_main2
;Comunicacion_AV.c,17 :: 		TXREG = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      TXREG+0
;Comunicacion_AV.c,18 :: 		caracter = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _caracter+0
;Comunicacion_AV.c,19 :: 		if(caracter >=48 && caracter<=57){
	MOVLW      48
	SUBWF      _caracter+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main5
	MOVF       _caracter+0, 0
	SUBLW      57
	BTFSS      STATUS+0, 0
	GOTO       L_main5
L__main19:
;Comunicacion_AV.c,20 :: 		entero = caracter - 48;
	MOVLW      48
	SUBWF      _caracter+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVF       R3+0, 0
	MOVWF      _entero+0
	MOVF       R3+1, 0
	MOVWF      _entero+1
;Comunicacion_AV.c,21 :: 		PORTB = D7SEG[entero];
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Comunicacion_AV.c,22 :: 		}
L_main5:
;Comunicacion_AV.c,23 :: 		PIR1.f5 = 0;
	BCF        PIR1+0, 5
;Comunicacion_AV.c,24 :: 		}
L_main2:
;Comunicacion_AV.c,26 :: 		lectura_ADC = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       FLOC__main+1, 0
	MOVWF      _lectura_ADC+1
;Comunicacion_AV.c,27 :: 		txt[0] = ((lectura_ADC/1000)%10) + 48;
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
;Comunicacion_AV.c,28 :: 		txt[1] = ((lectura_ADC/100)%10) + 48;
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
;Comunicacion_AV.c,29 :: 		txt[2] = ((lectura_ADC/10)%10) + 48;
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
;Comunicacion_AV.c,30 :: 		txt[3] = (lectura_ADC%10) + 48;
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
;Comunicacion_AV.c,32 :: 		TXREG = txt[0];
	MOVF       _txt+0, 0
	MOVWF      TXREG+0
;Comunicacion_AV.c,33 :: 		while(TXSTA.f1 == 0);
L_main6:
	BTFSC      TXSTA+0, 1
	GOTO       L_main7
	GOTO       L_main6
L_main7:
;Comunicacion_AV.c,34 :: 		TXREG = txt[1];
	MOVF       _txt+1, 0
	MOVWF      TXREG+0
;Comunicacion_AV.c,35 :: 		while(TXSTA.f1 == 0);
L_main8:
	BTFSC      TXSTA+0, 1
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;Comunicacion_AV.c,36 :: 		TXREG = txt[2];
	MOVF       _txt+2, 0
	MOVWF      TXREG+0
;Comunicacion_AV.c,37 :: 		while(TXSTA.f1 == 0);
L_main10:
	BTFSC      TXSTA+0, 1
	GOTO       L_main11
	GOTO       L_main10
L_main11:
;Comunicacion_AV.c,38 :: 		TXREG = txt[3];
	MOVF       _txt+3, 0
	MOVWF      TXREG+0
;Comunicacion_AV.c,39 :: 		while(TXSTA.f1 == 0);
L_main12:
	BTFSC      TXSTA+0, 1
	GOTO       L_main13
	GOTO       L_main12
L_main13:
;Comunicacion_AV.c,40 :: 		TXREG = 10;
	MOVLW      10
	MOVWF      TXREG+0
;Comunicacion_AV.c,41 :: 		while(TXSTA.f1 == 0);
L_main14:
	BTFSC      TXSTA+0, 1
	GOTO       L_main15
	GOTO       L_main14
L_main15:
;Comunicacion_AV.c,42 :: 		TXREG = 13;
	MOVLW      13
	MOVWF      TXREG+0
;Comunicacion_AV.c,43 :: 		while(TXSTA.f1 == 0);
L_main16:
	BTFSC      TXSTA+0, 1
	GOTO       L_main17
	GOTO       L_main16
L_main17:
;Comunicacion_AV.c,45 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;Comunicacion_AV.c,46 :: 		}
	GOTO       L_main0
;Comunicacion_AV.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
