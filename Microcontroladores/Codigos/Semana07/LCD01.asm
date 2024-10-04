
_main:

;LCD01.c,18 :: 		void main() {
;LCD01.c,19 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD01.c,20 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD01.c,21 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD01.c,22 :: 		Lcd_Out(1, 3, "Aldo Pizarro");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD01.c,23 :: 		while(1){
L_main0:
;LCD01.c,24 :: 		}
	GOTO       L_main0
;LCD01.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
