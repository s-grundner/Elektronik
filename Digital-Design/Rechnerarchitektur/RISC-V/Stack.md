---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 24th March 2026
professor:
release: false
title: Stack
---

# Stack

> [!question] [LIFO Stack](../../../Softwareentwicklung/DSA/LIFO%20Stack.md) als Datenstruktur

Der Stack dient als Speicher, in dem Variablen vorübergehend gespeichert werden müssen.

- *Wächst*: verbraucht mehr Speicher, wenn mehr Platz benötigt wird
- *Schrumpft*: verbraucht weniger Speicher, wenn der Platz nicht mehr benötigt wird

Der Stack wächst nach *unten* (von höherer zu niedrigerer Speicheradressen)

> [!example] Speichern von *2 Worten* auf dem Stack
> ![invert_dark](../../../_assets/Pasted%20image%2020260324173744.png)

## Stack Pointer

Der Stack Pointer `sp` ist ein spezielles [Register](Register.md), welches auf das aktuell oberste Datenelement im Stack zeigt.

## Speichern und Laden von Registern

Beispiel zur Speicherung beliebiger Register am Stack während eines [Funktionsaufrufs](Funktionsaufrufe.md) `diffofsums`.

![](../../../_assets/Pasted%20image%2020260324181618.png)

| Before Call                                                          | During Call                                                          | After Call                                                           |
| -------------------------------------------------------------------- | -------------------------------------------------------------------- | -------------------------------------------------------------------- |
| ![invert_dark](../../../_assets/Pasted%20image%2020260324181813.png) | ![invert_dark](../../../_assets/Pasted%20image%2020260324181856.png) | ![invert_dark](../../../_assets/Pasted%20image%2020260324181933.png) |

