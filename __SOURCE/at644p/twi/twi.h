/*
 * twi.h
 *
 * Created: 01.03.2022 23:19:05
 *  Author: Smon
 */ 


#ifndef TWI_H_
#define TWI_H_

#include <avr/io.h>
#include <avr/interrupt.h>
#include <math.h>
#include <inttypes.h>
#include <stdlib.h>
#include <util/twi.h>

#define F_CPU 16000000

#define START_H (1<<TWINT)|(1<<TWSTA)|(1<<TWEN)
#define START_L	~(1<<TWSTO)

#define STOP_H (1<<TWINT)|(1<<TWSTO)|(1<<TWEN)
#define STOP_L ~(1<<TWSTA)

#define SLA_W_H (1<<TWINT)|(1<<TWEN)
#define SLA_W_L ~((1<<TWSTO)|(1<<TWSTA))

#define REPEATED_START_H (1<<TWINT)|(1<<TWSTA)|(1<<TWEN)
#define REPEATED_START_L ~(1<<TWSTO)

typedef enum {
	USE_RX_DATA,
	USE_TX_DATA,
}transaction_mode_t;

struct twi_config {
	uint32_t f_scl;
};
typedef struct twi_config twi_config_t;

typedef struct twi_transaction {
	uint8_t addr;
	uint8_t tx_data;
	uint8_t *rx_data;
	transaction_mode_t mode;
} twi_transaction_t;

void twi_init(twi_config_t *cfg);
void twi_transmit(twi_transaction_t *t);

#endif /* TWI_H_ */