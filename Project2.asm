
_configTIMER:

;Project2.c,4 :: 		void configTIMER(){
;Project2.c,23 :: 		T0CON = 0B00000100;  //TIMER_OFF, MOD_16BITS, TIMER, PRES_1:32
	MOVLW       4
	MOVWF       T0CON+0 
;Project2.c,24 :: 		TMR0H = 0XB;   // Carrega valor inicial
	MOVLW       11
	MOVWF       TMR0H+0 
;Project2.c,25 :: 		TMR0L = 0XDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;Project2.c,27 :: 		INTCON.TMR0IF = 0;  //zera Flag do TIMER0
	BCF         INTCON+0, 2 
;Project2.c,28 :: 		}
L_end_configTIMER:
	RETURN      0
; end of _configTIMER

_configMCU:

;Project2.c,30 :: 		void configMCU(){
;Project2.c,32 :: 		ADCON1 |= 0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project2.c,34 :: 		TRISB.RB0 = 1; // define pino 0 da porta B como entrada
	BSF         TRISB+0, 0 
;Project2.c,35 :: 		TRISB.RB1 = 1; // define pino 1 da porta B como entrada
	BSF         TRISB+0, 1 
;Project2.c,36 :: 		TRISD = 0;  // define porta D como saida (Display)
	CLRF        TRISD+0 
;Project2.c,38 :: 		PORTD = 0;  // Display inicialmente apagado
	CLRF        PORTD+0 
;Project2.c,39 :: 		}
L_end_configMCU:
	RETURN      0
; end of _configMCU

_configInterruption:

;Project2.c,41 :: 		void configInterruption(){
;Project2.c,42 :: 		INTCON.GIEH = 1; // Alta prioridade
	BSF         INTCON+0, 7 
;Project2.c,43 :: 		INTCON.INT0IE = 1;  // Habilita interrupcao especifica INT0
	BSF         INTCON+0, 4 
;Project2.c,44 :: 		INTCON3.INT1IE = 1;  // Habilita interrupcao especifica INT1
	BSF         INTCON3+0, 3 
;Project2.c,45 :: 		INTCON.TMR0IE = 1;   //Habilita interrupcao individual do TIMER0
	BSF         INTCON+0, 5 
;Project2.c,47 :: 		RCON.IPEN = 1;  // Habilita niveis de prioridade
	BSF         RCON+0, 7 
;Project2.c,48 :: 		INTCON2.TMR0IP = 1;  // TIMER0 = alta prioridade
	BSF         INTCON2+0, 2 
;Project2.c,49 :: 		INTCON3.INT1IP = 1;       // Coloca INT1 como alta prioridade
	BSF         INTCON3+0, 6 
;Project2.c,51 :: 		INTCON.INT0IF = 0;    //Flag responsavel em gerar/acionar a interrupcao
	BCF         INTCON+0, 1 
;Project2.c,52 :: 		INTCON3.INT1IF = 0;    //Flag responsavel em gerar/acionar a interrupcao
	BCF         INTCON3+0, 0 
;Project2.c,54 :: 		INTCON2.INTEDG0 = 1;  // Borda de subida (ao soltar a tecla)
	BSF         INTCON2+0, 6 
;Project2.c,55 :: 		INTCON2.INTEDG1 = 1;  // Borda de subida (ao soltar a tecla)
	BSF         INTCON2+0, 5 
;Project2.c,56 :: 		}
L_end_configInterruption:
	RETURN      0
; end of _configInterruption

_DisplayNumber:

;Project2.c,59 :: 		void DisplayNumber(char number){
;Project2.c,60 :: 		switch(number){
	GOTO        L_DisplayNumber0
;Project2.c,61 :: 		case 0:
L_DisplayNumber2:
;Project2.c,62 :: 		LATD = 0b00111111;
	MOVLW       63
	MOVWF       LATD+0 
;Project2.c,63 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,64 :: 		case 1:
L_DisplayNumber3:
;Project2.c,65 :: 		LATD = 0b00000110;
	MOVLW       6
	MOVWF       LATD+0 
;Project2.c,66 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,67 :: 		case 2:
L_DisplayNumber4:
;Project2.c,68 :: 		LATD = 0b01011011;
	MOVLW       91
	MOVWF       LATD+0 
;Project2.c,69 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,70 :: 		case 3:
L_DisplayNumber5:
;Project2.c,71 :: 		LATD = 0b01001111;
	MOVLW       79
	MOVWF       LATD+0 
;Project2.c,72 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,73 :: 		case 4:
L_DisplayNumber6:
;Project2.c,74 :: 		LATD = 0b01100110;
	MOVLW       102
	MOVWF       LATD+0 
;Project2.c,75 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,76 :: 		case 5:
L_DisplayNumber7:
;Project2.c,77 :: 		LATD = 0b01101101;
	MOVLW       109
	MOVWF       LATD+0 
;Project2.c,78 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,79 :: 		case 6:
L_DisplayNumber8:
;Project2.c,80 :: 		LATD = 0b01111101;
	MOVLW       125
	MOVWF       LATD+0 
;Project2.c,81 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,82 :: 		case 7:
L_DisplayNumber9:
;Project2.c,83 :: 		LATD = 0b00000111;
	MOVLW       7
	MOVWF       LATD+0 
;Project2.c,84 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,85 :: 		case 8:
L_DisplayNumber10:
;Project2.c,86 :: 		LATD = 0b01111111;
	MOVLW       127
	MOVWF       LATD+0 
;Project2.c,87 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,88 :: 		case 9:
L_DisplayNumber11:
;Project2.c,89 :: 		LATD = 0b01101111;
	MOVLW       111
	MOVWF       LATD+0 
;Project2.c,90 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,91 :: 		default:
L_DisplayNumber12:
;Project2.c,92 :: 		break;
	GOTO        L_DisplayNumber1
;Project2.c,93 :: 		}
L_DisplayNumber0:
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber2
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber3
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber4
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber5
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber6
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber7
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber8
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber9
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber10
	MOVF        FARG_DisplayNumber_number+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_DisplayNumber11
	GOTO        L_DisplayNumber12
L_DisplayNumber1:
;Project2.c,94 :: 		}
L_end_DisplayNumber:
	RETURN      0
; end of _DisplayNumber

_interruption:

;Project2.c,96 :: 		void interruption() iv 0x0008 ics ICS_AUTO {
;Project2.c,97 :: 		if(INTCON.TMR0IF == 1){        // Verifica se o TIMER0 que gerou a interrupcao
	BTFSS       INTCON+0, 2 
	GOTO        L_interruption13
;Project2.c,98 :: 		DisplayNumber(number);    // Coloca o numero no display
	MOVF        _number+0, 0 
	MOVWF       FARG_DisplayNumber_number+0 
	CALL        _DisplayNumber+0, 0
;Project2.c,99 :: 		number++;
	INCF        _number+0, 1 
;Project2.c,101 :: 		if(number > 9){
	MOVF        _number+0, 0 
	SUBLW       9
	BTFSC       STATUS+0, 0 
	GOTO        L_interruption14
;Project2.c,102 :: 		number = 0;  // Reseta contagem
	CLRF        _number+0 
;Project2.c,103 :: 		}
L_interruption14:
;Project2.c,105 :: 		TMR0H = 0XB;   //Recarrega valor do timer
	MOVLW       11
	MOVWF       TMR0H+0 
;Project2.c,106 :: 		TMR0L = 0XDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;Project2.c,107 :: 		INTCON.TMR0IF = 0;  //Zera a Flag do TIMER0
	BCF         INTCON+0, 2 
;Project2.c,108 :: 		}
	GOTO        L_interruption15
L_interruption13:
;Project2.c,109 :: 		else if(INTCON.INT0IF == 1){        // Verifica se a INT0 que gerou a interrupcao
	BTFSS       INTCON+0, 1 
	GOTO        L_interruption16
;Project2.c,110 :: 		T0CON.T0PS1 = 0;   // Atribui um prescaler de 1:32
	BCF         T0CON+0, 1 
;Project2.c,111 :: 		T0CON.T0PS2 = 1;
	BSF         T0CON+0, 2 
;Project2.c,112 :: 		T0CON.TMR0ON = 1;   //Liga TIMER0
	BSF         T0CON+0, 7 
;Project2.c,113 :: 		DisplayNumber(number);    // Coloca o numero no display
	MOVF        _number+0, 0 
	MOVWF       FARG_DisplayNumber_number+0 
	CALL        _DisplayNumber+0, 0
;Project2.c,114 :: 		INTCON.INT0IF = 0;  // Zera a flag da interrupcao
	BCF         INTCON+0, 1 
;Project2.c,115 :: 		}
	GOTO        L_interruption17
L_interruption16:
;Project2.c,116 :: 		else if(INTCON3.INT1IF == 1){       // Verifica se a INT1 que gerou a interrupcao
	BTFSS       INTCON3+0, 0 
	GOTO        L_interruption18
;Project2.c,117 :: 		T0CON.T0PS1 = 1;  // Atribui um prescaler de 1:8
	BSF         T0CON+0, 1 
;Project2.c,118 :: 		T0CON.T0PS2 = 0;  // Muda o terceiro bit
	BCF         T0CON+0, 2 
;Project2.c,119 :: 		T0CON.TMR0ON = 1;   //Liga o TIMER0
	BSF         T0CON+0, 7 
;Project2.c,120 :: 		DisplayNumber(number);    // Coloca o numero no display
	MOVF        _number+0, 0 
	MOVWF       FARG_DisplayNumber_number+0 
	CALL        _DisplayNumber+0, 0
;Project2.c,121 :: 		INTCON3.INT1IF = 0; // Zera a flag da interrupcao
	BCF         INTCON3+0, 0 
;Project2.c,122 :: 		}
L_interruption18:
L_interruption17:
L_interruption15:
;Project2.c,123 :: 		}
L_end_interruption:
L__interruption26:
	RETFIE      1
; end of _interruption

_main:

;Project2.c,125 :: 		void main() {
;Project2.c,126 :: 		configMCU();
	CALL        _configMCU+0, 0
;Project2.c,127 :: 		configTIMER();
	CALL        _configTIMER+0, 0
;Project2.c,128 :: 		configInterruption();
	CALL        _configInterruption+0, 0
;Project2.c,129 :: 		while(1);
L_main19:
	GOTO        L_main19
;Project2.c,130 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
