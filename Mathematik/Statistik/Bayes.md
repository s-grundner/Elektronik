---
tags:
aliases:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 27th March 2026
professor:
release: false
title: Bayes
---

# Bayessche Statistik

Mit dem Satz von Bayes lassen sich die Bedingungsreihenfolge der Ereignisse umkehren. Es lässt sich damit *"von der Wirkung auf die Ursache"* schließen.

> [!satz] **S - Satz von Bayes)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$ ^BAYES
> Bilden die Ereignisse $B_{1},B_{2},\ldots, B_{n} \subseteq \Omega$ ein *vollständiges Ereignissystem*[^1], gilt für alle $A \subseteq \Omega$ und alle $j \in \{ 1,2,\dots, n \}$
> 
> $$
> \mathbb{P}(B_{j}|A) = \frac{\mathbb{P}(A|B_{j})\cdot\mathbb{P}(B_{j})}{\sum_{i=1}^{n} \mathbb{P}(A|B_{i})\cdot\mathbb{P}(B_{i})} = \frac{\mathbb{P}(A|B_{j})\cdot\mathbb{P}(B_{j})}{\mathbb{P}(A)}
> $$

## Referenzen

| ![Bayes theorem, the geometry of changing beliefs](https://www.youtube.com/watch?v=HZGCoVF3YvM) | ![The medical test paradox, and redesigning Bayes' rule](https://www.youtube.com/watch?v=lG4VkPoG3ko) |
| - | - |

[^1]: darunter versteht man paarweise disjunkte Ereignisse $B_{1},B_{2},\ldots,B_{n}$ mit positiver Wahrscheinlichkeit, deren Vereinigung gleich $\Omega$ ist