---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 21st June 2026
professor:
release: false
title: Direct-Mapped Cache
---

# Direct Mapped Cache

> [!question] [Cache](Caches.md)

- Jedes Datum wird an eine bestimmte Stelle im Cache geschrieben 
- Erfordert kaum zusätzliche Logik 

**Feste Abbildung** der Hauptspeicher-Adressen auf die Cache-Adressen

Aufbau eines Cache für einen RISC-V Prozessor mit 1024 Einträgen

- Valid Bit: gibt an ob der Eintrag gültig ist 
- Tag: Adressbits 31:12 
- Index: Adressbits 11:2 
- Byte Offset: Adressbits 1:0

Speicherzellen des Hauptspeichers mit gleichem Index werden auf die gleiche Position im Cache abgebildet

Cache Hit wenn Valid 1 ist und der Tag übereinstimmt
## Realisierung

![](../../_assets/Pasted%20image%2020260621195251.png)

## Beispiel

5-Bit Adressen (32 Speicherblöcke), Cache mit direkter Abbildung, 8 Cacheblöcke, ein Cache Block beinhaltet ein Wort

![700](../../_assets/Pasted%20image%2020260621201039.png)


![700](../../_assets/Pasted%20image%2020260621195357.png)