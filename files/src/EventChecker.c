/*
 * File:   TemplateEventChecker.c
 * Author: Gabriel Hugh Elkaim
 *
 * Template file to set up typical EventCheckers for the  Events and Services
 * Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the
 * names will have to be changed to match your code.
 *
 * This EventCheckers file will work with both FSM's and HSM's.
 *
 * Remember that EventCheckers should only return TRUE when an event has occured,
 * and that the event is a TRANSITION between two detectable differences. They
 * should also be atomic and run as fast as possible for good results.
 *
 * This file includes a test harness that will run the event detectors listed in the
 * ES_Configure file in the project, and will conditionally compile main if the macro
 * EVENTCHECKER_TEST is defined (either in the project or in the file). This will allow
 * you to check you event detectors in their own project, and then leave them untouched
 * for your project unless you need to alter their post functions.
 *
 * Created on September 27, 2013, 8:37 AM
 */

/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "EventChecker.h"
#include "ES_Events.h"
#include "serial.h"
#include "AD.h"
#include <stdio.h>// to add printf()
#include "timers.h"
//#include "EventService.h"
//#include "EventService.c"
#include "ES_Framework.h"
#include <math.h>
#include <stdlib.h>
#include <xc.h>
#include "ES_Timers.h"
#include "IO_Ports.h" // to use digital pins
#include "HSM.h" // to use #define for HighMiddle
#include "LED.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
#define BATTERY_DISCONNECT_THRESHOLD 175
#define BumperOnThreshold  900 // 1000

#define FL 0
#define FR 1
#define RL 3
#define RR 4

#define IR_FL PIN3
#define IR_FM PIN4
#define IR_FR PIN5
#define IR_R PIN7

// Start Bot Pin
#define StartPin PORTZ11_BIT

// Bumper
#define FL_Bumper AD_PORTW3
#define FR_Bumper AD_PORTW4
#define RL_Bumper AD_PORTW5
#define RR_Bumper AD_PORTW6

// Camera
#define GoalPostPin PORTZ08_BIT
#define ReloadSpotPin PORTZ09_BIT
#define CloseGoalPin PORTZ10_BIT
#define AdjustLeftPin PORTY08_BIT
#define AdjustRightPin PORTY05_BIT
#define ShootPin PORTY06_BIT
//#define CameraOffsetPin AD_PORTW7

/*******************************************************************************
 * EVENTCHECKER_TEST SPECIFIC CODE                                                             *
 ******************************************************************************/

//#define EVENTCHECKER_TEST
#ifdef EVENTCHECKER_TEST
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)

static const char *eventName;
static ES_Event storedEvent;
#endif

//#define EVENT_TESTER
#ifdef EVENT_TESTER
#include <stdio.h>
#define SaveEvent(x) do {eventName=__func__; storedEvent=x;} while (0)

static const char *eventName;
static ES_Event storedEvent;
#endif

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this EventChecker. They should be functions
   relevant to the behavior of this particular event checker */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                    *
 ******************************************************************************/

/* Any private module level variable that you might need for keeping track of
   events would be placed here. Private variables should be STATIC so that they
   are limited in scope to this module. */

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/




void Sensor_Init(void) {
    //    Bumper Pins
    AD_Init();
    //         AD_PORTW3   AD_PORTW4   AD_PORTW5   AD_PORTW6  
    AD_AddPins(FL_Bumper | FR_Bumper | RL_Bumper | RR_Bumper);
    //    IR Tape Pins
    //                            Z03     Z04     Z05     Z07
    IO_PortsSetPortInputs(PORTZ, IR_FL | IR_FM | IR_FR | IR_R);

    //    Camera Pins               GoalPost  ReloadSpot CloseGoalPin StartPin
    IO_PortsSetPortInputs(PORTZ, PIN8 | PIN9 | PIN10 | PIN11);

    // Camera Pins    AdjustLeftPin    Right    Shoot
    //    IO_PortsSetPortInputs(PORTY, PIN3 | PIN5 | PIN6);
    PORTY08_TRIS = 1;
    PORTY05_TRIS = 1;
    PORTY06_TRIS = 1;
    //AD_AddPins(CameraOffsetPin);

    // Test
    LED_Init();
    LED_AddBanks(LED_BANK2);

}

/**
 * @Function TemplateCheckBattery(void)
 * @param none
 * @return TRUE or FALSE
 * @brief This function is a prototype event checker that checks the battery voltage
 *        against a fixed threshold (#defined in the .c file). Note that you need to
 *        keep track of previous history, and that the actual battery voltage is checked
 *        only once at the beginning of the function. The function will post an event
 *        of either BATTERY_CONNECTED or BATTERY_DISCONNECTED if the power switch is turned
 *        on or off with the USB cord plugged into the Uno32. Returns TRUE if there was an 
 *        event, FALSE otherwise.
 * @note Use this code as a template for your other event checkers, and modify as necessary.
 * @author Gabriel H Elkaim, 2013.09.27 09:18
 * @modified Gabriel H Elkaim/Max Dunne, 2016.09.12 20:08 */
uint8_t CheckBattery(void) {
    static ES_EventTyp_t lastEvent = BATTERY_DISCONNECTED;
    ES_EventTyp_t curEvent;
    ES_Event thisEvent;
    uint8_t returnVal = FALSE;
    uint16_t batVoltage = AD_ReadADPin(BAT_VOLTAGE); // read the battery voltage

    if (batVoltage > BATTERY_DISCONNECT_THRESHOLD) { // is battery connected?
        curEvent = BATTERY_CONNECTED;
    } else {
        curEvent = BATTERY_DISCONNECTED;
    }
    if (curEvent != lastEvent) { // check for change from last time
        thisEvent.EventType = curEvent;
        thisEvent.EventParam = batVoltage;
        returnVal = TRUE;
        lastEvent = curEvent; // update history
#ifndef EVENTCHECKER_TEST           // keep this as is for test harness
        // PostGenericService(thisEvent);
#else
        SaveEvent(thisEvent);
#endif   
    }
    return (returnVal);
}

/****************************************************************************/


#define FLEFT_BUMP_MASK (1)
#define FRIGHT_BUMP_MASK (1<<1)
#define RLEFT_BUMP_MASK (1<<2)
#define RRIGHT_BUMP_MASK (1<<3)


// Possib add other permulations of multiple hits

uint8_t CheckBumpers(void) {
    static ES_EventTyp_t LastBumperEvent = FR_BUMPER_UNHIT;
    ES_EventTyp_t currEvent;
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    uint16_t BumperType;
    // change to ADC read
    //    printf("%i    ", AD_ReadADPin(FR_Bumper));
    if ((AD_ReadADPin(FL_Bumper) + 1) > BumperOnThreshold) {
        //        printf("%i        ", AD_ReadADPin(FL_Bumper));
        currEvent = FL_BUMPER_HIT;
        BumperType = FL;
        //        printf("FRONT LEFT BUMPER HIT\n");
        //        printf("FL_BUMP_HIT");
    } else if (AD_ReadADPin(FL_Bumper) < BumperOnThreshold) {
        //        currEvent = FL_BUMPER_UNHIT;
    }

    if ((AD_ReadADPin(FR_Bumper) + 1) > BumperOnThreshold) {
        //                printf("%i        ", AD_ReadADPin(FR_Bumper));
        currEvent = FR_BUMPER_HIT;

        //        printf("FL currEvent: %i ", currEvent);
        //        printf("FL lastEvent: %i ", LastBumperEvent);
        BumperType = FR;
        //                printf("FR_BUMP_HIT");
    } else if (AD_ReadADPin(FR_Bumper) < BumperOnThreshold) {
        //        currEvent = FR_BUMPER_UNHIT;
    }

    if ((AD_ReadADPin(RL_Bumper) + 1) > BumperOnThreshold) {
        //        printf("%i      ", AD_ReadADPin(RL_Bumper));
        currEvent = RL_BUMPER_HIT;
        BumperType = RL;
        //                printf("RL_BUMP_HIT");
    } else if (AD_ReadADPin(RL_Bumper) < BumperOnThreshold) {
        //        currEvent = RL_BUMPER_UNHIT;
    }

    if ((AD_ReadADPin(RR_Bumper) + 1) > BumperOnThreshold) {
        //        printf("RR ADC VAL: %i               ", AD_ReadADPin(RR_Bumper));
        currEvent = RR_BUMPER_HIT;
        BumperType = RR;
        //                printf("RR_BUMP_HIT");
    } else if (AD_ReadADPin(RR_Bumper) < BumperOnThreshold) {
        //        currEvent = RR_BUMPER_UNHIT;
    }
    //     If the last bumper event was a hit
    //    if (LastBumperEvent == FL_BUMPER_HIT || LastBumperEvent == FR_BUMPER_HIT || LastBumperEvent == RL_BUMPER_HIT || LastBumperEvent == RR_BUMPER_HIT) {
    //        // check for an unhit
    //        if (AD_ReadADPin(FL_Bumper) < BumperOnThreshold) {
    //            currEvent = FL_BUMPER_UNHIT;
    //        } else if (AD_ReadADPin(FR_Bumper) < BumperOnThreshold) {
    //            currEvent = FR_BUMPER_UNHIT;
    //        } else if (AD_ReadADPin(RL_Bumper) < BumperOnThreshold) {
    //            currEvent = RL_BUMPER_UNHIT;
    //        } else if (AD_ReadADPin(RR_Bumper) < BumperOnThreshold) {
    //            currEvent = RR_BUMPER_UNHIT;
    //        }
    //    }

    if (LastBumperEvent == FL_BUMPER_HIT) {
        if ((AD_ReadADPin(FL_Bumper) < BumperOnThreshold) & (AD_ReadADPin(FL_Bumper) < BumperOnThreshold) & (AD_ReadADPin(FL_Bumper) < BumperOnThreshold)) {
            currEvent = FL_BUMPER_UNHIT;
        } else {
            currEvent = FL_BUMPER_HIT;
        }
    } else if (LastBumperEvent == FR_BUMPER_HIT) {
        if (AD_ReadADPin(FR_Bumper) < BumperOnThreshold) {
            currEvent = FR_BUMPER_UNHIT;
        } else {
            currEvent = FR_BUMPER_HIT;
        }
    } else if (LastBumperEvent == RL_BUMPER_HIT) {
        if (AD_ReadADPin(RL_Bumper) < BumperOnThreshold) {
            currEvent = RL_BUMPER_UNHIT;
        } else {
            currEvent = RL_BUMPER_HIT;
        }
    } else if (LastBumperEvent == RR_BUMPER_HIT) {
        if (AD_ReadADPin(RR_Bumper) < BumperOnThreshold) {
            currEvent = RR_BUMPER_UNHIT;
        } else {
            currEvent = RR_BUMPER_HIT;
        }
    } else {

    }


    //    printf("currEvent: %i", currEvent);
    //    printf("LastEvent: %i", LastBumperEvent);
    if (currEvent != LastBumperEvent) {
        if ((currEvent == FL_BUMPER_HIT) | (currEvent == FR_BUMPER_HIT) | (currEvent == RL_BUMPER_HIT) | (currEvent == RR_BUMPER_HIT)) {
            thisEvent.EventType = currEvent;
            printf("WTF: %i    ", thisEvent.EventType);
            thisEvent.EventParam = BumperType;
            returnVal = TRUE;
            PostHSM(thisEvent);
            LastBumperEvent = currEvent; // update history
        } else if ((currEvent == FL_BUMPER_UNHIT) | (currEvent == FR_BUMPER_UNHIT) | (currEvent == RL_BUMPER_UNHIT) | (currEvent == RR_BUMPER_UNHIT)) {
            //            thisEvent.EventType = currEvent;
            //            printf("WTF: %i    ", thisEvent.EventType);
            //            thisEvent.EventParam = BumperType;
            //            returnVal = TRUE;
            //            PostHSM(thisEvent);

            LastBumperEvent = currEvent; // update history
        } else {

        }

    }

    return (returnVal);
    //}
    // TIMERS_StartTimer(0);


}

uint8_t CheckIR(void) {
    static ES_EventTyp_t LastIREvent;
    ES_EventTyp_t currEvent;
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    int16_t IO_Output = IO_PortsReadPort(PORTZ);
    if (IO_Output & IR_FL == TRUE) {
        currEvent = FL_IR_HIT;
    } else if (IO_Output & IR_FL != TRUE) {
        currEvent = FL_IR_UNHIT;
    }

    if (IO_Output & IR_FM == TRUE) {
        currEvent = FM_IR_HIT;
    } else if (IO_Output & IR_FM != TRUE) {
        currEvent = FM_IR_UNHIT;
    }

    if (IO_Output & IR_FR == TRUE) {
        currEvent = FR_IR_HIT;
    } else if (IO_Output & IR_FR != TRUE) {
        currEvent = FR_IR_UNHIT;
    }

    if (IO_Output & IR_R == TRUE) {
        currEvent = R_IR_HIT;
    } else if (IO_Output & IR_R != TRUE) {
        currEvent = R_IR_UNHIT;
    }

    if (currEvent != LastIREvent) {

        thisEvent.EventType = currEvent;
        returnVal = TRUE;
        PostHSM(thisEvent);
        LastIREvent = currEvent; // update history
    }

    return (returnVal);
}

uint8_t CheckDestination(void) {
    static ES_EventTyp_t LastCameraEvent = CLOSE_TO_GOAL;
    ES_EventTyp_t CamcurrEvent;
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    //    LED_SetBank(LED_BANK2, 0b1000);
    //    printf("we are event checking");
    // GoalPost detected
    if (GoalPostPin) {
        //        printf("goalpost detected  ");
        LED_SetBank(LED_BANK2, 0b1000);
        CamcurrEvent = GOAL_LOCATED;
    }// Reload Zone Detected
    else if (ReloadSpotPin) {
        CamcurrEvent = RELOAD_SPOTTED;
    }

    if (CloseGoalPin) {
        CamcurrEvent = CLOSE_TO_GOAL;
    }

    // Sammy out of way event 
//    if (ShootPin) {
//        CamcurrEvent = SHOOT_NOW;
//    }

    // Start bot
    if (StartPin) {
        //        CamcurrEvent = SHOOT_NOW;
    }

    if (CamcurrEvent != LastCameraEvent) {

        if ((CamcurrEvent == GOAL_LOCATED) | (CamcurrEvent == RELOAD_SPOTTED) | (CamcurrEvent == CLOSE_TO_GOAL) | (CamcurrEvent == SHOOT_NOW)) {
//            printf("cam event posted: %i  \r\n", CamcurrEvent);
            thisEvent.EventType = CamcurrEvent;
            returnVal = TRUE;
            PostHSM(thisEvent);
            LastCameraEvent = CamcurrEvent; // update history
        }

        
    }

    return (returnVal);

}

uint8_t CheckCam(void) {
    static ES_EventTyp_t LastCameraEvent = STRAIGHT;
    static uint16_t LastCameraOffset;
    ES_EventTyp_t currEvent;
    uint8_t returnVal = FALSE;
    ES_Event thisEvent;
    static uint16_t CameraOffset = STRAIGHT; // Middle(Straight))

    // Sig dif in Offset found
    if (AdjustLeftPin) {
        //        printf("PORT BITS: %i", IO_PortsReadPort(PORTY));
        currEvent = NEED_ADJUSTMENT;
        CameraOffset = LowMiddle;

    } else if (AdjustRightPin) {
        currEvent = NEED_ADJUSTMENT;
        CameraOffset = HighMiddle;

    } else {
        currEvent = NEED_ADJUSTMENT;
        CameraOffset = Middle;
    }

    if (LastCameraOffset != CameraOffset) {

        thisEvent.EventType = currEvent;
        thisEvent.EventParam = CameraOffset;
        returnVal = TRUE;
        PostHSM(thisEvent);
        LastCameraEvent = currEvent; // update history
        LastCameraOffset = CameraOffset;
    }

    return (returnVal);
}


/* 
 * The Test Harness for the event checkers is conditionally compiled using
 * the EVENTCHECKER_TEST macro (defined either in the file or at the project level).
 * No other main() can exist within the project.
 * 
 * It requires a valid ES_Configure.h file in the project with the correct events in 
 * the enum, and the correct list of event checkers in the EVENT_CHECK_LIST.
 * 
 * The test harness will run each of your event detectors identically to the way the
 * ES_Framework will call them, and if an event is detected it will print out the function
 * name, event, and event parameter. Use this to test your event checking code and
 * ensure that it is fully functional.
 * 
 * If you are locking up the output, most likely you are generating too many events.
 * Remember that events are detectable changes, not a state in itself.
 * 
 * Once you have fully tested your event checking code, you can leave it in its own
 * project and point to it from your other projects. If the EVENTCHECKER_TEST marco is
 * defined in the project, no changes are necessary for your event checkers to work
 * with your other projects.
 */

#ifdef EVENT_TESTER
#include <stdio.h>


static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {

    printf("seg fault \n");
    BOARD_Init();
    printf("seg fault \n");
    printf("seg fault 1\n");
    //    TIMERS_Init();
    ES_Initialize();
    printf("seg fault 2\n");
    ES_Run();
}

void PrintEvent(void) {

    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif
#ifdef EVENTCHECKER_TEST
#include <stdio.h>


static uint8_t(*EventList[])(void) = {EVENT_CHECK_LIST};

void PrintEvent(void);

void main(void) {
    BOARD_Init();
    /* user initialization code goes here */

    // Do not alter anything below this line
    int i;

    printf("\r\nEvent checking test harness for %s", __FILE__);

    while (1) {
        if (IsTransmitEmpty()) {
            for (i = 0; i< sizeof (EventList) >> 2; i++) {
                if (EventList[i]() == TRUE) {
                    PrintEvent();

                    break;
                }

            }
        }
    }
}

void PrintEvent(void) {
    printf("\r\nFunc: %s\tEvent: %s\tParam: 0x%X", eventName,
            EventNames[storedEvent.EventType], storedEvent.EventParam);
}
#endif