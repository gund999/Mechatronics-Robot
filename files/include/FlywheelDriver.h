/* 
 * File:   MotorDriver.h
 * Author: eadra
 *
 * Created on May 16, 2023, 11:12 PM
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
#include <xc.h>
#include <sys/attribs.h>
#include "RC_Servo.h"
/*-------------LOCAL-DEFINES------------*/


// PORTY: This is where the ports for pins are decided in case pins no work
//#define FlyBridgeIn1 PORTY03_LAT
//#define FlyBridgeIn2 PORTY04_LAT
//#define FlyBridgeIn3 PORTY05_LAT
//#define FlyBridgeIn4 PORTY06_LAT
// PORTX
#define FlyBridgeIn1 PORTX08_LAT
#define FlyBridgeIn2 PORTX10_LAT
#define FlyBridgeIn3 PORTX11_LAT
#define FlyBridgeIn4 PORTX12_LAT


#define En1 PWM_PORTY04
#define En2 PWM_PORTZ06

#define GatePWMPin RC_PORTY07
/*--------------------------------------*/



/*---------------*/

/**
 * @param N/A 
 * @return SUCCESS or ERROR
 * @brief Inits stuff dummy
 */
uint8_t FlywheelInit(void);

/**
 * @param WhichMotor: Takes MotorA or MotorB to set
 * @param MotorSpeedVal: 0-100 how fast you want motors to spin
 * @return SUCCESS or ERROR
 * @brief 
 */
uint8_t FlywheelSpeed(unsigned int MotorSpeedVal);

/**
 * @param LEFT RIGHT FORWARD REVERSE
 * @return SUCCESS or ERROR
 * @brief Sets In1-4 of the H-Bridge Pins to decide which way the motors spin
 */
uint8_t FlywheelDirection(void);

/**
 * @param Speed 0-100
 * @return SUCCESS or ERROR
 * @brief makes both wheels on bot go forward 
 */
uint8_t FlywheelOn(unsigned int MotorSpeedVal);


/**
 * @return SUCCESS or ERROR
 * @brief Stops motors by setting magnitudes to 
 *        
 */
uint8_t FlywheelStop(void);


uint8_t OpenGate(void);

uint8_t CloseGate(void);
/**
 * @param direc: Which way motors spin. Forward and reverse should be all you 
 *        need
 *               Forward: ^   ^
 *               Reverse: \/ \/
 *               Left:    ^   0
 *               Right:   0   ^
 * 
 * 
 * @param LeftAMotorVal: How fast Left motor 0-100
 * @param RightBMotorVal: How fast Right motor 0-100
 * @return SUCCESS or ERROR
 * @brief Manually sets the robot's motors. Sets in 4 directions
 *  difference you can pick the angle of the turn
 * 
 *       _________      
 *      |    ^    |
 *     [| Forward |]
 * MotA[|         |] Motor B
 *     [|         |]
 *      |_________|
 *  
 * @note MotorA is usually faster, so if you want extra speed, compensate for
 *       MotorAMargin a
 * 
 * 
 */
//uint8_t ManualSettings(MotorDirections direc, unsigned int LeftAMotorVal, unsigned int RightBMotorVal);