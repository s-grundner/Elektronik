---
tags: ["ds-algo"]
aliases: ["time complexity", "space complexity", "Big-O", "big-O", "Speicherbewertung", "Laufzeitbewertung"]
subject: ["null"]
source: ["null"]
created: 17th April 2022
---

# Big-[O-Notation](https://de.wikipedia.org/wiki/Landau-Symbole)

The efficiency of an algorithm is often Expressed through the Big-O Notation.
An efficient algorithm is balanced in **time-complexity** and **space-complexity**

Time-complexity describes, how **time-efficient** an algorithm is.
Space-complexity describes, how **memory-efficient** an algorithm is.

Memory-efficiency is described as how much memory an algorithm is consuming *during* its operation.

## Laufzeitbewertung

Die Laufzeit von Algorithmen kann nicht eindeutig bestimmt werden.
Sie hängt von vielen allgemeinen Faktoren (Hardware, Betriebssystem, Software ...) als auch von den speziellen Eigenheiten der Startwerte ab.
Sortieren eines schon fast fertig sortierten Felds kann zum Beispiel sehr viel schneller ablaufen als ein vollständig durchmischtes Feld.
Um die Laufzeit unterschiedlicher Algorithmen trotzdem vergleichen zu können wird ihr Zeitverhalten in Abhängigkeit der Anzahl der Elemente betrachtet.
Zum Beispiel ist für den oben erwähnten Selection-Sort ersichtlich, dass sich die Sortierzeit mit dem Quadrat der Anzahl der Elemente verändern wird. Dargestellt wird das mittels der **[O-Notation](../ds-algo/O-Notation.md)** (O für Ordnung): der Selection-Sort hat ein Laufzeitverhalten **$O(n^2)$**, sprich sie hat ein Verhalten *in der Ordnung von $n^2$*.
### Polynomial Runtimes✅
An Algorithm is considered to have a **Polynomial Runtime**, if, for a given value of $n$, is in the **Form of $n^{k}$**.

Big-O Notation$\dots O(n^{k})$

A polynomial runtime is considered efficient.
#### Constant Time
$O(n^{0}) = O(1)$
#### Logarithmic Time
$O(\log(n))$
#### Linear Time
$O(n^{1}) = O(n)$
#### Quasilinear Time
$O(n\cdot\log(n))$
#### Quad/Cubed Time
$O(n^{2})$
$O(n^{3})$
### Other Runtimes ❌
#### Exponential Time
$O(x^{n})$
#### Fractorial/Combinatorial Time
$O(n!)$

## Memory


---
# Tags
