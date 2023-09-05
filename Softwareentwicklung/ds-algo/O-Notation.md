---
tags: ["Algorithmus"]
aliases: ["time complexity", "space complexity", "Big-O", "big-O", "Speicherbewertung", "Laufzeitbewertung"]
created: 17th April 2022
---

# Big-[O-Notation](https://de.wikipedia.org/wiki/Landau-Symbole)

Die Effizienz eines Algorithmus wird oft durch die Big-O-Notation ausgedrückt.  
Ein effizienter Algorithmus ist hinsichtlich **Laufzeitbewertung** und **Speicherbewertung** ausbalanciert.

Laufzeitbewertung beschreibt, wie **zeiteffizient** ein Algorithmus ist.  
Speicherbewertung beschreibt, wie **speichereffizient** ein Algorithmus ist.

Unter Speichereffizienz versteht man, wie viel Speicher ein Algorithmus *während* seiner Ausführung verbraucht

## Laufzeitbewertung

Die Laufzeit von Algorithmen kann nicht eindeutig bestimmt werden.  
Sie hängt von vielen allgemeinen Faktoren (Hardware, [Betriebssystem](../Betriebssysteme/{MOC}%20Operating%20Systems.md), Software …) als auch von den speziellen Eigenheiten der Startwerte ab.  
Sortieren eines schon fast fertig sortierten Felds kann zum Beispiel sehr viel schneller ablaufen als ein vollständig durchmischtes Feld.  
Um die Laufzeit unterschiedlicher Algorithmen trotzdem vergleichen zu können wird ihr Zeitverhalten in Abhängigkeit der Anzahl der Elemente betrachtet.

> [!EXAMPLE]  
> Zum Beispiel ist für den [Selection-Sort](Selection%20Sort.md) ersichtlich, dass sich die Sortierzeit mit dem Quadrat der Anzahl der Elemente verändern wird. Dargestellt wird das mittels der **O-Notation (O für Ordnung): der [Selection-Sort](Selection%20Sort.md) hat ein Laufzeitverhalten **$O(n^2)$**, sprich sie hat ein Verhalten *in der Ordnung von $n^2$*.

### Polynom-Laufzeit✅

Ein Algorithmus hat eine Polynom-Laufzeit, wenn er für einen Wert $n$ die Form $n^{k}$ hat.

Big-O Notation$\dots O(n^{k})$

Ein Algorithmus mit der einer Polynom-Laufzeit ist effizient.

- Konstante Zeit: $O(n^{0}) = O(1)$
- Logarithmische Zeit: $O(\log(n))$
- Lineare Zeit: $O(n^{1}) = O(n)$
- Quasilineare Zeit: $O(n\cdot\log(n))$
- Quadratische/Kubische Zeit: $O(n^{2})$, $O(n^{3})$

### Andere Laufzeiten ❌

- Exponentielle Zeit: $O(x^{n})$
- Fakultative Zeit: $O(n!)$

## Speicherbewertung

---

# Tags