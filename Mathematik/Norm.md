---
tags: 
aliases:
  - Definition 6.11
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 28. September 2024
professor:
---
 

# Norm

Wir haben bereits in $\mathbb{C}$ gesehen, dass man den [Betrag](Betrag.md) der komplexen Zahl $z=x+i y$ angeben kann, der in der Zahlenebene der Länge des Vektors $(x, y)$ entspricht (siehe Bemerkung 5.2). Dieser Betrag erfüllt die [Dreiecksungleichung](Betrag.md).

Es stellt sich nun die Frage, ob man auf allgmeinen Vektorräumen auch so einen Abstandsbegriff einführen kann. Das führt uns zu Normen. Der Körper $\mathbb{K}$ sei im Folgenden entweder $\mathbb{R}$ oder $\mathbb{C}$. Mit $|\cdot|$ bezeichnen wir jeweils den Betrag in $\mathbb{K}$ :

> [!important] **Definition 6.11** Sei $X$ ein $\mathbb{K}$-[Vektorraum](Algebra/Vektorraum.md). Eine Abbildung $\|\cdot\|: X \rightarrow \mathbb{R}$ heißt Norm auf $X$, falls folgende Bedingungen gelten:
> **(N1)** $\forall x \in X:\|x\|=0 \Longleftrightarrow x=0\quad$ (**[Definitheit](Algebra/Definitheit.md)**)
> **(N2)** $\forall x \in X \forall \lambda \in \mathbb{K}:\|\lambda x\|=|\lambda|\|x\|\quad$ (**Homogenität**)
> **(N3)** $\forall x, y \in X:\|x+y\| \leq\|x\|+\|y\|\quad$ (**Dreiecksungleichung**)
> 
> $(X,\|\cdot\|)$ heißt **normierter Raum**.