---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 4th January 2023
---

# Kombination
Eine *Kombination* oder *ungeordnete Stichprobe* ist in der [[Kombinatorik]] eine Auswahl von Objekten aus einer gegebenen Grundmenge …
- … die im Gegensatz zur [[Permutation]] nicht alle Objekte der Grundmenge enthalten muss (Stichprobe)
- … bei der im Gegensatz zur [[Permutation]] und [[Variation]] die Reihenfolge unberücksichtigt bleibt
## ohne Wiederholung
Darf jedes Objekt nur einmal auftreten, spricht man von einer **Kombination ohne Wiederholung**.
$n$ über $k$:
$$
\frac{n \cdot (n - 1) \cdot (n - 2) \cdot \ldots \cdot (n - k + 1)}{k!} = \frac{n!}{(n - k)! \cdot k!} = \binom{n}{n - k} = \binom{n}{k}
$$
```ad-example
title: 7 Personen: ABCEFG. Wv Möglchkeiten gibt es, eine 3er Gruppe zu bilden!
Keine Person kommt in einer Gruppe doppelt vor, und die Reihenfolge ist unwichtig.
ABC, ABE, ABF, BCF ...

```

```ad-example
title: 30 Schüler auf 26 Plätze aufteilen
4 auswählen, die keinen Platz bekommen:
$$\binom{30}{4} = 27405$$
[[Kombinatorik#Produktregel]]
$$\binom{30}{4}\cdot 26!$$
```

## mit Wiederholung
# Tags