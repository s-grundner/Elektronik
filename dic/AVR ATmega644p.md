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

Konstante Variablen oder Tabellen sollten zur speicheroptimierung im Programmemory gespeichert werden:
```c
// AVR GCC usues Variable Attributes to declare a variable in Program Memory
const int mydata[] __attribute__((__progmem__)) = ...
```

```c
// AVRlibC Macro
#include <avr/pgmspace.h>
const int mydata[] PROGMEM = ...
```

## `static` Specifier
Wenn **globale Variablen** nur in einem File verwendet werden, soll man sie als `static` bezeichnen.
**Lokale Variablen** sollen nur `static` markiert werden, wenn <mark style="background: #FFB86CA6;">der Wert erhalten bleiben</mark> soll.

Wenn eine **Funktion** nur in <mark style="background: #FFB86CA6;">einem File</mark> verwendet wird, sollte sie als `static` markiert werden. 

## ASM
![[Pasted image 20230421081440.png]]
## AVR-lib Basics
### 1. Pin als Ausgang Definieren
### 2. Bit setzen
### 3. Bit löschen
### 4. Bit toggeln
### 5. Bit abfragen
## ADC

## Interrupts
![[at644p.pdf]]
### Extern Interrupt
### Timer Interrupt
### ADC Interrupt

## Protokolle
### Custom Protocol
## [[{MOC} Schnittstellen]]
### [[TWI|I2C]]/[[TWI]]
## Sleep and Powersaving
### Typische Wakeup-Sources aus Stromspar-Modes
| Source                    |     |
| ------------------------- | --- |
| [[TWI]] address match (Slave) |     |
| Timer Interrupt           |     |
| ADC Interrupt             |     |
|                           |     |

# Algo
## Hex to ASCII (xtoa)
## ASCII to Hex (atox)
## [[Ringbuffer]]

---
# Tags
## [AVR Tips and API](https://onlinedocs.microchip.com/pr/GUID-78362176-487F-41B9-95C7-B478A9A186EB-en-US-2/index.html?GUID-E8E50411-4A61-4C7B-A8FD-7E07E93F6DDE)
![[Instruction_Set_8bit.pdf]]

![[at644p.pdf]]