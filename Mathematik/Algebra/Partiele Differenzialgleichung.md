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