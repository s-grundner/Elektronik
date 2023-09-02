---
tags: ["AVR"]
aliases: ["CrumbTL", "CrumTL", "ATmega644p", "at644p"]
subject: ["dic"]
source: ["Robert Vogl"]
created: 21st March 2022
---

# AVR ATmega644p

## Memory

| Storage Medium | Size  |
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

## Assembly

> [!EXAMPLE]  
> ![AVR_Assembly1](assets/AVR_Assembly1.png)  
> Vor dem Start des Programms wurde das gesamte interne Datenmemory (insklusive der Register R0-R31) auf 0x5A initialisiert. Indirektes Register X=R27:R26  
> **Was steht nach der Ausführung des Programms (also von C:0x002B-letztem Befehl) auf folgender Adressen:**  
> D:0x0029 : `0x5A `  
> D:0x002A : `0x76 `  
> D:0x002B : `0x76`  
> D:0x002C : `0x5A`  
> R17 : `0x2D`  
> R19 : `0x5A`  
> R20 : `0x76`  
> R26 : `0x2C `  
> R27 : `0x00`

## AVR-lib Basics

- Bit setzen: `REG = REG | (1<<REG[n])`
- Bit löschen: `REG = REG & ~(1<<REG[n])`
- Bit toggeln: `REG = REG ^ (1<<REG[n])`
- Bit abfragen: `BOOL = REG & (1<<REG[n])`

## PIN, PORT, DDR

- `PORT` Register zum Beschreiben der Pin Ausgänge
- `PIN` Register zum Abfragen des digitalen Wertes am Pin
- `DDR` Register: `0 -> input`, `1 -> output`

## ADC

### Examples

> [!info] Eine Photodiode ist über einen Widerstand an PA3 angeschlossen. 
> - Bei 1 mW/cm² misst man 0,1 V
> - bei 10 mW/cm² 4 V.
> 
> Schreib eine Funktion `char check_sensor(void)`:  
> Returncode:
> - -1 bei Energiedichte < als 3mW/cm²
> - 0 Energiedichte zwischen 3 und 7 mW/cm²
> - 1 Energiedichte > 7 mW/cm²

> [!WARNING] Der AD Wandler wurde bereits initialisiert mit Single Konversion, Referenz Spannung = 5V, 10 Bit Auflösung und ADLAR = 0.
> 
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
	return (energy_density > 7.0) - (energy_density < 3.0);
}
```

--- 

## Interrupts

### External Interrupt

#### Example

```c
void ext_int1_init(void)
{
    EICRA |= ((1 << ISC10) | (1 << ISC11)); // rising edge
    EIMSK |= (1 << INT1);                   // enable interrupt
}

ISR(INT1_vect)
{
	// do stuff
}

int main()
{
	ext_int1_init();
	sei();
	while(1);
}
```

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
		// PA0 und PA1 als Eingang zur DC Steuerung
		inputState = PINA & 0x03;
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

## [{MOC} Schnittstellen]({MOC}%20Schnittstellen.md)

- [I2C](I2C.md)/[I2C](I2C.md)
- [USART](USART.md)

# Algo

- [Ringbuffer](Ringbuffer.md)

# Quellen

- [AVR Tips and API](https://onlinedocs.microchip.com/pr/GUID-78362176-487F-41B9-95C7-B478A9A186EB-en-US-2/index.html?GUID-E8E50411-4A61-4C7B-A8FD-7E07E93F6DDE)
- [Instruction_Set_8bit](datasheets/Instruction_Set_8bit.pdf)
- [at644p](datasheets/at644p.pdf)
