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

| Codeadresse | Hexcode | Mnemonic | Operanden | _Bemerkung_              | Cycles |
| ----------- | ------- | -------- | --------- | ------------------------ | ------ |
| C:`0x0020`  | `0xE2, 0x0F` | ldi | `r16, 0x0F` | Lade direkte Daten in Register 16 | 1      |
| C:`0x0022`  | `0xBD, 0x01, 0x20` | lds | `r24, 0x0020` | Lade Daten aus SRAM-Speicheradresse 0x0020 in Register 24 | 2      |
| C:`0x0025`  | `0x1C, 0x5C` | add | `r1, r28` | Addiere Register 1 und Register 28 und speichere das Ergebnis in Register 1 | 1      |
| C:`0x0027`  | `0x9D, 0x00, 0x20` | sts | `0x0020, r29` | Speichere Daten aus Register 29 in SRAM-Speicheradresse 0x0020 | 2      |
| C:`0x002A`  | `0xE0, 0x93, 0x04` | ldi | `r30, 0x04` | Lade direkte Daten in Register 30 | 1      |
| C:`0x002D`  | `0x90, 0xE0` | ld | `r14, Z` | Lade Daten aus dem Speicher, der durch das Adressregister Z angegeben wird, in Register 14 | 2      |
| C:`0x002F`  | `0x92, 0x60` | st | `Z+, r18` | Speichere Daten aus Register 18 im Speicher, der durch das Adressregister Z angegeben wird, und erhöhe anschließend das Adressregister Z um 1 | 2      |
| C:`0x0031`  | `0x0D, 0x98` | or | `r1, r5` | Führe eine Bitweise-ODER-Operation zwischen Register 1 und Register 5 durch und speichere das Ergebnis in Register 1 | 1      |

## AVR-lib Basics
### 1. Pin als Ausgang Definieren
### 2. Bit setzen
### 3. Bit löschen
### 4. Bit toggeln
### 5. Bit abfragen
## ADC

## Interrupts
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
# Quellen
- [AVR Tips and API](https://onlinedocs.microchip.com/pr/GUID-78362176-487F-41B9-95C7-B478A9A186EB-en-US-2/index.html?GUID-E8E50411-4A61-4C7B-A8FD-7E07E93F6DDE)
[[Instruction_Set_8bit.pdf]]
[[at644p.pdf]]