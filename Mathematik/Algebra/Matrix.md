---
tags:
  - Algebra/LineareAlgebra
aliases:
  - Matrizen
  - Matrixgleichung
  - Matrixrechnung
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 11. April 2024
professor: 
cited:
---
 

# Matrix

> [!def] Axiome für Matrizen  
> $A,A_{1}, A_{2}\in \mathbb{K}^{m\times n}$  
> $B,B_{1}, B_{2}\in \mathbb{K}^{n\times p}$  
> $C\in \mathbb{K}^{p\times q}$  
> $\lambda \in \mathbb{K}$
> 
> (a) *Assoziativgesetze*: 
> 
> - $A \cdot(B \cdot C)=(A \cdot B) \cdot C$ 
> - $\lambda(A \cdot B)=(\lambda A) \cdot B=A \cdot(\lambda B)$  
> 
> (b) *Distributivgesetze*:
> 
> - $(A_1+A_2) \cdot B=A_1 \cdot B+A_2 \cdot B$ 
> - $A \cdot(B_1+B_2)=A \cdot B_1+A \cdot B_2$  
> 
> (c) *Neutrale Elemente*:
>
> - $I_m \cdot A=A \cdot I_n=A$

> [!warning] Achtung: Auch für $m=n=p$ gilt i.a. nicht: $A B=B A$  
> die Matrixmultiplikation ist also *nicht kommutativ*.


> [!important] Eine Wichtige Kenngröße einer Matrix ist dessen [Determinante](Determinante.md)

## Rang einer Matrix

 Der Rang einer Matrix $\mathbf{A}\in\mathbb{R}^{m\times n}$ ist:
 
 $$\operatorname{rang}(\mathbf{A}) \leq \min\{m,n\}$$

Sie entspricht der Anzahl der linear unabhängigen Zeilen bzw. Spalten der Matrix $A$.  
Man könnte auch sagen, $\operatorname{rang}(\mathbf{A})$ ist die **Dimension** der [linearen Hüllen](Koordinatenmatrix.md) aus den Zeilen bzw. Spaltenvektoren der Matrix $A$

$$
\operatorname{rang}\mathbf{A}=\dim\operatorname{im}\mathbf{A}
$$
## Operationen auf eine Matrix

- [Gauß-Jordan-Verfahren](Gauß-Jordan-Verfahren.md)  
- [Transponieren](Transponieren.md)  
- [Determinante](Determinante.md)  
- [[Matrixmultiplikation]]
- [[Definitheit]]

## Elementare Umformungen

Eine quadratische Matrix heißt Elementarmatrix, wenn sie aus der Einheitsmatrix durch eine elementare Zeilenumformung hervorgeht. Somit können wir drei Typen von Elementarmatrizen definieren ($\mathbb{R}^{n\times n}$):

- [[Vertauschungsmatrix]] $T_{i, j}$
- [[Skalierungsmatrix]] $S_i(\lambda)$
- [Additionsmatrix](Additionsmatrix.md) $R_{i, j}(\lambda)$

## Besondere Matrizen

- [Einheitsmatrix](Einheitsmatrix.md) $\mathbb{1}_{m}$ 
- [[Rotationsmatrix]] 
- [[Dreiecksmatrix]] 
- [[Diagonalmatrix]]

# Tags

[Vektorraum](Vektorraum.md)