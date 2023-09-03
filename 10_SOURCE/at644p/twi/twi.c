/*
 * twi.c
 *
 * Created: 01.03.2022 23:18:56
 *  Author: Simon Grundner
 */

#include "twi.h"

// ------------------------------------------------------------
// Private Functions
// ------------------------------------------------------------

void wait_twint(void)
{
	while (!TW_SR_DATA_ACK);
}

void start_c(void)
{
	TWCR |= START_H;
	TWCR &= START_L;
}
void stop_c(void)
{
	TWCR |= STOP_H;
	TWCR &= STOP_L;
}
void sla_w_c(void)
{
	TWCR |= SLA_W_H;
	TWCR &= SLA_W_L;
}
void repeated_start_c(void)
{
	TWCR |= REPEATED_START_H;
	TWCR &= REPEATED_START_L;
}

uint8_t get_br(uint32_t f_scl, uint8_t ps)
{
	return ((F_CPU / (2 * f_scl)) - 8) / pow(4, ps);
}
uint32_t get_scl(uint8_t br, uint8_t ps)
{
	return (F_CPU / (16 + 2 * br * pow(4, ps)));
}
void set_br_ps(uint32_t f_scl)
{
	uint32_t smallest_diff = f_scl;
	uint8_t ps_fit;
	for (int i = 0; i < 4; i++)
	{
		uint32_t diff = abs(f_scl - get_scl(get_br(f_scl, i), i));
		if (smallest_diff > diff)
		{
			smallest_diff = diff;
			ps_fit = i;
		}
	}
	TWBR = get_br(f_scl - smallest_diff / 2, ps_fit);
	TWSR &= (0xfc | ps_fit);
}

// ------------------------------------------------------------
// Public Functions
// ------------------------------------------------------------

void twi_init(twi_config_t *cfg)
{
	set_br_ps(cfg->f_scl);
}

void twi_transmit(twi_transaction_t *t)
{
	
	// ------------------------------------------------------------
	// Address Phase
	// ------------------------------------------------------------
	
	start_c();
	wait_twint();
	if (TW_STATUS != TW_START)
	{
		// no start
		// error();
		return;
	}
	TWDR = t->addr;
	sla_w_c()

	// wait for address acknowledgement
	wait_twint();
	if (TW_STATUS != TW_MT_SLA_ACK)
	{
		// not acknowledged
		// error();
		return;
	}

	// ------------------------------------------------------------
	// Data Phase
	// ------------------------------------------------------------	

	wait_twint();
	switch (t->mode)
	{
	case USE_TX_DATA:
		TWDR = t->tx_data;
		break;
	case USE_RX_DATA:
		*(t->rx_data) = TWDR;
		break;
	}
	sla_w_c();
	
	// wait for data acknowledgement
	wait_twint();
	if (TW_STATUS != TW_MT_DATA_ACK)
	{
		// data not acknowledged
		// error();
		return;
	}
	
	// ------------------------------------------------------------
	// Stop Phase
	// ------------------------------------------------------------
	
	stop_c();
}
