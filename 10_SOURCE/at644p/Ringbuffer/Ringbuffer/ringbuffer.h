/*
 * usart.h
 *
 * Created: 23.11.2021 12:53:54
 *  Author: Smon
 */ 

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/common.h>

#ifndef USART_H_
#define USART_H_

void init_usart(void);
void init_ringbuffer(void);
char send_serial_data(char* serial_data, char len);

#endif /* USART_H_ */