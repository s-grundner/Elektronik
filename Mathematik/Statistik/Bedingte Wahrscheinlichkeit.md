---
tags:
aliases:
  - Satz von Bayes
keywords:
subject:
  - VL
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 10th February 2026
professor:
release: false
title: Bedingte Wahrscheinlichkeit
---

# Bedingte Wahrscheinlichkeit

> [!question] [Unbedingte Wahrscheinlichkeit](Mathematik/Statistik/Wahrscheinlichkeit.md)

Oft hat man es mit einem Zufallsexperiment zu tun, wobei man über die zusätzliche Information *"ein gewisses Ereignis $\Omega'$ ist bereits eingetreten"* verfügt. 

> [!example] **Beispiel:** In einer Urne befinden sich zwei rote und drei schwarze Kugeln.
> - Es werden nacheinander zwei Kugeln gezogen, wobei die zuerst gezogene Kugel nicht zurückgelegt wird.
> - Wie groß ist die Wahrscheinlichkeit dafür, dass mindestens eine der beiden Kugeln schwarz ist, wenn bekannt ist, dass die zuerst gezogene Kugel rot war?
> 
> > [!success]- Lösung
> > Wir nehmen an, dass die Kugeln nummeriert sind und dabei die beiden roten Kugeln die Nummern $1,2$ und die drei schwarzen Kugeln die Nummern $3,4,5$ tragen.
> > 
> > **Ohne Berücksichtigung der Zusatzinformation** *"die zuerst gezogene Kugel ist rot"* lässt sich dieses zweimalige Ziehen ohne Zurücklegen durch den Ereignisraum
> > 
> > $$ 
> > \Omega = \{ \{ x_{1}, x_{2} \} |x_{1},x_{2} \in \{ 1,2,3,4,5 \}; x_{1} \neq x_{2} \}
> > $$


Man könnte nun ein Zufallsexperiment, über das die zusätzliche Information *"ein gewisses Ereignis $\Omega'$ ist eingetreten"* zur Verfügung steht, als neues Zufallsexperiment mit  $\Omega'$ als Ereignisraum auffassen und in der üblichen Weise behandeln. Am eben vorgeführten Beispiels erkennt man aber, dass

$$
\begin{align}
\mathbb{P}'[A'] &= \frac{|A'|}{|\Omega'|} = \frac{|A \cap \Omega'|}{|\Omega'|} &\color{grey}\Bigg| \cdot \frac{|\Omega|}{|\Omega|} \\
&= \frac{|A \cap \Omega'|}{|\Omega|} \cdot \frac{|\Omega|}{|\Omega'|}  = \frac{\mathbb{P}(A \cap \Omega')}{\mathbb{P}(\Omega')}
\end{align}
$$

gilt, dass sich also die **bedingte Wahrscheinlichkeit** $\mathbb{P'}(A')$ eines Ereignisses unter der Bedingung, dass das Ereignis $\Omega'$ bereits eingetreten ist, in einfacher Weise durch die **unbedingten Wahrscheinlichkeiten** $\mathbb{P}(A \cap \Omega')$ und $\mathbb{P}(\Omega')$ ausdrücken lässt. Man definiert daher

> [!def] **D)** Bedingte Wahrscheinlichkeit $\mathbb{P}(A|\Omega')$
> Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$ und sei $\Omega' \subseteq \Omega$ ein Ereignis mit positiver Wahrscheinlichkeit. Für jedes Ereignis $A \subseteq\Omega$ heißt die Zahl
> 
> $$
> \mathbb{P}(A|\Omega') := \frac{\mathbb{P}(A \cap \Omega')}{\mathbb{P}(\Omega')}
> $$
> 
> die **bedingte Wahrscheinlichkeit** von $A$ unter $\Omega'$.

![](_assets/Pasted%20image%2020260210215710.png)

## Rechnen mit Bedingten Wahrscheinlichkeiten

### Addition 

Gleich wie [Additionsregel](Mathematik/Statistik/Wahrscheinlichkeit.md#Additionsregel).

### Multiplikationssatz

Die Wahrscheinlichkeit, dass die beliebigen Ereignisse $A$ **und** $B \in\Omega$ **gemeinsam** auftreten ist gegeben durch

$$
\mathbb{P}(A \cap B) = \mathbb{P}(A) \cdot \mathbb{P}(B|A) = \mathbb{P}(B) \cdot \mathbb{P}(A|B)
$$

> [!satz] **S - Multiplikationssatz)**  Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> Für beleibeige Ereignisse $A_{1},A_{2},\dots, A_{n+1} \subseteq \Omega$ mit $\mathbb{P}(A_{1}\cap A_{2} \cap \ldots \cap A_{n}) > 0$ die **gemeinsam** Auftreten gilt
> 
> $$
> \mathbb{P}(A_1\cap A_2\cap \ldots \cap A_{n+1})=\mathbb{P}(A_1)\cdot\mathbb{P}(A_2|A_1)\cdot \ldots \cdot\mathbb{P}(A_{n+1}|A_1\cap A_2\cap\ldots \cap A_n)
> $$

### Satz von der totalen Wahrscheinlichkeit

Der Satz der totalen Wahrscheinlichkeit beschreibt, wie eine bestimmte *Wirkung*  $A$ durch bestimmte (disjunkte) *Ursachen* $B_{1}$ bis $B_{n}$ verursacht wird.

> [!satz] **S - Totale Wahrscheinlichkeit)**  Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$.
> Bilden die Ereignisse $B_{1},B_{2},\ldots, B_{n} \subseteq \Omega$ ein *vollständiges Ereignissystem*[^1], gilt für alle $A \subseteq \Omega$
> 
> $$
> \mathbb{P}(A) = \sum_{i=1}^{n} \mathbb{P}(A|B_{i})\,\mathbb{P}(B_{i})
> $$

Veranschaulichung:

- Vom Punkt $X$ nach $Y$ stehen $n$ mögliche Wege über die Punkte $B_{1},B_{2},\ldots,B_{n}$ zur Verfügung.
- Die Wahrscheinlichkeit des Weges vom Punkt $X$ über $B_{i}$ nach $Y$ ist gleich dem Produkt der Wahrscheinlichkeiten $\mathbb{P}(B_{i})$ und $\mathbb{P}(A|B_{i})$
- Die Wahrscheinlichkeit des Weges vom Punkt $X$ nach $Y$ ist gleich der Summe der Wahrscheinlichkeiten aller möglichen Wege

![invert_dark](_assets/Pasted%20image%2020260210224427.png)

### Satz von Bayes

Mit dem Satz von Bayes lassen sich die Bedingungsreihenfolge der Ereignisse umkehren. Es lässt sich damit *"von der Wirkung auf die Ursache"* schließen.

> [!satz] **S - Satz von Bayes)** Sei $\mathbb{P}$ ein W-Maß auf dem Ereignisraum $\Omega$
> Bilden die Ereignisse $B_{1},B_{2},\ldots, B_{n} \subseteq \Omega$ ein *vollständiges Ereignissystem*[^1], gilt für alle $A \subseteq \Omega$ und alle $j \in \{ 1,2,\dots, n \}$
> 
> $$
> \mathbb{P}(B_{j}|A) = \frac{\mathbb{P}(A|B_{j})\cdot\mathbb{P}(B_{j})}{\sum_{i=1}^{n} \mathbb{P}(A|B_{i})\cdot\mathbb{P}(B_{i})} = \frac{\mathbb{P}(A|B_{j})\cdot\mathbb{P}(B_{j})}{\mathbb{P}(A)}
> $$


## Referenzen

[Bedingte Wahrscheinlichkeit - Dimitry Efrosinin](xEDU/B5_WS25/WuSP/10_Bedingte_Wahrscheinlichkeit.nb)

[^1]: darunter versteht man paarweise disjunkte Ereignisse $B_{1},B_{2},\ldots,B_{n}$ mit positiver Wahrscheinlichkeit, deren Vereinigung gleich $\Omega$ ist
