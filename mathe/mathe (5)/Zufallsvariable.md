---
tags: ["Statistik"]
aliases: ["Zufallsvariablen", "Zufallsgröße", "Zufallsgrößen"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 30th November 2022
---

# Zufallsvariable
Ein Merkmal $X$, dessen numerische Werte die Ergebnisse eines Zufallsvorgangs sind, heißt Zufallsvariable oder Zufallsgröße.
## Diskrete Zufallsvariablen
Eine diskrete Zufallsvariable oder Zufallsgröße kann nur einzelne Werte annehmen.
Eine Funktion $X$, die $X:\Omega\rightarrow\mathbb{R}$

>[!hint] Jedem [Ereignis](mathe/mathe%20(5)/Ereignis.md) wird ein Wert zugeordnet (Diskret)

>[!example] Werfen von 2 Würfeln
>$\Omega=\{(1,1);(1,2);\dots;(6,6)\}$ Werte der einzelnen Würfel
>$X=\{2;3;\dots;12\}$ Augenzahl (einzelne Würfel sind unwichtig)

**Bisher:**
- $P(\omega)\dots$ [Wahrscheinlichkeit](mathe/mathe%20(5)/Wahrscheinlichkeit.md) eines Ereignisses $\omega$

**Jetzt:**
- $M_{x}=\{x_{1};\dots ;x_{n}\}$
- $P_{i}=P(X=x_{i})=P(\{\omega|X(\omega)=x_{i}\})$

>[!example] Würfeln mit $2$ Würfeln
>$p_{7}=P(X=7)=P(\{\omega|X(\omega)=7\})=\sum\limits P(\omega)$
>$X(\omega)=7$

### Beispiele für Zufallsvariablen
- Anzahl der Ausschussteile in einer Stichprobe.
- Anzahl der Mädchen in einer 4-Köpfigen Familie
- Alter einer Person

## Stetige Zufallsvariablen
Eine stetige Zufallsvariable nimmt jeden Wert in einem bestimmten Intervall an.
Die Gesamtheit dieser Werte $x_{i}$ einer diskreten Zufallsvariable $X$ zusammen mit den zugehörigen Wahrscheinlichkeiten $p_{i}$ heißt [Wahrscheinlichkeitsverteilung](mathe/mathe%20(5)/Wahrscheinlichkeitsverteilung.md) dieser Zufallsvariable.

# Tags
[Wahrscheinlichkeitsverteilung](mathe/mathe%20(5)/Wahrscheinlichkeitsverteilung.md)
[](mathe/mathe%20(5)/Varianz.md#Varianz%20einer%20Zufallsvariable)