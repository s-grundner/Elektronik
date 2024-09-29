---
tags:
  - Infinitesimalrechnung/Differenzieren
aliases:
  - Satz von Schwarz
  - Satz 11.28
  - Korollar 11.29
  - Bemerkung 11.30
keywords: 
subject:
  - KV
  - VL
  - Mathematik 1
  - Mathematik 2
semester: SS24
created: 28. Februar 2024
professor:
  - Tina Mitteramskogler
  - Andreas Neubauer
---
 

# Partielle [Ableitung](Differenzialrechnung.md)

Für Funktionen mit mehreren Argumenten benötigt man einen zusätzlichen Ableitungsbegriff: Die *Partielle Abeitung*

Für die partielle [Ableitung](Differenzialrechnung.md) wird zur Unterscheidung das Symbol $\partial$ verwendet, alternativ wird auch die Variable, nach der abgeleitet wird als Index geschrieben:
$$
\frac{\partial f}{\partial x}=f_{x}
$$

Die partielle Ableitung gibt also die Änderung der Funktion nach einer Variable an, wobei die anderen Variablen festgehalten werden. Sind die Variablen die $x-, y$ - und $z$-Koordinaten des Raums, so gibt die partielle Ableitung nach diesen die jeweilige Änderung in diese Raumrichtung an.

> [!important] Definition
Sei $f$ eine Funktion (skalar-, [[vektor]]- oder tensorwertig) z.B.
> $$
\begin{aligned}
f: \mathbb{R}^n &\rightarrow \mathbb{R} \\
\left(x_1, \ldots, x_n\right) &\mapsto f\left(x_1, \ldots, x_n\right)
\end{aligned}
> $$
> dann bezeichnet man den [[Grenzwert]]
> $$
\frac{\partial f}{\partial x_i}(a)=\lim _{h \rightarrow 0} \frac{f\left(a_1, \ldots, a_i+h, \ldots, a_n\right)-f\left(a_1, \ldots, a_i, \ldots, a_n\right)}{h}
> $$
> als die *partielle [Ableitung](Differenzialrechnung.md)* von $f$ nach der $i$-ten Variable $x_i$ an der Stelle $a$.
> Eine Funktion heißt partiell differenzierbar, wenn alle partiellen Ableitungen $\partial f / \partial x_i$ in diesem Punkt existieren.

> [!info] **Satz 11.28**: Satz von Schwarz
> 
> > Die Reihenfolge der zweiten partiellen Ableitungen ist vertauschbar, wenn diese stetig differenzierbar ist
> 
> Sei $A \subset \mathbb{R}^2$ offen, $x_0 \in A$ und $f: A \rightarrow \mathbb{R}$ besitzt in $A$ die partiellen Ableitungen $\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}$ und $\frac{\partial^2 f}{\partial x \partial y}$. 
> 
> Ist $\frac{\partial^2 f}{\partial x \partial y}$ in $x_0$ stetig, so existiert auch $\frac{\partial^2 f}{\partial y \partial x}\left(x_0\right)$ und es gilt:
> $$\frac{\partial^2 f}{\partial y \partial x}\left(x_0\right)=\frac{\partial^2 f}{\partial x \partial y}\left(x_0\right)$$

**Korollar 11.29**. Sei $A \subset \mathbb{R}^n$ offen, $k \in \mathbb{N}, k \geq 2$ und $f \in C^k(A)$. ==Dann existieren alle möglichen partiellen Ableitungen von $f$ bis zur $k$-ten Ordnung (mit beliebiger Differentiationsreihenfolge)==. Je zwei Ableitungen derselben Ordnung, bei denen nach denselben Variablen gleich oft differenziert wird, stimmen überein.

**Bemerkung 11.30**. Falls $f \in C^3(A)$ ist, stimmen also etwa $\frac{\partial^3 f}{\partial x \partial y \partial x}$ und $\frac{\partial^3 f}{\partial x^2 \partial y}$ überein. Ist $f \in C^2(A)$, so ist die sogenannte [Hesse-Matrix](../Gradient.md) symmetrisch.

$$
H_f(x):=\left(\begin{array}{ccc}
\frac{\partial^2 f}{\partial x_1^2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
\vdots & \ddots & \vdots \\
\frac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
\end{array}\right)
$$



Aus den Rechenregeln für erste Ableitungen kann man (i.a. durch [Induktion](../Logik/Induktionsbeweis.md)) Rechenregeln für höhere Ableitungen herleiten. Wir geben nur eindimensionale Beispiele dafür an, aus denen sich bei Bedarf natürlich Regeln für höhere partielle Ableitungen herleiten lassen.

# Tags

- [[Gradient]]