
_main:

;LCD03.c,19 :: 		void main() {
;LCD03.c,20 :: 		ADC_Init();
	CALL       _ADC_Init+0
;LCD03.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD03.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD03.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD03.c,24 :: 		Lcd_Out(1,1,"Voltaje:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD03+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD03.c,25 :: 		while(1){
L_main0:
;LCD03.c,26 :: 		voltaje = (ADC_Get_Sample(0)*5.0/1024.0); //2.123
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
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
	MOVWF      _voltaje+0
	MOVF       R0+1, 0
	MOVWF      _voltaje+1
	MOVF       R0+2, 0
	MOVWF      _voltaje+2
	MOVF       R0+3, 0
	MOVWF      _voltaje+3
;LCD03.c,27 :: 		FloatToStr(voltaje,texto);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _texto+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;LCD03.c,28 :: 		Lcd_Out(2, 1, texto);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _texto+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD03.c,29 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;LCD03.c,30 :: 		}
	GOTO       L_main0
;LCD03.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
