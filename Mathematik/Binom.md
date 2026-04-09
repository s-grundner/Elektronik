---
tags:
  - Algebra
aliases:
  - Binomische Formel
  - Binom
  - Pascalsches Dreieck
keywords:
subject:
  - Mathematik 1
  - VL
semester: WS23
created: 4. März 2024
professor:
title: Binom
---

# Binom

## Binomische Formeln

> [!satz] **S1 - BINF)** erste Binomische Formel ^S1-BINF
> $$(a+b)^{2}=a^{2}+2ab+b^{2}$$

> [!satz] **S2 - BINF)** zweite Binomische Formel
> $$(a-b)^{2} = a^{2}-2ab+b^{2}$$

> [!satz] **S3 - BINF)** dritte Binomische Formel
> $$(a+b)\cdot(a-b) = a^{2}-b^{2}$$

## Allgemeines Binom

Für $(a+b)^{n}$ lassen sich alle Kombinationen mittels dem [Kombination](Statistik/Kombinatorik/Kombination.md#^BINK) anschrieben

$$
(a+b)^{n} = \sum_{k=0}^{n} \binom{n}{k}a^{n}b^{n-k}
$$

> [!hint] Man kann das Ausmultiplizieren der Terme als [Kombination ohne Wiederholung](Statistik/Kombinatorik/Kombination.md#Ohne%20Wiederholung) betrachten

### Pascalsches Dreieck

Die Binomialkoeffizienten für jedes $n \in \mathbb{N}$ kann händisch ganz einfach mithilfe des Pascalschen Dreiecks berechnet werden. Dabei sind die Schenkel $1$. Man Summiert die zwei benachbarte zahlen, welche dann die nächste untere Zahl ergeben.

> [!example] Beispiel für $(a+b)^{n}$ mit $n=6$

$$
\begin{array}{rccccccccccc}
k=0: &&&&&&&1\\
k=1: &&&&&&1&&1\\
k=2:&&&&&1&&2&&1\\
\vdots&&&&1&&3&&3&&1\\
&&&1&&4&&6&&4&&1\\
&&1&&5&&10&&10&&5&&1\\
k=n=6:&1&&6&&15&&20&&15&&6&&1\\
\end{array}
$$

Man erhält:

$$
(a+b)^{6} = a^{6} + 6a^{5}b + 15a^{4}b^{2} + 20a^{3}b^{3} + 15a^{2}b^4 + 6ab^{5} + b^{6}
$$