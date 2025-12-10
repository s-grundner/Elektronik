---
tags:
  - Interface/Serial/Async
  - MCU/AVR
aliases:
  - USART
subject:
  - dic
source:
  - Robert Vogl
created: 19th April 2022
---

# Universal Asynchronous Receive and Transmit

UART steht für Universal Asynchronous Receive and Transmit und ist, wie der Name bereits sagt, ein serielles, asynchrones Übertragungsprotokoll.  
Mit UART, welche Datenübertragungen im Vollduplex-Betrieb unterstützt, werden zwei Bauelemente miteinander verbunden.  
Die Bus-Teilnehmer sind hierbei gleichgestellt, was heißt, dass des keinen Mastercontroller gibt, welcher den Bus steuert.  
Die Daten werden einfach gesendet. Bei der Verdrahtung ist zu beachten, dass die Übertragungsleitungen überkreuzt angeschlossen werden müssen.  
![UART_Wiring](../assets/UART_Wiring.png)

UART spielt eine wichtige Rolle bei der Arbeit mit SoCs, da deren Firmware oft über eine USB-Bridge den Flashspeicher beschreiben. Die USB-Bridge spricht das System dabei mit UART an. Auch das Debuggen erfolgt meistens über diese serielle [Schnittstelle](Interfaces/{MOC}%20Schnittstellen.md).

## 1 Die Übertragenen Datenpakte Haben Folgendes Format

![UART_Frame](../assets/UART_Frame.png)  
Ein Startbit signalisiert dem Empfänger, dass eine Übertragung beginnt. Das Potential auf der Übertragungsleitung ist _Normally-High_ und wird durch das Startbit auf _Low_ gezogen. Anschließend folgt das Datenframe, welches je nach Konfiguration fünf bis neun Bit lang ist. Eine Paritätsbit dient zur Validierung der Übertragung. Dieses Bit kann aber auch im Controller ausgeschalten werden. Am Ende der Übertragung setzt ein Stop Bit den Bus wieder auf den Idle-Zustand.

# AVR Example

USART Parameters:

|       Baudrate        |  Enable  |       Stoppbit        |       Datenbits       |     Parity Bit      |   Interrupts   |           Mode            |
|:---------------------:|:--------:|:---------------------:|:---------------------:|:-------------------:|:--------------:|:-------------------------:|
| Tabelle<br>Datenblatt | RX<br>TX | 1 Bit <br> (Standard) | 8 Bit <br> (Standard) | Aus <br> (Standard) | UDRE, RXC, TXC | Asynchron <br> (Standard) |

## 2 USART RXC Interrupt

```c
void usart_init(void)
{
	UCSR0B = ((1 << RXEN0) | (1 << RXCIE0));  // Reciever Enable, RX Interrupt Enable
	UCSR0C = ((1 << UCSZ01) | (1 << UCSZ00)); // 8-Bit Data
	UBRR0 = 51 // Baudrate
}
```

> [!INFO] LED mit USART Steuern  
> Unter Verwendung der obigen Funktion, schreib ein Programm,  
> welches bei der Eingabe über die serielle Schnittstelle bei `'e'` `PD7` auf _high_ setzt und bei `'a'` auf _low_.
> 
> Verwende dazu die passende Interrupt Service Routine.  
> Erstelle die komplette SW, das heißt die `main()` Routine und die Interrupt Service Routine.

> [!WARNING] Die obige Funktion muss nicht mehr hingeschrieben werden, man kann sie einfach mit `usart_init()`aufrufen.

```c
#include <avr/io.h>
#include <avr/interrupt.h>

ISR(USART0_RX_vect)
{
	// PD7-led is acive low
	PORTD &= ~((UDR0 == 'e') << PD7);
	PORTD |= ((UDR0 == 'a') << PD7);
}

int main(void)
{
	DDRD |= (1 << PD7);
	usart_init();
	sei();
	while (1);
	return 0;
}
```

---

## 3 USART UDRE Interrupt

```c
void usart_init(void)
{
	UCSR0B = ((1 << TXEN0) | (1 << UDRIE0));  // RX und TX einschalten
	UCSR0C = ((1 << UCSZ01) | (1 << UCSZ00)); // 8-Bit daten
	unsigned short baud = 51;                 // baudrate
	UBRR0H = (unsigned char) (baud >> 8);
	UBRR0L = (unsigned char) baud;
	UCSR0B |= (1 << UDRIE0); // Dataregister Empty Interrupt Enablen
}
```

> [!INFO] String via UART Senden  
> Unter Verwendung der obigen Funktion, schreibe ein Programm, welches den Text `„Hallo ich lebe“` einmal beim Einschalten auf die Serielle  
> Schnittstelle schickt.  
> Achtung, verwende dazu die Funktion: `ISR(USART0_UDRE_vect)`  
> Erstelle die komplette SW, das heißt die `main()` Routine und die Interrupt Service Routine.

> [!WARNING] Die obige Funktion muss nicht mehr hingeschrieben werden, man kann sie einfach mit `usart_init()` aufrufen.

> [!WARNING] Ein [Ringbuffer](Ringbuffer.md) ist nicht notwendig!

```c
static char *message = "Hallo ich lebe";

ISR(USART0_UDRE_vect)
{
	// Lokalstatische Variable wird einmal auf 0 initialisiert
	static counter = 0;
	if (message[counter] == '\0')
		UCSR0B &= ~(1 << UDRIE0);
	UDR0 = message[counter];
	counter++;
}

int main(void)
{
	usart_init();
	sei();
	while (1);
}
```

---

# Tags

- [Ringbuffer](Ringbuffer.md)
- [at644p](AVR%20ATmega644p.md)

![at644p](../../_assets/pdf/at644p.pdf)
