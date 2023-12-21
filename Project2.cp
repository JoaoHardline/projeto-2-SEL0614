#line 1 "C:/Users/Nicho/OneDrive/Documentos/GitHub/projeto-2-SEL0614/Project2.c"
char number = 0;


void configTIMER(){
#line 23 "C:/Users/Nicho/OneDrive/Documentos/GitHub/projeto-2-SEL0614/Project2.c"
 T0CON = 0B00000100;
 TMR0H = 0XB;
 TMR0L = 0XDC;

 INTCON.TMR0IF = 0;
}

void configMCU(){

 ADCON1 |= 0X0F;

 TRISB.RB0 = 1;
 TRISB.RB1 = 1;
 TRISD = 0;

 PORTD = 0;
}

void configInterruption(){
 INTCON.GIEH = 1;
 INTCON.INT0IE = 1;
 INTCON3.INT1IE = 1;
 INTCON.TMR0IE = 1;

 RCON.IPEN = 1;
 INTCON2.TMR0IP = 1;
 INTCON3.INT1IP = 1;

 INTCON.INT0IF = 0;
 INTCON3.INT1IF = 0;

 INTCON2.INTEDG0 = 1;
 INTCON2.INTEDG1 = 1;
}


void DisplayNumber(char number){
 switch(number){
 case 0:
 LATD = 0b00111111;
 break;
 case 1:
 LATD = 0b00000110;
 break;
 case 2:
 LATD = 0b01011011;
 break;
 case 3:
 LATD = 0b01001111;
 break;
 case 4:
 LATD = 0b01100110;
 break;
 case 5:
 LATD = 0b01101101;
 break;
 case 6:
 LATD = 0b01111101;
 break;
 case 7:
 LATD = 0b00000111;
 break;
 case 8:
 LATD = 0b01111111;
 break;
 case 9:
 LATD = 0b01101111;
 break;
 default:
 break;
 }
}

void interruption() iv 0x0008 ics ICS_AUTO {
 if(INTCON.TMR0IF == 1){
 DisplayNumber(number);
 number++;

 if(number > 9){
 number = 0;
 }

 TMR0H = 0XB;
 TMR0L = 0XDC;
 INTCON.TMR0IF = 0;
 }
 else if(INTCON.INT0IF == 1){
 T0CON.T0PS1 = 0;
 T0CON.T0PS2 = 1;
 T0CON.TMR0ON = 1;
 DisplayNumber(number);
 INTCON.INT0IF = 0;
 }
 else if(INTCON3.INT1IF == 1){
 T0CON.T0PS1 = 1;
 T0CON.T0PS2 = 0;
 T0CON.TMR0ON = 1;
 DisplayNumber(number);
 INTCON3.INT1IF = 0;
 }
}

void main() {
 configMCU();
 configTIMER();
 configInterruption();
 while(1);
}
