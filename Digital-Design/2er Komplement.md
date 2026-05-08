---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 6th May 2026
professor:
release: false
title: 2er Komplement
---


# 2er Komplement

Das $r$-Komplement des Dualsystems ist das **2er Komplement**, $r=2$.

![](Polyadisches%20Stellenwertsystem.md#^R)

Das 2er Komplement ist schwieriger zu bilden aber leichter zu rechnen (einfach Übertrag entfernen).

> [!info] Lemma: Sei a eine Festkommazahl, die Festkommazahl $\bar{a}$, die aus a durch Komplementieren aller Bits $(0 \to 1, 1 \to 0)$ hervorgeht. Dann gilt
> 
> $$
> [\bar{a}]_{2} + 2^{-k} = - [a]_{2}
> $$

Man erhält also die zu a inverse Zahl, indem man alle Bits komplementiert und an der niederwertigsten Stelle 2-k addiert.

> [!def] **D - 2K)** 2er- Komplement. Sei $d \in \{ 0,1 \}$
> 
> $$
> [d_{n}, d_{n-1}, \ldots, d_{0}{\color{orange},} d_{-1}, \ldots ,d_{-k}]_{2} := \sum_{i=-k}^{n-1} d_{i} 2^i - d_{n}2^{n}
> $$

- Jede $1$ zu $0$, jede $0$ zur $1$
- und $+1$


### Eigenschaften

Der Zahlenbereich ist unsymmetrisch:

- Kleinste Zahl: $-2^n$
- Größte Zahl: $2^n-2^{-k}$

Die Zahlendarstellung ist eindeutig: „Benachbarte Zahlen“ haben gleichen Abstand $2^{-k}$


## Beispiel

$n=2$, $k=0$

| $a$                 | $000$ | $001$ | $010$ | $011$ | $100$ | $101$ | $110$ | $111$ |
| ------------------- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- |
| $[a]_{\mathrm{2K}}$ | $0$   | $1$   | $2$   | $3$   | $-4$  | $-3$  | $-2$  | $-1$  |

## Beispiel

| $N_{r=10}$ | $N_{r=2}$           | $(r=2)^{(n=3)} - N_{(r=10)}$ | $\overline{N_{r=2}}$ | $\overline{N_{r=10}}$ |
| :----------: | :-------------------: | :----------------------------: | :--------------------: | :---------------------: |
| $0_{10}$   | $000$               | $8-0=8$                      | $1000$               | $+8_{10}$             |
| $1_{10}$   | $001$               | $8-1=7$                      | $111$                | $-1_{10}$             |
| $2_{10}$   | $010$               | $8-2=6$                      | $110$                | $-2_{10}$             |
| $3_{10}$   | $011$               | $8-3=5$                      | $101$                | $-3_{10}$             |
| $4_{10}$   | $\color{orange}100$ | $8-4=4$                      | $\color{orange}100$  | $-4_{10}$             |

Man Beachte dass nicht der gesamte Wertebereich verwendet werden kann, da z.B. für $n=3: -4_{10}=4_{10}$. Der Wertebereich des Radix Komplements ist daher

$$ [r^{n-1}-1, -r^{n-1}] $$