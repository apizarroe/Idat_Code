
_main:

;I2C_1.c,3 :: 		void main() {
;I2C_1.c,4 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2C_1.c,5 :: 		while(1){
L_main0:
;I2C_1.c,6 :: 		while(ACK != 0){
L_main2:
	MOVF       _ACK+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;I2C_1.c,7 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C_1.c,8 :: 		ACK = I2C1_Wr(direccion);
	MOVF       _direccion+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
	MOVF       R0+0, 0
	MOVWF      _ACK+0
;I2C_1.c,9 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C_1.c,10 :: 		direccion++;
	INCF       _direccion+0, 1
;I2C_1.c,11 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
;I2C_1.c,12 :: 		}
	GOTO       L_main2
L_main3:
;I2C_1.c,13 :: 		}
	GOTO       L_main0
;I2C_1.c,14 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
