---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 27th February 2025
professor:
release: false
title: Ereignisraum
---

# Ereignisraum $\Omega$


> [!def] **D)** Ereignisraum $\Omega$ ^DEF
> 
> 1. Die Menge $\Omega$ nennt man den **Ereignisraum** des Zufallsexperiments.
> 2. Teilmengen $A,B,\dots$ von $\Omega$ nennt man **Ereignisse**.
> 3. Ein-Elementige Teilmengen $\{\omega\}$ von $\Omega$ nennt man **Elementarereignisse**.
> 4. Man sagt *"das Ereignis $A$ tritt ein"*, wenn ein Ausgang $\omega$ aus der Menge $A$ realisiert wird.

- [Menge](../Algebra/Mengenlehre.md) aller möglichen [Ereignisse](Ereignis.md) (Ausgänge) $\Omega$
- Anzahl aller möglichen [Ereignisse](Ereignis.md) $|\Omega|$ (Mächtigkeit)

>[!example] 1 Würfel  
> $\Omega = \{1,2,3,4,5,6\}$  
> $|\Omega|= 6$

>[!example] 2 Würfel  
>
> Hier beiten sich unterschiedliche Ereignisräume an, die sich je nach Art des Zufallsexperiment wählen lassen.
> 
> - $\Omega=\{2,\dots,12\}$ ... Augensumme  
> - $\Omega=\{(1,1),(1,2),\dots,(6,6)\}$ ... Würfelkombination ohne Reihenfolge  
> - $\Omega=\{(1,1),(1,2),(2,1),\dots(6,6)\}$ ... Würfelkombination mit Reihenfolge

> [!example] Das Zufallsexperiment besteht im $n$-maligen Werfen einer Münze.
>
> 1. Man gebe einen passenden Ereignisraum $\Omega$ für dieses Zufallsexperiment an.
> 2. Man beschreibe das Ereignis *"es wird maximal $m$ mal Kopf geworfen"* als Teilmenge von $\Omega$.
> 
> > [!success]- 
> > 1. $\Omega = \{ \{ x_{1}, x_{2},\dots,x_{n} \} | x_{1},x_{2},\dots,x_{n} \in \{ 0,1 \} \}$
> > 2. $A = \left\{  \{  x_{1}, x_{2},\dots,x_{n} \} \in \Omega | \sum_{i=1}^{n} x_{i} \leq m \right\}$

> [!example] 

## Häufigkeit

sei $\omega\in\Omega$ (ein Ausgang)  
$n$ Versuche

### Absolute Häufigkeit

- $H(\omega)$ … Anzahl des Auftretens von $\omega$
- $\sum\limits_{\omega\in\Omega}H(\omega)=n$

### Relative Häufigkeit

- $h(\omega)=\dfrac{H(\omega)}{n}$
- $\sum\limits_{\omega\in\Omega}h(\omega)=1$

#### Das empirische Gesetz der großen Zahlen

Die Folge der relativen Häufigkeit zeigt ein konvergentes Verhalten

# Tags

- [Wahrscheinlichkeit](Wahrscheinlichkeit.md)