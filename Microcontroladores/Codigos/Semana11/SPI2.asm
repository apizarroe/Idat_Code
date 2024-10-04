
_enviar_DAC:

;SPI2.c,3 :: 		void enviar_DAC(unsigned int valor_enviar){
;SPI2.c,5 :: 		temporal = (valor_enviar >> 8) & 0x0F;
	MOVF       FARG_enviar_DAC_valor_enviar+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
;SPI2.c,6 :: 		temporal |= 0x30;
	MOVLW      48
	IORWF      FARG_SPI1_Write_data_+0, 1
;SPI2.c,7 :: 		SPI1_Write(temporal);
	CALL       _SPI1_Write+0
;SPI2.c,9 :: 		SPI1_Write(temporal);
	MOVF       FARG_enviar_DAC_valor_enviar+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;SPI2.c,10 :: 		}
L_end_enviar_DAC:
	RETURN
; end of _enviar_DAC

_main:

;SPI2.c,12 :: 		void main() {
;SPI2.c,13 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;SPI2.c,14 :: 		TRISD.f0 = 0;
	BCF        TRISD+0, 0
;SPI2.c,15 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI2.c,16 :: 		cuenta = 0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;SPI2.c,17 :: 		while(1){
L_main0:
;SPI2.c,18 :: 		PORTD.f0 = 0;
	BCF        PORTD+0, 0
;SPI2.c,19 :: 		enviar_DAC(cuenta);
	MOVF       _cuenta+0, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVF       _cuenta+1, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI2.c,20 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI2.c,21 :: 		cuenta ++;
	INCF       _cuenta+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cuenta+1, 1
;SPI2.c,22 :: 		if(cuenta > 4095){
	MOVF       _cuenta+1, 0
	SUBLW      15
	BTFSS      STATUS+0, 2
	GOTO       L__main5
	MOVF       _cuenta+0, 0
	SUBLW      255
L__main5:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;SPI2.c,23 :: 		cuenta = 0;
	CLRF       _cuenta+0
	CLRF       _cuenta+1
;SPI2.c,24 :: 		}
L_main2:
;SPI2.c,26 :: 		}
	GOTO       L_main0
;SPI2.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
