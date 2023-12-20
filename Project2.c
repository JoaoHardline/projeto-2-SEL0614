char number = 0; //Variavel global que armazena o numero a ser exibido no display

// Configuracao do TIMER0 para gerar interrupções a cada 1 segundo e 0,25 segundos
void configTIMER(){

/*                          TIMER0 PARA 1s
CicloMaquina = Frequencia osc/4 -> 8MHz/4 = 2MHz -> Periodo = 1/F -> 1/2MHz = 0.5us
Para usar o mesmo valor anterior de X = 49911 muda-se apenas o prescaler

Time_overflow = CicloMaq. * Prescaler * (Modo_8_16bits - valor Inicial)
1000.000us    = 0.5us * 32 * (65536 -  X)
X = 3036 => CONVERTENDO PARA VALOR EM HEX: BDC
*/

/*                           TIMER0 PARA 0,25s
CicloMaquina = Fosc/4 -> 8MHz/4 = 2MHz -> Periodo = 1/F -> 1/2MHz = 0.5us

Time_overflow = CicloMaq. * Prescaler * (Modo_8_16bits - valor Inicial)
250.000us    = 0.5us * P * (65536 -  X)
P = 1/8
*/

  T0CON = 0B00000100;  //TIMER_OFF, MOD_16BITS, TIMER, PRES_1:32
  TMR0H = 0XB;   // Carrega valor inicial
  TMR0L = 0XDC;

  INTCON.TMR0IF = 0;  //zera Flag do TIMER0
}

void configMCU(){
  // Configura pinos como digitais
  ADCON1 |= 0X0F;

  TRISB.RB0 = 1; // define pino 0 da porta B como entrada
  TRISB.RB1 = 1; // define pino 1 da porta B como entrada
  TRISD = 0;  // define porta D como saida (Display)

  PORTD = 0;  // Display inicialmente apagado
}

void configInterruption(){
     INTCON.GIEH = 1; // Alta prioridade
     INTCON.INT0IE = 1;  // Habilita interrupcao especifica INT0
     INTCON3.INT1IE = 1;  // Habilita interrupcao especifica INT1
     INTCON.TMR0IE = 1;   //Habilita interrupcao individual do TIMER0

     RCON.IPEN = 1;  // Habilita niveis de prioridade
     INTCON2.TMR0IP = 1;  // TIMER0 = alta prioridade
     INTCON3.INT1IP = 1;       // Coloca INT1 como alta prioridade

     INTCON.INT0IF = 0;    //Flag responsavel em gerar/acionar a interrupcao
     INTCON3.INT1IF = 0;    //Flag responsavel em gerar/acionar a interrupcao

     INTCON2.INTEDG0 = 1;  // Borda de subida (ao soltar a tecla)
     INTCON2.INTEDG1 = 1;  // Borda de subida (ao soltar a tecla)
}

// Recebe um numero e mostra no display
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
      if(INTCON.TMR0IF == 1){        // Verifica se o TIMER0 que gerou a interrupcao
            DisplayNumber(number);    // Coloca o numero no display
            number++;

            if(number == 9){
                      number = 0;  // Reseta contagem
            }

            TMR0H = 0XB;   //Recarrega valor do timer
            TMR0L = 0XDC;
            INTCON.TMR0IF = 0;  //Zera a Flag do TIMER0
      }
      else if(INTCON.INT0IF == 1){        // Verifica se a INT0 que gerou a interrupcao
            T0CON.T0PS1 = 0;   // Atribui um prescaler de 1:32
            T0CON.T0PS2 = 1;
            T0CON.TMR0ON = 1;   //Liga TIMER0
            DisplayNumber(number);    // Coloca o numero no display
            INTCON.INT0IF = 0;  // Zera a flag da interrupcao
      }
      else if(INTCON3.INT1IF == 1){       // Verifica se a INT1 que gerou a interrupcao
            T0CON.T0PS1 = 1;  // Atribui um prescaler de 1:8
            T0CON.T0PS2 = 0;  // Muda o terceiro bit
            T0CON.TMR0ON = 1;   //Liga o TIMER0
            DisplayNumber(number);    // Coloca o numero no display
            INTCON3.INT1IF = 0; // Zera a flag da interrupcao
      }
}

void main() {
     configMCU();
     configTIMER();
     configInterruption();
     while(true);
}