
_main:

;I2C_2.c,1 :: 		void main() {
;I2C_2.c,2 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2C_2.c,3 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C_2.c,4 :: 		I2C1_Wr(0xA0); //Memoria: 1010000 0
	MOVLW      160
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,5 :: 		I2C1_Wr(0x20);
	MOVLW      32
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,6 :: 		I2C1_Wr('A');
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,7 :: 		I2C1_Wr('L');
	MOVLW      76
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,8 :: 		I2C1_Wr('D');
	MOVLW      68
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,9 :: 		I2C1_Wr('O');
	MOVLW      79
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,10 :: 		I2C1_Wr(' ');
	MOVLW      32
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,11 :: 		I2C1_Wr('P');
	MOVLW      80
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,12 :: 		I2C1_Wr('I');
	MOVLW      73
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,13 :: 		I2C1_Wr('Z');
	MOVLW      90
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,14 :: 		I2C1_Wr('A');
	MOVLW      65
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,15 :: 		I2C1_Wr('R');
	MOVLW      82
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,16 :: 		I2C1_Wr('R');
	MOVLW      82
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,17 :: 		I2C1_Wr('O');
	MOVLW      79
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C_2.c,18 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C_2.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
