
_main:

;LCD_AV.c,20 :: 		void main() {
;LCD_AV.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD_AV.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_AV.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_AV.c,25 :: 		while(1){
L_main0:
;LCD_AV.c,26 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW      192
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_AV.c,27 :: 		for(cont=0; cont<10; cont++){
	CLRF       _cont+0
	CLRF       _cont+1
L_main2:
	MOVLW      0
	SUBWF      _cont+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      10
	SUBWF      _cont+0, 0
L__main7:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;LCD_AV.c,28 :: 		Lcd_Chr_Cp(cont+48);
	MOVLW      48
	ADDWF      _cont+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;LCD_AV.c,29 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_AV.c,30 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;LCD_AV.c,27 :: 		for(cont=0; cont<10; cont++){
	INCF       _cont+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cont+1, 1
;LCD_AV.c,31 :: 		}
	GOTO       L_main2
L_main3:
;LCD_AV.c,32 :: 		}
	GOTO       L_main0
;LCD_AV.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
