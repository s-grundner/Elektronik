---
tags: ["AVR"]
aliases: ["CrumbTL", "CrumTL", "ATmega644p", "at644p"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: [""]
created: 21st March 2022
last_edited: 11th April 2022
---

# AVR ATmega644p
## Memory
| Storage Medium               | Size  |
| -------------- | ----- |
| Program Memory | 64kiB |
| Flash (RAM)    | 2kiB  |

Konstante Variablen oder Tabellen sollten zur Speicher Optimierung im Programmemory gespeichert werden:
```c
// AVR GCC usues Variable Attributes to declare a variable in Program Memory
const int mydata[] __attribute__((__progmem__)) = ...
```

```c
// AVRlibC Macro
#include <avr/pgmspace.h>
const int mydata[] PROGMEM = ...
```

>[!info] `static` specifier
> Wenn **globale Variablen** nur in einem File verwendet werden, soll man sie als `static` bezeichnen.
> **Lokale Variablen** sollen nur `static` markiert werden, wenn <mark style="background: #FFB86CA6;">der Wert erhalten bleiben</mark> soll.
> Wenn eine **Funktion** nur in <mark style="background: #FFB86CA6;">einem File</mark> verwendet wird, sollte sie als `static` markiert werden. 

## Assembly
| Codeadresse | Hexcode              | Mnemonic | Operanden     | _Bemerkung_ | Cycles |
| ----------- | -------------------- | -------- | ------------- | ----------- | ------ |
| C:`0x0020`  | `0xE2AB`             | ldi      | `r26`,`$2B`   |             |        |
| C:`0x0021`  | `0x9140`<br>`0x002A` | lds      | `r20`,`$002A` |             |        |
| C:`0x0023`  | `0x0F4A`             | add      | `r20`,`r26`   |             |        |
| C:`0x0024`  | `0x93A0`<br>`0x002A` | sts      | `002A`,`R20`  |             |        |
| C:`0x0026`  | `0xE0B0`             | ldi      | `r27`,`$00`   |             |        |
| C:`0x0027`  | `0x913E`               | ld       | `r19`,`-X`    |             |        |
| C:`0x`      |                      | st       | `X+`,`r20`    |             |        |
| C:`0x`      |                      | or       | `r17`,`r26`   |             |        |

## AVR-lib Basics
- Bit setzen: `REG = REG | (1<<REG[n])`
- Bit löschen: `REG = REG & ~(1<<REG[n])`
- Bit toggeln: `REG = REG ^ (1<<REG[n])`
- Bit abfragen: `BOOL = REG & (1<<REG[n])`

## PIN, PORT, DDR
`PORT` Register zum Beschreiben der Pin Ausgänge
`PIN` Register zum Abfragen des digitalen Wertes am Pin
`DDR` Register: `0 -> input`, `1 -> output`

## ADC
### Examples

> [!info]  Eine Photodiode ist über einen Widerstand an PA3 angeschlossen. 
> - Bei 1 mW/cm² misst man 0,1 V
> - bei 10 mW/cm² 4 V.
> 
> Schreib eine Funktion `char check_sensor(void)`:
> Returncode:
> - -1 bei Energiedichte < als 3mW/cm²
> - 0 Energiedichte zwischen 3 und 7 mW/cm²
> - 1 Energiedichte > 7 mW/cm²

> [!warning] Der AD Wandler wurde bereits initialisiert mit Single Konversion, Referenz Spannung = 5V, 10 Bit Auflösung und ADLAR = 0.
```c
void adc_init()
{
	// Vref = 5V
	ADMUX |= (1 << REFS0);
	ADMUX &= ~(1 << REFS0);
	// ADLAR = 0
	ADMUX &= ~(1 << ADLAR); 
	// Set ADC Channel to PA3 (Single Conversion)
	ADMUX &= 0xE0;
	ADMUX |= 0x03;
	// Prescaler 128: f_adc = 125 000 Hz (ADPSn = b111)
	ADCSRA |= (1 << ADPS2) | (1 << ADPS2) | (1 << ADPS2);
	// Enable ADC
	ADCSRA |= (1 << ADEN);
	// Start First Conversion to initialize ADC
	ADCSRA |= (1 << ADSC);
}
```

> [!summary] Sensorgleichung
> $$
> ed = k\cdot V_{adc} + d \quad\rightarrow \quad
> \begin{align*}
> 9 &= 3.9\cdot k && k = \tfrac{9}{3.9} = \tfrac{30}{13}\\
> 1 &= \tfrac{3}{13} + d && d = \tfrac{10}{13}\\
> \end{align*}
> $$
> $$
> \begin{align*}
> \tfrac{V_{adc}}{5} &= \tfrac{ADC}{1024} \qquad V_{adc} = 5 \cdot\tfrac{ADC}{1024}\\\\
> ed &= \tfrac{30}{13} \cdot ADC \cdot  \tfrac{5}{1024} + \tfrac{10}{13}\\
> ed &= ADC \cdot \tfrac{75}{6656} + \tfrac{10}{13}\\
> \end{align*}
> $$

```c	
#define SENSOR_K (75.0/6656.0)
#define SENSOR_D (10.0/13.0)
char check_sensor()
{
	while (ADCSRA & (1<<ADSC)); // Warten bis Konversion fertig ist
	float energy_density = ADC * SENSOR_K + SENSOR_D; // Sensorgleichung
	ADCSRA |= (1<<ADSC); // Konversion restarten
	return (energy_density > 7.0) - (energy_density < 3.0); // -1 wenn < 3, 1 wenn > 7, 0 wenn dazwischen
}
```

--- 


## Interrupts

### Extern Interrupt
#### Example

### Timer Interrupt
#### Example
> [!info] Fast-PWM
> - Timer2 8-Bit breit, zählt von 0-255
> - fast pwm mode (non inverting)
> 	- Bei OC2A = 0 -> Pin High
> 	- Bei OC2A = TOP -> Pin Low
> - $f_{PWM} = 20kHz$

```c
void timer2_init(void)
{
	// fast PWM Modus Setzen (WGMn 011)
	TCCR2A |= (1<<WGM20)|(1<<WGM21);
	// non-inverting Mode setzen (COM2An 10)
	TCCR2A |= (1<<COM2A1);
	// Duty Cycle 50%
	OCR2A = (0xFF>>1); // 255/2
	// Prescaler bei f_osz = 16MHz
	// f_PWM ~= 20kHz = 16MHz/(PS*256) -> PS = 8 (am nächsten unter 20kHz)
	// f_PWM = 7812.5Hz
	// PS 8 (CS2n 010) und Starten
	TCCR2B |= (1<<CS21);
}
```

```c
int main()
{
	unsigned char inputState;
	DDRD |= (1 << PD7); //Pinout -> OC2A PIN
	timer2_init();
	
	while (1)
	{
		inputState = PINA & 0x03; // PA0 und PA1 als Eingang zur DC Steuerung
		switch (inputState)
		{
		case 0:
			OCR2A = 250; // DC = 250/255 ~ 98%
			break;
		case 1:
			OCR2A = 200; // DC = 200/255 ~ 78%
			break;
		case 2:
			OCR2A = 100; // DC = 100/255 ~ 39%
			break;
		case 3:
			OCR2A = 10; // DC = 10/255 ~ 4%
			break;
		}
	}
}
```

## Protokolle

## [[{MOC} Schnittstellen]]
- [[TWI|I2C]]/[[TWI]]
-  [[USART]]

# Algo
- [[Ringbuffer]]

# Quellen
- [AVR Tips and API](https://onlinedocs.microchip.com/pr/GUID-78362176-487F-41B9-95C7-B478A9A186EB-en-US-2/index.html?GUID-E8E50411-4A61-4C7B-A8FD-7E07E93F6DDE)
- [[Instruction_Set_8bit.pdf]]
- [[at644p.pdf]]