#include <BOARD.h>
#include <xc.h>
#include <stdio.h>
#include "ES_Configure.h"
#include "ES_Framework.h"

void main(void)
{
    ES_Return_t ErrorType;

    BOARD_Init();

    printf("Starting ES Framework StrangleHold\r\n");
    printf("using the Worst Generation Events & Services Framework\r\n");


    // Your hardware initialization function calls go here
    
    // I put them in the relevant state machine stuff its fineeeeeeeeee probably
    
    // now initialize the Events and Services Framework and start it running
    ErrorType = ES_Initialize();
    if (ErrorType == Success) {
        // idgaf errors be damned
        while(1) {
            ErrorType = ES_Run();
        }

    }
    /*
     * if we got to here, there was an error, and somethings wrong because
     * i got rid of this shit because of other things i removed because i dont
     * understand them 
     */
    switch (ErrorType) {
    case FailedPointer:
        printf("Failed on NULL pointer");
        break;
    case FailedInit:
        printf("Failed Initialization");
        break;
    default:
        printf("Other Failure: %d", ErrorType);
        break;
    }
    for (;;)
        ;

};

/*------------------------------- Footnotes -------------------------------*/
/*------------------------------ End of file ------------------------------*/
