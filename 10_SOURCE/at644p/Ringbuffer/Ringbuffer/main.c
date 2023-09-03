/*
 * Ringbuffer.c
 *
 * Created: 21.12.2021 12:05:09
 * Author : Smon
 */ 

#define F_CPU 16000000

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/common.h>
#include "ringbuffer.h"

int main(void)
{
	sei();
	init_ringbuffer();
	init_usart();
	char * txt = "Thomas";
	while(1)
	{
		send_serial_data(txt, 6);
		_delay_ms(500);		
	}
}