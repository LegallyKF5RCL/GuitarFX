#include <p24hj128GP202.h>
#include <Generic.h>
#include "Header_GuitarFX.h"

void Initialize_GuitarFX(void)      //Setup pins
{
    AD1PCFGL = 0xFFFF;
    TRISA = 0x0000;
    TRISB = 0x0000;
    TRISBbits.TRISB7 = 1;
    LATA = 0x0000;
    LATB = 0x0000;
    LATBbits.LATB5 = 1;
    
   
    return;
}
