---
tags:
  - Axiome/Norm
aliases:
  - Definition 6.11
  - Satz 6.15
  - Parallelogrammgleichung
  - Cauchy-Schwarzsche Ungleichung
  - euklidsche Norm
  - euklidschen Norm
keywords:
  - Normaxiome N1-N3
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor: 
axiome:
  - N1
  - N2
  - N3
---
 

# Norm

Wir haben bereits in $\mathbb{C}$ gesehen, dass man den [Betrag](Betrag.md) der komplexen Zahl $z=x+i y$ angeben kann, der in der Zahlenebene der Länge des Vektors $(x, y)$ entspricht. Dieser Betrag erfüllt die [Dreiecksungleichung](Betrag.md).

Es stellt sich nun die Frage, ob man auf allgmeinen Vektorräumen auch so einen **Abstandsbegriff** einführen kann. Das führt uns zu Normen. Der Körper $\mathbb{K}$ sei im Folgenden entweder $\mathbb{R}$ oder $\mathbb{C}$. Mit $|\cdot|$ bezeichnen wir jeweils den Betrag in $\mathbb{K}$ :



> [!important] **Definition 6.11** Sei $X$ ein $\mathbb{K}$-[Vektorraum](Algebra/Vektorraum.md). Eine Abbildung $\|\cdot\|: X \rightarrow \mathbb{R}_{0}^{+}$ heißt Norm auf $X$, falls folgende Bedingungen gelten:
> **(N1)** $\forall x \in X:\|x\|=0 \Longleftrightarrow x=0\quad$ (**[Definitheit](Algebra/Definitheit.md)**)
> **(N2)** $\forall x \in X \forall \lambda \in \mathbb{K}:\|\lambda x\|=|\lambda|\|x\|\quad$ (**Homogenität**)
> **(N3)** $\forall x, y \in X:\|x+y\| \leq\|x\|+\|y\|\quad$ (**Dreiecksungleichung**)
> 
> $(X,\|\cdot\|)$ heißt **normierter (Vektor-)Raum**.

>[!example] Es sind verschiedene Norm-Definitionen möglich, solange sie den obigen Axiomen (N1)-(N3) genügen.
>- Der komplexe Betrag $|\cdot|: \mathbb{C} \rightarrow \mathbb{R}_0^{+}$ist eine Norm im Sinne der Definition. Somit ist $\mathbb{C}$ bezüglich des Betrages ein normierter Raum.
> - Standardnorm im Euklidschen Raum $\mathbb{R}^2$ :
> 
> $$
> \|\mathbf{x}\|=\sqrt{x_1^2+x_2^2}
> $$
> 
> - Erweiterung der Euklidschen Norm auf $\mathbb{R}^n$
> 
> $$
> \|\mathbf{x}\|=\sqrt{x_1^2+x_2^2+\ldots+x_n^2}
> $$
> 

## Euklidsche Norm

Der nächste Satz besagt, dass jeder Prähilbertraum auch ein normierter Raum ist:

> [!important] **Satz 6.15** Sei $(X,\langle\cdot, \cdot\rangle)$ ein Prähilbertraum. Dann ist $\|x\|:=\sqrt{\langle x, x\rangle}$ eine Norm auf $X$ und für alle $x, y \in X$ gilt:
> **(a)** Cauchy-Schwarzsche Ungleichung: $|\langle x, y\rangle| \leq\|x\| \cdot\|y\|$
> **(b)** Parallelogrammgleichung: $\|x+y\|^2+\|x-y\|^2=2\left(\|x\|^2+\|y\|^2\right)$
> - $\langle\cdot,\cdot \rangle$: [[Skalarprodukt]]


### Weitere Normen in $\mathbb{R}^n$