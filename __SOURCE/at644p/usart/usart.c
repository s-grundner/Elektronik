/*
 * usart.c
 *
 * Created: 23.11.2021 12:52:59
 *  Author: Smon
 */ 

#include <avr/io.h>
#include "usart.h"

void init_usart(void)
{
    UBRR0 = 51; // 19200 baud
    UCSR0B |= ((1<<RXEN0)|(1<<TXEN0)); // enable transmitter + reciever
    UCSR0C |= ((1<<UCSZ01)|(1<<USBS0)); // 8 data + 1 stopbit
}

void usart_tx(unsigned char data){
	// wait for empty buffer
	while(!(UCSR0A & (1<<UDRE0))); // how long? 1/19200*10=0,5ms
	UDR0 = data;
}