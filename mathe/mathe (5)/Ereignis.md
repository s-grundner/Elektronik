---
tags: []
aliases: ["Ereignisse"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 8th January 2023
---

# Ereignis $E$
Oft interessiert uns nicht für die [[Wahrscheinlichkeit]] eines einzelnen $\omega\in\Omega$, sondern alle $\omega$ mit bestimmten Eigenschaften
Das Ereignis $E$ ist eine Teilmenge der Grundmenge $\Omega$

>[!example] Roulette - Ereignis mit allen geraden Zahlen: $E=\{2;4;\dots;36\}$

## Unvereinbare Ereignisse

![[Pasted image 20230107220855.png]]

>[!summary] Wenn die Ereignisse $A$ & $B$ unvereinbar sind, dann gilt
>$P(A\vee B)=P(A)+P(B)$
>$P(A\wedge B)=0$
>

> [!example] Zweimaliges Werfen eines Würfels
> - $A$: Beim ersten Wurf "6" werfen;
> - $B$: beim ersten Wurf eine ungerade Augenzahl werfen;
> - $C$: beim zweiten Wurf "6" werfen;
> 
> $A$ ist unvereinbar mit $B\rightarrow$ man kann nicht zugleich "6" und dabei eine ungerade Augenzahl werfen.
> $A$ ist mit $C$ vereinbar
> $B$ ist mit $C$ vereinbar

## Unabhängige Ereignisse
![[Pasted image 20230108002929.png]]

## Gegenereignis

>[!summary] Sei $E^C$ das Gegenereignis zu $E$, dann gilt:
> $P(E^C)=1-P(E)$

>[!example] gerade & ungerade Zahl beim Roulette
> $P(gerade) = 1-P(ungerade)$

 >[!example] 26 Schüler: 2 haben den selben Geburtstag
> $P(\text{min. 2 den selben Geb.}) = 1-P(\text{es gibt keine 2 mit selben Geb.})$
> 
> $\dfrac{365}{365}\cdot\dfrac{364}{365}\cdot\dfrac{363}{365}\dots\dfrac{340}{365} = \dfrac{365!}{365^{26}\cdot339!}=0.4$
> 
> $1-0.4=0.6$

# Tags
[[Wahrscheinlichkeit]]