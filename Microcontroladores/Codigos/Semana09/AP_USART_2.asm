
_main:

;AP_USART_2.c,1 :: 		void main() {
;AP_USART_2.c,2 :: 		TRISC.f5 = 0;
	BCF        TRISC+0, 5
;AP_USART_2.c,3 :: 		PORTC.f5 = 0;
	BCF        PORTC+0, 5
;AP_USART_2.c,4 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;AP_USART_2.c,5 :: 		PORTC.f5 = 1;
	BSF        PORTC+0, 5
;AP_USART_2.c,6 :: 		UART1_Write_Text("Aldo Pizarro");
	MOVLW      ?lstr1_AP_USART_2+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;AP_USART_2.c,7 :: 		while(UART1_Tx_Idle() == 0){
L_main0:
	CALL       _UART1_Tx_Idle+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main1
;AP_USART_2.c,8 :: 		} //or while(UART1_Tx_Idle() == 0);
	GOTO       L_main0
L_main1:
;AP_USART_2.c,9 :: 		PORTC.f5 = 0;
	BCF        PORTC+0, 5
;AP_USART_2.c,10 :: 		while(1){
L_main2:
;AP_USART_2.c,11 :: 		}
	GOTO       L_main2
;AP_USART_2.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
