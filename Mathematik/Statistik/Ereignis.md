---
tags:
aliases:
  - i.i.d.
  - independent and identically distributed
keywords:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 27th February 2025
professor:
release: false
title: Ereignis
---

# Ereignis $E$

Oft interessiert uns nicht für die [Unbedingte Wahrscheinlichkeit](Unbedingte%20Wahrscheinlichkeit.md) eines einzelnen $\omega\in\Omega$, sondern alle $\omega$ mit bestimmten Eigenschaften  
Das Ereignis $A$ ist eine Teilmenge der [Ereignisraum](Ereignisraum.md) $\Omega$

## Unabhängige Ereignisse

> [!question] i.i.d. (idependent and identically distributed), disjunkte Ereignisse

Für zwei unabhängige Ereignisse bedeuted, dass das vorherige Eintreten des einen Ereignisses $B$ keinen Einfluss auf das andere $A$ hat, was gleichzusetzen ist mit:

$$
\mathbb{P}(A) = \mathbb{P}(A|B) = \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)} \iff \mathbb{P}(A \cap B) = \mathbb{P}(A) \cdot \mathbb{P}(B)
$$

> [Bedingte Wahrscheinlichkeit](Bedingte%20Wahrscheinlichkeit.md)

> [!def] **D)** Sin $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> 1. Die beiden Ereignisse $A,B \subseteq\Omega$ heißen **unabhängig**, falls gilt
> 
> $$
> \mathbb{P}(A \cap B) = \mathbb{P}(A)\cdot \mathbb{P}(B) 
> $$
> 
> 2. Die Ereignisse $A_{1},A_{2},\dots \subseteq\Omega$ heißen **paarweise unabhängig**, falls für alle $i \neq k$ gilt
> 
> $$
> \mathbb{P}(A_{i} \cap A_{k}) = \mathbb{P}(A_{i})\cdot \mathbb{P}(A_{k}) 
> $$
> 
> 3. Die Ereignisse $A_{1},A_{2},\dots\subseteq\Omega$ heißen **vollständig unabhängig**, falls für jede Auswahl von $k$ paarweise verschiedenen Ereignissen $A_{1},A_{2},\dots A_{k}$ gilt
> 
> $$
> \mathbb{P}(A_{1} \cap A_{2} \cap \ldots \cap A_{k}) = \mathbb{P}(A_{1})\cdot \mathbb{P}(A_{2}) \cdot \ldots \cdot \mathbb{P}(A_{k})
> $$

### Sätze zu unabhängigen Ereignissen

> [!satz] **S - Ersetzen von Ereignissen durch ihr Komplement)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> Sind die Ereignisse $A_{1},A_{2},\dots\subseteq \Omega$ paarweise bzw. vollständig unabhängig, und ersetzt man einige dieser Ereignisse $A_{i}$ durch ihr Komplement $A^{C}_{i}$, so bleibt ihre paarweise bzw. vollständige **Unabhängigkeit erhalten**.

> [!satz] **S - Siebformel von Silvester)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> Sind die Ereignisse $A_{1},A_{2},\dots,A_{n}\subseteq \Omega$ vollständig unabhängig, gilt
> $$
> \mathbb{P}(A_{1} \cup A_{2} \cup \dots \cup A_{n}) = 1-(1-\mathbb{P}(A_{1}))\cdot(1-\mathbb{P}(A_{2}))\cdot\ldots\cdot(1-\mathbb{P}(A_{n}))
> $$

# Tags

[Unbedingte Wahrscheinlichkeit](Unbedingte%20Wahrscheinlichkeit.md)