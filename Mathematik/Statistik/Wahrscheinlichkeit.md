---
tags:
aliases:
  - Unbedingte Wahrscheinlichkeit
keywords:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
  - Übertragungstechnik
semester: WS25
created: 27th February 2025
professor:
  - Dmitry Efrosinin
release: false
title: Wahrscheinlichkeit
---

# Wahrscheinlichkeit

Die Wahrscheinlichkeit $\mathbb{P}(A)$ eines Ereignisses $A$ in einem Zufallsexperiment, ist ein Maß für die Tendenz, das dieses Ereignis eintritt.

> [!def] **D)** Wahrscheinlichkeitsmaß (W-Maß) $\mathbb{P}$
> Eine Abbildung $\mathbb{P}$, welche jedem Ereignis $A \subseteq \Omega$ eine Zahl $\mathbb{P}(A) \in \mathbb{R}$ zuordnet und dabei die drei Eigenschaften
> 1. $\mathbb{P}(\Omega)=1$
> 2. für alle Ereignisse $A\subseteq\Omega$ ist $\mathbb{P}(A)\geq 0$
> 3. für endlich oder abzählbar unendlich viele paarweise disjunkte[^1] Ereignisse $A_{1},A_{2},\dots \subseteq \Omega$ gilt
>  
> $$
> \mathbb{P}(A_{1} \cup A_{2} \cup \dots) = \mathbb{P}(A_{1}) + \mathbb{P}(A_{2}) + \dots
> $$
> 
> besitzt, nennt man ein **Wahrscheinlichkeitsmaß** (kurz W-Maß) auf dem Ereignisraum $\Omega$.

> [!quote]-  Dieser Begriffsbildung sind einige Bemerkungen angebracht
> 
> - Falls es sich bei der Menge $\Omega$ um eine endliche oder abzählbare Menge handelt, bereitet diese Definition wenes W-Maßes als Abbildung $\mathbb{P}:\mathcal{P}(\Omega)\to\mathbb{R}$ von der Potenzmenge $\mathcal{P}(\Omega)$ von $\Omega$ in $\mathbb{R}$ keine Probleme
> - Ist jedoch $\Omega$ eine überabzählbare Menge (etwa $\Omega=[0,1]$, $\Omega=\mathbb{R}$ oder $\Omega = \{ 0,1 \}^{\mathbb{N}}$), so existieren nur triviale Abbildungen $\mathbb{P}:\mathcal{P}(\Omega)\to\mathbb{R}$ von der Potenzmenge $\mathcal{P}(\Omega)$ von $\Omega$ in $\mathbb{R}$ mit diesen drei Eigenschaften.
> - Diese Problematik lässt sich dadurch beheben, indem man nicht versucht, allen Teilmengen $A \subseteq \Omega$ in sinnvoller Weise eine Wahrscheinlichkeit $\mathbb{P}(A)$ zuzuordnen, sondern **nur jenen** Ereignissen $A \subseteq \Omega$, für die man sich tatsächlich interessiert. 
> 
> Bei diesem System der interessierenden Ereignisse $\mathcal{A}$ handelt es sich um eine **Sigma Algebra**, also um eine Teilmenge $\mathcal{A}$ der Potenzmenge $\mathcal{P}(\Omega)$ von mit den drei Eigenschaften
> 
> - $\Omega \in \mathcal{A}$
> - mit $A,B \in \mathcal{A}$ ist auch $A-B\in\mathcal{A}$
> - mit $A_{1},A_{2},\ldots \in \mathcal{A}$ ist auch $A_{1} \cup A_{1} \cup \ldots \in \mathcal{A}$

## Rechnen mit Wahrscheinlichkeiten

> [!hint] Dieses Rechenregeln gelten nur für **unabhängige Ereignisse** (disjunkte Ereignisse[^1]). Für abhängige Ereignisse, siehe [bedingte Wahrscheinlichkeit](Bedingte%20Wahrscheinlichkeit.md).

### Additionsregel
 
Die Wahrscheinlichkeit, dass die unabhängigen Ereignisse $A$ **oder** $B \in\Omega$  auftreten, ist gegeben durch

$$
\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B)
$$

> [!satz] **S - Additionssatz)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> 
> Die Wahrscheinlichkeit, dass **mindestens** eines von $n$ disjunkten Ereignissen $A_{1},A_{2},\ldots,A_{n}\in\Omega$ auftritt, ist gegeben durch
> 
> $$
> \mathbb{P} \left( \bigcup_{i=1}^{n} A_{i} \right) = \sum_{i=1}^{n} \mathbb{P}(A_{i})
> $$

### Multiplikationsregel

Die Wahrscheinlichkeit dass die unabhängigen Ereignisse $A$ **und** $B \in\Omega$ gleichzeitig auftreten

$$
\mathbb{P}(A \cap B) = \mathbb{P}(A) \cdot \mathbb{P}(B)
$$

> [!satz] **S - Multiplikationssatz)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> 
> Die Wahrscheinlichkeit für das **gemeinsame** Auftreten von $n$ disjunkten Ereignissen $A_{1},A_{2},\ldots,A_{n}\in\Omega$ ist
> 
> $$
> \mathbb{P} \left( \bigcap_{i=1}^{n} A_{i} \right) = \prod_{i=1}^{n} \mathbb{P}(A_{i})
> $$

## Referenzen

[Zufallsexperimente - Dimitry Efrosinin](../../xEDU/B5_WS25/WuSP/02_Zufallsexperimente.nb)

[^1]: Disjunkte Eregnisse $\iff$ **unabhängige Ereignisse** $\iff A \cap B = \{ \}$
