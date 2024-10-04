
_main:

;ProgramaActividadVirt.c,7 :: 		void main() {
;ProgramaActividadVirt.c,8 :: 		TRISB = 0;
	CLRF       TRISB+0
;ProgramaActividadVirt.c,9 :: 		TRISD = 0;
	CLRF       TRISD+0
;ProgramaActividadVirt.c,10 :: 		PORTB = 0;
	CLRF       PORTB+0
;ProgramaActividadVirt.c,11 :: 		PORTD = 0;
	CLRF       PORTD+0
;ProgramaActividadVirt.c,12 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ProgramaActividadVirt.c,13 :: 		while(1){
L_main0:
;ProgramaActividadVirt.c,14 :: 		lectura_ADC = ADC_Get_Sample(0); //0-1023
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;ProgramaActividadVirt.c,15 :: 		voltaje = (lectura_ADC*30.0)/1024.0; //2.6,4.1
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      131
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
;ProgramaActividadVirt.c,16 :: 		unidad = (int)voltaje % 10;
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
	MOVWF      _unidad+0
;ProgramaActividadVirt.c,17 :: 		decena = (int)(voltaje / 10) % 10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FLOC__main+2, 0
	MOVWF      R0+0
	MOVF       FLOC__main+3, 0
	MOVWF      R0+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+2
	MOVF       FLOC__main+5, 0
	MOVWF      R0+3
	CALL       _Div_32x32_FP+0
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
	MOVWF      _decena+0
;ProgramaActividadVirt.c,18 :: 		PORTB = D7SEG[decena];
	MOVF       R0+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;ProgramaActividadVirt.c,19 :: 		PORTD = D7SEG[unidad];
	MOVF       FLOC__main+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;ProgramaActividadVirt.c,20 :: 		}
	GOTO       L_main0
;ProgramaActividadVirt.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
