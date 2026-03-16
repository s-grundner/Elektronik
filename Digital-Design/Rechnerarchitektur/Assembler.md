---
tags:
aliases:
  - Assembly
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 14th March 2026
professor:
release: false
title: Assembler
---

# Assembler

![invert_dark|1000](../../_assets/asm_ebenen.png)

![invert_dark|1000](../../_assets/Pasted%20image%2020260314154314.png)

> [!hint] **Assembler:** Letzte Lesbare Sprachebene. Meistens sind die Befehle elementare Operationen
> - add, sub, mul, load, store ...

> [!important] **Register:** Register stehen zur Datenmanipulation und speicherung zur Verfügung
> - Parallele D-FlipFlops
> - Register haben keinen Typen, es werden nur die Bits gespeichert
> - Operationen legen fest, wie das Register interpretiert wird. (Floating point operationen ...)

| Assembler                                      | Höhere Programmiersprache                                                                                                                                                 |
| ---------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Zusammenhänge von operationen schwer erkennbar | Gute Lesbarkeit                                                                                                                                                           |
| Einfache Befehle                               | Komplexe Sprachkonstrukte                                                                                                                                                 |
| Direkter Speicherzugriff                       | Implementiert selbst Memory Management<br>oder ein abstraktes Interface dafür.<br>(Garbage Collector, [Heap](../../Softwareentwicklung/DSA/Heap.md), Ownership/Borrowing) |
