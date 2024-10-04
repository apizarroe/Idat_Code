
_main:

;AP_USART_AV.c,19 :: 		void main() {
;AP_USART_AV.c,20 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AP_USART_AV.c,21 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;AP_USART_AV.c,22 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AP_USART_AV.c,23 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;AP_USART_AV.c,24 :: 		TRISC.f5 = 0;
	BCF        TRISC+0, 5
;AP_USART_AV.c,25 :: 		PORTC.f5 = 0;
	BCF        PORTC+0, 5
;AP_USART_AV.c,27 :: 		OPTION_REG.f7 = 0;
	BCF        OPTION_REG+0, 7
;AP_USART_AV.c,30 :: 		direccion = (PORTB & 0b00000111) + 48;
	MOVLW      7
	ANDWF      PORTB+0, 0
	MOVWF      _direccion+0
	MOVLW      48
	ADDWF      _direccion+0, 1
;AP_USART_AV.c,32 :: 		Lcd_Out(1, 3, "Direccion: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_AP_USART_AV+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;AP_USART_AV.c,33 :: 		Lcd_Chr_Cp(direccion);
	MOVF       _direccion+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;AP_USART_AV.c,35 :: 		while(1){
L_main0:
;AP_USART_AV.c,37 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;AP_USART_AV.c,39 :: 		dato = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _dato+0
;AP_USART_AV.c,40 :: 		if(dato == '$'){
	MOVF       R0+0, 0
	XORLW      36
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;AP_USART_AV.c,41 :: 		Trama[0] = dato;
	MOVF       _dato+0, 0
	MOVWF      _Trama+0
;AP_USART_AV.c,42 :: 		for(i=1; i<=3;i++){
	MOVLW      1
	MOVWF      _i+0
L_main4:
	MOVF       _i+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;AP_USART_AV.c,44 :: 		while(UART1_Data_Ready() == 0){}
L_main7:
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	GOTO       L_main7
L_main8:
;AP_USART_AV.c,46 :: 		Trama[i] = UART1_Read();
	MOVF       _i+0, 0
	ADDLW      _Trama+0
	MOVWF      FLOC__main+0
	CALL       _UART1_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;AP_USART_AV.c,42 :: 		for(i=1; i<=3;i++){
	INCF       _i+0, 1
;AP_USART_AV.c,47 :: 		}
	GOTO       L_main4
L_main5:
;AP_USART_AV.c,48 :: 		}
L_main3:
;AP_USART_AV.c,49 :: 		}
L_main2:
;AP_USART_AV.c,51 :: 		if(Trama[1] == direccion){
	MOVF       _Trama+1, 0
	XORWF      _direccion+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main9
;AP_USART_AV.c,52 :: 		Lcd_Chr(2, 1, Trama[2]);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _Trama+2, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;AP_USART_AV.c,53 :: 		}
L_main9:
;AP_USART_AV.c,54 :: 		}
	GOTO       L_main0
;AP_USART_AV.c,55 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
