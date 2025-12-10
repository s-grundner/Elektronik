---
tags: 
aliases:
  - Radix Komplement
keywords:
  - Radix Komplement
subject:
  - KV
  - Technische Informatik
semester: WS23
created: 19th May 2025
professor: 
title: Polyadisches Stellenwertsystem
---

# Polyadisches Stellenwertsystem

> [!question] [Zahlensysteme](Zahlensysteme.md)

---

> [!def] **D - PYAD)** Polyadisches Stellenwertsystem
>
> $$N_{r}=(a_{n-1} a_{n-2} \dots a_{1} a_{0}, a_{-1} a_{-2}\dots a_{-m})_{r}$$  

- $N\dots$ Zahl
- $a_{i}\dots$ Ziffern  
- $r\dots$ Radix, Basis (2 binär, 10 dezimal, 16 hexadezimal…)  
- $,\dots$ Komma/Radixpunkt - Trennung zwischen ganzzahligem und gebrochenem Teil
- $a_{n-1}$ MSD - most significant digit
- $a_{-m}$ LSD - least significant digit

Die Menge an Ziffern ist dann $0$ bis $r-1$ (Dual 0 bis 1, Dezimal 0 bis 9, usw)

> [!example]- Beispiele
>
> - Dezimalsystem ($345 = 3\cdot 10^2+4\cdot 10^1+5\cdot 10^0$)
> - [Dualsystem](Dualsystem.md) ($10110=1\cdot 2^{4}+0\cdot 2^{3}+1\cdot 2^{2}+1\cdot 2^1 +0\cdot 2^0$)
> - Oktalsystem (…)
> - Hexadezimal (…)
> 
> 
> 
>
> | Basis   | Dezimal $r=10$               | Dual $r=2$                               | Oktal $r=8$                  | Hexadezimal $r=16$           |
> | ------- | ---------------------------- | ---------------------------------------- | ---------------------------- | ---------------------------- |
> | Ziffern | $0-9$                        | $0,1$                                    | $0-7$                        | $0-9,A-F$                    |
> |         | $0$<br>$1$<br>$2$<br>$3$     | $00000$<br>$00001$<br>$00010$<br>$00011$ | $0$<br>$1$<br>$2$<br>$3$     | $0$<br>$1$<br>$2$<br>$3$     |
> |         | $4$<br>$5$<br>$6$<br>$7$     | $00100$<br>$00101$<br>$00110$<br>$00111$ | $4$<br>$5$<br>$6$<br>$7$     | $4$<br>$5$<br>$6$<br>$7$     |
> |         | $8$<br>$9$<br>$10$<br>$11$   | $01000$<br>$01001$<br>$01010$<br>$01011$ | $10$<br>$11$<br>$12$<br>$13$ | $8$<br>$9$<br>$A$<br>$B$     |
> |         | $12$<br>$13$<br>$14$<br>$15$ | $01100$<br>$01101$<br>$01110$<br>$01111$ | $14$<br>$15$<br>$16$<br>$17$ | $C$<br>$D$<br>$E$<br>$F$     |
> |         | $16$<br>$17$<br>$18$<br>$19$ | $10000$<br>$10001$<br>$10010$<br>$10011$ | $20$<br>$21$<br>$22$<br>$23$ | $10$<br>$11$<br>$12$<br>$13$ |
> 
## Darstellung Negativer Zahlen

Das Stellenwertsystem muss eine Stelle für das Vorzeichen aufgeben, um die Menge der Negativen Zahlen einzuschließen.

### Signed Magnitude

Das *most significant digit* wird als Vorzeichen verwendet.

> [!def] **D - SGNM)** Vorzeichen-Wert System Darstellung / Signed Magnitude ^SGNM
> $$N_{r}=(s,a_{n-1}a_{n-2}\dots a_{1}a_{0},a_{-1}a_{-2}\dots a_{-m})_{r}$$

Der Nachteil der Signed Maginitude ist, dass es zwei Darstellungsmöglichkeiten der 0 gibt.

### Radix Komplement

Dabei ist $n$ die Anzahl der Stellen von $N$

> [!def] **D - R)** $r$-Komplement ^R
> $$\overline{N}_{r} = r^{n} - N_{r}$$

Alle Stellen $a_{i}$ werden durch $r - a_{i}$ ersetzt. Es muss gelten $N_{r}+\overline{N}_{r}=0$

- Hier hat man nur eine Darstellung der 0.
- Im [Dualsystem](Dualsystem.md#2er%20Komplement) bezeichnet als 2er-Komplement mit der Kennung $2\mathrm{K}$ im Index

Einfacher:
- $r-1$-Komplement bilden: $a_{i} \to (r-1)-a_{i}$
- $+1$ addieren

---

> [!def] **D - R-1)** $r-1$-Komplement ^R-1
> $$\overline{N_{r-1}}=r^{n}-1-N_{r}$$

Alle Stellen $a_{i}$ werden durch $r-1-a_{i}$ ersetzt

- Das $r-1$-Komplement ist einfacher zu bilden,
- jedoch hat man hier zwei Darstellungsmöglichkeiten der 0.
- Im [Dualsystem](Dualsystem.md#1er%20Komplement) bezeichnet als 1er-Komplement mit der Kennung $1\mathrm{K}$ im Index

## Konvertieren zwischen polyadischen Systemen

![400](../assets/konvertierungZahlensys.svg)


