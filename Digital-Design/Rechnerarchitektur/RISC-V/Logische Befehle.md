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
title: Logische Befehle
---

# Logische Befehle

## `and`

> [!hint] nützlich zum *Maskieren* von Bits
> Maskierung aller Bytes bis auf das niederwertigste Byte eines Wertes:
> 
> `0xF234012F and 0x000000FF = 0x0000002F`

## `or`

> [!hint] nützlich für die *Zusammenführung* von Bitfeldern
> `0xF2340000 or 0x000012BC = 0xF23412BC`

## `xor`

> [!hint] nützlich für die *Negation* von Bits 
> `A xor -1 = not A` (Erinnerung: `-1 = 0xFFFFFFFF`)

## Beispiele

> [!example] Beispiel 1
> ![](../../../_assets/Pasted%20image%2020260324153010.png)

> [!example] Beispiel 2
> ![](../../../_assets/Pasted%20image%2020260324153054.png)