/*
 * File: HitSub.c
 * Author: J. Edward Carryer
 * Modified: Gabriel H Elkaim
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is for a substate machine. Make sure it has a unique name
 *
 * This is provided as an example and a good place to start.
 *
 * History
 * When           Who     What/Why
 * -------------- ---     --------
 * 09/13/13 15:17 ghe      added tattletail functionality and recursive calls
 * 01/15/12 11:12 jec      revisions for Gen2 framework
 * 11/07/11 11:26 jec      made the queue static
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunTemplateSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "HSM.h"
#include "HitSub.h"
#include "MotorDriver.h"
#include "EventChecker.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    InitTimer,
    Respond,
    EvadeObstacle,
    Adjust,
} HitSubState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "InitTimer",
    "Respond",
    "EvadeObstacle",
    "Adjust",
};

typedef enum {
    FL,
    FR,
    RL,
    RR,
    NONE,
} HitTypes;

//// Timers Redone in HSM.h, dont use these 
//#define BumperTimer 1
//#define TurnTimer 2
//#define EvadeTimer 3

/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine */

/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static HitSubState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;
static HitTypes BumperType;

/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitHitSub(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitHitSub(void) {
    ES_Event returnEvent;
    BumperType = NONE;
    CurrentState = InitPSubState;
    returnEvent = RunHitSub(INIT_EVENT);

    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunHitSub(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be responded.
 * @return Event - return event (type and param), in general should be ES_NO_EVENT
 * @brief This function is where you implement the whole of the heirarchical state
 *        machine, as this is called any time a new event is passed to the event
 *        queue. This function will be called recursively to implement the correct
 *        order for a state transition to be: exit current state -> enter next state
 *        using the ES_EXIT and ES_ENTRY events.
 * @note Remember to rename to something appropriate.
 *       The lower level state machines are run first, to see if the event is dealt
 *       with there rather than at the current level. ES_EXIT and ES_ENTRY events are
 *       not consumed as these need to pass pack to the higher level state machine.
 * @author J. Edward Carryer, 2011.10.23 19:25
 * @author Gabriel H Elkaim, 2011.10.23 19:25 */
ES_Event RunHitSub(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    HitSubState_t nextState; // <- change type to correct enum

    //    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state


                // now put the machine into the actual initial state
                nextState = InitTimer;
                makeTransition = TRUE;
                //            ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        case InitTimer:
            //            printf("Event Type: %i", ThisEvent.EventType);
            ES_Timer_InitTimer(EventCheckTimer, 5);
            makeTransition = TRUE;
            nextState = Respond;
            //            ES_Timer_InitTimer(EvadeTimer, 2000);
            break;

        case Respond: // in the first state, replace this with correct names
            switch (ThisEvent.EventType) {
                case FL_BUMPER_HIT:
                    ES_Timer_InitTimer(EvadeTimer, 1000);
                    ManualSettings(REVERSE, 50, 100);
                    BumperType = FL;
                    printf("Respond: FL ");
                    break;
                case FR_BUMPER_HIT:
                    printf("Respond: FR ");
                    ES_Timer_InitTimer(EvadeTimer, 1000);
                    BumperType = FR;
                    ManualSettings(REVERSE, 100, 50);
                    break;
                case RL_BUMPER_HIT:
                    printf("Respond: RL ");
                    ES_Timer_InitTimer(EvadeTimer, 1000);
                    BumperType = RL;
                    ManualSettings(FORWARD, 100, 50);
                    break;
                case RR_BUMPER_HIT:
                    printf("Respond: RR ");
                    ES_Timer_InitTimer(EvadeTimer, 1000);
                    BumperType = RR;
                    ManualSettings(FORWARD, 50, 100);
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == EvadeTimer) {
                        switch (BumperType) {
                            case FL:
                                ES_Timer_InitTimer(EvadeTimer, 1000);
                                Forward(100);
                                //                                printf("Initted the timer to evade");
                                //                                BumperType = NONE;
                                break;
                            case FR:
                                ES_Timer_InitTimer(EvadeTimer, 1000);
                                Forward(100);
                                //                                BumperType = NONE;
                                break;
                            case RL:
                                ThisEvent.EventType = DONE_EVADING;
                                return ThisEvent;
                                //                                BumperType = NONE;
                                break;
                            case RR:
                                ThisEvent.EventType = DONE_EVADING;
                                return ThisEvent;
                                //                                BumperType = NONE;
                                break;
                            case NONE:

                                break;
                        }
                        //                        printf("going to EvadeObstacle");
                        makeTransition = TRUE;
                        nextState = Adjust; // changed from EvadeObstacle b/c too much evading
                    } else if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 5);
                        CheckBumpers();
                    }

                    break;
                case ES_NO_EVENT:

                default: // all unhandled events pass the event back up to the next level
                    break; // end of event handlers
            }
            break; // end of Respond State(case)

        case EvadeObstacle:
            switch (ThisEvent.EventType) {
                case FL_BUMPER_HIT:
                    printf("Evade Obstacle(HIT): FL ");
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    ManualSettings(REVERSE, 50, 100);
                    BumperType = FL;
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case FR_BUMPER_HIT:
                    printf("Evade Obstacle(HIT): FR ");
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = FR;
                    ManualSettings(REVERSE, 100, 50);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case RL_BUMPER_HIT:
                    printf("Evade Obstacle(HIT): RL ");
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = RL;
                    ManualSettings(FORWARD, 50, 100);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case RR_BUMPER_HIT:
                    printf("Evade Obstacle(HIT): RR ");
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = RR;
                    ManualSettings(FORWARD, 100, 50);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == EvadeTimer) {
                        //                        printf("we got evade timer ");
                        switch (BumperType) {
                            case FL:
                                ES_Timer_InitTimer(EvadeTimer, 2000);
                                ManualSettings(FORWARD, 50, 100);
                                //                                BumperType = NONE;
                                break;
                            case FR:
                                printf("Evade Obstacle(TIMEOUT): FR ");
                                ES_Timer_InitTimer(EvadeTimer, 2000);
                                ManualSettings(FORWARD, 100, 50);
                                //                                BumperType = NONE;
                                break;
                            case RL:
                                ES_Timer_InitTimer(EvadeTimer, 2000);
                                ManualSettings(REVERSE, 100, 50);
                                //                                BumperType = NONE;
                                break;
                            case RR:
                                ES_Timer_InitTimer(EvadeTimer, 2000);
                                ManualSettings(REVERSE, 50, 100);
                                //                                BumperType = NONE;
                                break;
                            case NONE:

                                break;
                        }
                        makeTransition = TRUE;
                        nextState = Adjust;
                    } else if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 5);
                        CheckBumpers();
                    }

                    break;
                case ES_NO_EVENT:

                default: // all unhandled events pass the event back up to the next level
                    break; // end of event handlers
            }
            break; // end of EvadeObstacle State(case)
        case Adjust:
            switch (ThisEvent.EventType) {
                case FL_BUMPER_HIT:
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    ManualSettings(REVERSE, 50, 100);
                    BumperType = FL;
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case FR_BUMPER_HIT:
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = FR;
                    ManualSettings(REVERSE, 100, 50);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case RL_BUMPER_HIT:
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = RL;
                    ManualSettings(FORWARD, 50, 100);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;
                case RR_BUMPER_HIT:
                    ES_Timer_InitTimer(EvadeTimer, 2000);
                    BumperType = RR;
                    ManualSettings(FORWARD, 100, 50);
                    makeTransition = TRUE;
                    nextState = Respond;
                    break;

                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == EvadeTimer) {
                        printf("Got Done Evading timeout ");
                        ThisEvent.EventType = DONE_EVADING;
                        return ThisEvent;
                    } else if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 5);
                        CheckBumpers();
                    }

                    break;
                case ES_NO_EVENT:

                default: // all unhandled events pass the event back up to the next level
                    break; // end of event handlers
            }
            break; // end of Adjust State(case)
        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        //        RunHitSub(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        //        RunHitSub(ENTRY_EVENT); // <- rename to your own Run function
    }

    //    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

