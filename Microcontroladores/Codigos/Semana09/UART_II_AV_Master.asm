
_main:

;UART_II_AV_Master.c,7 :: 		void main() {
;UART_II_AV_Master.c,8 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;UART_II_AV_Master.c,9 :: 		PORTB = 0b00000000;
	CLRF       PORTB+0
;UART_II_AV_Master.c,10 :: 		Trama[0] = '$';
	MOVLW      36
	MOVWF      _Trama+0
;UART_II_AV_Master.c,11 :: 		Trama[3] = ';';
	MOVLW      59
	MOVWF      _Trama+3
;UART_II_AV_Master.c,13 :: 		while(1){
L_main0:
;UART_II_AV_Master.c,14 :: 		dato1 = PORTB.f0 + 48;
	CLRF       R0+0
	BTFSC      PORTB+0, 0
	INCF       R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _dato1+0
;UART_II_AV_Master.c,15 :: 		Trama[1] = '1';
	MOVLW      49
	MOVWF      _Trama+1
;UART_II_AV_Master.c,16 :: 		Trama[2] = dato1;
	MOVF       R0+0, 0
	MOVWF      _Trama+2
;UART_II_AV_Master.c,18 :: 		for(i=0; i<=5; i++){
	CLRF       _i+0
L_main2:
	MOVLW      128
	XORLW      5
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;UART_II_AV_Master.c,19 :: 		UART1_Write(Trama[i]);
	MOVF       _i+0, 0
	ADDLW      _Trama+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART_II_AV_Master.c,18 :: 		for(i=0; i<=5; i++){
	INCF       _i+0, 1
;UART_II_AV_Master.c,20 :: 		}
	GOTO       L_main2
L_main3:
;UART_II_AV_Master.c,22 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;UART_II_AV_Master.c,24 :: 		dato2 = PORTB.f1 + 48;
	CLRF       R0+0
	BTFSC      PORTB+0, 1
	INCF       R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      _dato2+0
;UART_II_AV_Master.c,25 :: 		Trama[1] = '2';
	MOVLW      50
	MOVWF      _Trama+1
;UART_II_AV_Master.c,26 :: 		Trama[2] = dato2;
	MOVF       R0+0, 0
	MOVWF      _Trama+2
;UART_II_AV_Master.c,28 :: 		for(i=0; i<=5; i++){
	CLRF       _i+0
L_main6:
	MOVLW      128
	XORLW      5
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;UART_II_AV_Master.c,29 :: 		UART1_Write(Trama[i]);
	MOVF       _i+0, 0
	ADDLW      _Trama+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;UART_II_AV_Master.c,28 :: 		for(i=0; i<=5; i++){
	INCF       _i+0, 1
;UART_II_AV_Master.c,30 :: 		}
	GOTO       L_main6
L_main7:
;UART_II_AV_Master.c,32 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;UART_II_AV_Master.c,33 :: 		}
	GOTO       L_main0
;UART_II_AV_Master.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
