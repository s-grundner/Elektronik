---
tags:
  - index
aliases:
  - RV-Assembly
keywords:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 13th March 2025
professor:
release: false
title: RISC-V
---
 

# RISC-V

RISC-V ist ein *offener Standard* für eine [Befehlssatzarchitektur](../index.md).

> [!question] Was heißt offener Standard?
> - Jeder kann einen RISC-V-Prozessor auf Grundlage der offenen ISA-Spezifikation implementieren, ohne Lizenzgebühren (Royalties) zahlen zu müssen
> - Implementierungen können Open Source oder proprietär (Closed Source) sein
> - Implementierungen können kommerzialisiert werden

- LOAD/STORE Architektur
	- Nur durch LOAD- bzw. STORE-Befehle kann auf den *Hauptspeicher* zugegriffen werden.
	- Alle anderen Befehle arbeiten auf [Registern](Register.md).

> [!info] Standard namenskonvention um [ISA](../index.md) zu beschreiben, die von einer bestimmten Implementierung unterstützt werden
> 
> `RV[###][abc...xyz]`
> 
>  - `RV`: RISC-V Architektur
>  - `###` $\in \{ 32, 64, 128 \}$: definiert die Bitbreite der REgister und des Adressraums
>  - `abc...xyz`: definiert die unterstützte ISA Erweiterung (extensions)

## Basics

- `I`= Integer (Basis immer vorhanden)

Optionale Erweiterung

- `M`: Multiplikation
- `A`: Atomic. atomarere Speicherzugriff
- `F/D/Q`: Floatingpoint- Berechnung. single, double, quad precision
- `C`: Compressed Befehle
- `V`: Vector extension
- `CSR`: Control ans Status registers. Weitere spezialregister für Interrupts ISRs etc

## RV-Assembly

### Registers

> [!question] [Register](Register.md)

### Arithmetik

> [!question] [Arithmetik](Arithmetik.md)

Wo  liegen die Operanden

- Register (schneller, direkt am prozessor, alu)
- Speicher
- Konstante (*immediate*)
## Speicher

Wie werden daten gespeichert?
- Big-/Little-Endian Formate
- Big: Byte mit höchster wertigkeit zuerst
- Little: Byte mit niedrigster wertigkeit zuerst

**Lesen vom Speicher: lw (load word)**

`lw destination, offset (base)

Adressberechnung
- Basisadresse: base (jedes register kann als Basisadresse verwendet werden)
- Referenz zur adresse dieses registers

**Schreiben von Speicher sw** (store word)

`sw ` 

### 32 Bit Konstanten

Mit load upper immediate und add immedaiate

add immediate (addi) addiert zur nach oben verschobenen Konstaten (von lui) seine bits dazu. Achtung beim vorzeichen. 2er komplement. wenn das 11-bit der unteren words gesetzt ist, dann in eine positive Zahl umwandeln und dann dazu addieren.

## Aufbau eines RISC-V Programms

```asm
.globl main              # Deklariert main als Einstiegspunkt
.data                    # Ab hier beginnen globale Daten
my_a: .word 13           # Globale Integer Varaible
my_arr: .word 1, 24, -54 # Globales Integer Array
my_str: .string „Hallo“  # Globaler String (Character Array)
.text                    # Ab hier beginnt der Programmcode
main: ...                # Main Methode des Programms
...                      # Source code
.end                     # Ende des Programmcodes
```

## Referenzen

- [Venus@ICS v0.1.4](https://venus.ics.jku.at/)
