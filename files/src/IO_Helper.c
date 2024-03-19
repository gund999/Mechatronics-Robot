/* 
 * File:   IO_Helper.h
 * Author: eadra
 *
 * Created on May 22, 2023, 9:24 PM
 */
#include "IO_Ports.h"
#include "IO_Helper.h"

#define IO_PIN3 (1<<0)
#define IO_PIN4 (1<<1)
#define IO_PIN5 (1<<2)
#define IO_PIN6 (1<<3)
#define IO_PIN7 (1<<4)
#define IO_PIN8 (1<<5)
#define IO_PIN9 (1<<6)
#define IO_PIN10 (1<<7)
#define IO_PIN11 (1<<8)
#define IO_PIN12 (1<<9)

uint8_t Read_IO_Pin(int8_t port, int8_t pin) {
    int16_t portOut = IO_PortsReadPort(int8_t port);
    return portOut & pin;
}
