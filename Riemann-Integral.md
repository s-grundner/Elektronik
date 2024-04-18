---
tags:
  - Infinitesimalrechnung/Integrieren
aliases:
  - Riemannsche Summe
  - Riemann
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

> [!important] Riemann-Summe
> Sei $I \subset \mathbb{R}^n$ ein abgeschlossenes Intervall, $Z$ eine Zerlegung von $I$ mit Teilintervallen $I_1, \ldots, I_m$. Für $j \in\{1, \ldots, m\}$ sei $\xi_j \in I_j$.
> $\sigma:=\left\{\xi_1, \ldots, \xi_m\right\}$ heißt ein zu $Z$ gehöriges System von Zwischenpunkten.
> Sei $f: I \rightarrow \mathbb{R}$. Dann heißt
> $$
> S(f, Z, \sigma):=\sum_{j=1}^m f\left(\xi_j\right)\left|I_j\right|
> $$
> die zu $(f, Z, \sigma)$ gehörige Riemannsche Summe (Zwischensumme).
> $f$ heißt Riemann-integrierbar ( $\mathrm{R}$-integrierbar), wenn:
> > [!tldr]- $\exists A \in \mathbb{R} \forall \varepsilon>0 \exists \delta>0 \forall Z:(|Z|<\delta \Longrightarrow \forall \sigma:|S(f, Z, \sigma)-A|<\varepsilon)$
> > Wenn es eine Zahl $A$ aus $\mathbb{R}$ ein $\varepsilon > 0$ und eine $\delta>0$ gibt, sodass für alle Zerlegungen $Z$ gilt wenn die Feinheit kleiner ist als $\delta$, gilt für alle Zwischenpunkte $\sigma$ die Differenz der Riemann-Summe und der Zahl $A$ kleiner als $\varepsilon$
> 
> Dabei handelt es sich bei $Z$ und $\sigma$ um Zerlegungen von $I$ bzw. Systeme von Zwischenpunkten zu $Z$.

> [!important] Riemann-Integral
> Die Zahl $A$ heißt (bestimmtes, Riemann-)Integral von $f$ über $I$, Symbole:
> $$ \int_I f d x \text { oder } \int_I f(x) d x \text { oder } \int_I f\left(x_1, \ldots, x_n\right) d\left(x_1, \ldots, x_n\right) $$
> 
> Ist $n=1$ und $I=[a, b]$, so schreiben wir statt $\int_I f d x$ auch $\int_a^b f d x$ und definieren:
> $$ \int_b^a f d x:=-\int_a^b f d x $$

| ![invert_dark\|400](ZerlegungR2.png) |   ![invert_dark\|400](RiemannSum.png)   | 
|:------------------------------------:|:---------------------------------------:|
|  Zerlegung $Z$ in $\mathbb{R}^{2}$   | Visualisierung einer Riemannschen Summe |

 