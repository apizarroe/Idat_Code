
_main:

;EC03_1.c,25 :: 		void main() {
;EC03_1.c,26 :: 		ADC_Init();
	CALL       _ADC_Init+0
;EC03_1.c,27 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;EC03_1.c,28 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EC03_1.c,29 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EC03_1.c,30 :: 		Lcd_Out(1, 3, "Lector 4 - 20 mA");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EC03_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EC03_1.c,32 :: 		Lcd_Out(3, 1, "Aldo Pizarro");
	MOVLW      3
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EC03_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EC03_1.c,33 :: 		Lcd_Out(4, 12, "A17202187");
	MOVLW      4
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EC03_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EC03_1.c,35 :: 		while(1){
L_main0:
;EC03_1.c,36 :: 		lectura_ADC = ADC_Get_Sample(0)-98;
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVLW      98
	SUBWF      R0+0, 1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _lectura_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_ADC+1
;EC03_1.c,37 :: 		porcentaje = ((lectura_ADC/393.0)*100.0);//98
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      128
	MOVWF      R4+1
	MOVLW      68
	MOVWF      R4+2
	MOVLW      135
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2word+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+4
	MOVF       R0+1, 0
	MOVWF      FLOC__main+5
	MOVF       FLOC__main+4, 0
	MOVWF      _porcentaje+0
	MOVF       FLOC__main+5, 0
	MOVWF      _porcentaje+1
;EC03_1.c,38 :: 		centenas = porcentaje/100;//0
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__main+2
	MOVF       R0+1, 0
	MOVWF      FLOC__main+3
	MOVF       FLOC__main+2, 0
	MOVWF      _centenas+0
	MOVF       FLOC__main+3, 0
	MOVWF      _centenas+1
;EC03_1.c,39 :: 		decenas = ((porcentaje/10)%10);//9
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
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
	MOVF       R0+0, 0
	MOVWF      FLOC__main+0
	MOVF       R0+1, 0
	MOVWF      FLOC__main+1
	MOVF       FLOC__main+0, 0
	MOVWF      _decenas+0
	MOVF       FLOC__main+1, 0
	MOVWF      _decenas+1
;EC03_1.c,40 :: 		unidades = (porcentaje%10);//8
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       FLOC__main+4, 0
	MOVWF      R0+0
	MOVF       FLOC__main+5, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _unidades+0
	MOVF       R0+1, 0
	MOVWF      _unidades+1
;EC03_1.c,41 :: 		texto[0] = centenas + 48;
	MOVLW      48
	ADDWF      FLOC__main+2, 0
	MOVWF      _texto+0
;EC03_1.c,42 :: 		texto[1] = decenas + 48;
	MOVLW      48
	ADDWF      FLOC__main+0, 0
	MOVWF      _texto+1
;EC03_1.c,43 :: 		texto[2] = unidades + 48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _texto+2
;EC03_1.c,44 :: 		Lcd_Out(2, 1, "Nivel: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EC03_1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EC03_1.c,45 :: 		Lcd_Chr_Cp(texto[0]);
	MOVF       _texto+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;EC03_1.c,46 :: 		Lcd_Chr_Cp(texto[1]);
	MOVF       _texto+1, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;EC03_1.c,47 :: 		Lcd_Chr_Cp(texto[2]);
	MOVF       _texto+2, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;EC03_1.c,48 :: 		Lcd_Chr_Cp('%');
	MOVLW      37
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;EC03_1.c,50 :: 		}
	GOTO       L_main0
;EC03_1.c,52 :: 		delay_ms(200);
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;EC03_1.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
