#include <generic.h>
#include <p24hj128GP202.h>
#include <uart.h>
#include <pps.h>

void SetupUART_GuitarFX(void)
{
    //PPSUnLock;
    PPSOutput(OUT_FN_PPS_U1TX, OUT_PIN_PPS_RP6);
    PPSInput(IN_FN_PPS_U1RX, IN_PIN_PPS_RP7);
    //PPSLock;
    
    OpenUART1(UART_EN &
                UART_IDLE_CON &
                UART_IrDA_DISABLE &
                UART_MODE_SIMPLEX &
                UART_UEN_00 &
                UART_EN_WAKE &
                UART_DIS_LOOPBACK &
                UART_DIS_ABAUD &
                UART_UXRX_IDLE_ONE &
                UART_BRGH_SIXTEEN &
                UART_NO_PAR_8BIT &
                UART_1STOPBIT
                ,
                UART_INT_TX_BUF_EMPTY &
                UART_SYNC_BREAK_DISABLED &
                UART_TX_ENABLE &
                UART_INT_RX_CHAR &
                UART_ADR_DETECT_DIS
                ,
                23
                );
    
    ConfigIntUART1(UART_RX_INT_DIS &
                    UART_RX_INT_PR6 &
                    UART_TX_INT_DIS &
                    UART_TX_INT_PR5
                    );
    
    /*
    while(1)
    {
        for(j = 0; j < 0x003F; j++)
        {
            for(i = 0; i < 0xFFFF; i++)
            {
                asm("NOP");
            }
        }
        printf("!");
    }
     * */
    
    return;
}
