---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Rechnerarchitektur
semester: SS25
created: 12th March 2025
professor: 
draft: true
title: Assembly
---
 

# Assembler

**Ebenensicht**

![invert_dark](assets/Pasted%20image%2020250312223452.png)


Letzte Lesbare Sprachebene. Meistens sind die Befehle elementare Operationen
- add, sub, mul, load, store ...

> [!important] **Register:** Register stehen zur Datenmanipulation und speicherung zur Verfügung
> - Parallele D-FlipFlops
> - Register haben keinen Typen, es werdenu die Bits gespeichert
> - Operationen legen fest, wie das Register interpretiert wird. (Floating point operationen ...)

| Assembler                                      | Höhere Programmiersprache                                                                                                 |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| Zusammenhänge von operationen schwer erkennbar | Gute Lesbarkeit                                                                                                           |
| Einfache Befehle                               | Komplexe Sprachkonstrukte                                                                                                 |
| Direkter Speicherzugriff                       | Implementiert selbst Memory Management oder ein abstraktes Interface dafür (Garbage Collector, Heap, Ownership/Borrowing) |

## Instructionset Architecture

ISA: Instructionset Architecture (ARM, x86, RISC-V)

![](assets/Pasted%20image%2020250312144308.png)