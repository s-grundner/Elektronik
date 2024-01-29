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
- [[../Matrixmultiplikation]]

## Elementare Umformungen

Eine quadratische Matrix heißt Elementarmatrix, wenn sie aus der Einheitsmatrix durch eine elementare Zeilenumformung hervorgeht.  
Somit können wir drei Typen von Elementarmatrizen definieren ($\mathbb{R}^{n\times n}$):

- [[Vertauschungsmatrix]] $T_{i, j}$
- [[Skalierungsmatrix]] $S_i(\lambda)$
- [Additionsmatrix](Additionsmatrix.md) $R_{i, j}(\lambda)$

## Besondere Matrizen

- [Einheitsmatrix](Einheitsmatrix.md)  
- [[Rotationsmatrix]]  
- [[Dreiecksmatrix]]
- [[Diagonalmatrix]]

# Tags

[[Vektorraum]]