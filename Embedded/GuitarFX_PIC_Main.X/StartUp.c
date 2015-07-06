#include <stdio.h>
#include <stdlib.h>

#include <Generic.h>
#include <p24Hxxxx.h>
#include <uart.h>
#include <timer.h>

//#define GPIO_TEST       //all GPIOs digital and high
#define GPIO_BLINK      //all GPIOs digital and blink every half second
//#define UART_ENABLED

//function declarations
void OpenTimer1( unsigned int config, unsigned int period);
void ConfigIntTimer1(unsigned int config);
void WriteTimer1( unsigned int timer);
void OpenUART1(unsigned int config1,unsigned int config2, unsigned int ubrg);

void StartUp (void)
{
#ifdef GPIO_TEST
#warning DEBUG_GPIO_TEST
    TRISA = 0;
    TRISB = 0;
    AD1PCFGL = 0xFFFF;
    LATA = 0xFFFF;
    LATB = 0xFFFF;
#endif

#ifdef GPIO_BLINK
#warning DEBUG_GPIO_BLINK
    TRISA = 0;          //PORTA - output
    TRISB = 0;          //PORTB - output
    LATA = 0xFFFF;      //write HIGH to all A latches
    LATB = 0xFFFF;      //write HIGH to all B latches
    AD1PCFGL = 0xFFFF;      //make all gpios digital

    ConfigIntTimer1(T1_INT_PRIOR_1 &
                T1_INT_ON
                );

    OpenTimer1(T1_ON & 
            T1_IDLE_CON &
            T1_GATE_OFF &
            T1_PS_1_256 &
            T1_SYNC_EXT_OFF &
            T1_SOURCE_INT
            ,
            39062       //proc every quarter second
            );
#endif

#ifdef UART_ENABLED
#warning DEBUG_UART_ENABLED
    OpenUART1(UART_EN &         //config1
            UART_IDLE_CON &
            UART_IrDA_DISABLE
            ,
            UART_MODE_SIMPLEX &     //config2
            UART_UEN_10 &
            UART_EN_WAKE &
            UART_DIS_LOOPBACK &
            UART_EN_ABAUD &
            UART_UXRX_IDLE_ZERO &
            UART_BRGH_FOUR &
            UART_NO_PAR_8BIT &
            UART_2STOPBITS
            ,
            UART_INT_TX_BUF_EMPTY &      //ubrg <- whatever thats supposed to be
            UART_IrDA_POL_INV_ZERO &
            UART_SYNC_BREAK_ENABLED &
            UART_TX_ENABLE &
            UART_TX_BUF_NOT_FUL &
            UART_INT_RX_CHAR &
            UART_ADR_DETECT_DIS &
            UART_RX_OVERRUN_CLEAR
            );
    printf("UART_DEBUG_TEST_PRINTF\n");
#endif

    while(1);
    return;
}
