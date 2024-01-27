---
tags: 
aliases:
  - Matrizen
  - Matrixgleichung
  - Matrixrechnung
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 28th September 2022
---

# Matrix

> [!info] Axiome für Matrizen  
> $A,A_{1}, A_{2}\in \mathbb{K}^{m\times n}$  
> $B,B_{1}, B_{2}\in \mathbb{K}^{n\times p}$  
> $C\in \mathbb{K}^{p\times q}$  
> $\lambda \in \mathbb{K}$
> 
> (a) *Assoziativgesetze*: 
> - $A \cdot(B \cdot C)=(A \cdot B) \cdot C$ 
> - $\lambda(A \cdot B)=(\lambda A) \cdot B=A \cdot(\lambda B)$  
> (b) *Distributivgesetze*:
> - $(A_1+A_2) \cdot B=A_1 \cdot B+A_2 \cdot B$ 
> - $A \cdot(B_1+B_2)=A \cdot B_1+A \cdot B_2$  
> (c) *Neutrale Elemente*:
> - $I_m \cdot A=A \cdot I_n=A$

> [!warning] Achtung: Auch für $m=n=p$ gilt i.a. nicht: $A B=B A$  
> die Matrixmultiplikation ist also *nicht kommutativ*.

## Rang einer Matrix

> [!important] Sei $A\in \mathbb{R}^{m\times n}$,  
> dann ist der Rang von $A$: $Rg(A) \leq min\{m,n\}$
>
> Sie entspricht der Anzahl der linear unabhängigen Zeilen bzw. Spalten der Matrix $A$.  
> Man könnte auch sagen, $Rg(A)$ ist die Dimension der [linearen Hüllen](Lineare%20Hülle.md) aus den Zeilen bzw. Spaltenvektoren der Matrix $A$

## Operationen auf eine Matrix

- [Invertierbarkeit](Invertierbarkeit.md)  
- [Transponieren](Transponieren.md)  
- [Determinante](Determinante.md)  
- [Matrixmultiplikation - Wikipedia](https://de.wikipedia.org/wiki/Matrizenmultiplikation)

## Elementare Umformungen

Eine quadratische Matrix heißt Elementarmatrix, wenn sie aus der Einheitsmatrix durch eine elementare Zeilenumformung hervorgeht.  
Somit können wir drei Typen von Elementarmatrizen definieren ($\mathbb{R}^{n\times n}$):

(1) Vertauschungsmatrix $T_{i, j}$ : für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt

(2) Skalierungsmatrix $S_i(\lambda)$ mit $\lambda \neq 0$ : für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt

$$
\vec{z_k}=\left\{\begin{array}{ll}
\lambda \vec{e_i} & \text { falls } k=i, \\
\vec{e_k} & \text { falls } k \neq i,
\end{array} \quad \text { also } S_i(\lambda):=\begin{pmatrix}
1 &&&&& \cdots & 0 \\
0 & \ddots &&&&& \vdots \\
&& 1\\
&&&\lambda\\
&&&& 1 \\
\vdots &&&&& \ddots & 0 \\
0 & \cdots &&&& 0 & 1
\end{pmatrix} \leftarrow i\right. \text {-te Zeile }
$$

(3) Additionsmatrix $R_{i, j}(\lambda)$ mit $i \neq j$ und $\lambda \neq 0$ (Linearkombination): für ihre Zeilenvektoren $\vec{z_1}, \ldots, \vec{z_n}$ gilt

$$
\vec{z_k}=\left\{\begin{array}{ll}
\vec{e_i}+\lambda \vec{e_j} & \text { falls } k=i, \\
\vec{e_k} & \text { falls } k \neq i,
\end{array} \quad \text { also } R_{i, j}(\lambda):=\left(\begin{array}{ccccccc}
1 & 0 & & & & \cdots & 0 \\
0 & \ddots & & & & & \vdots \\
& & 1 & 0 & \cdots & \lambda & \\
& & \ddots & & \vdots & \\
& & & \ddots & 0 & \\
& & & & 1 & \\
\vdots & & & & & \ddots & 0 \\
0 & \cdots & & & & 0 & 1
\end{array}\right) \leftarrow i\right. \text {-te Zeile }
$$

## Besondere Matrizen

- [Einheitsmatrix](Einheitsmatrix.md)  
- [[Rotationsmatrix]]  



