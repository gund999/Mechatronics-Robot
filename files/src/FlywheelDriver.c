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
#include "FlywheelDriver.h"
#include "RC_Servo.h"

/*-TypeDef-Enums-*/

/*---------------*/

/*
 * The motors do not move the same so we experimentally drop the speed of the 
 * faster one until they are both equal here 
 */
#define FlywheelAMargin 0
#define FlywheelBMargin 0

// Initialize pins n files n stuff

uint8_t FlywheelInit(void) {
    // Init BOARD and ADC Pins
    BOARD_Init();
    AD_Init();
    // Servo Stuff
    RC_Init();
    RC_AddPins(GatePWMPin);
    // PWM output pin settings
    PWM_Init();
    PWM_AddPins(En1 | En2); // EN1 and EN2
    PWM_SetFrequency(MAX_PWM_FREQ);
    // Setting ADC pins as outputs
    //                            PIN3: In1  PIN4: In2 PIN5: In3 PIN6: In4 
    // IO_PortsSetPortOutputs(PORTY, PIN3     | PIN4 |    PIN5 |    PIN6);
    IO_PortsSetPortOutputs(PORTX, PIN8 | PIN10 | PIN11 | PIN12);

    return SUCCESS;
}

// Set Duty Cycle Takes Input: 0 - 100 (100.0%)

uint8_t FlywheelSpeed(unsigned int MotorSpeedVal) {
    unsigned int Duty;
    uint8_t speedcheck = ERROR;
    Duty = (MotorSpeedVal) * 10;

    PWM_SetDutyCycle(En1, Duty);
    PWM_SetDutyCycle(En2, Duty);

    speedcheck = SUCCESS;

    return speedcheck;
}

//sets direction for flywheels to go so that they spin to push ping pong ball
uint8_t FlywheelDirection(void) {
    int MotorDirOutput = ERROR;

    FlyBridgeIn1 = 1;
    FlyBridgeIn2 = 0;
    FlyBridgeIn3 = 1;
    FlyBridgeIn4 = 0;
    MotorDirOutput = SUCCESS;
    int16_t PortYCheck = IO_PortsReadPort(PORTY);

    return MotorDirOutput;
}


/*-------------------Movement-Functions---------------------------------------*/


// Set direction and speed

uint8_t FlywheelOn(unsigned int MotorSpeedVal) {
    FlywheelDirection();
    if (FlywheelSpeed(MotorSpeedVal + FlywheelBMargin) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}


// Stops motors

uint8_t FlywheelStop(void) {
//    FlywheelDirection();
    FlyBridgeIn1 = 1;
    FlyBridgeIn2 = 1;
    FlyBridgeIn3 = 1;
    FlyBridgeIn4 = 1;
    if (FlywheelSpeed(0) == ERROR) {
        return ERROR;

    }
    return SUCCESS;
}

uint8_t OpenGate(void) {
    unsigned short int ServoPulse = 2000;
    ServoPulse = RC_SetPulseTime(GatePWMPin, ServoPulse);

}

uint8_t CloseGate(void) {
    unsigned short int ServoPulse = 1000;
    ServoPulse = RC_SetPulseTime(GatePWMPin, ServoPulse);
}



// Set motor speeds freely(see .h)

//uint8_t ManualSettings(MotorDirections direc, unsigned int LeftAMotorVal, unsigned int RightBMotorVal) {
//    MotorDirection(direc);
//    if (MotorSpeed(MotorA, (LeftAMotorVal + MotorAMargin)) == ERROR) {
//        return ERROR;
//    }
//    if (MotorSpeed(MotorB, (LeftAMotorVal + MotorBMargin)) == ERROR) {
//        return ERROR;
//
//    }
//    return SUCCESS;
//}


/*----------------------------------------------------------------------------*/




/*------Comment-This-In-To-Test-------*/
//#define FlywheelLibTest

#ifdef FlywheelLibTest

int main() {

    printf("Flywheel Test:         \n");
    FlywheelInit();
    //    FlywheelOn(100);
    //    OpenGate();
    while (1) {

//        for (int i = 0; i < 100000 / 4; i++) {
//
//            CloseGate();
//        }
//        for (int i = 0; i < 100000 / 4; i++) {
//
//            OpenGate();
//        }
        FlywheelOn(100);
        for (int i = 0; i < 100000; i++) {
            OpenGate();
        }
        
    }
}
#endif
