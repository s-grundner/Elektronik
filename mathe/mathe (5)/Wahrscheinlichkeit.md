---
tags: ["Statistik"]
aliases: ["WSK"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 4th October 2022
---

# Wahrscheinlichkeit $P(\omega)$
Unter der Wahrscheinlichkeit $P(\omega)$ (Probabilität) eines Ausgang eines Zufallsexperiments verstehen wir den [[Grenzwert]] der Folge $\langle h(\omega)\rangle$.

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

## Wahrscheinlichkeitsfunktion#
[[Grundmenge]] $\Omega$:
$P: \Omega\in\mathbb{R}\qquad$ (eigentlich $\rightarrow[0;1]$)

> [!summary] $$\sum\limits_{\omega\in\Omega}P(\omega)=1$$

### Laplace Experiment (Laplace Modell)
- Ein **[Laplace Experiment](https://studyflix.de/statistik/laplace-experiment-1109)** ist ein Zufallsexperiment, bei dem alle [[Ereignis|Elementarereignisse]] gleichwahrscheinlich sind.
- Typische Beispiele sind hier auch der Münzwurf oder ein Würfelwurf.

Ein Fall der häufig vorkommt: $P(\omega_{1})=P(\omega_{2})=\dots=P(\omega_{n})\qquad\forall\omega\in\Omega$

>[!summary] $P(\omega_{i})=\dfrac{1}{|\Omega|}$
>mit
> - $P(\omega_{i})\dots$ die Wahrscheinlichkeit des [[Ereignis]] $\omega$
> - $|\Omega|\dots$ die Anzahl der möglichen [[Ereignis|Ereignisse]]

>[!summary] $P(E)=\dfrac{E}{|\Omega|}$
> mit:
> - $P(E)\dots$ die Wahrscheinlichkeit eines [[Ereignis]]
> - $E\dots$ die Anzahl der günstigen [[Ereignis|Ereignisse]]
> - $|\Omega|\dots$ die Anzahl der möglichen [[Ereignis|Ereignisse]] 

> [!example] $E$ … gerade Zahl beim Roulette: $\dfrac{18}{36}$

## Rechnen mit Wahrscheinlichkeiten
### Bedingte Wahrscheinlichkeit $P(A|B)$
Ist $P(B)\neq 0$, so heißt der Wert  $P(A|B) = \dfrac{P(A\wedge B)}{P(B)}$ die Wahrscheinlichkeit von $A$, unter der Bedingung, dass $B$ eintritt.
- Die bedingte Wahrscheinlichkeit $A$ unter der Bedingung $B$

### Additionssatz (ODER-Regel)

> [!summary] für beliebige [[Ereignis|Ereignisse]]
> $$P(A\vee B) = P(A) + P(B) - P(A\wedge B)$$

>[!summary] für [[Ereignis#Unvereinbare Ereignisse|unvereinbare Ereignisse]]
> $$P(A\vee B) = P(A) + P(B) - 0$$

### Multiplikationssatz (UND-Regel)

>[!summary] für beliebige [[Ereignis|Ereignisse]]
> $P(A\wedge B)=P(A)\cdot P(B|A)$
> - $P(B|A) = P\dfrac{A\wedge B}{P(A)}$
> - $P(A|B) = P\dfrac{A\wedge B}{P(B)}$

>[!summary] für [[Ereignis#Unabhängige Ereignisse|unabhängige Ereignisse]]
> $P(A\wedge B)=P(A)\cdot P(B)$


## Mehrstufige Zufallsvorgänge
- Ein **zusammengesetzter Zufallsvorgang** lässt sich oft in eine Folge von einfacheren Zufallsvorgängen zerlegen.
- Man spricht dann von einem **mehrstufigen Zufallsvorgang**.
- Kann durch ein sogenanntes Baumdiagramm veranschaulicht werden.
- Durch ein Baumdiagramm auch die Berechnung von Wahrscheinlichkeiten erheblich erleichtert werden.  
### Pfadregeln
![[Pasted image 20230108013030.png]]

![[Pasted image 20230108013044.png]]

![[Pasted image 20230108013054.png]]
# Tags
| ![[Pasted image 20221211123853.png]] | ![[UEB-rechnen-wsk.png]] | 
| ------------------------------------ | ------------------------ |

[[Grundmenge]]
[[Ereignis]]
https://studyflix.de/statistik/wahrscheinlichkeit-1932