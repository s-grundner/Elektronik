---
tags:
  - IT
aliases:
  - Stellenwertsystem
  - polyadisch
  - binär
  - hexadezimal
  - dezimal
keywords:
  - Stellenwertsystem
  - Polyadische Systeme
  - Komplementär Darstellung
subject:
  - Technische Informatik
  - "336.001"
semester: 1
created: 3. Oktober 2023
professor:
  - Timm Ostermann
---
 

# Zahlensysteme

> [!INFO] Stellenwertsystem (Positionssystem)  
> Zahlen werden durch Ziffern dargestellt.  
> Die Wertigkeit einer Ziffer hängt von der jeweiligen Stelle ab.

> [!IMPORTANT] Wichtigste Stellenwertsysteme sind polyadische Systeme  
> Zahlen werden mit einer Potenzreihe dargestellt:  
> $1\cdot 10^1+1\cdot 10^2\dots$ (hier: Dezimalsystem)
>
> > [!EXAMPLE] Beispiele für nicht polyadische Zahlensysteme  
> > - Zeit Skala - Stellenwertsystem aber nicht polyadisch  
> > - röm. Zahlensystem - Additionssystem

## Darstellung einer Zahl im polyadischen Stellenwertsystem

> [!QUESTION] $N=(a_{n-1} a_{n-2}\dots  a_{1} a_{0},  a_{-1} a_{-2}\dots a_{-m})_{r}$  
> - $N\dots$ Zahl
> - $a_{i}\dots$ Ziffern  
> - $r\dots$ Radix, Basis (2 binär, 10 dezimal, 16 hexadezimal…)  
> - $,\dots$ Komma/Radixpunkt - Trennung zwischen ganzzahligem und gebrochenem Teil
> - $a_{n-1}$ MSD - most significant digit
> - $a_{-m}$ LSD - least significant digit

> [!EXAMPLE] Beispiele
> - Dezimalsystem ($345 = 3\cdot 10^2+4\cdot 10^1+5\cdot$)
> - Dualsystem ($10110=1\cdot 2^{4}+0\cdot 2^{3}+1\cdot 2^{2}+1\cdot 2^1 +0\cdot 2^0$)
> - Oktalsystem (…)
> - Hexadezimal (…)

![|625](assets/Pasted%20image%2020231003162318.png)

# Konvertieren in Zahlensysteme

- Sukzessive Multiplikation mit Addition
- Sukzessive Division mit Rest $\to$ Horner Schematic
- Umwandlung von Zahlen mit gebrochenen Anteil, getrennte Berechnung des ganzzahligen Anteils und des gebrochenen Anteils.

> [!IMPORTANT] Multiplikation im Dualsystem ist schieben und addieren

# Rechnen in Zahlensystemen

## Addieren

> [!INFO] Additionsmatrix
> ![](assets/Pasted%20image%2020231010122745.png)

## Multiplizieren 

> [!INFO] Multiplikationsmatrix
> ![](assets/Pasted%20image%2020231010122811.png)

> [!QUESTION] Add and Shift
> ![](assets/Pasted%20image%2020231010122432.png)

# Darstellung negativer Zahlen

> [!INFO] Vorzeichen-Wert System Darstellung  
> $N=(s,a_{n-1}a_{n-2}\dots a_{1}a_{0}\dots a_{-1}a_{-2}\dots a_{-m})_{r}$

> [!INFO] Komplement Darstellung  
> $\bar{N} = r^{n}-N_{r}$  
> $\bar{N}\dots$ Radix-Komplement  
> $N_{r}\dots$ Zahl  
> $r\dots$ Radix  
> $\to$ 2er Komplement im Dualsystem

> [!INFO]  
> 2er Komplement schwieriger zu bilden aber leichter zu rechnen (einfach Übertrag entfernen)  
> 1er Komplement leichter zu bilden, schwieriger zu rechnen

## 1er/r-1 Komplement (1K)

$\overline{N_{r-1}}=r^{n}-1-N_{r}$

> [!INFO] Jede $1$ zu $0$, jede $0$ zur $1$

## 2er/r Komplement (2K)

$\overline{N_{r}}=r^{n}-N_{r}$

> [!INFO] Jede $1$ zu $0$, jede $0$ zur $1$ UND $+1$

>[!EXAMPLE] $9.5_{10}-4_{10}$
>
> $$
> \begin{align}
> 9.5_{10} &\hat{=} 1001.1_{2} \\ \\
> 4_{10} &\hat{=}0100_{2} \\
> &\downarrow \\
> r-1:-4_{10}&\hat{=}1011_{1K} \\
> &\downarrow \\
> r: -4_{10}&\hat{=}1100_{2K} \\ \\
> &1001.1 \\
> +&\underline{1100} \\
1&0101.1 \hat{=} 5.5
> \end{align}
> $$

