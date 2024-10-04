#line 1 "C:/Users/Aldo Pizarro/Desktop/Idat_Clases/CicloIV/MicroControladores/Proyectos/Semana10/Teclado_1.c"
unsigned short tecla = 0;
void teclado4x4(){
 PORTB = 0x0E;
 if(PORTB == 0xEE){tecla = 1;}
 if(PORTB == 0xDE){tecla = 2;}
 if(PORTB == 0xBE){tecla = 3;}
 if(PORTB == 0x7E){tecla = 4;}
 PORTB = 0x0D;
 if(PORTB == 0xED){tecla = 5;}
 if(PORTB == 0xDD){tecla = 6;}
 if(PORTB == 0xBD){tecla = 7;}
 if(PORTB == 0x7D){tecla = 8;}
 PORTB = 0x0B;
 if(PORTB == 0xEB){tecla = 9;}
 if(PORTB == 0xDB){tecla = 10;}
 if(PORTB == 0xBB){tecla = 11;}
 if(PORTB == 0x7B){tecla = 12;}
 PORTB = 0x07;
 if(PORTB == 0xE7){tecla = 13;}
 if(PORTB == 0xD7){tecla = 14;}
 if(PORTB == 0xB7){tecla = 15;}
 if(PORTB == 0x77){tecla = 16;}
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
 OPTION_REG.f7 = 0;
 INTCON = 0b10001000;
 while(1){
 PORTC = tecla;
 }
}
