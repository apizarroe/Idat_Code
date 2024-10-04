
_main:

;Teclado_AV.c,20 :: 		void main() {
;Teclado_AV.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Teclado_AV.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teclado_AV.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Teclado_AV.c,24 :: 		Lcd_Out(1, 1, "Porcentaje: 00%");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Teclado_AV+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Teclado_AV.c,25 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Teclado_AV.c,26 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Teclado_AV.c,27 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Teclado_AV.c,28 :: 		while(1){
L_main0:
;Teclado_AV.c,29 :: 		do
L_main2:
;Teclado_AV.c,30 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;Teclado_AV.c,31 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Teclado_AV.c,33 :: 		switch (kp) {
	GOTO       L_main5
;Teclado_AV.c,34 :: 		case  1: kp = '7'; break; // 1        // Uncomment this block for keypad4x4
L_main7:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,35 :: 		case  2: kp = '4'; break; // 2
L_main8:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,36 :: 		case  3: kp = '1'; break; // 3
L_main9:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,37 :: 		case  5: kp = '8'; break; // 4
L_main10:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,38 :: 		case  6: kp = '5'; break; // 5
L_main11:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,39 :: 		case  7: kp = '2'; break; // 6
L_main12:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,40 :: 		case  8: kp = '0'; break; // B
L_main13:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,41 :: 		case  9: kp = '9'; break; // 7
L_main14:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,42 :: 		case 10: kp = '6'; break; // 8
L_main15:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,43 :: 		case 11: kp = '3'; break; // 9
L_main16:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_main6
;Teclado_AV.c,44 :: 		}
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
;Teclado_AV.c,45 :: 		Lcd_Chr(1, 13, kp);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Teclado_AV.c,47 :: 		valortecla = kp - 48;
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _valortecla+0
;Teclado_AV.c,48 :: 		valordutty = valortecla * 25.5;
	CALL       _byte2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      76
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      _valordutty+0
;Teclado_AV.c,49 :: 		PWM1_Set_Duty(valordutty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;Teclado_AV.c,50 :: 		}
	GOTO       L_main0
;Teclado_AV.c,51 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
