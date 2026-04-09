---
tags: []
aliases: []
subject:
  - mathe
created: 4th January 2023
title: Linearkombination
---

# Kombination

Eine *Kombination* oder *ungeordnete Stichprobe* ist in der [index](index.md) eine Auswahl von Objekten aus einer gegebenen [Ereignisraum](Ereignisraum.md) …

- … die im Gegensatz zur [Permutation](Permutation.md) nicht alle Objekte der [Ereignisraum](Ereignisraum.md) enthalten muss (Stichprobe)
- … bei der im Gegensatz zur [Permutation](Permutation.md) und [Variation](Variation.md) die Reihenfolge unberücksichtigt bleibt


> [!def] **D - BINK)** Binomialkoeffizient ^BINK
>
> Der Binomialkoeffizient berechnet die Anzahl der Möglichkeiten, $k$ Elemente aus einer Menge von $n$ Elementen *ohne Zurücklegen* und *ohne Reihenfolge* auszuwählen.
> 
> $$
> \binom{n}{k} := \frac{n!}{k!(n-k)!}
> $$
> 
> gesprochen: *$n$ über $k$* 


## Ohne Wiederholung

Darf jedes Objekt nur einmal auftreten, spricht man von einer **Kombination ohne Wiederholung**.

>[!summary] $n$ über $k$:  
>
> $$\frac{n \cdot (n - 1) \cdot (n - 2) \cdot \ldots \cdot (n - k + 1)}{k!} = \frac{n!}{(n - k)! \cdot k!} = \binom{n}{n - k} = \binom{n}{k}$$

> [!EXAMPLE] 7 Personen: ABCEFG. Wv Möglchkeiten gibt es, eine 3er Gruppe zu bilden!  
> Keine Person kommt in einer Gruppe doppelt vor, und die Reihenfolge ist unwichtig.  
> ABC, ABE, ABF, BCF …

> [!EXAMPLE] 30 Schüler auf 26 Plätze aufteilen  
> 4 auswählen, die keinen Platz bekommen:  
>
> $$\binom{30}{4} = 27405$$

## Mit Wiederholung

>[!summary] Formel  
>
> $$\binom{n+k-1}{k}$$

# Tags