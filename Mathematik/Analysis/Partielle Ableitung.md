---
tags:
  - Analysis/Differenzieren
aliases:
  - Satz von Schwarz
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
satz:
  - SCHW
def:
  - PART
---
 

# Partielle [Ableitung](Differenzialrechnung.md)

Für Funktionen mit mehreren Argumenten benötigt man einen zusätzlichen Ableitungsbegriff: Die *Partielle Abeitung*

Die partielle Ableitung gibt also die Änderung der Funktion nach einer Variable an, wobei die anderen Variablen festgehalten werden. Sind die Variablen die $x$-, $y$ - und $z$-Koordinaten des $\mathbb{R}^3$, so gibt die partielle Ableitung nach diesen die jeweilige Änderung in dieser Dimension des Raumes an.

> [!def] **D1 - PART)** Sei $A \subset \mathbb{R}^n$ offen.
> Sei $f: A \rightarrow \mathbb{R}, x=\left(x_1, \ldots, x_n\right) \in A$ und $j \in\{1, \ldots, n\}$.
> $f$ heißt in $x$ partiell nach $x_j$ differenzierbar, wenn folgender [[Grenzwert]] existiert:
> 
> $$\lim _{t \rightarrow 0} \frac{f\left((x_1, \ldots, x_{j-1}, x_j+t), (x_{j+1}, \ldots, x_n)\right)-f(x)}{t} =: \frac{\partial f}{\partial x_j}(x)$$
> 
> Dieser Grenzwert heißt dann partielle [Ableitung](Differenzialrechnung.md) von $f$ nach $x_j$ (auch bezeichnet mit $f_{x_j}(x)$).
> Falls in $x$ alle partiellen Ableitungen existieren, so heißt $f$ partiell differenzierbar in $x$.

> [!satz] **S1 - SCHW)** Satz von Schwarz
> 
> > [!quote] Die Reihenfolge der zweiten partiellen Ableitungen ist vertauschbar, wenn diese stetig differenzierbar ist
> 
> Sei $A \subset \mathbb{R}^2$ offen, $x_0 \in A$ und $f: A \rightarrow \mathbb{R}$ besitzt in $A$ die partiellen Ableitungen $\dfrac{\partial f}{\partial x}, \dfrac{\partial f}{\partial y}$ und $\dfrac{\partial^2 f}{\partial x \partial y}$. 
> 
> Ist $\dfrac{\partial^2 f}{\partial x \partial y}$ in $x_0$ stetig, so existiert auch $\dfrac{\partial^2 f}{\partial y \partial x}\left(x_0\right)$ und es gilt:
> $$\boxed{ \frac{\partial^2 f}{\partial y \partial x}\left(x_0\right)=\frac{\partial^2 f}{\partial x \partial y}\left(x_0\right) }$$

> [!info] **Korollar**. Sei $A \subset \mathbb{R}^n$ offen, $k \in \mathbb{N}, k \geq 2$ und $f \in C^k(A)$. 
> Dann existieren alle möglichen partiellen Ableitungen von $f$ bis zur $k$-ten Ordnung (mit beliebiger Differentiationsreihenfolge). Je zwei Ableitungen derselben Ordnung, bei denen nach denselben Variablen gleich oft differenziert wird, stimmen überein.

> [!info] **Bemerkung**. Falls $f \in C^3(A)$ ist, stimmen also etwa $\frac{\partial^3 f}{\partial x \partial y \partial x}$ und $\frac{\partial^3 f}{\partial x^2 \partial y}$ überein. Ist $f \in C^2(A)$, so ist die sogenannte [Hesse-Matrix](Gradient.md) symmetrisch.
> 
> $$
> H_f(x):=\left(\begin{array}{ccc}
> \frac{\partial^2 f}{\partial x_1^2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\
> \vdots & \ddots & \vdots \\
> \frac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 f}{\partial x_n^2}
> \end{array}\right)
> $$
> 
> 
> 
> Aus den Rechenregeln für erste Ableitungen kann man (i.a. durch [Induktion](../Logik/Induktionsbeweis.md)) Rechenregeln für höhere Ableitungen herleiten. Wir geben nur eindimensionale Beispiele dafür an, aus denen sich bei Bedarf natürlich Regeln für höhere partielle Ableitungen herleiten lassen.

# Tags

- [[Gradient]]