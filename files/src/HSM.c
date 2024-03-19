/*
 * File: TemplateSubHSM.c
 * Author: J. Edward Carryer
 * Modified: Gabriel Elkaim and Soja-Marie Morgens
 *
 * Template file to set up a Heirarchical State Machine to work with the Events and
 * Services Framework (ES_Framework) on the Uno32 for the CMPE-118/L class. Note that
 * this file will need to be modified to fit your exact needs, and most of the names
 * will have to be changed to match your code.
 *
 * There is another template file for the SubHSM's that is slightly differet, and
 * should be used for all of the subordinate state machines (flat or heirarchical)
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
#include "FindGoalieSub.h" // sub HSM for Finding the Goalie
#include "TemplateSubHSM.h" //#include all sub state machines called
#include "EventChecker.h" // Event Checkers, including bumpers, tape, and cam
#include "MotorDriver.h" // Driving Motor Helper Library
#include "HitSub.h" // sub HSM to deal with collisions
#include "ShootSub.h" // sub HSM for shooting
#include "AimSub.h" // Sub HSM for aiming
#include "GoHomeSub.h" // Sub HSM for returning to reload zone
#include "FlywheelDriver.h" // Shoooting Helper Library
#include "ES_Timers.h"
/*******************************************************************************
 * PRIVATE #DEFINES                                                            *
 ******************************************************************************/
//Include any defines you need to do

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/



//#define FL 0
//#define FR 1
//#define RL 3
//#define RR 4

typedef enum {
    FL,
    FR,
    RL,
    RR,
    NONE,
} HitTypes;

typedef enum {
    InitPState,
    WaitToStart,
    FindGoalie,
    Hit,
    Aim,
    Shoot,
    GoHome,
    Reload,
} HSMState_t;

static const char *StateNames[] = {
    "InitPState",
    "WaitToStart",
    "FindGoalie",
    "Hit",
    "Aim",
    "Shoot",
    "GoHome",
    "Reload",
};


/*******************************************************************************
 * PRIVATE FUNCTION PROTOTYPES                                                 *
 ******************************************************************************/
/* Prototypes for private functions for this machine. They should be functions
   relevant to the behavior of this state machine
   Example: char RunAway(uint_8 seconds);*/
/*******************************************************************************
 * PRIVATE MODULE VARIABLES                                                            *
 ******************************************************************************/
/* You will need MyPriority and the state variable; you may need others as well.
 * The type of state variable should match that of enum in header file. */

static HSMState_t CurrentState = InitPState;
static HSMState_t PrevHitState;
static uint8_t MyPriority;
static HitTypes LastHit = NONE;
//static HitTypes BumperHit = NONE;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitTemplateHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitHSM(uint8_t Priority) {
    MyPriority = Priority;
    // put us into the Initial PseudoState
    // Initialize all sub-state machines
    InitFindGoalieSubHSM();
    InitShootSub();
    InitAimSub();
    InitGoHomeSub();
    InitHitSub();

    // Init Bumper Pins
    Sensor_Init();

    CurrentState = InitPState;
    // post the initial transition event
    if (ES_PostToService(MyPriority, INIT_EVENT) == TRUE) {
        return TRUE;
    } else {
        return FALSE;
    }
}

/**
 * @Function PostTemplateHSM(ES_Event ThisEvent)
 * @param ThisEvent - the event (type and param) to be posted to queue
 * @return TRUE or FALSE
 * @brief This function is a wrapper to the queue posting function, and its name
 *        will be used inside ES_Configure to point to which queue events should
 *        be posted to. Remember to rename to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t PostHSM(ES_Event ThisEvent) {
    return ES_PostToService(MyPriority, ThisEvent);
}

/**
 * @Function RunTemplateHSM(ES_Event ThisEvent)
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
ES_Event RunHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    HSMState_t nextState;

    //    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPState: // If current state is initial Pseudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // now put the machine into the actual initial state
                //                nextState = FindGoalie;
                //test 

                ES_Timer_InitTimer(EventCheckTimer, 1500); // Init 5ms event checking timer
                //                ES_Timer_InitTimer(SpinTimer, 7000); // Init timer to wait for le potato to boot ~1 sec
                nextState = WaitToStart; // change to WaitToStart
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;

        case WaitToStart: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            //                        printf("In find goalie");
            CloseGate();
            Forward(100);
            if (ThisEvent.EventType == ES_TIMEOUT) {
                if (ThisEvent.EventParam == EventCheckTimer) {
                    nextState = Shoot;
                    makeTransition = TRUE;
                }
            }


//            if (PORTZ11_BIT) {
//                printf("LETS GO  ");
//                ES_Timer_InitTimer(SpinTimer, 7000);
//                makeTransition = TRUE;
//                nextState = Shoot;
//            }
            break;


        case FindGoalie: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            if ((ThisEvent.EventType != ES_TIMEOUT)) {
                if (ThisEvent.EventType != ES_TIMERACTIVE) {
                    printf("In find goalie: %i  \r\n", ThisEvent.EventType);
                }

            }
            CloseGate();
            ThisEvent = RunFindGoalieSubHSM(ThisEvent);
            switch (ThisEvent.EventType) {
                case GOAL_LOCATED:
                    printf("we doing hsm instead  ");
                    ThisEvent.EventType = GOAL_LOCATED;
                    ThisEvent = RunFindGoalieSubHSM(ThisEvent);
                    break;
                case CLOSE_TO_GOAL:
                    MotorsStop();
                    makeTransition = TRUE;
                    nextState = Aim;
                    break;
                case FL_BUMPER_HIT:
                    //                    printf("got FL hit         \n");
                    PrevHitState = FindGoalie;
                    LastHit = FL;
                    makeTransition = TRUE;
                    nextState = Hit;
                    ThisEvent = RunHitSub(ThisEvent);
                    break;
                case FR_BUMPER_HIT:
                    //                    printf("got FR hit  \n");
                    PrevHitState = FindGoalie;
                    LastHit = FR;
                    makeTransition = TRUE;
                    nextState = Hit;
                    ThisEvent = RunHitSub(ThisEvent);
                    break;
                case RL_BUMPER_HIT:
                    PrevHitState = FindGoalie;
                    LastHit = RL;
                    makeTransition = TRUE;
                    nextState = Hit;
                    ThisEvent = RunHitSub(ThisEvent);
                    break;
                case RR_BUMPER_HIT:
                    PrevHitState = FindGoalie;
                    LastHit = RR;
                    makeTransition = TRUE;
                    nextState = Hit;
                    ThisEvent = RunHitSub(ThisEvent);
                    break;
                case ES_NO_EVENT:
                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;

        case Hit:
            //                        printf("Entered Hit");
            //                        printf("Last HIt: %i, %i", LastHit, FL);
            // Keep Gate Shut in other states
            CloseGate();
            // Sets Bumper Event after it was consumed to get to this state
            switch (LastHit) {
                case FL:
                    ThisEvent.EventType = FL_BUMPER_HIT;
                    break;
                case FR:
                    ThisEvent.EventType = FR_BUMPER_HIT;
                    break;
                case RL:
                    ThisEvent.EventType = RL_BUMPER_HIT;
                    break;
                case RR:
                    ThisEvent.EventType = RR_BUMPER_HIT;
                    break;
            }
            LastHit = NONE; // Consume Last Hit so it doesn't keep making events
            // Break into Lower-Sub-State-Machine
            ThisEvent = RunHitSub(ThisEvent);
            switch (ThisEvent.EventType) {
                case DONE_EVADING:
                    printf("hit to find/home  ");

                    switch (PrevHitState) {
                        case FindGoalie:
                            printf("going goal  ");
                            ES_Timer_InitTimer(SpinTimer, 7000);
                            makeTransition = TRUE;
                            nextState = FindGoalie;

                            break;
                        case GoHome:
                            printf("going home  ");
                            //                            ES_Timer_InitTimer(SpinTimer, 7000);
                            makeTransition = TRUE;
                            nextState = GoHome;
                            break;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;

        case Aim:
            CloseGate();
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            ThisEvent = RunAimSub(ThisEvent);
            switch (ThisEvent.EventType) {

                case SHOOT_NOW:
                    makeTransition = TRUE;
                    nextState = Shoot;
                    //                    ES_Timer_InitTimer(FlywheelWarmUp, 5000);
                    break;
                case ES_NO_EVENT:
                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;
        case Shoot: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            //            printf("Got Here");
            ThisEvent = RunShootSub(ThisEvent);
            switch (ThisEvent.EventType) {
                case DONE_SHOOT:
                    // TImers dont work? Instead is in second init sub state 
                    //                    ES_Timer_InitTimer(SpinTimer, 10000);
                    //                    ES_Timer_InitTimer(EventCheckTimer, 5);
                    ES_Timer_InitTimer(SpinTimer, 4050);
                    nextState = GoHome;
                    makeTransition = TRUE;
                    //                    printf("Shoot Completed        \n");
                    break;

                case ES_NO_EVENT:

                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;
        case GoHome: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            CloseGate();
            Reverse(100);
//            ThisEvent = RunGoHomeSub(ThisEvent);
            //                        printf("Done Shooting and back to where we wanna be         \n");
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == SpinTimer) {
                        ES_Timer_InitTimer(ReloadTimer, 3000);
                        makeTransition = TRUE;
                        nextState = Reload;
                    }

                    break;

                case ES_NO_EVENT:
                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;

            }
            break;
        case Reload: // in the first state, replace this with correct names
            // run sub-state machine for this state
            //NOTE: the SubState Machine runs and responds to events before anything in the this
            //state machine does
            //            ThisEvent = RunTemplateSubHSM(ThisEvent);
            CloseGate();
            MotorsStop();
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if (ThisEvent.EventParam == ReloadTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 1500);
                        makeTransition = TRUE;
                        nextState = WaitToStart;
                        ThisEvent.EventType = ES_NO_EVENT;
                    }
                    break;
                case ES_NO_EVENT:
                default:
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;
        default: // all unhandled states fall into here
            ThisEvent.EventType = ES_NO_EVENT;
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        //        RunHSM(EXIT_EVENT);
        CurrentState = nextState;
        printf("CurrentState: %s    ", StateNames[CurrentState]);
        //        RunHSM(ENTRY_EVENT);

        makeTransition = FALSE;
    }

    //    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/
