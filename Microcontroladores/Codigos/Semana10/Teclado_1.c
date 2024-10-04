unsigned short tecla = 0;
void teclado4x4(){
    PORTB = 0x0E; // 00001110
    if(PORTB == 0xEE){tecla = 1;} // 11101110
    if(PORTB == 0xDE){tecla = 2;} // 11011110
    if(PORTB == 0xBE){tecla = 3;} // 10111110
    if(PORTB == 0x7E){tecla = 4;} // 01111110
    PORTB = 0x0D; // 00001101
    if(PORTB == 0xED){tecla = 5;} // 11101101
    if(PORTB == 0xDD){tecla = 6;} // 11011101
    if(PORTB == 0xBD){tecla = 7;} // 10111101
    if(PORTB == 0x7D){tecla = 8;} // 01111101
    PORTB = 0x0B; // 00001011
    if(PORTB == 0xEB){tecla = 9;} // 11101011
    if(PORTB == 0xDB){tecla = 10;} // 11011011
    if(PORTB == 0xBB){tecla = 11;} // 10111011
    if(PORTB == 0x7B){tecla = 12;} // 01111011
    PORTB = 0x07; // 00000111
    if(PORTB == 0xE7){tecla = 13;} // 11100111
    if(PORTB == 0xD7){tecla = 14;} // 11010111
    if(PORTB == 0xB7){tecla = 15;} // 10110111
    if(PORTB == 0x77){tecla = 16;} // 01110111
    PORTB = 0x00;
}
void interrupt(){
    if (INTCON.f0 == 1){
       teclado4x4();
       INTCON.f0 = 0;
    }
}

void main() {
    TRISB = 0xF0;
    PORTB = 0;
    TRISC = 0;
    PORTC = 0;
    OPTION_REG.f7 = 0; // habilitamos pull up
    INTCON = 0b10001000; // hab interr. por PORTB
    while(1){
         PORTC = tecla;
    }
}