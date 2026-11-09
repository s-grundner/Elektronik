---
tags:
aliases:
  - Kumulative Verteilungsfunktion
  - Cumulative Distribution Function
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: WS26
created: 15th October 2026
professor:
release: false
title: CDF
---

# Kumulative Verteilungfunktion

Wir definieren ein Event $(X \leq x)$ als die Menge aller realisierung[^1], für die $X(\omega) \leq x$ gilt:

$$
(X\leq x) :=\{\omega \in \Omega | X(\omega) \leq x\}
$$

Die Funktion

$$
F_{X}(x) := P(X\leq x) \qquad -\infty < x < \infty
$$

nennen wir **kumulative Verteilungsfunktion** der Zufallsvariable $X$.

Die meiste information über das durch $X$ beschriebene Zufallsexperiment ist gegeben durch die CDF.

> [!example] Beispiel: [Normalverteilung](Normalverteilung.md)
> 
> | Normalverteilung PDF                                              | Normalverteilung CDF                                              |
> | :-----------------------------------------------------------------: | :-----------------------------------------------------------------: |
> | ![invert_dark](../../_assets/Pasted%20image%2020261015121908.png) | ![invert_dark](../../_assets/Pasted%20image%2020261015121938.png) |
> 

Einige eigenschaften der CDF folgen direkt aus der definition

- $0 \leq F_{X}(x) \leq 1$
- $F_{X}(x_{1}) \leq F_{X}(x_{2})$ wenn $x_{1}<x_{2}$ ($F_{X}(x)$ ist monoton steigend)
- $\lim_{ x \to \infty }$

[^1]: Sample-Points, Mögliche Ergebnisse eines Zufallsexperiments
