/*
 * File: GoHomeSub.c
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
#include "GoHomeSub.h"
#include "ES_Timers.h"
#include "MotorDriver.h" // Driving Motor Helper Library
#include "EventChecker.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    InitTimer,
    Spin,
    Drive,
} GoHomeSubState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "InitTimer",
    "Spin",
    "Drive",
};

// Timers
#define EventCheckTimer 0 // also in FindGoalieSub.c
#define SpinTimer 1 // also in FindGoalieSub.c
#define ReturnTimer 2 // not sure if i need to use a different timer???


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

static GoHomeSubState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitGoHomeSub(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunTemplateFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitGoHomeSub(void) {
    ES_Event returnEvent;

    CurrentState = InitPSubState;
    returnEvent = RunGoHomeSub(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }
    return FALSE;
}

/**
 * @Function RunGoHomeSub(ES_Event ThisEvent)
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
ES_Event RunGoHomeSub(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    GoHomeSubState_t nextState; // <- change type to correct enum
    static AdjustmentDirections goalway = STRAIGHT;
    uint8_t raw_adjustment;
    //    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state
                // Put these timers before they enter the substate machine
                //                ES_Timer_InitTimer(SpinTimer, 10000);
                //                ES_Timer_InitTimer(EventCheckTimer, 5);

                // now put the machine into the actual initial state
                nextState = InitTimer;
                makeTransition = TRUE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
        case InitTimer:
            ES_Timer_InitTimer(SpinTimer, 10000);
            ES_Timer_InitTimer(EventCheckTimer, 30);
            makeTransition = TRUE;
            nextState = Spin;
            break;

        case Spin: // in the first state, replace this with correct names
            TankLeft(50);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    // Hopefully times to 2.5 spins so it ends up facing backwards if signal not detected by then
                    if (ThisEvent.EventParam == SpinTimer) {
                        makeTransition = TRUE;
                        nextState = Drive;
                    } else if ((ThisEvent.EventParam == EventCheckTimer)) {
                        ES_Timer_InitTimer(EventCheckTimer, 30);
                        CheckBumpers();
                        CheckIR();
                        CheckDestination();
                        //                        CheckCam();
                    }
                    break;
                // Same Problem here as with check cam pins, need to be grounded if not in use
                case RELOAD_SPOTTED:
                    makeTransition = TRUE;
                    ES_Timer_InitTimer(ReturnTimer, 15000);
                    nextState = Drive;
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;
        case Drive:
            if (goalway == ADJUST_LEFT) {
                // Sets right motor to go faster than left
                ManualSettings(FORWARD, 40, 70);
            } else if (goalway == ADJUST_RIGHT) {
                // Sets left motor to go faster than right
                ManualSettings(FORWARD, 70, 40);
            } else if (goalway == STRAIGHT) {
                // Straight ahead, should be this if we get the signal hopefully
                Forward(100);
            } else {
                MotorsStop();
            }
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    if ((ThisEvent.EventParam == EventCheckTimer)) {
                        ES_Timer_InitTimer(EventCheckTimer, 30);
                        CheckBumpers();
                        CheckIR();
                        CheckDestination();
                        CheckCam();
                    } else if (ThisEvent.EventParam == ReturnTimer) {
                        ThisEvent.EventType = STOP;
                        return ThisEvent;
                    }
                    break;
                case NEED_ADJUSTMENT:
                    // Uses parameter do decide which way to go, see GoGoal State
                    // w/ goalway
                    raw_adjustment = ThisEvent.EventParam;
                    if (raw_adjustment == HighMiddle) {
                        goalway = ADJUST_LEFT;
                        makeTransition = TRUE;
                        nextState = Drive;
                    } else if (raw_adjustment == LowMiddle) {
                        goalway = ADJUST_RIGHT;
                        makeTransition = TRUE;
                        nextState = Drive;
                    } else if (raw_adjustment == Middle) {
                        goalway = STRAIGHT;
                        makeTransition = TRUE;
                        nextState = Drive;
                    }
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    break;
            }
            break;
        default: // all unhandled states fall into here
            break;
    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
        //        RunGoHomeSub(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
        //        RunGoHomeSub(ENTRY_EVENT); // <- rename to your own Run function
    }

    //    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

