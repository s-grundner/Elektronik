---
tags:
  - Infinitesimalrechnung/Integrieren
aliases: 
keywords:
  - Fläche unter Kurve
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 18. April 2024
professor: 
cited:
---
 

# Riemann-Integral

> [!important] Inhalt
> (a) Seien $a_i, b_i \in \mathbb{R}$ mit $a_i<b_i$ für $i=1, \ldots, n$. Ein *abgeschlossenes* $n$-*dimensionales* Intervall ist eine Menge $I:=\left[a_1, b_1\right] \times \ldots \times\left[a_n, b_n\right]$. Der *Inhalt* von $I$ ist definiert als:
> $$
> |I|:=\prod_{i=1}^n\left(b_i-a_i\right)
> $$

> [!important] Feinheit, Zerlegung von $[a,b]$
> (b) Sei $[a, b] \subset \mathbb{R}$ ein abgeschlossenes Intervall und $a=x_0<\ldots<x_k=b$. Die Menge $Z:=\left\{x_0, \ldots, x_k\right\}$ heißt *Zerlegung* von $[a, b]$ mit *Feinheit*:
> $$
> |Z|:=\max \left\{\left|x_i-x_{i-1}\right|: i \in\{1, \ldots, k\}\right\}
> $$

> [!important] Feinheit, Zerlegung von $I$
> (c) Sei $I=\left[a_1, b_1\right] \times \ldots \times\left[a_n, b_n\right] \subset \mathbb{R}^n$ ein abgeschlossenes Intervall, $Z_1, \ldots, Z_n$ Zerlegungen von $\left[a_1, b_1\right], \ldots,\left[a_n, b_n\right]$ (mit nicht notwendigerweise gleich vielen Zerlegungspunkten pro Intervall). Dann heißt $Z:=Z_1 \times \ldots \times Z_n$ eine *Zerlegung* von $I$ mit *Feinheit*:
> $$
> |Z|:=\max \left\{\left|Z_i\right|: i \in\{1, \ldots, n\}\right\}
> $$

> [!warning] Betragsstriche dienen nur zur notation