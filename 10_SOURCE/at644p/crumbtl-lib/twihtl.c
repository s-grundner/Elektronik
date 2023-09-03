#include "twihtl.h"
#include "ringbuffer.h"
#include <avr/io.h>
#include <util/twi.h>
#include <stdlib.h>

unsigned char i2c_presacler_values[] = {1, 4, 16, 64};

typedef enum
{
	I2C_CMD_IDLE,
	I2C_CMD_WRITE,
	I2C_CMD_READ,
} i2c_cmd_t;

typedef struct
{
	ringbuffer_t write_buffer;	 // data for sending
	unsigned char *read_buffer;	 // pointer to the user buffer
	i2c_state_t cur_state;		 // transferstate
	unsigned char slave_address; // i2c slave adress
	unsigned char read_size;
	unsigned char read_bytes;
	i2c_cmd_t cmd;
} i2c_t;

static i2c_t i2c;

bool_t i2c_init(unsigned long a_bitrate, unsigned long a_scl, unsigned char a_write_buffersize)
{
	unsigned int twps;
	unsigned long twbr;

	memset(&i2c, 0, sizeof(i2c_t));

	for (twps = 0; twps < 4; twps++)
	{
		twbr = ((a_scl / a_bitrate) - 16) / 2 / i2c_presacler_values[twps];
		if (twbr < 256)
			break;
	}
	if (twbr >= 256)
		return FALSE_E;
	PORTC |= 1 << PC0 | 1 << PC1;

	TWBR = (unsigned char)twbr;
	TWSR |= (twps << TWPS0);

	i2c.cur_state = I2C_STATE_IDLE;
	i2c.cmd = I2C_CMD_IDLE;
	sei();
	return TRUE_E;
}

bool_t i2c_write(unsigned char a_sla, unsigned char *a_buffer, unsigned char a_size)
{
	if(i2c.cur_state != I2C_STATE_TRANSFER_FINISHED && 
		i2c.cur_state != I2C_STATE_IDLE &&
		i2c.cur_state != I2C_STATE_ERROR)
	{
		return FALSE_E;
	}

	for (unsigned char i = 0; i < a_size; i++)
	{
		if (!ringbuffer_write(i2c.write_buffer, a_buffer[i]))	
		{
			return FALSE_E;
		}
	}
	i2c.slave_address = a_sla;
	i2c.cmd = I2C_CMD_WRITE;
	i2c_start();
	return TRUE_E;
}

bool_t i2c_read(unsigned char a_sla, unsigned char *a_buffer, unsigned char a_size)
{
	if(i2c.cur_state != I2C_STATE_TRANSFER_FINISHED && 
		i2c.cur_state != I2C_STATE_IDLE &&
		i2c.cur_state != I2C_STATE_ERROR)
	{
		return FALSE_E;
	}
	i2c.cmd = I2C_CMD_READ;
	/*...*/
}

static void i2c_start(void)
{
	i2c.cur_state = I2C_STATE_START;
	TWCR = TWI_START; // in twi.h avrlibc header
}

static void i2c_stop(void)
{
	TWCR = (1 << TWINT) | (1 << TWSTO) | (1 << TWEN); // TWIE is not enabled
}

static void i2c_send_sla_w(void)
{
	i2c.cur_state = I2C_STATE_ADDRESS_WRITE;
	TWDR = i2c.slave_address & ~0x01;				// clear LSB for WRITE
	TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWIE) // TWIE is enabled
}

static void i2c_send_sla_r(void)
{
	i2c.cur_state = I2C_STATE_ADDRESS_READ;
	TWDR = i2c.slave_address | 0x01;				// set LSB for READ
	TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWIE) // TWIE is enabled
}

static void i2c_transmit(void)
{
	unsigned char data;
	if (ringbuffer_read(i2c.write_buffer, &data))
	{
		i2c.cur_state = I2C_STATE_WRITE_BYTE;
		TWDR = data;
		TWCR = (1 << TWINT) | (1 << TWEN) | (1 << TWIE) // TWIE is enabled
	}
	else
	{
		i2c_stop();
		i2c.cur_state = I2C_STATE_TRANSFER_FINISHED;
	}
}

ISR(TWI_vect)
{
	unsigned char i2c_status = TW_STATUS;

	switch (i2c.cur_state)
	{
	case I2C_STATE_START:

		if (i2c_status != TW_START && i2c_status != TW_REP_START)
		{
			i2c_stop();
			i2c.cur_state = I2C_STATE_ERROR;
			break;
		}
		if (i2c.cmd /*...*/)
		{
			/*...*/
		}
		/*...*/
		break;

	case I2C_STATE_ADDRESS_WRITE:
		if(i2c_status != TW_MT_SLA_ACK)
		{
			i2c_stop();
			i2c.cur_state = I2C_STATE_ERROR;
			break;
		}
		i2c_send_sla_w();
		break;

	case I2C_STATE_WRITE_BYTE:
		if(i2c_status != TW_MT_DATA_ACK)
		{
			i2c_stop();
			i2c.cur_state = I2C_STATE_ERROR;
			break;
		}
		i2c_transmit();
		break;
	
	case I2C_STATE_ADDRESS_READ:
		if(i2c_status != TW_MT_DATA_ACK)
		{
			i2c_stop();
			i2c.cur_state = I2C_STATE_ERROR;
			break;
		}
		i2c_transmit();
		break;
	
	default:
		break;
	}
}