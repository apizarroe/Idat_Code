
_dht22_read_byte:

;dht22.h,40 :: 		uint8_t dht22_read_byte()
;dht22.h,42 :: 		uint8_t i = 8, dht22_byte = 0;
	MOVLW      8
	MOVWF      dht22_read_byte_i_L0+0
	CLRF       dht22_read_byte_dht22_byte_L0+0
;dht22.h,43 :: 		while(i--)
L_dht22_read_byte0:
	MOVF       dht22_read_byte_i_L0+0, 0
	MOVWF      R0+0
	DECF       dht22_read_byte_i_L0+0, 1
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_dht22_read_byte1
;dht22.h,45 :: 		while( !DHT22_PIN );
L_dht22_read_byte2:
	BTFSC      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read_byte3
	GOTO       L_dht22_read_byte2
L_dht22_read_byte3:
;dht22.h,46 :: 		Delay_us(40);
	MOVLW      13
	MOVWF      R13+0
L_dht22_read_byte4:
	DECFSZ     R13+0, 1
	GOTO       L_dht22_read_byte4
;dht22.h,47 :: 		if( DHT22_PIN )
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read_byte5
;dht22.h,49 :: 		dht22_byte |= (1 << i);   // set bit i
	MOVF       dht22_read_byte_i_L0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__dht22_read_byte21:
	BTFSC      STATUS+0, 2
	GOTO       L__dht22_read_byte22
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__dht22_read_byte21
L__dht22_read_byte22:
	MOVF       R0+0, 0
	IORWF      dht22_read_byte_dht22_byte_L0+0, 1
;dht22.h,50 :: 		while( DHT22_PIN );
L_dht22_read_byte6:
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read_byte7
	GOTO       L_dht22_read_byte6
L_dht22_read_byte7:
;dht22.h,51 :: 		}
L_dht22_read_byte5:
;dht22.h,52 :: 		}
	GOTO       L_dht22_read_byte0
L_dht22_read_byte1:
;dht22.h,53 :: 		return(dht22_byte);
	MOVF       dht22_read_byte_dht22_byte_L0+0, 0
	MOVWF      R0+0
;dht22.h,54 :: 		}
L_end_dht22_read_byte:
	RETURN
; end of _dht22_read_byte

_dht22_read:

;dht22.h,56 :: 		void dht22_read(uint16_t *dht22_humi, int16_t *dht22_temp)
;dht22.h,59 :: 		DHT22_PIN     = 0;   // connection pin output low
	BCF        RD7_bit+0, BitPos(RD7_bit+0)
;dht22.h,60 :: 		DHT22_PIN_DIR = 0;   // configure connection pin as output
	BCF        TRISD7_bit+0, BitPos(TRISD7_bit+0)
;dht22.h,61 :: 		Delay_ms(25);        // wait 25 ms
	MOVLW      33
	MOVWF      R12+0
	MOVLW      118
	MOVWF      R13+0
L_dht22_read8:
	DECFSZ     R13+0, 1
	GOTO       L_dht22_read8
	DECFSZ     R12+0, 1
	GOTO       L_dht22_read8
	NOP
;dht22.h,62 :: 		DHT22_PIN     = 1;   // connection pin output high
	BSF        RD7_bit+0, BitPos(RD7_bit+0)
;dht22.h,63 :: 		Delay_us(30);        // wait 30 us
	MOVLW      9
	MOVWF      R13+0
L_dht22_read9:
	DECFSZ     R13+0, 1
	GOTO       L_dht22_read9
	NOP
	NOP
;dht22.h,64 :: 		DHT22_PIN_DIR = 1;   // configure connection pin as input
	BSF        TRISD7_bit+0, BitPos(TRISD7_bit+0)
;dht22.h,66 :: 		while( DHT22_PIN );
L_dht22_read10:
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read11
	GOTO       L_dht22_read10
L_dht22_read11:
;dht22.h,67 :: 		while(!DHT22_PIN );
L_dht22_read12:
	BTFSC      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read13
	GOTO       L_dht22_read12
L_dht22_read13:
;dht22.h,68 :: 		while( DHT22_PIN );
L_dht22_read14:
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_dht22_read15
	GOTO       L_dht22_read14
L_dht22_read15:
;dht22.h,70 :: 		*dht22_humi = dht22_read_byte();  // read humidity byte 1
	CALL       _dht22_read_byte+0
	MOVF       FARG_dht22_read_dht22_humi+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;dht22.h,71 :: 		*dht22_humi = (*dht22_humi << 8) | dht22_read_byte();  // read humidity byte 2
	MOVF       FARG_dht22_read_dht22_humi+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      FLOC__dht22_read+1
	CLRF       FLOC__dht22_read+0
	CALL       _dht22_read_byte+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       FLOC__dht22_read+0, 0
	IORWF      R0+0, 1
	MOVF       FLOC__dht22_read+1, 0
	IORWF      R0+1, 1
	MOVF       FARG_dht22_read_dht22_humi+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dht22.h,72 :: 		*dht22_temp = dht22_read_byte();  // read temperature byte 1
	CALL       _dht22_read_byte+0
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
;dht22.h,73 :: 		*dht22_temp = (*dht22_temp << 8) | dht22_read_byte();  // read temperature byte 2
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      FLOC__dht22_read+1
	CLRF       FLOC__dht22_read+0
	CALL       _dht22_read_byte+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       FLOC__dht22_read+0, 0
	IORWF      R0+0, 1
	MOVF       FLOC__dht22_read+1, 0
	IORWF      R0+1, 1
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dht22.h,74 :: 		dht22_read_byte();               // read checksum (skipped)
	CALL       _dht22_read_byte+0
;dht22.h,75 :: 		if(*dht22_temp & 0x8000)// if temperature is negative
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R2+1
	BTFSS      R2+1, 7
	GOTO       L_dht22_read16
;dht22.h,77 :: 		*dht22_temp &= 0x7FFF;
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVLW      255
	ANDWF      INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	ANDLW      127
	MOVWF      R0+1
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dht22.h,78 :: 		*dht22_temp *= -1;
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      255
	MOVWF      R4+0
	MOVLW      255
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       FARG_dht22_read_dht22_temp+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;dht22.h,79 :: 		}
L_dht22_read16:
;dht22.h,80 :: 		}
L_end_dht22_read:
	RETURN
; end of _dht22_read

_main:

;LCD_AV01.c,21 :: 		void main(){
;LCD_AV01.c,22 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;LCD_AV01.c,23 :: 		while(1){
L_main17:
;LCD_AV01.c,24 :: 		dht22_read(&humidity, &temperature);
	MOVLW      _humidity+0
	MOVWF      FARG_dht22_read_dht22_humi+0
	MOVLW      _temperature+0
	MOVWF      FARG_dht22_read_dht22_temp+0
	CALL       _dht22_read+0
;LCD_AV01.c,25 :: 		Lcd_Out(1,1,"HUMIDITY:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD_AV01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,26 :: 		Lcd_Out(2,1,"TEMP:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD_AV01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,27 :: 		message[0] = humidity/100 + 48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _humidity+0, 0
	MOVWF      R0+0
	MOVF       _humidity+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+0
;LCD_AV01.c,28 :: 		message[1] = humidity/10%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _humidity+0, 0
	MOVWF      R0+0
	MOVF       _humidity+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+1
;LCD_AV01.c,29 :: 		message[3] = humidity%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _humidity+0, 0
	MOVWF      R0+0
	MOVF       _humidity+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+3
;LCD_AV01.c,30 :: 		Lcd_Out(1,11, message);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,31 :: 		Lcd_Out(1,16,"%");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_LCD_AV01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,32 :: 		message[0] = temperature/100 + 48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+0
;LCD_AV01.c,33 :: 		message[1] = temperature/10%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+1
;LCD_AV01.c,34 :: 		message[3] = temperature%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _temperature+0, 0
	MOVWF      R0+0
	MOVF       _temperature+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+3
;LCD_AV01.c,35 :: 		Lcd_Out(2,11, message);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,36 :: 		Lcd_Chr_CP(223);
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;LCD_AV01.c,37 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_LCD_AV01+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_AV01.c,38 :: 		Delay_ms(1000);  // wait a second
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;LCD_AV01.c,39 :: 		}//while(1)
	GOTO       L_main17
;LCD_AV01.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
