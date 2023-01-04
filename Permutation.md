---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 4th January 2023
---

# Permutation
Unter einer **Permutation** versteht man in der [[Kombinatorik]] eine Anordnung von Objekten in einer bestimmten Reihenfolge.

Die Anzahl der Permutationen ohne Wiederholung ergibt sich als [Fakultät](https://de.wikipedia.org/wiki/Fakult%C3%A4t_(Mathematik) "Fakultät (Mathematik)"),
während die Anzahl der Permutationen mit Wiederholung über [Multinomialkoeffizienten](https://de.wikipedia.org/wiki/Multinomialkoeffizient "Multinomialkoeffizient") angegeben wird.

### ohne Wiederholung
![[Pasted image 20230104153716.png]]
Fakultät: 
$$n!$$
```ad-example
title: Wv. Möglichkeiten gibt es, $4$ Schüler auf $4$ Plätze aufzuteilen?
$$
4\cdot3\cdot2\cdot1 = \frac{4!}{(4-4)!} = 4!
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
# Tags