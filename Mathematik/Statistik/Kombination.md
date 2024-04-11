---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 4th January 2023
---

# Kombination

Eine *Kombination* oder *ungeordnete Stichprobe* ist in der [Kombinatorik](Kombinatorik.md) eine Auswahl von Objekten aus einer gegebenen [Grundmenge](Grundmenge.md) …
- … die im Gegensatz zur [Permutation](Permutation.md) nicht alle Objekte der [Grundmenge](Grundmenge.md) enthalten muss (Stichprobe)
- … bei der im Gegensatz zur [Permutation](Permutation.md) und [Variation](Variation.md) die Reihenfolge unberücksichtigt bleibt

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

> [](Kombinatorik.md#Produktregel)  
>
> $$\binom{30}{4}\cdot 26!$$

## Mit Wiederholung

>[!summary] Formel  
>
> $$\binom{n+k-1}{k}$$

# Tags