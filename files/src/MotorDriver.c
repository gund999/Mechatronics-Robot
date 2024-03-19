/* 
 * File:   MotorDriver.c
 * Author: eadra
 *
 * Created on May 16, 2023, 10:30 PM
 */

#include <stdio.h>
#include <stdlib.h>
#include "AD.h"
#include "BOARD.h"
#include "ES_Timers.h"
#include "IO_Ports.h"
#include "LED.h"
#include "pwm.h"
#include "serial.h"
#include "timers.h"
#include "MotorDriver.h"

/*-TypeDef-Enums-*/

/*---------------*/

/*
 * The motors do not move the same so we experimentally drop the speed of the 
 * faster one until they are both equal here 
 */
#define MotorAMargin 0
#define MotorBMargin -17

// Initialize pins n files n stuff

uint8_t MotorsInit(void) {
    // Init BOARD and ADC Pins
    BOARD_Init();
    AD_Init();
    // PWM output pin settings
    PWM_Init();
    PWM_AddPins(PWM_PORTY12 | PWM_PORTY10); // EN1 and EN2
    PWM_SetFrequency(MAX_PWM_FREQ);
    // Setting ADC pins as outputs
    //                            PIN3: In1  PIN4: In2 PIN5: In3 PIN6: In4 
 // IO_PortsSetPortOutputs(PORTY, PIN3     | PIN4 |    PIN5 |    PIN6);
    IO_PortsSetPortOutputs(PORTX, PIN3     | PIN4 |    PIN5 |    PIN6);

    return SUCCESS;
}

// Set Duty Cycle Takes Input: 0 - 100 (100.0%)

uint8_t MotorSpeed(WhichMotor MotorAB, unsigned int MotorSpeedVal) {
    unsigned int Duty;
    uint8_t speedcheck = ERROR;
    Duty = (MotorSpeedVal) * 10;
    if (MotorAB == MotorA) {
        speedcheck = SUCCESS;
        PWM_SetDutyCycle(PWM_PORTY12, Duty);
    } else if (MotorAB == MotorB) {
        speedcheck = SUCCESS;
        PWM_SetDutyCycle(PWM_PORTY10, Duty);
    } else {
        
    }
    return speedcheck;
}

uint8_t MotorDirection(MotorDirections direction) {
    int MotorDirOutput = ERROR;
    switch (direction) {
        case FORWARD:
            HBridgeIn1 = 1;
            HBridgeIn2 = 0;
            HBridgeIn3 = 1;
            HBridgeIn4 = 0;
            MotorDirOutput = SUCCESS;
            int16_t PortYCheck = IO_PortsReadPort(PORTY);
            break;
        case REVERSE:
            HBridgeIn1 = 0;
            HBridgeIn2 = 1;
            HBridgeIn3 = 0;
            HBridgeIn4 = 1;
            MotorDirOutput = SUCCESS;
            break;
        case RIGHT: // Right forward, Left reverse(tank)
//            HBridgeIn1 = 0;
//            HBridgeIn2 = 1;
//            HBridgeIn3 = 1;
//            HBridgeIn4 = 0;
            //whoops which is which, i thought it worked but maybve not???
            HBridgeIn1 = 1;
            HBridgeIn2 = 0;
            HBridgeIn3 = 0;
            HBridgeIn4 = 1;
            MotorDirOutput = SUCCESS;
            break;
        case LEFT: // Left forward, Right reverse
//            HBridgeIn1 = 1;
//            HBridgeIn2 = 0;
//            HBridgeIn3 = 0;
//            HBridgeIn4 = 1;
            
            HBridgeIn1 = 0;
            HBridgeIn2 = 1;
            HBridgeIn3 = 1;
            HBridgeIn4 = 0;
            break;
        case MOTOR_STOP: // Left forward, Right reverse
//            HBridgeIn1 = 1;
//            HBridgeIn2 = 0;
//            HBridgeIn3 = 0;
//            HBridgeIn4 = 1;
            
            HBridgeIn1 = 1;
            HBridgeIn2 = 1;
            HBridgeIn3 = 1;
            HBridgeIn4 = 1;
            break;
    }
    return MotorDirOutput;
}


/*-------------------Movement-Functions---------------------------------------*/


// Set direciton and speed

uint8_t Forward(unsigned int MotorSpeedVal) {
    MotorDirection(FORWARD);
    if (MotorSpeed(MotorA, MotorSpeedVal + MotorAMargin) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, MotorSpeedVal + MotorBMargin) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}

// Set direciton and speed

uint8_t Reverse(unsigned int MotorSpeedVal) {
    MotorDirection(REVERSE);
    if (MotorSpeed(MotorA, MotorSpeedVal + MotorAMargin) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, MotorSpeedVal - 23) == ERROR) {
        return ERROR;

    }
    return SUCCESS;

}

// Set direciton and speed

uint8_t TankLeft(unsigned int MotorSpeedVal) {
    MotorDirection(LEFT);
    if (MotorSpeed(MotorA, MotorSpeedVal + MotorAMargin) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, MotorSpeedVal + MotorBMargin) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}

// Set direciton and speed

uint8_t TankRight(unsigned int MotorSpeedVal) {
    MotorDirection(RIGHT);
    if (MotorSpeed(MotorA, MotorSpeedVal + (MotorAMargin)) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, MotorSpeedVal + MotorBMargin) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}

// Stops motors

uint8_t MotorsStop(void) {
    MotorDirection(MOTOR_STOP);
    if (MotorSpeed(MotorA, 0) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, 0) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}




// Set motor speeds freely(see .h)

uint8_t ManualSettings(MotorDirections direc, unsigned int LeftAMotorVal, unsigned int RightBMotorVal) {
    MotorDirection(direc);
    if (MotorSpeed(MotorA, (LeftAMotorVal + MotorAMargin)) == ERROR) {
        return ERROR;
    }
    if (MotorSpeed(MotorB, (RightBMotorVal + MotorBMargin)) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}


/*----------------------------------------------------------------------------*/




/*------Comment-This-In-To-Test-------*/
//#define MotorLibTest

#ifdef MotorLibTest

int main() {

    printf("Motor Test:         \n");
    MotorsInit();
    while (1) {
        // Replace with whatever movement function and compile to test
        Forward(100);

    }
}
#endif
