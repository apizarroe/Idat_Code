
_enviar_DAC:

;SPI3.c,4 :: 		void enviar_DAC(unsigned int valor_enviar){
;SPI3.c,6 :: 		temporal = (valor_enviar >> 8) & 0x0F;
	MOVF       FARG_enviar_DAC_valor_enviar+1, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
;SPI3.c,7 :: 		temporal |= 0x30;
	MOVLW      48
	IORWF      FARG_SPI1_Write_data_+0, 1
;SPI3.c,8 :: 		SPI1_Write(temporal);
	CALL       _SPI1_Write+0
;SPI3.c,10 :: 		SPI1_Write(temporal);
	MOVF       FARG_enviar_DAC_valor_enviar+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;SPI3.c,11 :: 		}
L_end_enviar_DAC:
	RETURN
; end of _enviar_DAC

_main:

;SPI3.c,13 :: 		void main() {
;SPI3.c,14 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;SPI3.c,15 :: 		TRISD = 0;
	CLRF       TRISD+0
;SPI3.c,16 :: 		PORTD = 0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;SPI3.c,17 :: 		while(1){
L_main0:
;SPI3.c,18 :: 		DipSwitch = (PORTB >> 6);
	MOVLW      6
	MOVWF      R0+0
	MOVF       PORTB+0, 0
	MOVWF      _DipSwitch+0
	MOVF       R0+0, 0
L__main9:
	BTFSC      STATUS+0, 2
	GOTO       L__main10
	RRF        _DipSwitch+0, 1
	BCF        _DipSwitch+0, 7
	ADDLW      255
	GOTO       L__main9
L__main10:
;SPI3.c,20 :: 		dato = (PORTB & 0x3F) * 64;
	MOVLW      63
	ANDWF      PORTB+0, 0
	MOVWF      _dato+0
	CLRF       _dato+1
	MOVLW      0
	ANDWF      _dato+1, 1
	MOVLW      6
	MOVWF      R0+0
	MOVLW      0
	MOVWF      _dato+1
	MOVF       R0+0, 0
L__main11:
	BTFSC      STATUS+0, 2
	GOTO       L__main12
	RLF        _dato+0, 1
	RLF        _dato+1, 1
	BCF        _dato+0, 0
	ADDLW      255
	GOTO       L__main11
L__main12:
;SPI3.c,22 :: 		switch(DipSwitch){
	GOTO       L_main2
;SPI3.c,23 :: 		case 0:
L_main4:
;SPI3.c,24 :: 		PORTD.f0 = 0;
	BCF        PORTD+0, 0
;SPI3.c,25 :: 		enviar_DAC(dato);
	MOVF       _dato+0, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVF       _dato+1, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI3.c,26 :: 		PORTD.f0 = 1;
	BSF        PORTD+0, 0
;SPI3.c,27 :: 		break;
	GOTO       L_main3
;SPI3.c,28 :: 		case 1:
L_main5:
;SPI3.c,29 :: 		PORTD.f1 = 0;
	BCF        PORTD+0, 1
;SPI3.c,30 :: 		enviar_DAC(dato);
	MOVF       _dato+0, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVF       _dato+1, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI3.c,31 :: 		PORTD.f1 = 1;
	BSF        PORTD+0, 1
;SPI3.c,32 :: 		break;
	GOTO       L_main3
;SPI3.c,33 :: 		case 2:
L_main6:
;SPI3.c,34 :: 		PORTD.f2 = 0;
	BCF        PORTD+0, 2
;SPI3.c,35 :: 		enviar_DAC(dato);
	MOVF       _dato+0, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+0
	MOVF       _dato+1, 0
	MOVWF      FARG_enviar_DAC_valor_enviar+1
	CALL       _enviar_DAC+0
;SPI3.c,36 :: 		PORTD.f2 = 1;
	BSF        PORTD+0, 2
;SPI3.c,37 :: 		break;
	GOTO       L_main3
;SPI3.c,38 :: 		}
L_main2:
	MOVF       _DipSwitch+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	MOVF       _DipSwitch+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	MOVF       _DipSwitch+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_main6
L_main3:
;SPI3.c,39 :: 		}
	GOTO       L_main0
;SPI3.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
