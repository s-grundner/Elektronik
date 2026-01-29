---
tags:
  - Algorithmus/Mathe
aliases:
keywords:
subject:
  - Mathematik1
semester: WS23
created: 29. Januar 2024
professor:
complexity:
---
 

# Matrixmultiplikation

> [!info] Complexity: $\mathcal{O}(n^{3})$

> [!def] **D - Matrix Multiplikation)**  Seien $\mathbb{K}^{m\times n}$ und $\mathbf{B} \in \mathbb{K}^{n \times p}$, dann ist das **Produkt** $\mathbf{A}\cdot \mathbf{B}$ definiert als
> 
> $$
> \mathbf{A} \cdot \mathbf{B} := (c_{ij})^{m,p}_{i=1,j=1} \in \mathbb{K}^{m\times p} \quad \text{mit} \quad c_{ij}:= \sum_{k=1}^{i} a_{ik}b_{kj}
> $$


## Beispiel

Gegeben seien die beiden reellen Matrizen

$$
\mathbf{A} = \begin{pmatrix} 3 & 2 & 1 \\ 1 & 0 & 2 \end{pmatrix} \in \mathbb{R}^{2 \times 3}, \quad \mathbf{B} = \begin{pmatrix} 1 & 2 \\ 0 & 1 \\ 4 & 0 \end{pmatrix} \in \mathbb{R}^{3 \times 2}
$$

Da die Matrix $A$ ebenso viele Spalten wie die Matrix $B$ Zeilen besitzt, ist die Matrizenmultiplikation $A \cdot B$ durchführbar. Nachdem $A$ zwei Zeilen und $B$ zwei Spalten hat, wird das Matrizenprodukt ebenfalls zwei Zeilen und Spalten aufweisen. Zur Berechnung des ersten Matrixelements der Ergebnismatrix werden die Produkte der entsprechenden Einträge der ersten Zeile von $A$ und der ersten Spalte von $B$ aufsummiert:

$$\begin{pmatrix} \color{OliveGreen} 3 & \color{OliveGreen} 2 & \color{OliveGreen} 1 \\ 1 & 0 & 2 \end{pmatrix} \cdot \begin{pmatrix} \color{BrickRed} 1 & 2 \\ \color{BrickRed} 0 & 1 \\ \color{BrickRed} 4 & 0 \end{pmatrix} = \begin{pmatrix} {\color{OliveGreen} 3} \cdot {\color{BrickRed} 1} + {\color{OliveGreen} 2} \cdot {\color{BrickRed} 0} + {\color{OliveGreen} 1} \cdot {\color{BrickRed} 4} & \ast \\ \ast & \ast \end{pmatrix} = \begin{pmatrix} {\color{Blue} 7} & \ast \\ \ast & \ast \end{pmatrix}$$

Für das nächste Element der Ergebnismatrix in der ersten Zeile und zweiten Spalte wird entsprechend die erste Zeile von $A$ und die zweite Spalte von $B$ verwendet:

$$\begin{pmatrix} \color{OliveGreen} 3 & \color{OliveGreen} 2 & \color{OliveGreen} 1 \\ 1 & 0 & 2 \end{pmatrix} \cdot \begin{pmatrix} 1 & \color{BrickRed} 2 \\ 0 & \color{BrickRed} 1 \\ 4 & \color{BrickRed} 0 \end{pmatrix} = \begin{pmatrix} 7 & {\color{OliveGreen} 3} \cdot {\color{BrickRed} 2} + {\color{OliveGreen} 2} \cdot {\color{BrickRed} 1} + {\color{OliveGreen} 1} \cdot {\color{BrickRed} 0} \\ \ast & \ast \end{pmatrix} = \begin{pmatrix} 7 & {\color{Blue} 8} \\ \ast & \ast \end{pmatrix}$$

Dieses Rechenschema setzt sich nun in der zweiten Zeile und ersten Spalte fort:

$$\begin{pmatrix} 3 & 2 & 1 \\ \color{OliveGreen} 1 & \color{OliveGreen} 0 & \color{OliveGreen} 2 \end{pmatrix} \cdot \begin{pmatrix} \color{BrickRed} 1 & 2 \\ \color{BrickRed} 0 & 1 \\ \color{BrickRed} 4 & 0 \end{pmatrix} = \begin{pmatrix} 7 & 8 \\ {\color{OliveGreen} 1} \cdot {\color{BrickRed} 1} + {\color{OliveGreen} 0} \cdot {\color{BrickRed} 0} + {\color{OliveGreen} 2} \cdot {\color{BrickRed} 4} & \ast \end{pmatrix} = \begin{pmatrix} 7 & 8 \\ {\color{Blue} 9} & \ast \end{pmatrix}$$

Es wiederholt sich bei dem letzten Element in der zweiten Zeile und zweiten Spalte:

$$
\begin{pmatrix} 3 & 2 & 1 \\ \color{OliveGreen} 1 & \color{OliveGreen} 0 & \color{OliveGreen} 2 \end{pmatrix} \cdot \begin{pmatrix} 1 & \color{BrickRed} 2 \\ 0 & \color{BrickRed} 1 \\ 4 & \color{BrickRed} 0 \end{pmatrix} = \begin{pmatrix} 7 & 8 \\ 9 & {\color{OliveGreen} 1} \cdot {\color{BrickRed} 2} + {\color{OliveGreen} 0} \cdot {\color{BrickRed} 1} + {\color{OliveGreen} 2} \cdot {\color{BrickRed} 0} \end{pmatrix} = \begin{pmatrix} 7 & 8 \\ 9 & {\color{Blue} 2} \end{pmatrix}
$$
