/*
 * ringbuffer.c
 *
 * Created: 4/23/2022 6:03:12 PM
 * @author Smino
 */ 

#include "ringbuffer.h"

#define RINGBUFFER 20

ISR(USART0_UDRE_vect)
{
	if(p_read == p_write)
	{
		UCSR0B &= ~(1<<UDRIE0);
		return;
	}
	UDR0 = *p_read;
	p_read = (uint8_t*)(((int)p_read + 1) % RINGBUFFER);
}

uint8_t ringbuffer[RINGBUFFER], *p_write, *p_read;

void init_usart()
{
	/* Baud rate 
	 * Enable transmit (+ recieve)
	 * data size (1 character -> 8 bit)
	 */
	
	UBRR0 = 51; // Baudrate 19200
	UCSR0B |= 1 << TXEN0; // Enable Transmit
	UCSR0C |= (1 << UCSZ00) | (1 << UCSZ01); // Data size 8 bit
}

void init_ringbuffer()
{
	p_read = p_write = ringbuffer;
}

void send_serial_data(uint8_t *data, uint8_t len)
{
	int freesize;
	// enter critical Section
	{
		uint8_t c_sreg = SREG;
		cli(); // clear all interrupts
		freesize = (p_write >= p_read) ? (RINGBUFFER - (int) p_write + (int) p_read - 1) : ((int) p_read - (int) p_write - 1);
		SREG = c_sreg;
	}
	// exit critical section

	if(len > freesize) return; // out of memory

	for (int i = 0; i < len; i++) // write data to ringbuffer
	{
		*p_write = data[i];
		p_write = (uint8_t*)(((int)p_write + 1) % RINGBUFFER);
	}
	UCSR0B |= (1<<UDRIE0); // Enable Data Register Empty 
	// wenn UDR0 = NULL -> ISR
}