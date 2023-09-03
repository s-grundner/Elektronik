#include <avr/io.h>
#include <avr/interrupt.h>

/*
 * Unter Verwendung der obigen Funktion, schreib ein Programm,
 * welches bei der Eingabe über die serielle Schnittstelle bei 'e' PD7 auf high setzt und bei 'a' auf low.
 * Verwende dazu die passende Interruptserviceroutine.
 * Erstelle die komplette SW, das heißt die main Routine und die Interruptserviceroutine.
 * Die obige Funktion muss nicht mehr hingeschrieben werden,
 * man kann sie einfach mit InitUsart() aufrufen.
 */

void init_usart(void)
{
	UCSR0B = ((1 << RXEN0) | (1 << RXCIE0));
	UCSR0C = ((1 << UCSZ01) | (1 << UCSZ00));
	UBRR0 = 51;
}

ISR(USART0_RX_vect)
{
	PORTD &= ~((UDR0 == 'e') << PD7);
	PORTD |= ((UDR0 == 'a') << PD7);
}

int main(void)
{
	DDRD |= (1 << PD7);
	init_usart();
	sei();
	while (1)
		;
	return 0;
}