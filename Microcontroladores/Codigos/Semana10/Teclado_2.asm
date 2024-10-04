
_main:

;Teclado_2.c,20 :: 		void main() {
;Teclado_2.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Teclado_2.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teclado_2.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teclado_2.c,24 :: 		Lcd_Out(1, 1, "Tecla:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Teclado_2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teclado_2.c,25 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Teclado_2.c,26 :: 		while(1){
L_main0:
;Teclado_2.c,27 :: 		do
L_main2:
;Teclado_2.c,28 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Teclado_2.c,29 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Teclado_2.c,31 :: 		switch (kp) {
	GOTO       L_main5
;Teclado_2.c,32 :: 		case  1: kp = '7'; break; // 1        // Uncomment this block for keypad4x4
L_main7:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,33 :: 		case  2: kp = '4'; break; // 2
L_main8:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,34 :: 		case  3: kp = '1'; break; // 3
L_main9:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,35 :: 		case  5: kp = '8'; break; // 4
L_main10:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,36 :: 		case  6: kp = '5'; break; // 5
L_main11:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,37 :: 		case  7: kp = '2'; break; // 6
L_main12:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,38 :: 		case  8: kp = '0'; break; // B
L_main13:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,39 :: 		case  9: kp = '9'; break; // 7
L_main14:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,40 :: 		case 10: kp = '6'; break; // 8
L_main15:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,41 :: 		case 11: kp = '3'; break; // 9
L_main16:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_2.c,42 :: 		}
L_main5:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_main9
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_main16
L_main6:
;Teclado_2.c,43 :: 		Lcd_Chr(2, 1, kp);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Teclado_2.c,44 :: 		}
	GOTO       L_main0
;Teclado_2.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
