
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

_main:

;I2C_LCD_1.c,3 :: 		void main() {
;I2C_LCD_1.c,5 :: 		I2C1_Init(100000);
	MOVLW      10
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;I2C_LCD_1.c,6 :: 		I2C_LCD_Init();
	CALL       _I2C_LCD_Init+0
;I2C_LCD_1.c,7 :: 		I2C_LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;I2C_LCD_1.c,8 :: 		I2C_LCD_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_I2C_LCD_Cmd_out_char+0
	CALL       _I2C_LCD_Cmd+0
;I2C_LCD_1.c,9 :: 		I2C_LCD_Out_Cp("Hola mundo");
	MOVLW      ?lstr1_I2C_LCD_1+0
	MOVWF      FARG_I2C_LCD_Out_Cp_text+0
	CALL       _I2C_LCD_Out_Cp+0
;I2C_LCD_1.c,10 :: 		while(1){}
L_main18:
	GOTO       L_main18
;I2C_LCD_1.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
