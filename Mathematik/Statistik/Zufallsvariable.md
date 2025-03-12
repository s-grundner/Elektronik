---
tags: ["Statistik"]
aliases: ["Zufallsvariablen", "Zufallsgröße", "Zufallsgrößen"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 30th November 2022
---

# Zufallsvariable

Ein Merkmal $X$, dessen numerische Werte die Ergebnisse eines Zufallsvorgangs sind, heißt Zufallsvariable oder Zufallsgröße.

## Diskrete Zufallsvariablen

Eine diskrete Zufallsvariable oder Zufallsgröße kann nur einzelne Werte annehmen.  
Eine Funktion $X$, die $X:\Omega\rightarrow\mathbb{R}$

>[!hint] Jedem [Ereignis](Ereignis.md) wird ein Wert zugeordnet (Diskret)

>[!EXAMPLE] Werfen von 2 Würfeln  
>$\Omega=\{(1,1);(1,2);\dots;(6,6)\}$ Werte der einzelnen Würfel  
>$X=\{2;3;\dots;12\}$ Augenzahl (einzelne Würfel sind unwichtig)

**Bisher:**
- $P(\omega)\dots$ [Wahrscheinlichkeit](Wahrscheinlichkeit.md) eines Ereignisses $\omega$

**Jetzt:**
- $M_{x}=\{x_{1};\dots ;x_{n}\}$
- $P_{i}=P(X=x_{i})=P(\{\omega|X(\omega)=x_{i}\})$

>[!EXAMPLE] Würfeln mit $2$ Würfeln  
>$p_{7}=P(X=7)=P(\{\omega|X(\omega)=7\})=\sum\limits P(\omega)$  
>$X(\omega)=7$

### Beispiele für Zufallsvariablen

- Anzahl der Ausschussteile in einer Stichprobe.
- Anzahl der Mädchen in einer 4-Köpfigen Familie
- Alter einer Person

## Stetige Zufallsvariablen

Eine stetige Zufallsvariable nimmt jeden Wert in einem bestimmten Intervall an.  
Die Gesamtheit dieser Werte $x_{i}$ einer diskreten Zufallsvariable $X$ zusammen mit den zugehörigen Wahrscheinlichkeiten $p_{i}$ heißt [Wahrscheinlichkeitsverteilung](Wahrscheinlichkeitsverteilung.md) dieser Zufallsvariable.

# Tags

[Wahrscheinlichkeitsverteilung](Wahrscheinlichkeitsverteilung.md)  
[Varianz](Varianz.md#Varianz%20einer%20Zufallsvariable)
