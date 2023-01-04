---
tags: ["Statistik"]
aliases: ["WSK"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 4th October 2022
---

# Wahrscheinlichkeit $P(\omega)$
![[Pasted image 20221211123853.png|750]]
Unter der Wahrscheinlichkeit $P(\omega)$ (Probabilität) eines Ausgang eines Zufallsexperiments verstehen wir den Grenzwert der Folge $\langle h(\omega)\rangle$.

>[!summary] $$P(\omega)=\lim_{h\rightarrow\infty}\langle h_{n}(\omega)\rangle$$

> [!example] Würfel: $P(1)=\dfrac{1}{6}$

Ein Zufallsexperiment ist gekennzeichnet durch:
- gleiche Ausgangsbedingungen
- unsicheren Ausgang
- beliebig wiederholbar

>[!example] Beispiele
> - Würfeln mit einem Würfel
> - ein Los ziehen
> - eine Münze werfen

## Ereignis $E$
Oft interessiert uns nicht für die Wahrscheinlichkeit eines einzelnen $\omega\in\Omega$, sondern alle $\omega$ mit bestimmten Eigenschaften
Das Ereignis $E$ ist eine Teilmenge der Grundmenge $\Omega$

>[!example] Roulette - Ereignis mit allen geraden Zahlen: $E=\{2;4;\dots;36\}$

## Wahrscheinlichkeitsfunktion
$P: \Omega\in\mathbb{R}\qquad$ (eigentlich $\rightarrow[0;1]$)

> [!summary] $$\sum\limits_{\omega\in\Omega}P(\omega)=1$$

### Laplace Experiment (Laplace Modell)
- Ein **[Laplace Experiment](https://studyflix.de/statistik/laplace-experiment-1109)** ist ein Zufallsexperiment, bei dem alle Elementarereignisse gleichwahrscheinlich sind.
- Typische Beispiele sind hier auch der Münzwurf oder ein Würfelwurf.

Ein Fall der häufig vorkommt: $P(\omega_{1})=P(\omega_{2})=\dots=P(\omega_{n})\qquad\forall\omega\in\Omega$

>[!summary] $P(\omega_{i})=\dfrac{1}{|\Omega|}$
>mit
> - $P(\omega_{i})\dots$ die Wahrscheinlichkeit des Ereignis $\omega$
> - $|\Omega|\dots$ die Anzahl der möglichen Ergebnisse 

>[!summary] $P(E)=\dfrac{E}{|\Omega|}$
> mit:
> - $P(E)\dots$ die Wahrscheinlichkeit eines Ereignisses
> - $E\dots$ die Anzahl der günstigen Ergebnisse
> - $|\Omega|\dots$ die Anzahl der möglichen Ergebnisse 

> [!example] $E$ … gerade Zahl beim Roulette: $\dfrac{18}{36}$
 
## Rechnen mit Wahrscheinlichkeiten
Zwei Ereignisse heißen ausschließlich oder unvereinbar, wenn sie nicht gemeinsam auftreten können.

>[!summary] Wenn die Ereignisse $E$ & $F$ unvereinbar sind, dann gilt
>$P(E\wedge F)=P(E)+P(F)$

>[!summary] Sei $E^C$ das Gegenereignis zu $E$, dann gilt:
> $P(E^C)=1-P(E)$

![[UEB-rechnen-wsk.png]]


>[!example] gerade & ungerade Zahl beim Roulette
> $P(gerade) = 1-P(ungerade)$

 >[!example] 26 Schüler: 2 haben den selben Geburtstag
> $P(\text{min. 2 den selben Geb.}) = 1-P(\text{es gibt keine 2 mit selben Geb.})$
> 
> $\dfrac{364}{365}\cdot\dfrac{364}{365}\cdot\dfrac{363}{365}\dots\dfrac{340}{365} = \dfrac{365!}{365^{26}\cdot339!}=0.4$
> 
> $1-0.4=0.6$

# Tags
[[Einführung in die Wahrscheinlichkeitsrechnung]]

[[Bedingte Wahrscheinlichkeit]]

https://studyflix.de/statistik/wahrscheinlichkeit-1932