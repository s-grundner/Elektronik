---
tags: 
aliases:
  - Partielle DGL
  - Partielle Differenzialgleichungen
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 8. Januar 2025
professor:
---
 

# Partielle DGL

## Lineare DGL 2. Ordnung

$$
\mathrm{L}u := \sum_{i,j=0}^{n} a_{ij} \frac{\partial^{2}u}{\partial x_{i} \partial x_{j}} + \sum_{i=0}^{n} a_{i} \frac{\partial u}{\partial x_{i}} + cu = f
$$

> [!def] **D1 - KLAS)** $L$ heißt im Punkt $x \in \mathbb{R}$
> **(a) elliptisch**
> **(b) hyperbolisch**
> **(c) parabolisch**

Man möchte, dass $L$ in jedem Punkt von der gleichen Klasse ist.

>[!example] Je nachdem ob $L$ ell. hyp. oder par ist hat die Lineare Abbildung $L$ die Form wie hier mit $n=2$ dargestellt
> 
> $$
> \begin{align}
> \text{elliptisch:}\quad&\begin{pmatrix}
> 1 & 0 \\ 0 & 1
> \end{pmatrix}: x^{2}+y^{2} = \text{const.} \\
> \text{hyperbolisch:}\quad&\begin{pmatrix}
> 1 & 0 \\ 0 & -1
> \end{pmatrix}: x^{2}-y^{2} = \text{const.} \\
> \text{parabolisch:}\quad&\begin{pmatrix}
> 0 & 1 \\ 1 & 0
> \end{pmatrix}: x^{2} y^{2} = \text{const.}
> \end{align}
> $$

Bereich indem die Partielle DGL definiert ist:

> [!info] Ist die Zeit $t$ einer der Parameter von $u$, so zeichnen wir Folgendes Bild
> ![](assets/Pasted%20image%2020250108151936.png)
> 
> Raumvariablen $\Omega \subset \mathbb{K}^{n}$, Zeitvariable $I = [0,\infty)$: Definitionsraum $I \times\Omega$
> **AB:** Anfangsbedingungen: $u(0,x)=f_{0}(x), x \in\Omega$
> **RB:** Randbedingungen: $u(t,y)= f_{1}(t,y), y\in\partial \Omega$


> [!info] Falls kine Zeitvariable vorkommt sind **nur** Randbedingungen möglich


