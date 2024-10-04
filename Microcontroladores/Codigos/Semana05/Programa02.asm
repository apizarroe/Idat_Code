
_main:

;Programa02.c,8 :: 		void main(){
;Programa02.c,9 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa02.c,10 :: 		TRISD = 0;
	CLRF       TRISD+0
;Programa02.c,11 :: 		PORTB = 0;
	CLRF       PORTB+0
;Programa02.c,12 :: 		PORTD = 0;
	CLRF       PORTD+0
;Programa02.c,13 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Programa02.c,15 :: 		while(1){
L_main0:
;Programa02.c,16 :: 		lectura_ADC = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;Programa02.c,17 :: 		voltaje = (lectura_ADC * 5.0)/1024.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       R0+2, 0
	MOVWF      FLOC__main+4
	MOVF       R0+3, 0
	MOVWF      FLOC__main+5
	MOVF       FLOC__main+2, 0
	MOVWF      _voltaje+0
	MOVF       FLOC__main+3, 0
	MOVWF      _voltaje+1
	MOVF       FLOC__main+4, 0
	MOVWF      _voltaje+2
	MOVF       FLOC__main+5, 0
	MOVWF      _voltaje+3
;Programa02.c,18 :: 		entero = (int)voltaje % 10;
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+2
	MOVF       FLOC__main+5, 0
	MOVWF      R0+3
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _entero+0
;Programa02.c,19 :: 		decimal = (int)(voltaje * 10) % 10;
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+2
	MOVF       FLOC__main+5, 0
	MOVWF      R0+3
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _decimal+0
;Programa02.c,20 :: 		PORTB = D7SEG[entero];
	MOVF       FLOC__main+0, 0
	MOVWF      R2+0
	RLF        R2+0, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Programa02.c,21 :: 		PORTD = D7SEG[decimal];
	MOVF       R0+0, 0
	MOVWF      R2+0
	RLF        R2+0, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;Programa02.c,22 :: 		}
	GOTO       L_main0
;Programa02.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
