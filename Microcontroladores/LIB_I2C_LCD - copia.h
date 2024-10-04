/*
INSTRUCCIONES:
*COPIE EL PRESENTE ARCHIVO EN LA CARPETA DE SU PROYECTO USANDO EL EXPLORARDOR DE ARCHIVOS.
*VERIFIQUE QUE EL PRESENTE ARCHIVO TENGA EL NOMBRE DE "LIB_I2C_LCD"
*AGREGAR EL PRESENTE ARCHIVO AL INICIO DEL PROYECTO CON #include "LIB_I2C_LCD.h"
---REQUIERE DE LA LIBRERÍA I2C DE MIKROC---
*INICIAR I2C;
*INICIAR EL LCD:   I2C_LCD_Init();

*ESCRIBIR UN COMANDO: I2C_LCD_Cmd(nombre del comando); USE LOS NOMBRES DESCRITOS MAS ABAJO

*ESCRIBIR UN CARACTER EN EL LCD: I2C_LCD_Chr_Cp('CARACTER');
*ESCRIBIR UN CARACTER EN EL LCD ESPECIFICANDO SU UBICACIÓN: I2C_LCD_Chr(#LINEA, #POSICIÓN, 'CARACTER');

*ESCRIBIR UN TEXTO EN EL LCD: I2C_LCD_Out_Cp("texto a escribir");
*ESCRIBIR UN TEXTO EN EL LCD ESPECIFICANDO SU UBICACIÓN: I2C_Lcd_Out(#LINEA,#POSICIÓN,"texto a escribir");
*/

//COMANDOS PARA EL LCD
#define _LCD_FIRST_ROW          0x80     //MUEVE EL CURSOR A LA LÍNEA 1
#define _LCD_SECOND_ROW         0xC0     //MUEVE EL CURSOR A LA LÍNEA 2
#define _LCD_THIRD_ROW          0x94     //MUEVE EL CURSOR A LA LÍNEA 3
#define _LCD_FOURTH_ROW         0xD4     //MUEVE EL CURSOR A LA LÍNEA 4
#define _LCD_CLEAR              0x01     //BORRAR EL DISPLAY
#define _LCD_RETURN_HOME        0x02     //REGRESA EL CURSOR A LA POSICIÓN 0 SIN ALTERAR EL CONTENIDO
                                         //DE LA MEMORIA RAM.
#define _LCD_CURSOR_OFF         0x0C     //APAGA EL CURSOR
#define _LCD_UNDERLINE_ON       0x0E     //CURSOR BAJO ENCENDIDO
#define _LCD_BLINK_CURSOR_ON    0x0F     //CURSOR INTERMITENTE ENCENDIDO
#define _LCD_MOVE_CURSOR_LEFT   0x10     //MUEVE EL CURSOR A LA IZQUIERDA SIN ALTERAR EL CONTENIDO DE LA RAM
#define _LCD_MOVE_CURSOR_RIGHT  0x14     //MUEVE EL CURSOR A LA DERECHA SIN ALTERAR EL CONTENIDO DE LA RAM
#define _LCD_TURN_ON            0x0C     //ENCIENDE EL DIPLAY DEL LCD
#define _LCD_TURN_OFF           0x08     //APAGA EL DISPLAY DEL LCD
#define _LCD_SHIFT_LEFT         0x18     //ROTA EL DISPLAY A LA IZQUIERDA SIN ALTERAR EL CONTENIDO EN LA RAM
#define _LCD_SHIFT_RIGHT        0x1E     //ROTA EL DISPLAY A LA DERECHA SIN ALTERAR EL CONTENIDO EN LA RAM

// DEFINICIONES PARA LCD
#define LCD_ADDR 0x4E                    //DIRECCIÓN DEL LCD EN EL BUS I2C

void I2C_LCD_Cmd(char out_char) {

    char byte;    
    
    byte = out_char & 0xF0;    

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    
    byte.F0 = 0;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();    
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    
    byte = (out_char << 4) & 0xF0;
    
    byte.F0 = 0;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();    
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    I2C1_stop();

    if(out_char == 0x01)Delay_ms(2);
}

void I2C_LCD_Chr(char row, char column, char out_char) {

    char byte;
    
    switch(row){

        case 1:
        I2C_LCD_Cmd(0x80 + (column - 1));
        break;
        case 2:
        I2C_LCD_Cmd(0xC0 + (column - 1));
        break;
        case 3:
        I2C_LCD_Cmd(0x94 + (column - 1));
        break;
        case 4:
        I2C_LCD_Cmd(0xD4 + (column - 1));
        break;
    };

    byte = out_char & 0xF0;    

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    
    byte.F0 = 1;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    
    byte = (out_char << 4) & 0xF0;
    
    byte.F0 = 1;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    
    I2C1_stop();
}

void I2C_LCD_Chr_Cp(char out_char) {

    char byte;
    
    byte = out_char & 0xF0;    

    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();
    
    byte.F0 = 1;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    
    byte = (out_char << 4) & 0xF0;
    
    byte.F0 = 1;
    byte.F2 = 1;
    byte.F3 = 1;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    
    I2C1_stop();
}


void I2C_LCD_Init() {    

    char byte;
    
    Delay_ms(150);
      
    I2C1_Start();
    I2C1_Is_Idle();
    I2C1_Wr(LCD_ADDR);
    I2C1_Is_Idle();

    Delay_ms(30);
    
    byte = 0x30;    
    byte.F3 = 1;
    
    byte.F2 = 1;
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();

    Delay_ms(30);

    byte.F2 = 1;
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();

    Delay_ms(30);

    byte.F2 = 1;
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();

    Delay_ms(20);

    byte = 0x20;
    byte.F3 = 1;
    
    byte.F2 = 1;
    I2C1_Wr(byte);
    I2C1_Is_Idle();
    byte.F2 = 0;    
    I2C1_Wr(byte);
    I2C1_Is_Idle();

    Delay_ms(10);

    I2C_LCD_Cmd(0x28);
    I2C_LCD_Cmd(0x06);
}

void I2C_LCD_Out(char row, char col, char *text) {
    while(*text)
         I2C_LCD_Chr(row, col++, *text++);
}

void I2C_LCD_Out_Cp(char *text) {
    while(*text)
         I2C_LCD_Chr_Cp(*text++);
}