# 7 Funktionen - Rekursionen - Übungen - Lösungen

##  A01_Add

- Rekursive Addition von zwei ganzen Zahlen. Wie beim Fingerzählen: solange 1 dazuzählen bis Zahl erreicht.
- Pseudocode:
  - Summe = Summand1 + Summand2 = Summand1 + (Summand2-1) + 1
  - Summe von Summand1 + 0 = Summand1

L:

```c
#include <stdio.h>
#include <stdlib.h>

int add(int a, int b);

int main() {
    int x = 31234;
    int y = 50000;

    printf("%d + %d = %d\n", x, y, add(x,y));
    return 0;
}

int add(int a, int b) {
    if (b <= 0) return a;           // Abbruchbedingung
    return a = add(a, b-1) + 1;
}
```

##  A02_Sub

- Rekursive Subtraktion von zwei ganzen Zahlen.
- Pseudocode:
  - Differenz = Minuend - Subtrahend = Minuend - (Subtrahend-1) - 1
  - Differenz von Minuend - 0 = Minuend

##  A03_Mult

- Rekursive Multiplikation von zwei ganzen Zahlen: Multiplikant wird Multiplikator oft miteinander addiert.
- Pseudocode:
  - Produkt = Multiplikant * Multiplikator = Multiplikant * (Multiplikator-1) + Multiplikant
  - Produkt von Multiplikant * 1 = Multiplikant

##  A03_Fakultaet

- Die Fakultät einer Zahl spielt in der Wahrscheinlichkeitsrechnung aber auch in Taylorreihen eine Rolle. Berechne die Fakultät einer ganzen Zahl:
  n! = 1 * 2 * 3 * .... * n
- Pseudocode:
  - Fakultät(n) = Fakultät(n-1) * n
  - Fakultät(1) = 1

##  A05_Fibonacci

- In der Natur gibt es viele Wachstumsgesetze die sich nach einer bestimmten Folge berechnen lassen:
  n = (n-1) + (n-2). Wobei gilt: Fibo(1) = Fibo(2) = 1
- Pseudocode:
  - Fico(n) = (n-1) + (n-2)
  - Fibo(2) = Fibo(1) = 1
