---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 24th October 2022
---

# Kombinatorik
## Produktregel
Vorgang in $k$ Schritten
1. Schritt hat $n_{1}$ möglichkeiten
2. Schritt hat $n_{2}$ möglichkeiten
3. $k$. Schritt hat $n_{k}$ möglichkeiten
Es gibt insgesamt $n_{1}\cdot n_{2}\dots n_{k}$ Möglichkeiten

## Permutationen
Unter einer **Permutation** versteht man in der Kombinatorik eine Anordnung von Objekten in einer bestimmten Reihenfolge.

Die Anzahl der Permutationen ohne Wiederholung ergibt sich als [Fakultät](https://de.wikipedia.org/wiki/Fakult%C3%A4t_(Mathematik) "Fakultät (Mathematik)"), während die Anzahl der Permutationen mit Wiederholung über [Multinomialkoeffizienten](https://de.wikipedia.org/wiki/Multinomialkoeffizient "Multinomialkoeffizient") angegeben wird.

### ohne Wiederholung
Fakultät: 
$$n!$$
```ad-example
title: Wv. Möglichkeiten gibt es, $4$ Schüler auf $4$ Plätze aufzuteilen?
$$
4\cdot3\cdot2\cdot1 = 4!
$$
```

### mit Wiederholung
Multinomialkoeffizient:
$$
n! \choose {k_{1}!,\cdots, k_{n}!}
$$
```ad-example
title: "Teebeutel": Wv. Wörter kann man mit "EEEETTBUL" bilden?
Alle Buchstaben Verschieden, dann: $9!$
$$
\begin{align*}
E_{1}E_{2}E_{3}E_{4}T_{1}T_{2}B_{1}U_{1}L_{1}\\
\frac{9!}{\underbrace{4!}_{E}\cdot\underbrace{2!}_{T}\cdot\underbrace{1!}_{B}\cdot\underbrace{1!}_{U}\cdot\underbrace{1!}_{L}} &= \frac{9!}{4!\cdot 2!} = 7560
\end{align*}
$$
```
## Stichproben
### Geordnet (Variation)

### Ungeordnet (Kombination)
$n$ über $k$:
$$
\frac{n \cdot (n - 1) \cdot (n - 2) \cdot \ldots \cdot (n - k + 1)}{k!} = \frac{n!}{(n - k)! \cdot k!} = \binom{n}{n - k} = \binom{n}{k}
$$
```ad-example
title: 7 Personen: ABCEFG. Wv Möglchkeiten gibt es, eine 3er Gruppe zu bilden!
Keine Person kommt in einer Gruppe doppelt vor, und die Reihenfolge ist unwichtig.
ABC, ABE, ABF, BCF ...

```

# Quellen
![[Kombinatorik-formeln.PNG]]
![[Kombinatorik-formeln.PNG]]

