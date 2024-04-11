---
tags:
  - Infinitesimalrechnung
aliases:
  - Satz von Schwarz
keywords: 
subject:
  - KV
  - Mathematik1
semester:
  - WS23
created: 28. Februar 2024
professor:
  - Tina Mitteramskogler
---
 

# Partielle [Ableitung](Differenzialrechnung.md)

Für Funktionen mit mehreren Argumenten benötigt man einen zusätzlichen Ableitungsbegriff: Die *Partielle Abeitung*

Für die partielle [Ableitung](Differenzialrechnung.md) wird zur Unterscheidung das Symbol $\partial$ verwendet, alternativ wird auch die Variable, nach der abgeleitet wird als Index geschrieben:
$$
\frac{\partial f}{\partial x}=f_x=f_{, x}
$$

Die partielle [Ableitung](Differenzialrechnung.md) gibt also die Änderung der Funktion nach einer Variable an, wobei die anderen Variablen festgehalten werden. Sind die Variablen die $x-, y$ - und $z$-Koordinaten des Raums, so gibt die partielle [Ableitung](Differenzialrechnung.md) nach diesen die jeweilige Änderung in diese Raumrichtung an.

> [!info] Satz von Schwarz
> Die Reihenfolge der zweiten partiellen Ableitungen ist vertauschbar:
> 
> $$\frac{\partial^2 f}{\partial x_i \partial x_j}=\frac{\partial^2 f}{\partial x_j \partial x_i}$$



> [!important] Definition
Sei $f$ eine Funktion (skalar-, vektoroder tensorwertig) z.B.
> $$
\begin{aligned}
f: \mathbb{R}^n &\rightarrow \mathbb{R} \\
\left(x_1, \ldots, x_n\right) &\mapsto f\left(x_1, \ldots, x_n\right)
\end{aligned}
> $$
> dann bezeichnet man den Grenzwert
> $$
\frac{\partial f}{\partial x_i}(a)=\lim _{h \rightarrow 0} \frac{f\left(a_1, \ldots, a_i+h, \ldots, a_n\right)-f\left(a_1, \ldots, a_i, \ldots, a_n\right)}{h}
> $$
> als die *partielle [Ableitung](Differenzialrechnung.md)* von $f$ nach der $i$-ten Variable $x_i$ an der Stelle $a$.
> Eine Funktion heißt partiell differenzierbar, wenn alle partiellen Ableitungen $\partial f / \partial x_i$ in diesem Punkt existieren.

## Jacobi Matrix

## Hesse Matrix

![4000](../../assets/Excalidraw/Partielle%20Ableitung%202024-03-19%2017.40.01.excalidraw)

# Tags

- Gradient