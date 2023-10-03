
# Zahlensysteme

Stellenwertsystem (Positionssystem)

Polyadische Systeme ($1\cdot 10^1+1\cdot 10^2\dots$)

> [!INFO] Darstellung einer Zahl  
> $N=(a_{n-1}a_{n-2}\dots a_{1}a_{0}\dots a_{-1}a_{-2})_{r}$  
> $N\dots$ 

> [!EXAMPLE] Beispiele
> - Dezimalsystem
> - Dualsystem
> - Oktalsystem
> - Hexadezimal

## Konvertieren in Zahlensysteme

- Sukzessive Multiplikation mit Addtion
- Sukzessive Division mit Rest $\to$ Horner Schematic
- Umwandlung von Zahlen mit gebrochenen Anteil, getrennte berechnung des ganzzahligen Anteils und des gebrochenen Anteils.

> [!IMPORTANT] Multiplikation im Dualsystem ist schieben und addieren

## Darstellung negativer Zahlen

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
> 1er Komplement leichter zu nenbilden, schwieriger zu rechnen

### 1er Komplement 1K, r-1

$\overline{N_{r-1}}=r^{n}-1-N_{r}$

### 2er Komplement 2K, r

$\overline{N_{r}}=r^{n}-N_{r}$