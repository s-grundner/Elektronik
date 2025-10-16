---
tags:
aliases:
keywords:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
  - Übertragungstechnik
semester: WS25
created: 27th February 2025
professor:
release: false
title: Wahrscheinlichkeit
---

# Wahrscheinlichkeit $P(\omega)$

Unter der Wahrscheinlichkeit $P(\omega)$ (Probabilität) eines Ausgang eines Zufallsexperiments verstehen wir den [Grenzwert](Grenzwert.md) der Folge $\langle h(\omega)\rangle$.

>[!summary] $$P(\omega)=\lim_{h\rightarrow\infty}\langle h_{n}(\omega)\rangle$$

> [!EXAMPLE] Würfel: $P(1)=\dfrac{1}{6}$

Ein Zufallsexperiment ist gekennzeichnet durch:
- gleiche Ausgangsbedingungen
- unsicheren Ausgang
- beliebig wiederholbar

>[!EXAMPLE] Beispiele
> - Würfeln mit einem Würfel
> - ein Los ziehen
> - eine Münze werfen

## Wahrscheinlichkeitsfunktion

[Ereignisraum](Ereignisraum.md) $\Omega$:  
$P: \Omega\in\mathbb{R}\qquad$ (eigentlich $\rightarrow[0;1]$)

> [!summary] $$\sum\limits_{\omega\in\Omega}P(\omega)=1$$


## Rechnen mit Wahrscheinlichkeiten

### Bedingte Wahrscheinlichkeit $P(A|B)$

Ist $P(B)\neq 0$, so heißt der Wert $P(A|B) = \dfrac{P(A\wedge B)}{P(B)}$ die Wahrscheinlichkeit von $A$, unter der Bedingung, dass $B$ eintritt.
- Die bedingte Wahrscheinlichkeit $A$ unter der Bedingung $B$

### Additionssatz (ODER-Regel)

> [!summary] für beliebige [Ereignisse](Ereignis.md)  
> $$P(A\vee B) = P(A) + P(B) - P(A\wedge B)$$

>[!summary] für [](Ereignis.md#Unvereinbare%20Ereignisse|unvereinbare%20Ereignisse)  
> $$P(A\vee B) = P(A) + P(B) - 0$$

### Multiplikationssatz (UND-Regel)

>[!summary] für beliebige [Ereignisse](Ereignis.md)  
> $P(A\wedge B)=P(A)\cdot P(B|A)$
> - $P(B|A) = P\dfrac{A\wedge B}{P(A)}$
> - $P(A|B) = P\dfrac{A\wedge B}{P(B)}$

>[!summary] für [](Ereignis.md#Unabhängige%20Ereignisse|unabhängige%20Ereignisse)  
> $P(A\wedge B)=P(A)\cdot P(B)$

## Gegenereignis

>[!summary] [Wahrscheinlichkeit](Wahrscheinlichkeit.md) für das Gegenereignis von $A$:  
> $P(\overline{A})=1-P(A)$

öfter ergeben sich Rechenvorteile bei Fragestellungen mit "mindestens" oder auch "höchstens", wenn man zuerst die [Wahrscheinlichkeit](Wahrscheinlichkeit.md) des Gegenereignisses ermittelt.  
So gilt: Mindestens eines = nicht keines

>[!EXAMPLE] gerade & ungerade Zahl beim Roulette  
> $P(gerade) = 1-P(ungerade)$

 >[!EXAMPLE] 26 Schüler: 2 haben den selben Geburtstag  
> $P(\text{min. 2 den selben Geb.}) = 1-P(\text{es gibt keine 2 mit selben Geb.})$
> 
> $\dfrac{365}{365}\cdot\dfrac{364}{365}\cdot\dfrac{363}{365}\dots\dfrac{340}{365} = \dfrac{365!}{365^{26}\cdot339!}=0.4$
> 
> $1-0.4=0.6$

## Mehrstufige Zufallsvorgänge

- Ein **zusammengesetzter Zufallsvorgang** lässt sich oft in eine Folge von einfacheren Zufallsvorgängen zerlegen.
- Man spricht dann von einem **mehrstufigen Zufallsvorgang**.
- Kann durch ein sogenanntes Baumdiagramm veranschaulicht werden.
- Durch ein Baumdiagramm auch die Berechnung von Wahrscheinlichkeiten erheblich erleichtert werden.  

### Pfadregeln

![Pasted image 20230108013030](Pasted%20image%2020230108013030.png)

![Pasted image 20230108013044](Pasted%20image%2020230108013044.png)

![invert_light](Pasted%20image%2020230108013054.png)

# Tags

| ![Pasted image 20221211123853](../assets/Pasted%20image%2020221211123853.png) | ![UEB-rechnen-wsk](../assets/UEB-rechnen-wsk.png) |  
| ------------------------------------ | ------------------------ |

[Ereignisraum](Ereignisraum.md)  
[Ereignis](Ereignis.md)  
<https://studyflix.de/statistik/wahrscheinlichkeit-1932>
