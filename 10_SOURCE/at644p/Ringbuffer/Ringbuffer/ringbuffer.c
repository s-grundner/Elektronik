/*
 * usart.c
 *
 * Created: 23.11.2021 12:52:59
 *  Author: Smon
 */ 

#include "ringbuffer.h"

#define RINGBUFFERSIZE 20

unsigned char ringbuffer[RINGBUFFERSIZE], *p_read, *p_write;

void init_usart(void)
{
    UBRR0 = 51; // 19200 baud
    UCSR0B |= ((1<<RXEN0)|(1<<TXEN0)); // enable transmitter + reciever
    UCSR0C |= ((1<<UCSZ01)|(1<<USBS0)); // 8 data + 1 stopbit
}

void init_ringbuffer(void)
{
	p_read = p_write = ringbuffer;
}

char send_serial_data(char* serial_data, char len)
{
	int free_size;
	
	// [!] Critical Section
	// ------------------------------------------------------------
	{
		unsigned char c_sreg;
		c_sreg = SREG;
		cli();
		free_size = (p_write >= p_read) ? (RINGBUFFERSIZE - (int) p_write + (int) p_read - 1) : ((int) p_read + (int) p_write - 1);
		SREG = c_sreg;
	}
	// ------------------------------------------------------------
	// [!] Leave Critical Section
	
	if(len > free_size) return -1;
	for (int i = 0; i < len; i++)
	{
		*p_write = serial_data[i];
		p_write++;
		if (p_write >= &ringbuffer[RINGBUFFERSIZE])
		{
			p_write = ringbuffer;
		}
	}
	UCSR0B |= (1<<UDRIE0);
	return 0;
}

ISR(USART0_UDRE_vect)
{
	if (p_read == p_write)
	{
		// Exit ISR & Disable UDR Empty Interrupt
		UCSR0B &= ~(1<<UDRIE0);
		return;
	}
	UDR0 = *p_read;
	p_read++;
	
	if (p_read >= &ringbuffer[RINGBUFFERSIZE])
	{
		// pointer set to ringbuffer start
		p_read = ringbuffer;
	}
	return;
}