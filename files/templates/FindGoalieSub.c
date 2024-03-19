/*
 * File: FindGoalieSub.c
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
 * 10/30/11 17:59 jec      fixed references to CurrentEvent in RunFindGoalieSM()
 * 10/23/11 18:20 jec      began conversion from SMTemplate.c (02/20/07 rev)
 */


/*******************************************************************************
 * MODULE #INCLUDE                                                             *
 ******************************************************************************/

#include "ES_Configure.h"
#include "ES_Framework.h"
#include "BOARD.h"
#include "HSM.h"
#include "FindGoalieSub.h"

#include "IO_Ports.h"
#include "MotorDriver.h"
#include "EventChecker.h"
#include "ES_Timers.h"

/*******************************************************************************
 * MODULE #DEFINES                                                             *
 ******************************************************************************/
typedef enum {
    InitPSubState,
    Spin,
    Jig,
    GoGoal,
    Stop,
} FindGoalieSubHSMState_t;

static const char *StateNames[] = {
    "InitPSubState",
    "Spin",
    "Jig",
    "GoGoal",
    "Stop",
};




#define EventCheckTimer 0
#define SpinTimer 1




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

static FindGoalieSubHSMState_t CurrentState = InitPSubState; // <- change name to match ENUM
static uint8_t MyPriority;


/*******************************************************************************
 * PUBLIC FUNCTIONS                                                            *
 ******************************************************************************/

/**
 * @Function InitFindGoalieSubHSM(uint8_t Priority)
 * @param Priority - internal variable to track which event queue to use
 * @return TRUE or FALSE
 * @brief This will get called by the framework at the beginning of the code
 *        execution. It will post an ES_INIT event to the appropriate event
 *        queue, which will be handled inside RunFindGoalieFSM function. Remember
 *        to rename this to something appropriate.
 *        Returns TRUE if successful, FALSE otherwise
 * @author J. Edward Carryer, 2011.10.23 19:25 */
uint8_t InitFindGoalieSubHSM(void) {
    ES_Event returnEvent;
    MotorsInit();
    ES_Timer_Init();
    CurrentState = InitPSubState;
    returnEvent = RunFindGoalieSubHSM(INIT_EVENT);
    if (returnEvent.EventType == ES_NO_EVENT) {
        return TRUE;
    }

    return FALSE;
}

/**
 * @Function RunFindGoalieSubHSM(ES_Event ThisEvent)
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
ES_Event RunFindGoalieSubHSM(ES_Event ThisEvent) {
    uint8_t makeTransition = FALSE; // use to flag transition
    FindGoalieSubHSMState_t nextState; // <- change type to correct enum
    uint16_t raw_adjustment; // for camera -> offset movement
    static AdjustmentDirections goalway = STRAIGHT;
    //    ES_Tattle(); // trace call stack

    switch (CurrentState) {
        case InitPSubState: // If current state is initial Psedudo State
            if (ThisEvent.EventType == ES_INIT)// only respond to ES_Init
            {
                // this is where you would put any actions associated with the
                // transition from the initial pseudo-state into the actual
                // initial state

                //                // Start timer for robot to spin for 2 seconds, exp make 1 full turn
                //                ES_Timer_InitTimer(SpinTimer, 4000);
                // now put the machine into the actual initial state
                nextState = Spin; // Should be Spin
                makeTransition = FALSE;
                ThisEvent.EventType = ES_NO_EVENT;
            }
            break;
            // Spins to find goal 
        case Spin:
            // Spins Robot counterclockwise to search
            printf("you should be here \r\n");
            TankLeft(47);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    // Checking Sensors for Event Changes
                    if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 30); // reinit timer
                        CheckBumpers();
                        CheckIR();
                        CheckDestination();
//                        CheckCam();
                    } else if (ThisEvent.EventParam == SpinTimer) {
                        //  Not sure if this will work as intended, but i want the bot to go forward
                        //  If the goal wasn't found to move around, but it should be fine because 
                        //  We should be able to see the goal from anywhere on the field but maybe not 
                        //  Because camera needs to see the goalposts?
                        // 
                        ES_Timer_InitTimer(SpinTimer, 1500); // Re-init timer for jig timeout
                        makeTransition = TRUE;
                        nextState = Jig;
                    }
                    break;
                case GOAL_LOCATED:
                    printf("got camera event  ");
                    makeTransition = TRUE;
                    nextState = GoGoal;

                    break;
                case FL_BUMPER_HIT:
                    ThisEvent.EventType = FL_BUMPER_HIT;
                    printf("got bumper hit in sub");
                    return ThisEvent;
                    break;
                case FR_BUMPER_HIT:
                    ThisEvent.EventType = FR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RL_BUMPER_HIT:
                    ThisEvent.EventType = RL_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RR_BUMPER_HIT:
                    ThisEvent.EventType = RR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;
            // Cant find goal? MOve a lil forward and try again!
        case Jig:
            MotorsStop();
            //Forward(100);
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    // Checking Sensors for Event Changes
                    if (ThisEvent.EventParam == SpinTimer) {
                        ES_Timer_InitTimer(SpinTimer, 4000); // Re-init timer for spin timeout
                        makeTransition = TRUE;
                        nextState = Spin;
                    } else if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 30); // reinit timer
                        CheckBumpers();
                        CheckIR();
                        CheckDestination();
//                        CheckCam();
                    }
                    break;
                case GOAL_LOCATED:
                    printf("got camera event   ");
                    makeTransition = TRUE;
                    nextState = GoGoal;
                    break;
                case FL_BUMPER_HIT:
                    ThisEvent.EventType = FL_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case FR_BUMPER_HIT:
                    ThisEvent.EventType = FR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RL_BUMPER_HIT:
                    ThisEvent.EventType = RL_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RR_BUMPER_HIT:
                    ThisEvent.EventType = RR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }
            break;
            // We out here moving to goal
        case GoGoal:
            // Set From need adjustment state 
            if (goalway == ADJUST_LEFT) {
                // Sets right motor to go faster than left
                ManualSettings(FORWARD, 40, 70);
            } else if (goalway == ADJUST_RIGHT) {
//                printf("wtf why we here: %i", goalway);
                // Sets left motor to go faster than right
                ManualSettings(FORWARD, 70, 40);
            } else if (goalway == STRAIGHT) {
//                printf("we should be here: %i", goalway);
                // Straigth ahead, should be this if we get the signal hopefully
                Forward(100);
            } else {
                MotorsStop();
            }


            // Change HSM state to ShootingPosition if we close enough to goal
            switch (ThisEvent.EventType) {
                case ES_TIMEOUT:
                    // Checking Sensors for Event Changes
                    if (ThisEvent.EventParam == EventCheckTimer) {
                        ES_Timer_InitTimer(EventCheckTimer, 30); // reinit timer
                        CheckBumpers();
                        CheckIR();
                        CheckCam();
                    }
                    break;
                    // Maybe i dont need this because we deal with it in hsm
                    //                case CLOSE_TO_GOAL:
                    //                    ThisEvent.EventType = CLOSE_TO_GOAL;
                    //                    makeTransition = TRUE;
                    //                    nextState = Stop;
                    //                    break;
                case NEED_ADJUSTMENT:
                    // Uses parameter do decide which way to go, see GoGoal State
                    // w/ goalway
                    raw_adjustment = ThisEvent.EventParam;
                    if (raw_adjustment == LowMiddle) {
                        goalway = ADJUST_LEFT;
                        makeTransition = TRUE;
                        nextState = GoGoal;
                    } else if (raw_adjustment == HighMiddle) {
                        goalway = ADJUST_RIGHT;
                        makeTransition = TRUE;
                        nextState = GoGoal;
                    } else if (raw_adjustment == Middle) {
                        goalway = STRAIGHT;
                        makeTransition = TRUE;
                        nextState = GoGoal;
                    }
                    break;
                case FL_BUMPER_HIT:
                    ThisEvent.EventType = FL_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case FR_BUMPER_HIT:
                    ThisEvent.EventType = FR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RL_BUMPER_HIT:
                    ThisEvent.EventType = RL_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case RR_BUMPER_HIT:
                    ThisEvent.EventType = RR_BUMPER_HIT;
                    return ThisEvent;
                    break;
                case ES_NO_EVENT:
                default: // all unhandled events pass the event back up to the next level
                    ThisEvent.EventType = ES_NO_EVENT;
                    break;
            }


            break;

        case Stop:
            // Dont need bc dealt with in HSM?
            ThisEvent.EventType = CLOSE_TO_GOAL;
            return ThisEvent;

            break;


        default: // all unhandled states fall into here
            break;


    } // end switch on Current State

    if (makeTransition == TRUE) { // making a state transition, send EXIT and ENTRY
        // recursively call the current state with an exit event
//                RunFindGoalieSubHSM(EXIT_EVENT); // <- rename to your own Run function
        CurrentState = nextState;
//                RunFindGoalieSubHSM(ENTRY_EVENT); // <- rename to your own Run function
    }

    //    ES_Tail(); // trace call stack end
    return ThisEvent;
}


/*******************************************************************************
 * PRIVATE FUNCTIONS                                                           *
 ******************************************************************************/

