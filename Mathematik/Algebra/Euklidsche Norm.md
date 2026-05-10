---
title: Euklidsche Norm
tags:
aliases:
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 29th January 2026
professor:
release: false
---


# Euklidsche Norm

> [!question] [Norm](Norm.md)

---

 Standardnorm im Euklidschen Raum $\mathbb{R}^2$ :

$$
\lVert \mathbf{x} \rVert_{2} =\sqrt{x_1^2+x_2^2}
$$

Erweiterung der Euklidschen Norm auf $\mathbb{R}^n$

$$
\lVert \mathbf{x} \rVert_{2} =\sqrt{x_1^2+x_2^2+\ldots+x_n^2}
$$

Der nächste Satz besagt, dass jeder Prähilbertraum auch ein normierter Raum ist:

> [!satz] Sei $(X,\langle\cdot, \cdot\rangle)$ ein Prähilbertraum. Dann ist $\|x\|:=\sqrt{\langle x, x\rangle}$ eine Norm auf $X$ und für alle $x, y \in X$ gilt:
> **(a)** [Cauchy-Schwarzsche Ungleichung](Cauchy-Schwarzsche%20Ungleichung.md): $|\langle x, y\rangle| \leq\|x\| \cdot\|y\|$
> **(b)** Parallelogrammgleichung: $\|x+y\|^2+\|x-y\|^2=2\left(\|x\|^2+\|y\|^2\right)$
> - $\langle\cdot,\cdot \rangle$: [[Skalarprodukt]]