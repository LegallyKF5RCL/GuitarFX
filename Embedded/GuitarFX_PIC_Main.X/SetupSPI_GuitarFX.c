#include <p24hj128GP202.h>
#include <Generic.h>
#include <spi.h>
#include "Header_GuitarFX.h"

void SetupSPI_GuitarFX(void)
{
    OpenSPI1(
            ENABLE_SCK_PIN
            ,
            FRAME_ENABLE_OFF &
            ENABLE_SDO_PIN &        //check this when remapping periphs
            SPI_MODE16_ON &
            SPI_SMP_OFF &
            SPI_CKE_ON &
            SLAVE_ENABLE_OFF &
            CLK_POL_ACTIVE_HIGH &
            MASTER_ENABLE_ON &
            SEC_PRESCAL_8_1 &
            PRI_PRESCAL_16_1
            , 
            SPI_ENABLE &
            SPI_IDLE_CON
            );
    
    ConfigIntSPI1(
            SPI_INT_DIS
            );
    
    return;
}
