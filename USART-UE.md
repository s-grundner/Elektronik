![[Pasted image 20230501162724.png|825]]

| Baudrate | Parity Bit |      Datenbits      | Stoppbits | Modus                   | Enable | Interrupt |     |
|:--------:|:----------:|:-------------------:| :---------: | :-----------------------: | :------: | :---------: | --- |
|   19200   |    aus     | 8 Bit <br> Standard | 1 Bit     | Asynchron <br> Standard | RX     | RXC       |     |

```c
void usart_init(void)
{
	UCSR0B |= (1<<RXEN0)|(1<<RXCIE0); // RX Enable, RX Complete Interrupt
	//UCSR0C |= (1<<UCSZ01)|(1<<UCSZ00); // 8 Bit Datengröße (Standard)
	short baud = 51; // Tabelle -> f_osz = 16MHz : 19200 Baud
	
	//UBRR0 = baud; // geht auch
	UBRRH0 = (unsigned char) baud>>8;
	UBRRL0 = (unsigned char) baud & 0xff;
}
```

```c
ISR(USART0_RX_vect)
{
	char data = UDR0;
	/*
	if(data == 'e')
		PORTD |= (1<<PD7);
	else if(data == 'a')
		PORTD &= ~(1<<PD7);
	*/	
	PORTD |= ((data == 'e') << PD7);
	PORTD &= ~((data == 'a') << PD7);
}
```

```c 
int main()
{
	DDRD |= (1<<PD7)
	usart_init();
	sei(); // WICHTIG!!
	while(1);
}
```