/**
 * @file 	twihtl.h
 * @author 	Simon Grundner
 * @brief 	custom two-wire interfacelib for AVR programming
 * @version 0.1
 * @date 2022-05-09
 *
 * @copyright Copyright (c) 2022
 *
 */
#ifndef I2C_H_
#define I2C_H_

#include "stdhtl.h"

typedef enum
{
	I2C_STATE_NOT_INITIALIZED,
	I2C_STATE_IDLE,
	I2C_STATE_ERROR,
	I2C_STATE_START,
	I2C_STATE_ADDRESS_WRITE,
	I2C_STATE_ADDRESS_READ,
	I2C_STATE_READ_BYTE,
	I2C_STATE_WRITE_BYTE,
	I2C_STATE_TRANSFER_FINISHED,
} i2c_state_t;

bool_t i2c_init(unsigned long a_bitrate, unsigned long a_scl, unsigned char a_write_buffersize);
bool_t i2c_write(unsigned char a_sla, unsigned char *a_buffer, unsigned char a_size);
bool_t i2c_read(unsigned char a_sla, unsigned char *a_buffer, unsigned char a_size);

i2c_state_t i2c_get_state(void);
char *i2c_get_state_name(void);

#endif // I2C_H_
