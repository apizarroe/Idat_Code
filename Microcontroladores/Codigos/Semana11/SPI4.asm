
_enviar_DAC:

;SPI4.c,4 :: 		void enviar_DAC(unsigned int valor_enviar){
;SPI4.c,6 :: 		temporal = (valor_enviar >> 8) & 0x0F;
	MOVF       FARG_enviar_DAC_valor_enviar+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
;SPI4.c,7 :: 		temporal |= 0x30;
	MOVLW      48
	IORWF      FARG_SPI1_Write_data_+0, 1
;SPI4.c,8 :: 		SPI1_Write(temporal);
	CALL       _SPI1_Write+0
;SPI4.c,10 :: 		SPI1_Write(temporal);
	MOVF       FARG_enviar_DAC_valor_enviar+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;SPI4.c,11 :: 		}
L_end_enviar_DAC:
	RETURN
; end of _enviar_DAC

_main:

;SPI4.c,13 :: 		void main() {
;SPI4.c,14 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;SPI4.c,15 :: 		TRISD = 0;
	CLRF       TRISD+0
;SPI4.c,16 :: 		PORTD.f0 = 0;
	BCF        PORTD+0, 0
;SPI4.c,17 :: 		enviar_DAC(410);
	MOVLW      154
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVLW      1
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI4.c,18 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI4.c,19 :: 		PORTD.f1 = 0;
	BCF        PORTD+0, 1
;SPI4.c,20 :: 		enviar_DAC(820);
	MOVLW      52
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVLW      3
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI4.c,21 :: 		PORTD.f1 = 1;
	BSF        PORTD+0, 1
;SPI4.c,22 :: 		PORTD.f2 = 0;
	BCF        PORTD+0, 2
;SPI4.c,23 :: 		enviar_DAC(1229);
	MOVLW      205
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVLW      4
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI4.c,24 :: 		PORTD.f2 = 1;
	BSF        PORTD+0, 2
;SPI4.c,25 :: 		PORTD.f3 = 0;
	BCF        PORTD+0, 3
;SPI4.c,26 :: 		enviar_DAC(1639);
	MOVLW      103
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVLW      6
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI4.c,27 :: 		PORTD.f3 = 1;
	BSF        PORTD+0, 3
;SPI4.c,28 :: 		PORTD.f4 = 0;
	BCF        PORTD+0, 4
;SPI4.c,29 :: 		enviar_DAC(2048);
	MOVLW      0
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVLW      8
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI4.c,30 :: 		PORTD.f4 = 1;
	BSF        PORTD+0, 4
;SPI4.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
