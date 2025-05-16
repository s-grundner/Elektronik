---
tags:
  - IT
aliases:
  - Stellenwertsystem
  - polyadisch
keywords:
  - Stellenwertsystem
  - Polyadische Systeme
  - Komplementär Darstellung
subject:
  - KV
  - Technische Informatik
semester: WS23
created: 3. Oktober 2023
professor:
  - Timm Ostermann
---
 

# Zahlensysteme


Stellenwertsystem (Positionssystem)

- Zahlen werden durch Ziffern dargestellt.
- Die Wertigkeit einer Ziffer hängt von der jeweiligen Stelle ab.

Wichtigste Stellenwertsysteme sind polyadische Systeme 
 
- Zahlen werden mit einer Potenzreihe dargestellt 
- $1\cdot 10^1+1\cdot 10^2\dots$ (hier: Dezimalsystm)

Beispiele für nicht polyadische Zahlensysteme  
- Zeit Skala - Stellenwertsystem aber nicht polyadisch  
- röm. Zahlensystem - Additionssystem, kein Stellenwertsystem

## Polyadisches Stellenwertsystem

> [!def] **D - PYAD)** Polyadisches Stellenwertsystem
>
> $$N=(a_{n-1} a_{n-2} \dots a_{1} a_{0}, a_{-1} a_{-2}\dots a_{-m})_{r}$$  

- $N\dots$ Zahl
- $a_{i}\dots$ Ziffern  
- $r\dots$ Radix, Basis (2 binär, 10 dezimal, 16 hexadezimal…)  
- $,\dots$ Komma/Radixpunkt - Trennung zwischen ganzzahligem und gebrochenem Teil
- $a_{n-1}$ MSD - most significant digit
- $a_{-m}$ LSD - least significant digit

> [!example] Beispiele
>
> - Dezimalsystem ($345 = 3\cdot 10^2+4\cdot 10^1+5\cdot 10^0$)
> - [Dualsystem](Dualsystem.md) ($10110=1\cdot 2^{4}+0\cdot 2^{3}+1\cdot 2^{2}+1\cdot 2^1 +0\cdot 2^0$)
> - Oktalsystem (…)
> - Hexadezimal (…)
> 

| Basis   | Dezimal $r=10$               | Dual $r=2$                               | Oktal $r=8$                  | Hexadezimal $r=16$           |
| ------- | ---------------------------- | ---------------------------------------- | ---------------------------- | ---------------------------- |
| Ziffern | $0-9$                        | $0,1$                                    | $0-7$                        | $0-9,A-F$                    |
|         | $0$<br>$1$<br>$2$<br>$3$     | $00000$<br>$00001$<br>$00010$<br>$00011$ | $0$<br>$1$<br>$2$<br>$3$     | $0$<br>$1$<br>$2$<br>$3$     |
|         | $4$<br>$5$<br>$6$<br>$7$     | $00100$<br>$00101$<br>$00110$<br>$00111$ | $4$<br>$5$<br>$6$<br>$7$     | $4$<br>$5$<br>$6$<br>$7$     |
|         | $8$<br>$9$<br>$10$<br>$11$   | $01000$<br>$01001$<br>$01010$<br>$01011$ | $10$<br>$11$<br>$12$<br>$13$ | $8$<br>$9$<br>$A$<br>$B$     |
|         | $12$<br>$13$<br>$14$<br>$15$ | $01100$<br>$01101$<br>$01110$<br>$01111$ | $14$<br>$15$<br>$16$<br>$17$ | $C$<br>$D$<br>$E$<br>$F$     |
|         | $16$<br>$17$<br>$18$<br>$19$ | $10000$<br>$10001$<br>$10010$<br>$10011$ | $20$<br>$21$<br>$22$<br>$23$ | $10$<br>$11$<br>$12$<br>$13$ |

## Konvertieren in Zahlensysteme

![400](assets/konvertierungZahlensys.svg)


