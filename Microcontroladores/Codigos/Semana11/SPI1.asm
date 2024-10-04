
_main:

;SPI1.c,3 :: 		void main() {
;SPI1.c,5 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;SPI1.c,6 :: 		TRISD.f0 = 0;
	BCF        TRISD+0, 0
;SPI1.c,7 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI1.c,8 :: 		cuenta = 0;
	CLRF       _cuenta+0
;SPI1.c,9 :: 		while(1){
L_main0:
;SPI1.c,10 :: 		PORTD.f0 = 0;
	BCF        PORTD+0, 0
;SPI1.c,11 :: 		SPI1_Write(cuenta);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;SPI1.c,12 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI1.c,13 :: 		cuenta ++;
	INCF       _cuenta+0, 1
;SPI1.c,14 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;SPI1.c,15 :: 		}
	GOTO       L_main0
;SPI1.c,16 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
