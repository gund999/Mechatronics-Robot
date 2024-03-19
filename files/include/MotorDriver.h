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

/*-------------LOCAL-DEFINES------------*/


// PORTY: This is where the ports for pins are decided in case pins no work
//#define HBridgeIn1 PORTY03_LAT
//#define HBridgeIn2 PORTY04_LAT
//#define HBridgeIn3 PORTY05_LAT
//#define HBridgeIn4 PORTY06_LAT
// PORTX
#define HBridgeIn1 PORTX03_LAT
#define HBridgeIn2 PORTX04_LAT
#define HBridgeIn3 PORTX05_LAT
#define HBridgeIn4 PORTX06_LAT

/*--------------------------------------*/


typedef enum {
    LEFT,
    RIGHT,
    FORWARD,
    REVERSE,
    MOTOR_STOP,
} MotorDirections;

typedef enum {
    MotorA,
    MotorB,
} WhichMotor;

/*---------------*/

/**
 * @param N/A 
 * @return SUCCESS or ERROR
 * @brief Inits stuff dummy
 */
uint8_t MotorsInit(void);

/**
 * @param WhichMotor: Takes MotorA or MotorB to set
 * @param MotorSpeedVal: 0-100 how fast you want motors to spin
 * @return SUCCESS or ERROR
 * @brief 
 */
uint8_t MotorSpeed(WhichMotor MotorAB, unsigned int MotorSpeedVal);

/**
 * @param LEFT RIGHT FORWARD REVERSE
 * @return SUCCESS or ERROR
 * @brief Sets In1-4 of the H-Bridge Pins to decide which way the motors spin
 */
uint8_t MotorDirection(MotorDirections direction);

/**
 * @param Speed 0-100
 * @return SUCCESS or ERROR
 * @brief makes both wheels on bot go forward 
 */
uint8_t Forward(unsigned int MotorSpeedVal);

/**
 * @param Speed 0-100
 * @return SUCCESS or ERROR
 * @brief Robot moves in reverse at MotorSpeedVal
 */
uint8_t Reverse(unsigned int MotorSpeedVal);

/**
 * @param How fast Robot Turns 0-100
 * @return SUCCESS or ERROR
 * @brief Robot twist in a circle by setting each motor to equal but opposite magnitudes
 */
uint8_t TankLeft(unsigned int MotorSpeedVal);

/**
 * @param How fast Robot Turns 0-100
 * @return SUCCESS or ERROR
 * @brief Robot twist in a circle by setting each motor to equal but 
 *        opposite magnitudes
 */
uint8_t TankRight(unsigned int MotorSpeedVal);

/**
 * @return SUCCESS or ERROR
 * @brief Stops motors by setting magnitudes to 0
 *        
 */
uint8_t MotorsStop(void);


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
uint8_t ManualSettings(MotorDirections direc, unsigned int LeftAMotorVal, unsigned int RightBMotorVal);