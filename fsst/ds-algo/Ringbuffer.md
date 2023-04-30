---
tags: ["ds-algo"]
aliases: ["Circular Buffer", "Circular Queue"]
subject: ["dic", "fsst"]
source: ["Robert Vogl"]
reference: []
created: 19th April 2022
last_edited: 19th April 2022
---

# Ringbuffer
Der Ringbuffer ist ein [[Queue|FIFO]] Speicher, der zwischen Ein und Ausgangsmedium eine Zeit Unabhängigkeit schaffen soll,
indem die zu übertragenden Daten nacheinander in einem Array geschrieben werden und bei bedarf gelesen werden können.
![[Circular_Buffer_Animation.gif]]

Hierbei bewegen sich zwei Pointer `p_read` und `p_write` durch ein Buffer Array:

> [!info] `p_write` zeigt auf die Stelle im Buffer, auf die als nächstes geschrieben wird
> - Wenn geschrieben wird. bewegt er sich auf die nächste Stelle
> - Ist er am Ende des Ringbuffers, kehrt er auf die Anfangspoition zurück

> [!info] `p_read` zeigt auf die Stelle im Buffer, von der als nächstes gelesen werden soll
> - Wenn gelesen wird. bewegt er sich auf die nächste Stelle
> - Ist er am Ende des Ringbuffers, kehrt er auf die Anfangspoition zurück


![[buffer_anim.gif]]

> [!summary] Die Größe und der Datentyp des Ring Buffers müssen als einzige Parameter angegeben werden
> Freie Größe im Ring Buffer (D... Daten, X ... Freier Platz)
> - Wenn der *Read-Pointer* im Array vor dem *Write-Pointer* ist: `free_size = p_read - p_write - 1` 
> ![[Pasted image 20230430160942.png]]
> - Daraus folgt: Wenn der *Read-Pointer* eine Stelle vor dem *Write-Pointer* ist: `free_Size = 0` 
> ![[Pasted image 20230430161830.png]]
> ---
> - Wenn der *Read-Pointer* im Array hinter dem *Write-Pointer* ist: `free_size = RINGBUFFER_SIZE - p_read - p_write - 1` 
> ![[Pasted image 20230430161829.png]]
> - Daraus folgt:  Wenn der *Read*-Pointer auf dem *Write*-Pointer ist: `free_size = RINGBUFFER_SIZE - 1`
> ![[Pasted image 20230430161507.png]]

> [!warning] Der Tatsächlich für die Daten verfügbare Platz ist um `1` weniger als die angegebene Größe
> Es muss eine Stelle im Puffer geben, bei der der Write Pointer stehenbleibt, diese 

## AVR Example
Im Beispiel soll ein Ring Buffer verwendet werden, um Daten über die serielle [[{MOC} Schnittstellen|Schnittstelle]] `usart0` des µC [[AVR ATmega644p|ATMega644p]]
### Header
```c
/// @file ringbuffer.h
void ringbuffer_init();
void usart0_init();
void send_serial_data();
void print();
```
### Source
Includes:
```c
/// @file ringbuffer.c
#include <avr/common.h>    // für Statusregister SREG
#include <avr/io.h>        // für Pin-Definitionen des Prozessors
#include <avr/interrupt.h> // für UART Interrupt Vektoren
```
Initialisieren der Ring Buffer variablen:
- Da Interrupts verwendet werden, müssen die variablen global angelegt werden, weil keine Parameter in eine ISR übergeben werden können.
- Der verwendete Datentyp ist `unsigned char`
- Die Größe des Ring Buffers wird als Makro definiert.
```c
#define RINGBUFFER_SIZE 30
static unsigned char *p_read, *p_write, ringbuffer[RINGBUFFER_SIZE];
```
Zum initialisieren des Ring Buffers werden `p_read` und `p_write` auf den Anfang  von `ringbuffer` gesetzt, damit der Ring Buffer zu Beginn leer ist.
```c
void ringbuffer_init()
{
	p_read = p_write = ringbuffer // oder p_read = p_write = &ringbuffer[0]
}
```
Anschließend muss die Serielle [[{MOC} Schnittstellen|Schnittstelle]] initialisiert werden.
Serielle [[{MOC} Schnittstellen|Schnittstelle]]:
| Baudrate | Enable   | Startbit | Stoppbit | Datenbits | Parity Bit | Interrupt           |
| -------- | -------- | -------- | -------- | --------- | ---------- | ------------------- |
| 19200    | Reciever | 1 Bit    | 1 Bit    | 8 Bit     | Aus        | Data Register Empty | 

```c
void usart0_init()
{
	// Baudrate 19200 (single speed)
	// Start Stopp Parity
	// Reciever Enable
	// UDRE Interrupt Enable
	
}
```

## AVR Example
``` c
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
```

---
# Tags