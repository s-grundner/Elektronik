---
tags:
  - Architektur/RISC-V
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

> [!question] [Rechnerarchitektur](Architekturen/Assembly.md), [Venus@ICS v0.1.4](https://venus.ics.jku.at/)

RISC-V: Erweiterbar, open source

- RISC-V != Prozessor
- LOAD/STORE Architektur
- Standard namenskonvention um [ISA](Architekturen/Assembly.md) zu Beschreiben

Basics:

- `I`= Integer (Basis immer vorhanden)
- Optionale Erweiterung
    - `M`Multiplikation
    - A: Atomic: atomarere Speicherzugriff
    - F/D/Q: Floatingpoint- Berechnung. single, double, quad precision
    - C: Compressed Befehle
    - V: Vector extension
- CSRs: Control ans Status registers.
    - weitere spezialregister für Interrupts ISRs etc

**RISC-V Card**:
- `add, rd, rs1, rs2` | Add | `rd = rs1 + rs2` 

## RV-Assembly

### Registers

Wo  liegen die Operanden
- Register (schneller, direkt am prozessor, alu)
- Speicher
- Konstante (*immediate*)

RISC-V 32 Bit register. 

Registersatz

Gesicherte Register s0-s11 für variablen
Temp register t0-t6 für Zwischenergebnisse

| Name  | Nummer | Beschreibung                                             |
| ----- | ------ | -------------------------------------------------------- |
| zero  | x0     | Konstante 0                                              |
| ra    | x1     | Rücksprungsaddresse (bei return wird dorthin gesprungen) |
| sp    | x2     | Stackpointer                                             |
| gp    | x3     | Zeiger auf globale Daten                                 |
| tp    | x4     | Zeiger auf threadlokale daten                            |
| t0-2  | x5-7   | temp register                                            |
| s0/fp |        | Stack-frame                                              |

### Arithmetik

| Operation | Addition      | Subtraktion   | Mehrere Befehle                 |
| --------- | ------------- | ------------- | ------------------------------- |
| C-Code    | `a=b+c`       | `a=b-c`       | `a=b+c-d`                       |
| RV-asm    | `add a, b, c` | `sub a, b, c` | `add t, b, c`<br> `sub a, t, d` |

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

