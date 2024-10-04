
_main:

;AP_USART_1.c,5 :: 		void main() {
;AP_USART_1.c,6 :: 		TXSTA = 0b00100100;
	MOVLW      36
	MOVWF      TXSTA+0
;AP_USART_1.c,7 :: 		RCSTA = 0b10010000;
	MOVLW      144
	MOVWF      RCSTA+0
;AP_USART_1.c,8 :: 		SPBRG = 25;
	MOVLW      25
	MOVWF      SPBRG+0
;AP_USART_1.c,9 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;AP_USART_1.c,10 :: 		PORTD = 0x00;
	CLRF       PORTD+0
;AP_USART_1.c,11 :: 		while(1){
L_main0:
;AP_USART_1.c,12 :: 		while(TXSTA.f1 == 0);
L_main2:
	BTFSC      TXSTA+0, 1
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;AP_USART_1.c,13 :: 		TXREG = PORTB;
	MOVF       PORTB+0, 0
	MOVWF      TXREG+0
;AP_USART_1.c,14 :: 		if(PIR1.f5==1){
	BTFSS      PIR1+0, 5
	GOTO       L_main4
;AP_USART_1.c,15 :: 		dato = RCREG;
	MOVF       RCREG+0, 0
	MOVWF      _dato+0
;AP_USART_1.c,17 :: 		}
L_main4:
;AP_USART_1.c,19 :: 		PORTD = D7SEG[dato];
	MOVF       _dato+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _D7SEG+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;AP_USART_1.c,20 :: 		}
	GOTO       L_main0
;AP_USART_1.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
