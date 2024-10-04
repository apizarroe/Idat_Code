
_main:

;Programa01.c,4 :: 		void main(){
;Programa01.c,5 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Programa01.c,6 :: 		TRISB = 0;
	CLRF       TRISB+0
;Programa01.c,7 :: 		TRISD.f4 = 0;
	BCF        TRISD+0, 4
;Programa01.c,8 :: 		TRISD.f5 = 0;
	BCF        TRISD+0, 5
;Programa01.c,10 :: 		while(1){
L_main0:
;Programa01.c,11 :: 		lectura_ADC = ADC_Get_Sample(3);
	MOVLW      3
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;Programa01.c,12 :: 		PORTB = lectura_ADC;
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;Programa01.c,15 :: 		PORTD = (lectura_ADC >> 4);
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;Programa01.c,16 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Programa01.c,17 :: 		}
	GOTO       L_main0
;Programa01.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
