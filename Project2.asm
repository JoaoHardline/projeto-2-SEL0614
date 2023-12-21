
_configTIMER:

;Project2.c,4 :: 		void configTIMER(){
;Project2.c,22 :: 		T0CON = 0B00000100;  //TIMER_OFF, MOD_16BITS, TIMER, PRES_1:32
	MOVLW       4
	MOVWF       T0CON+0 
;Project2.c,23 :: 		TMR0H = 0XB;   // Carga do valor inicial
	MOVLW       11
	MOVWF       TMR0H+0 
;Project2.c,24 :: 		TMR0L = 0XDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;Project2.c,26 :: 		INTCON.TMR0IF = 0;  //zera a Flag do TIMER0
	BCF         INTCON+0, 2 
;Project2.c,27 :: 		}
L_end_configTIMER:
	RETURN      0
; end of _configTIMER

_configMCU:

;Project2.c,29 :: 		void configMCU(){
;Project2.c,31 :: 		ADCON1 |= 0X0F;
	MOVLW       15
	IORWF       ADCON1+0, 1 
;Project2.c,33 :: 		TRISB.RB0 = 1; // define o pino 0 da porta B como entrada
	BSF         TRISB+0, 0 
;Project2.c,34 :: 		TRISB.RB1 = 1; // define o pino 1 da porta B como entrada
	BSF         TRISB+0, 1 
;Project2.c,35 :: 		TRISD = 0;  // define o porta D como saida (Display)
	CLRF        TRISD+0 
;Project2.c,37 :: 		PORTD = 0;  // Display inicialmente apagado
	CLRF        PORTD+0 
;Project2.c,38 :: 		}
L_end_configMCU:
	RETURN      0
; end of _configMCU

_configInterrupcao:

;Project2.c,40 :: 		void configInterrupcao(){
;Project2.c,41 :: 		INTCON.GIEH = 1; // Alta prioridade
	BSF         INTCON+0, 7 
;Project2.c,42 :: 		INTCON.INT0IE = 1;  // Habilita a interrupcao especifica INT0
	BSF         INTCON+0, 4 
;Project2.c,43 :: 		INTCON3.INT1IE = 1;  // Habilita a interrupcao especifica INT1
	BSF         INTCON3+0, 3 
;Project2.c,44 :: 		INTCON.TMR0IE = 1;   //Habilita a interrupcao individual do TIMER0
	BSF         INTCON+0, 5 
;Project2.c,46 :: 		RCON.IPEN = 1;  // Habilita niveis de prioridade
	BSF         RCON+0, 7 
;Project2.c,47 :: 		INTCON2.TMR0IP = 1;  // TIMER0 = alta prioridade
	BSF         INTCON2+0, 2 
;Project2.c,48 :: 		INTCON3.INT1IP = 1;       // Coloca INT1 como alta prioridade
	BSF         INTCON3+0, 6 
;Project2.c,50 :: 		INTCON.INT0IF = 0;    //Flag responsavel em gerar/acionar a interrupcao
	BCF         INTCON+0, 1 
;Project2.c,51 :: 		INTCON3.INT1IF = 0;    //Flag responsavel em gerar/acionar a interrupcao
	BCF         INTCON3+0, 0 
;Project2.c,53 :: 		INTCON2.INTEDG0 = 1;  // Borda de subida   (ao soltar a tecla)
	BSF         INTCON2+0, 6 
;Project2.c,54 :: 		INTCON2.INTEDG1 = 1;  // Borda de subida   (ao soltar a tecla)
	BSF         INTCON2+0, 5 
;Project2.c,55 :: 		}
L_end_configInterrupcao:
	RETURN      0
; end of _configInterrupcao

_numeroDisplay:

;Project2.c,58 :: 		void numeroDisplay(char numero){
;Project2.c,59 :: 		switch(numero){
	GOTO        L_numeroDisplay0
;Project2.c,60 :: 		case 0:
L_numeroDisplay2:
;Project2.c,61 :: 		LATD = 0b00111111;
	MOVLW       63
	MOVWF       LATD+0 
;Project2.c,62 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,63 :: 		case 1:
L_numeroDisplay3:
;Project2.c,64 :: 		LATD = 0b00000110;
	MOVLW       6
	MOVWF       LATD+0 
;Project2.c,65 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,66 :: 		case 2:
L_numeroDisplay4:
;Project2.c,67 :: 		LATD = 0b01011011;
	MOVLW       91
	MOVWF       LATD+0 
;Project2.c,68 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,69 :: 		case 3:
L_numeroDisplay5:
;Project2.c,70 :: 		LATD = 0b01001111;
	MOVLW       79
	MOVWF       LATD+0 
;Project2.c,71 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,72 :: 		case 4:
L_numeroDisplay6:
;Project2.c,73 :: 		LATD = 0b01100110;
	MOVLW       102
	MOVWF       LATD+0 
;Project2.c,74 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,75 :: 		case 5:
L_numeroDisplay7:
;Project2.c,76 :: 		LATD = 0b01101101;
	MOVLW       109
	MOVWF       LATD+0 
;Project2.c,77 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,78 :: 		case 6:
L_numeroDisplay8:
;Project2.c,79 :: 		LATD = 0b01111101;
	MOVLW       125
	MOVWF       LATD+0 
;Project2.c,80 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,81 :: 		case 7:
L_numeroDisplay9:
;Project2.c,82 :: 		LATD = 0b00000111;
	MOVLW       7
	MOVWF       LATD+0 
;Project2.c,83 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,84 :: 		case 8:
L_numeroDisplay10:
;Project2.c,85 :: 		LATD = 0b01111111;
	MOVLW       127
	MOVWF       LATD+0 
;Project2.c,86 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,87 :: 		case 9:
L_numeroDisplay11:
;Project2.c,88 :: 		LATD = 0b01101111;
	MOVLW       111
	MOVWF       LATD+0 
;Project2.c,89 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,90 :: 		default:
L_numeroDisplay12:
;Project2.c,91 :: 		break;
	GOTO        L_numeroDisplay1
;Project2.c,92 :: 		}
L_numeroDisplay0:
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay2
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay3
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay4
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay5
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay6
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay7
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay8
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay9
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay10
	MOVF        FARG_numeroDisplay_numero+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_numeroDisplay11
	GOTO        L_numeroDisplay12
L_numeroDisplay1:
;Project2.c,93 :: 		}
L_end_numeroDisplay:
	RETURN      0
; end of _numeroDisplay

_interrupcao:

;Project2.c,95 :: 		void interrupcao() iv 0x0008 ics ICS_AUTO {
;Project2.c,96 :: 		if(INTCON.TMR0IF == 1){        // Verifica se o TIMER0 que gerou a interrupcao
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupcao13
;Project2.c,97 :: 		numeroDisplay(numero);    // Coloca o numero no display
	MOVF        _numero+0, 0 
	MOVWF       FARG_numeroDisplay_numero+0 
	CALL        _numeroDisplay+0, 0
;Project2.c,98 :: 		numero++;
	INCF        _numero+0, 1 
;Project2.c,100 :: 		if(numero == 9){
	MOVF        _numero+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupcao14
;Project2.c,101 :: 		numero = 0;  // Reseta contagem
	CLRF        _numero+0 
;Project2.c,102 :: 		}
L_interrupcao14:
;Project2.c,104 :: 		TMR0H = 0XB;   //Recarrega valor do timer
	MOVLW       11
	MOVWF       TMR0H+0 
;Project2.c,105 :: 		TMR0L = 0XDC;
	MOVLW       220
	MOVWF       TMR0L+0 
;Project2.c,106 :: 		INTCON.TMR0IF = 0;  //Zera a Flag do TIMER0
	BCF         INTCON+0, 2 
;Project2.c,107 :: 		}
	GOTO        L_interrupcao15
L_interrupcao13:
;Project2.c,108 :: 		else if(INTCON.INT0IF == 1){        // Verifica se a INT0 que gerou a interrupcao
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupcao16
;Project2.c,109 :: 		T0CON.T0PS1 = 0;   // Atribui um prescaler de 1:32
	BCF         T0CON+0, 1 
;Project2.c,110 :: 		T0CON.T0PS2 = 1;
	BSF         T0CON+0, 2 
;Project2.c,111 :: 		T0CON.TMR0ON = 1;   //Liga TIMER0
	BSF         T0CON+0, 7 
;Project2.c,112 :: 		numeroDisplay(numero);    // Coloca o numero no display
	MOVF        _numero+0, 0 
	MOVWF       FARG_numeroDisplay_numero+0 
	CALL        _numeroDisplay+0, 0
;Project2.c,113 :: 		INTCON.INT0IF = 0;  // Zera a flag da interrupcao
	BCF         INTCON+0, 1 
;Project2.c,114 :: 		}
	GOTO        L_interrupcao17
L_interrupcao16:
;Project2.c,115 :: 		else if(INTCON3.INT1IF == 1){       // Verifica se a INT1 que gerou a interrupcao
	BTFSS       INTCON3+0, 0 
	GOTO        L_interrupcao18
;Project2.c,116 :: 		T0CON.T0PS1 = 1;  // Atribui um prescaler de 1:8
	BSF         T0CON+0, 1 
;Project2.c,117 :: 		T0CON.T0PS2 = 0;  // Muda o terceiro bit
	BCF         T0CON+0, 2 
;Project2.c,118 :: 		T0CON.TMR0ON = 1;   //Liga o TIMER0
	BSF         T0CON+0, 7 
;Project2.c,119 :: 		numeroDisplay(numero);    // Coloca o numero no display
	MOVF        _numero+0, 0 
	MOVWF       FARG_numeroDisplay_numero+0 
	CALL        _numeroDisplay+0, 0
;Project2.c,120 :: 		INTCON3.INT1IF = 0; // Zera a flag da interrupcao
	BCF         INTCON3+0, 0 
;Project2.c,121 :: 		}
L_interrupcao18:
L_interrupcao17:
L_interrupcao15:
;Project2.c,122 :: 		}
L_end_interrupcao:
L__interrupcao26:
	RETFIE      1
; end of _interrupcao

_main:

;Project2.c,124 :: 		void main() {
;Project2.c,125 :: 		configMCU();
	CALL        _configMCU+0, 0
;Project2.c,126 :: 		configTIMER();
	CALL        _configTIMER+0, 0
;Project2.c,127 :: 		configInterrupcao();
	CALL        _configInterrupcao+0, 0
;Project2.c,129 :: 		while(1);
L_main19:
	GOTO        L_main19
;Project2.c,130 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
