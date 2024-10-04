
_I2C_LCD_Cmd:

;lib_i2c_lcd.h,40 :: 		void I2C_LCD_Cmd(char out_char) {
;lib_i2c_lcd.h,44 :: 		byte = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      I2C_LCD_Cmd_byte_L0+0
;lib_i2c_lcd.h,46 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lib_i2c_lcd.h,47 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,48 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,49 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,51 :: 		byte.F0 = 0;
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
;lib_i2c_lcd.h,52 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Cmd_byte_L0+0, 2
;lib_i2c_lcd.h,53 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Cmd_byte_L0+0, 3
;lib_i2c_lcd.h,54 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Cmd_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,55 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,56 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Cmd_byte_L0+0, 2
;lib_i2c_lcd.h,57 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Cmd_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,58 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,60 :: 		byte = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	MOVWF      I2C_LCD_Cmd_byte_L0+0
	RLF        I2C_LCD_Cmd_byte_L0+0, 1
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
	RLF        I2C_LCD_Cmd_byte_L0+0, 1
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
	RLF        I2C_LCD_Cmd_byte_L0+0, 1
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
	RLF        I2C_LCD_Cmd_byte_L0+0, 1
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Cmd_byte_L0+0, 1
;lib_i2c_lcd.h,62 :: 		byte.F0 = 0;
	BCF        I2C_LCD_Cmd_byte_L0+0, 0
;lib_i2c_lcd.h,63 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Cmd_byte_L0+0, 2
;lib_i2c_lcd.h,64 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Cmd_byte_L0+0, 3
;lib_i2c_lcd.h,65 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Cmd_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,66 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,67 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Cmd_byte_L0+0, 2
;lib_i2c_lcd.h,68 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Cmd_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,69 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,70 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lib_i2c_lcd.h,72 :: 		if(out_char == 0x01)Delay_ms(2);
	MOVF       FARG_I2C_LCD_Cmd_out_char+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_I2C_LCD_Cmd0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_I2C_LCD_Cmd1:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Cmd1
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Cmd1
	NOP
	NOP
L_I2C_LCD_Cmd0:
;lib_i2c_lcd.h,73 :: 		}
L_end_I2C_LCD_Cmd:
	RETURN
; end of _I2C_LCD_Cmd

_I2C_LCD_Chr:

;lib_i2c_lcd.h,75 :: 		void I2C_LCD_Chr(char row, char column, char out_char) {
;lib_i2c_lcd.h,79 :: 		switch(row){
	GOTO       L_I2C_LCD_Chr2
;lib_i2c_lcd.h,81 :: 		case 1:
L_I2C_LCD_Chr4:
;lib_i2c_lcd.h,82 :: 		I2C_LCD_Cmd(0x80 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      128
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,83 :: 		break;
	GOTO       L_I2C_LCD_Chr3
;lib_i2c_lcd.h,84 :: 		case 2:
L_I2C_LCD_Chr5:
;lib_i2c_lcd.h,85 :: 		I2C_LCD_Cmd(0xC0 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      192
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,86 :: 		break;
	GOTO       L_I2C_LCD_Chr3
;lib_i2c_lcd.h,87 :: 		case 3:
L_I2C_LCD_Chr6:
;lib_i2c_lcd.h,88 :: 		I2C_LCD_Cmd(0x94 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      148
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,89 :: 		break;
	GOTO       L_I2C_LCD_Chr3
;lib_i2c_lcd.h,90 :: 		case 4:
L_I2C_LCD_Chr7:
;lib_i2c_lcd.h,91 :: 		I2C_LCD_Cmd(0xD4 + (column - 1));
	DECF       FARG_I2C_LCD_Chr_column+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDLW      212
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,92 :: 		break;
	GOTO       L_I2C_LCD_Chr3
;lib_i2c_lcd.h,93 :: 		};
L_I2C_LCD_Chr2:
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr4
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr5
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr6
	MOVF       FARG_I2C_LCD_Chr_row+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Chr7
L_I2C_LCD_Chr3:
;lib_i2c_lcd.h,95 :: 		byte = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      I2C_LCD_Chr_byte_L0+0
;lib_i2c_lcd.h,97 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lib_i2c_lcd.h,98 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,99 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,100 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,102 :: 		byte.F0 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 0
;lib_i2c_lcd.h,103 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 2
;lib_i2c_lcd.h,104 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 3
;lib_i2c_lcd.h,105 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,106 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,107 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Chr_byte_L0+0, 2
;lib_i2c_lcd.h,108 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,109 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,111 :: 		byte = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Chr_out_char+0, 0
	MOVWF      I2C_LCD_Chr_byte_L0+0
	RLF        I2C_LCD_Chr_byte_L0+0, 1
	BCF        I2C_LCD_Chr_byte_L0+0, 0
	RLF        I2C_LCD_Chr_byte_L0+0, 1
	BCF        I2C_LCD_Chr_byte_L0+0, 0
	RLF        I2C_LCD_Chr_byte_L0+0, 1
	BCF        I2C_LCD_Chr_byte_L0+0, 0
	RLF        I2C_LCD_Chr_byte_L0+0, 1
	BCF        I2C_LCD_Chr_byte_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Chr_byte_L0+0, 1
;lib_i2c_lcd.h,113 :: 		byte.F0 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 0
;lib_i2c_lcd.h,114 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 2
;lib_i2c_lcd.h,115 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Chr_byte_L0+0, 3
;lib_i2c_lcd.h,116 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,117 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,118 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Chr_byte_L0+0, 2
;lib_i2c_lcd.h,119 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,120 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,122 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lib_i2c_lcd.h,123 :: 		}
L_end_I2C_LCD_Chr:
	RETURN
; end of _I2C_LCD_Chr

_I2C_LCD_Chr_Cp:

;lib_i2c_lcd.h,125 :: 		void I2C_LCD_Chr_Cp(char out_char) {
;lib_i2c_lcd.h,129 :: 		byte = out_char & 0xF0;
	MOVLW      240
	ANDWF      FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      I2C_LCD_Chr_Cp_byte_L0+0
;lib_i2c_lcd.h,131 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lib_i2c_lcd.h,132 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,133 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,134 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,136 :: 		byte.F0 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 0
;lib_i2c_lcd.h,137 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 2
;lib_i2c_lcd.h,138 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 3
;lib_i2c_lcd.h,139 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_Cp_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,140 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,141 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 2
;lib_i2c_lcd.h,142 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_Cp_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,143 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,145 :: 		byte = (out_char << 4) & 0xF0;
	MOVF       FARG_I2C_LCD_Chr_Cp_out_char+0, 0
	MOVWF      I2C_LCD_Chr_Cp_byte_L0+0
	RLF        I2C_LCD_Chr_Cp_byte_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_byte_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_byte_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 0
	RLF        I2C_LCD_Chr_Cp_byte_L0+0, 1
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 0
	MOVLW      240
	ANDWF      I2C_LCD_Chr_Cp_byte_L0+0, 1
;lib_i2c_lcd.h,147 :: 		byte.F0 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 0
;lib_i2c_lcd.h,148 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 2
;lib_i2c_lcd.h,149 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Chr_Cp_byte_L0+0, 3
;lib_i2c_lcd.h,150 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_Cp_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,151 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,152 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Chr_Cp_byte_L0+0, 2
;lib_i2c_lcd.h,153 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Chr_Cp_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,154 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,156 :: 		I2C1_stop();
	CALL       _I2C1_Stop+0
;lib_i2c_lcd.h,157 :: 		}
L_end_I2C_LCD_Chr_Cp:
	RETURN
; end of _I2C_LCD_Chr_Cp

_I2C_LCD_Init:

;lib_i2c_lcd.h,160 :: 		void I2C_LCD_Init() {
;lib_i2c_lcd.h,164 :: 		Delay_ms(150);
	MOVLW      195
	MOVWF      R12+0
	MOVLW      205
	MOVWF      R13+0
L_I2C_LCD_Init8:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init8
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init8
;lib_i2c_lcd.h,166 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;lib_i2c_lcd.h,167 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,168 :: 		I2C1_Wr(LCD_ADDR);
	MOVLW      78
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,169 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,171 :: 		Delay_ms(30);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_I2C_LCD_Init9:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init9
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init9
;lib_i2c_lcd.h,173 :: 		byte = 0x30;
	MOVLW      48
	MOVWF      I2C_LCD_Init_byte_L0+0
;lib_i2c_lcd.h,174 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 3
;lib_i2c_lcd.h,176 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,177 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,178 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,179 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,180 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,181 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,183 :: 		Delay_ms(30);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_I2C_LCD_Init10:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init10
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init10
;lib_i2c_lcd.h,185 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,186 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,187 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,188 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,189 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,190 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,192 :: 		Delay_ms(30);
	MOVLW      39
	MOVWF      R12+0
	MOVLW      245
	MOVWF      R13+0
L_I2C_LCD_Init11:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init11
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init11
;lib_i2c_lcd.h,194 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,195 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,196 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,197 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,198 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,199 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,201 :: 		Delay_ms(20);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_I2C_LCD_Init12:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init12
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init12
	NOP
;lib_i2c_lcd.h,203 :: 		byte = 0x20;
	MOVLW      32
	MOVWF      I2C_LCD_Init_byte_L0+0
;lib_i2c_lcd.h,204 :: 		byte.F3 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 3
;lib_i2c_lcd.h,206 :: 		byte.F2 = 1;
	BSF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,207 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,208 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,209 :: 		byte.F2 = 0;
	BCF        I2C_LCD_Init_byte_L0+0, 2
;lib_i2c_lcd.h,210 :: 		I2C1_Wr(byte);
	MOVF       I2C_LCD_Init_byte_L0+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;lib_i2c_lcd.h,211 :: 		I2C1_Is_Idle();
	CALL       _I2C1_Is_Idle+0
;lib_i2c_lcd.h,213 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_I2C_LCD_Init13:
	DECFSZ     R13+0, 1
	GOTO       L_I2C_LCD_Init13
	DECFSZ     R12+0, 1
	GOTO       L_I2C_LCD_Init13
	NOP
	NOP
;lib_i2c_lcd.h,215 :: 		I2C_LCD_Cmd(0x28);
	MOVLW      40
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,216 :: 		I2C_LCD_Cmd(0x06);
	MOVLW      6
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;lib_i2c_lcd.h,217 :: 		}
L_end_I2C_LCD_Init:
	RETURN
; end of _I2C_LCD_Init

_I2C_LCD_Out:

;lib_i2c_lcd.h,219 :: 		void I2C_LCD_Out(char row, char col, char *text) {
;lib_i2c_lcd.h,220 :: 		while(*text)
L_I2C_LCD_Out14:
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out15
;lib_i2c_lcd.h,221 :: 		I2C_LCD_Chr(row, col++, *text++);
	MOVF       FARG_I2C_LCD_Out_row+0, 0
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVF       FARG_I2C_LCD_Out_col+0, 0
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVF       FARG_I2C_LCD_Out_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
	INCF       FARG_I2C_LCD_Out_col+0, 1
	INCF       FARG_I2C_LCD_Out_text+0, 1
	GOTO       L_I2C_LCD_Out14
L_I2C_LCD_Out15:
;lib_i2c_lcd.h,222 :: 		}
L_end_I2C_LCD_Out:
	RETURN
; end of _I2C_LCD_Out

_I2C_LCD_Out_Cp:

;lib_i2c_lcd.h,224 :: 		void I2C_LCD_Out_Cp(char *text) {
;lib_i2c_lcd.h,225 :: 		while(*text)
L_I2C_LCD_Out_Cp16:
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_I2C_LCD_Out_Cp17
;lib_i2c_lcd.h,226 :: 		I2C_LCD_Chr_Cp(*text++);
	MOVF       FARG_I2C_LCD_Out_Cp_text+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_I2C_LCD_Chr_Cp_out_char+0
	CALL       _I2C_LCD_Chr_Cp+0
	INCF       FARG_I2C_LCD_Out_Cp_text+0, 1
	GOTO       L_I2C_LCD_Out_Cp16
L_I2C_LCD_Out_Cp17:
;lib_i2c_lcd.h,227 :: 		}
L_end_I2C_LCD_Out_Cp:
	RETURN
; end of _I2C_LCD_Out_Cp

_controlVelocidadFaja:

;ProyectoFinal.c,11 :: 		void controlVelocidadFaja(){
;ProyectoFinal.c,12 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;ProyectoFinal.c,13 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal.c,14 :: 		if(PORTD.f2 == 1){
	BTFSS      PORTD+0, 2
	GOTO       L_controlVelocidadFaja18
;ProyectoFinal.c,15 :: 		if (dutty<255){
	MOVLW      128
	XORWF      _dutty+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__controlVelocidadFaja74
	MOVLW      255
	SUBWF      _dutty+0, 0
L__controlVelocidadFaja74:
	BTFSC      STATUS+0, 0
	GOTO       L_controlVelocidadFaja19
;ProyectoFinal.c,16 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal.c,17 :: 		dutty = dutty + 1;
	INCF       _dutty+0, 1
	BTFSC      STATUS+0, 2
	INCF       _dutty+1, 1
;ProyectoFinal.c,18 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_controlVelocidadFaja20:
	DECFSZ     R13+0, 1
	GOTO       L_controlVelocidadFaja20
	DECFSZ     R12+0, 1
	GOTO       L_controlVelocidadFaja20
;ProyectoFinal.c,19 :: 		}
L_controlVelocidadFaja19:
;ProyectoFinal.c,20 :: 		}
L_controlVelocidadFaja18:
;ProyectoFinal.c,21 :: 		if(PORTD.f3 == 1){
	BTFSS      PORTD+0, 3
	GOTO       L_controlVelocidadFaja21
;ProyectoFinal.c,22 :: 		if (dutty>0){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _dutty+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__controlVelocidadFaja75
	MOVF       _dutty+0, 0
	SUBLW      0
L__controlVelocidadFaja75:
	BTFSC      STATUS+0, 0
	GOTO       L_controlVelocidadFaja22
;ProyectoFinal.c,23 :: 		PWM1_Set_Duty(dutty);
	MOVF       _dutty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal.c,24 :: 		dutty = dutty - 1;
	MOVLW      1
	SUBWF      _dutty+0, 1
	BTFSS      STATUS+0, 0
	DECF       _dutty+1, 1
;ProyectoFinal.c,25 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_controlVelocidadFaja23:
	DECFSZ     R13+0, 1
	GOTO       L_controlVelocidadFaja23
	DECFSZ     R12+0, 1
	GOTO       L_controlVelocidadFaja23
;ProyectoFinal.c,26 :: 		}
L_controlVelocidadFaja22:
;ProyectoFinal.c,27 :: 		}
L_controlVelocidadFaja21:
;ProyectoFinal.c,28 :: 		}
L_end_controlVelocidadFaja:
	RETURN
; end of _controlVelocidadFaja

_ingresoPeso:

;ProyectoFinal.c,30 :: 		void ingresoPeso(){
;ProyectoFinal.c,31 :: 		do
L_ingresoPeso24:
;ProyectoFinal.c,32 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;ProyectoFinal.c,33 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso24
;ProyectoFinal.c,35 :: 		if(kp == 4){
	MOVF       _kp+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_ingresoPeso27
;ProyectoFinal.c,36 :: 		for(i=1; i<5; i++){
	MOVLW      1
	MOVWF      _i+0
	MOVLW      0
	MOVWF      _i+1
L_ingresoPeso28:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso77
	MOVLW      5
	SUBWF      _i+0, 0
L__ingresoPeso77:
	BTFSC      STATUS+0, 0
	GOTO       L_ingresoPeso29
;ProyectoFinal.c,37 :: 		do
L_ingresoPeso31:
;ProyectoFinal.c,38 :: 		kp = Keypad_Key_Click();
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;ProyectoFinal.c,39 :: 		while (!kp);
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso31
;ProyectoFinal.c,41 :: 		switch (kp) {
	GOTO       L_ingresoPeso34
;ProyectoFinal.c,42 :: 		case  1: kp = '7'; break; // 1
L_ingresoPeso36:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,43 :: 		case  2: kp = '4'; break; // 2
L_ingresoPeso37:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,44 :: 		case  3: kp = '1'; break; // 3
L_ingresoPeso38:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,45 :: 		case  5: kp = '8'; break; // 4
L_ingresoPeso39:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,46 :: 		case  6: kp = '5'; break; // 5
L_ingresoPeso40:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,47 :: 		case  7: kp = '2'; break; // 6
L_ingresoPeso41:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,48 :: 		case  8: kp = '0'; break; // B
L_ingresoPeso42:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,49 :: 		case  9: kp = '9'; break; // 7
L_ingresoPeso43:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,50 :: 		case 10: kp = '6'; break; // 8
L_ingresoPeso44:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,51 :: 		case 11: kp = '3'; break; // 9
L_ingresoPeso45:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_ingresoPeso35
;ProyectoFinal.c,52 :: 		}
L_ingresoPeso34:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso36
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso37
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso38
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso39
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso40
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso41
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso42
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso43
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso44
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso45
L_ingresoPeso35:
;ProyectoFinal.c,53 :: 		I2C_Lcd_Chr(1, i+9, kp);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Chr_row+0
	MOVLW      9
	ADDWF      _i+0, 0
	MOVWF      FARG_I2C_LCD_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_I2C_LCD_Chr_out_char+0
	CALL       _I2C_LCD_Chr+0
;ProyectoFinal.c,54 :: 		cadena[i-1] = kp;
	MOVLW      1
	SUBWF      _i+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _i+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	ADDLW      _cadena+0
	MOVWF      FSR
	MOVF       _kp+0, 0
	MOVWF      INDF+0
;ProyectoFinal.c,55 :: 		if(i == 1){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso78
	MOVLW      1
	XORWF      _i+0, 0
L__ingresoPeso78:
	BTFSS      STATUS+0, 2
	GOTO       L_ingresoPeso46
;ProyectoFinal.c,56 :: 		miles = kp-48;
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      _miles+0
	CLRF       _miles+1
	BTFSS      STATUS+0, 0
	DECF       _miles+1, 1
;ProyectoFinal.c,57 :: 		}
L_ingresoPeso46:
;ProyectoFinal.c,58 :: 		if(i == 2){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso79
	MOVLW      2
	XORWF      _i+0, 0
L__ingresoPeso79:
	BTFSS      STATUS+0, 2
	GOTO       L_ingresoPeso47
;ProyectoFinal.c,59 :: 		cent = kp-48;
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      _cent+0
	CLRF       _cent+1
	BTFSS      STATUS+0, 0
	DECF       _cent+1, 1
;ProyectoFinal.c,60 :: 		}
L_ingresoPeso47:
;ProyectoFinal.c,61 :: 		if(i == 3){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso80
	MOVLW      3
	XORWF      _i+0, 0
L__ingresoPeso80:
	BTFSS      STATUS+0, 2
	GOTO       L_ingresoPeso48
;ProyectoFinal.c,62 :: 		dec = kp-48;
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      _dec+0
	CLRF       _dec+1
	BTFSS      STATUS+0, 0
	DECF       _dec+1, 1
;ProyectoFinal.c,63 :: 		}
L_ingresoPeso48:
;ProyectoFinal.c,64 :: 		if(i == 4){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso81
	MOVLW      4
	XORWF      _i+0, 0
L__ingresoPeso81:
	BTFSS      STATUS+0, 2
	GOTO       L_ingresoPeso49
;ProyectoFinal.c,65 :: 		und = kp-48;
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      _und+0
	CLRF       _und+1
	BTFSS      STATUS+0, 0
	DECF       _und+1, 1
;ProyectoFinal.c,66 :: 		}
L_ingresoPeso49:
;ProyectoFinal.c,36 :: 		for(i=1; i<5; i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ProyectoFinal.c,67 :: 		}
	GOTO       L_ingresoPeso28
L_ingresoPeso29:
;ProyectoFinal.c,68 :: 		peso_ingresado = miles*1000+cent*100+dec*10+und;
	MOVF       _miles+0, 0
	MOVWF      R0+0
	MOVF       _miles+1, 0
	MOVWF      R0+1
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__ingresoPeso+0
	MOVF       R0+1, 0
	MOVWF      FLOC__ingresoPeso+1
	MOVF       _cent+0, 0
	MOVWF      R0+0
	MOVF       _cent+1, 0
	MOVWF      R0+1
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDWF      FLOC__ingresoPeso+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FLOC__ingresoPeso+1, 1
	MOVF       _dec+0, 0
	MOVWF      R0+0
	MOVF       _dec+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       FLOC__ingresoPeso+0, 0
	ADDWF      R0+0, 1
	MOVF       FLOC__ingresoPeso+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _und+0, 0
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _und+1, 0
	MOVWF      R2+1
	MOVF       R2+0, 0
	MOVWF      _peso_ingresado+0
	MOVF       R2+1, 0
	MOVWF      _peso_ingresado+1
;ProyectoFinal.c,69 :: 		if(peso_ingresado <= 500 | peso_ingresado >= 2000){
	MOVF       R2+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso82
	MOVF       R2+0, 0
	SUBLW      244
L__ingresoPeso82:
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVLW      7
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__ingresoPeso83
	MOVLW      208
	SUBWF      R2+0, 0
L__ingresoPeso83:
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R1+0, 0
	IORWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_ingresoPeso50
;ProyectoFinal.c,70 :: 		I2C_LCD_Out(1,1,"Lote de: 0000Kg");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr1_ProyectoFinal+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;ProyectoFinal.c,71 :: 		peso_ingresado = 0;
	CLRF       _peso_ingresado+0
	CLRF       _peso_ingresado+1
;ProyectoFinal.c,72 :: 		}
L_ingresoPeso50:
;ProyectoFinal.c,73 :: 		peso_silicio = (peso_ingresado/4)*3;
	MOVF       _peso_ingresado+0, 0
	MOVWF      FLOC__ingresoPeso+0
	MOVF       _peso_ingresado+1, 0
	MOVWF      FLOC__ingresoPeso+1
	RRF        FLOC__ingresoPeso+1, 1
	RRF        FLOC__ingresoPeso+0, 1
	BCF        FLOC__ingresoPeso+1, 7
	RRF        FLOC__ingresoPeso+1, 1
	RRF        FLOC__ingresoPeso+0, 1
	BCF        FLOC__ingresoPeso+1, 7
	MOVF       FLOC__ingresoPeso+0, 0
	MOVWF      R0+0
	MOVF       FLOC__ingresoPeso+1, 0
	MOVWF      R0+1
	MOVLW      3
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _peso_silicio+0
	MOVF       R0+1, 0
	MOVWF      _peso_silicio+1
	MOVF       R0+2, 0
	MOVWF      _peso_silicio+2
	MOVF       R0+3, 0
	MOVWF      _peso_silicio+3
;ProyectoFinal.c,74 :: 		peso_carbon = (peso_ingresado/4)*1;
	MOVF       FLOC__ingresoPeso+0, 0
	MOVWF      R0+0
	MOVF       FLOC__ingresoPeso+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      _peso_carbon+0
	MOVF       R0+1, 0
	MOVWF      _peso_carbon+1
	MOVF       R0+2, 0
	MOVWF      _peso_carbon+2
	MOVF       R0+3, 0
	MOVWF      _peso_carbon+3
;ProyectoFinal.c,75 :: 		}
L_ingresoPeso27:
;ProyectoFinal.c,76 :: 		}
L_end_ingresoPeso:
	RETURN
; end of _ingresoPeso

_llenado_Horno:

;ProyectoFinal.c,78 :: 		void llenado_Horno(){
;ProyectoFinal.c,79 :: 		if(flg_llenado == 0){
	MOVF       _flg_llenado+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_llenado_Horno51
;ProyectoFinal.c,80 :: 		lectura_peso_ADC = ADC_Get_Sample(1);
	MOVLW      1
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_peso_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_peso_ADC+1
;ProyectoFinal.c,81 :: 		peso_ADC = lectura_peso_ADC * 2;
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RLF        R2+0, 1
	RLF        R2+1, 1
	BCF        R2+0, 0
	MOVF       R2+0, 0
	MOVWF      _peso_ADC+0
	MOVF       R2+1, 0
	MOVWF      _peso_ADC+1
;ProyectoFinal.c,82 :: 		IntToStr(peso_ADC, txtpeso);
	MOVF       R2+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R2+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txtpeso+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ProyectoFinal.c,83 :: 		I2C_Lcd_Out(2,9,txtpeso);
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      9
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      _txtpeso+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;ProyectoFinal.c,84 :: 		if(peso_ADC < peso_silicio){
	MOVF       _peso_ADC+0, 0
	MOVWF      R0+0
	MOVF       _peso_ADC+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       _peso_silicio+0, 0
	MOVWF      R4+0
	MOVF       _peso_silicio+1, 0
	MOVWF      R4+1
	MOVF       _peso_silicio+2, 0
	MOVWF      R4+2
	MOVF       _peso_silicio+3, 0
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_llenado_Horno52
;ProyectoFinal.c,85 :: 		PORTD.f0=1;
	BSF        PORTD+0, 0
;ProyectoFinal.c,86 :: 		} else {
	GOTO       L_llenado_Horno53
L_llenado_Horno52:
;ProyectoFinal.c,87 :: 		PORTD.f0=0;
	BCF        PORTD+0, 0
;ProyectoFinal.c,88 :: 		}
L_llenado_Horno53:
;ProyectoFinal.c,89 :: 		if(peso_ADC > peso_silicio & peso_ADC < peso_ingresado){
	MOVF       _peso_ADC+0, 0
	MOVWF      R0+0
	MOVF       _peso_ADC+1, 0
	MOVWF      R0+1
	CALL       _word2double+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVF       _peso_silicio+0, 0
	MOVWF      R0+0
	MOVF       _peso_silicio+1, 0
	MOVWF      R0+1
	MOVF       _peso_silicio+2, 0
	MOVWF      R0+2
	MOVF       _peso_silicio+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       _peso_ingresado+1, 0
	SUBWF      _peso_ADC+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__llenado_Horno85
	MOVF       _peso_ingresado+0, 0
	SUBWF      _peso_ADC+0, 0
L__llenado_Horno85:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1+0
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_llenado_Horno54
;ProyectoFinal.c,90 :: 		PORTD.f1=1;
	BSF        PORTD+0, 1
;ProyectoFinal.c,91 :: 		} else {
	GOTO       L_llenado_Horno55
L_llenado_Horno54:
;ProyectoFinal.c,92 :: 		PORTD.f1=0;
	BCF        PORTD+0, 1
;ProyectoFinal.c,93 :: 		}
L_llenado_Horno55:
;ProyectoFinal.c,94 :: 		if(peso_ADC > peso_ingresado){
	MOVF       _peso_ADC+1, 0
	SUBWF      _peso_ingresado+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__llenado_Horno86
	MOVF       _peso_ADC+0, 0
	SUBWF      _peso_ingresado+0, 0
L__llenado_Horno86:
	BTFSC      STATUS+0, 0
	GOTO       L_llenado_Horno56
;ProyectoFinal.c,95 :: 		flg_llenado = 1;
	MOVLW      1
	MOVWF      _flg_llenado+0
;ProyectoFinal.c,96 :: 		}
L_llenado_Horno56:
;ProyectoFinal.c,97 :: 		}
L_llenado_Horno51:
;ProyectoFinal.c,98 :: 		}
L_end_llenado_Horno:
	RETURN
; end of _llenado_Horno

_control_Electrodo:

;ProyectoFinal.c,100 :: 		void control_Electrodo(){
;ProyectoFinal.c,101 :: 		lectura_electrodo_ADC = ADC_Get_Sample(0);
	CLRF       FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_electrodo_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_electrodo_ADC+1
;ProyectoFinal.c,102 :: 		pot_elect = (lectura_electrodo_ADC/1024.0)*255.0;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      134
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2int+0
	MOVF       R0+0, 0
	MOVWF      _pot_elect+0
	MOVF       R0+1, 0
	MOVWF      _pot_elect+1
;ProyectoFinal.c,103 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;ProyectoFinal.c,104 :: 		PWM2_Set_Duty(pot_elect);
	MOVF       _pot_elect+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ProyectoFinal.c,105 :: 		lectura_temp_ADC = ADC_Get_Sample(2);
	MOVLW      2
	MOVWF      FARG_ADC_Get_Sample_channel+0
	CALL       _ADC_Get_Sample+0
	MOVF       R0+0, 0
	MOVWF      _lectura_temp_ADC+0
	MOVF       R0+1, 0
	MOVWF      _lectura_temp_ADC+1
;ProyectoFinal.c,106 :: 		if(lectura_temp_ADC >= 750){
	MOVLW      2
	SUBWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__control_Electrodo88
	MOVLW      238
	SUBWF      R0+0, 0
L__control_Electrodo88:
	BTFSS      STATUS+0, 0
	GOTO       L_control_Electrodo57
;ProyectoFinal.c,107 :: 		flg_temp_limite = 1;
	MOVLW      1
	MOVWF      _flg_temp_limite+0
;ProyectoFinal.c,108 :: 		}
L_control_Electrodo57:
;ProyectoFinal.c,109 :: 		}
L_end_control_Electrodo:
	RETURN
; end of _control_Electrodo

_vaciado_Material:

;ProyectoFinal.c,111 :: 		void vaciado_Material(){
;ProyectoFinal.c,112 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;ProyectoFinal.c,114 :: 		PORTC.f5 = 0;
	BCF        PORTC+0, 5
;ProyectoFinal.c,115 :: 		PORTD.f5 = 1;
	BSF        PORTD+0, 5
;ProyectoFinal.c,116 :: 		controlVelocidadFaja();
	CALL       _controlVelocidadFaja+0
;ProyectoFinal.c,118 :: 		if(PORTD.f6 == 1){
	BTFSS      PORTD+0, 6
	GOTO       L_vaciado_Material58
;ProyectoFinal.c,119 :: 		flg_fin = 1;
	MOVLW      1
	MOVWF      _flg_fin+0
;ProyectoFinal.c,120 :: 		}
L_vaciado_Material58:
;ProyectoFinal.c,121 :: 		}
L_end_vaciado_Material:
	RETURN
; end of _vaciado_Material

_main:

;ProyectoFinal.c,123 :: 		void main() {
;ProyectoFinal.c,125 :: 		TRISC = 0b00000000;
	CLRF       TRISC+0
;ProyectoFinal.c,126 :: 		PORTC = 0b10100000;
	MOVLW      160
	MOVWF      PORTC+0
;ProyectoFinal.c,127 :: 		TRISD = 0b01011100;
	MOVLW      92
	MOVWF      TRISD+0
;ProyectoFinal.c,128 :: 		PORTD = 0b00000000;
	CLRF       PORTD+0
;ProyectoFinal.c,130 :: 		PWM1_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ProyectoFinal.c,131 :: 		PWM2_Init(5000);
	BCF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      199
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;ProyectoFinal.c,133 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;ProyectoFinal.c,134 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;ProyectoFinal.c,136 :: 		I2C_LCD_Init();
	CALL       _I2C_LCD_Init+0
;ProyectoFinal.c,137 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;ProyectoFinal.c,138 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;ProyectoFinal.c,140 :: 		I2C_LCD_Out(1,1,"Lote de: 0000Kg");
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr2_ProyectoFinal+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;ProyectoFinal.c,141 :: 		I2C_LCD_Out(2,1,"Actual:   0000Kg");
	MOVLW      2
	MOVWF      FARG_I2C_LCD_Out_row+0
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Out_col+0
	MOVLW      ?lstr3_ProyectoFinal+0
	MOVWF      FARG_I2C_LCD_Out_text+0
	CALL       _I2C_LCD_Out+0
;ProyectoFinal.c,143 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;ProyectoFinal.c,144 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ProyectoFinal.c,146 :: 		while(1){
L_main59:
;ProyectoFinal.c,147 :: 		ingresoPeso();
	CALL       _ingresoPeso+0
;ProyectoFinal.c,149 :: 		while(1){
L_main61:
;ProyectoFinal.c,150 :: 		if(peso_ingresado != 0){
	MOVLW      0
	XORWF      _peso_ingresado+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      0
	XORWF      _peso_ingresado+0, 0
L__main91:
	BTFSC      STATUS+0, 2
	GOTO       L_main63
;ProyectoFinal.c,151 :: 		llenado_Horno();
	CALL       _llenado_Horno+0
;ProyectoFinal.c,153 :: 		if(PORTD.f4 == 1 & flg_llenado == 1){
	BTFSC      PORTD+0, 4
	GOTO       L__main92
	BCF        114, 0
	GOTO       L__main93
L__main92:
	BSF        114, 0
L__main93:
	MOVF       _flg_llenado+0, 0
	XORLW      1
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main64
;ProyectoFinal.c,154 :: 		control_Electrodo();
	CALL       _control_Electrodo+0
;ProyectoFinal.c,155 :: 		if(flg_temp_limite == 1){
	MOVF       _flg_temp_limite+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main65
;ProyectoFinal.c,156 :: 		vaciado_Material();
	CALL       _vaciado_Material+0
;ProyectoFinal.c,157 :: 		}
L_main65:
;ProyectoFinal.c,159 :: 		if(PORTD.f6 == 0 & flg_fin == 1){
	BTFSC      PORTD+0, 6
	GOTO       L__main94
	BSF        114, 0
	GOTO       L__main95
L__main94:
	BCF        114, 0
L__main95:
	MOVF       _flg_fin+0, 0
	XORLW      1
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1+0
	CLRF       R0+0
	BTFSC      114, 0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	ANDWF      R0+0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main66
;ProyectoFinal.c,160 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal.c,162 :: 		PORTC.f7 = 0;
	BCF        PORTC+0, 7
;ProyectoFinal.c,163 :: 		PORTD.f5 = 0;
	BCF        PORTD+0, 5
;ProyectoFinal.c,164 :: 		flg_llenado = 0;
	CLRF       _flg_llenado+0
;ProyectoFinal.c,165 :: 		flg_temp_limite = 0;
	CLRF       _flg_temp_limite+0
;ProyectoFinal.c,166 :: 		flg_fin = 0;
	CLRF       _flg_fin+0
;ProyectoFinal.c,167 :: 		peso_ingresado = 0;
	CLRF       _peso_ingresado+0
	CLRF       _peso_ingresado+1
;ProyectoFinal.c,168 :: 		PORTC = 0b10100000;
	MOVLW      160
	MOVWF      PORTC+0
;ProyectoFinal.c,169 :: 		break;
	GOTO       L_main62
;ProyectoFinal.c,170 :: 		}
L_main66:
;ProyectoFinal.c,171 :: 		}
L_main64:
;ProyectoFinal.c,172 :: 		}
L_main63:
;ProyectoFinal.c,173 :: 		}
	GOTO       L_main61
L_main62:
;ProyectoFinal.c,174 :: 		}
	GOTO       L_main59
;ProyectoFinal.c,176 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
