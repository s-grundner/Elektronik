---
tags: []
aliases: ["UART"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 19th April 2022
last_edited: 19th April 2022
---

# Universal Asynchronous Receive and Transmit

UART steht für Universal Asynchronous Receive and Transmit und ist, wie der Name bereits sagt, ein serielles, asynchrones Übertragungsprotokoll.
Mit UART, welche Datenübertragungen im Vollduplex-Betrieb unterstützt, werden zwei Bauelemente miteinander verbunden.
Die Bus-Teilnehmer sind hierbei gleichgestellt, was heißt, dass des keinen Mastercontroller gibt, welcher den Bus steuert.
Die Daten werden einfach gesendet. Bei der Verdrahtung ist zu beachten, dass die Übertragungsleitungen überkreuzt angeschlossen werden müssen.
![[Pasted image 20230501003528.png]]

UART spielt eine wichtige Rolle bei der Arbeit mit SoCs, da deren Firmware oft über eine USB-Bridge den Flashspeicher beschreiben. Die USB-Bridge spricht das System dabei mit UART an. Auch das Debuggen erfolgt meistens über diese serielle [[{MOC} Schnittstellen|Schnittstelle]].

## Die übertragenen Datenpakte haben folgendes Formatierung

![[Pasted image 20230501003521.png]]
Ein Startbit signalisiert dem Empfänger, dass eine Übertragung beginnt. Das Potential auf der Übertragungsleitung ist _Normally-High_ und wird durch das Startbit auf _Low_ gezogen. Anschließend folgt das Datenframe, welches je nach Konfiguration fünf bis neun Bit lang ist. Eine Paritätsbit dient zur Validierung der Übertragung. Dieses Bit kann aber auch im Controller ausgeschalten werden. Am Ende der Übertragung setzt ein Stop Bit den Bus wieder auf den Idle-Zustand.
  
# AVR Example
### USART ohne Interrupt
```c
void usart0_init(unsigned short baud)
{
	/* Set baud rate */
	UBRRHn = (unsigned char)(baud>>8);
	UBRRLn = (unsigned char)baud;
	/* Enable receiver and transmitter */
	UCSR0B = (1<<RXEN0)|(1<<TXEN0);
	/* Set frame format: 8data, 2stop bit */
	UCSR0C = (1<<USBS0)|(3<<UCSZn0);
}
```

``` c
void usart0_transmit(unsigned char data)
{
	/* Wait for empty transmit buffer */
	while (!( UCSR0A & (1<<UDRE0)));
	/* Put data into buffer, sends the data */
	UDR0 = data;
}
```

``` c
unsigned char usart0_recieve(void)
{
	/* Wait for data to be received */
	while (!(UCSRnA & (1<<RXCn)));
	/* Get and return received data from buffer */
	return UDR0;
}
```
###

---
# Tags

- [[Ringbuffer]]
- [[AVR ATmega644p|at644p]]

![[at644p.pdf]]