---
tags:
  - Algebra/LineareAlgebra
  - MOC
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
---
 

# Matrix

> [!def] **D1 - MAAX)** Axiome für Matrizen ^MAAX
> Seien $\mathbf{A},\mathbf{A}_{1}, \mathbf{A}_{2}\in \mathbb{K}^{m\times n}$ und $\mathbf{B},\mathbf{B}_{1}, \mathbf{B}_{2}\in \mathbb{K}^{n\times p}$ und $\mathbf{C}\in \mathbb{K}^{p\times q}$ Matrizen und $\lambda \in \mathbb{K}$ ein Skalar.
> 
> (a) *Assoziativgesetze*: 
> 
> - $\mathbf{A} \cdot(\mathbf{B} \cdot \mathbf{C})=(\mathbf{A} \cdot \mathbf{B}) \cdot \mathbf{C}$ 
> - $\lambda(\mathbf{A} \cdot \mathbf{B})=(\lambda \mathbf{A}) \cdot \mathbf{B}=\mathbf{A} \cdot(\lambda \mathbf{B})$  
> 
> (b) *Distributivgesetze*:
> 
> - $(\mathbf{A}_1+\mathbf{A}_2) \cdot \mathbf{B}=\mathbf{A}_1 \cdot \mathbf{B}+\mathbf{A}_2 \cdot \mathbf{B}$ 
> - $\mathbf{A} \cdot(\mathbf{B}_1+\mathbf{B}_2)=\mathbf{A} \cdot \mathbf{B}_1+\mathbf{A} \cdot \mathbf{B}_2$  
> 
> (c) *Neutrales Element*:
>
> - $\mathbb{1}_m \cdot \mathbf{A}=\mathbf{A} \cdot \mathbb{1}_n=\mathbf{A}$

> [!warning] Die Matrixmultilikation ist **nicht kommutativ**
>  Auch für $m=n=p$ gilt i.a. nicht: $\mathbf{A} \mathbf{B}=\mathbf{B} \mathbf{A}$  

![invert_dark](assets/Pasted%20image%2020250401160610.png)

## Kenngrößen einer Matrix

- [Determinante](Determinante.md)
- [Rang einer Matrix](Rang%20einer%20Matrix.md)
- [Definitheit](Definitheit.md)

## Eigenschaften einer Matrix

- [Reguläre Matrizen](Reguläre%20Matrizen.md)
- [Singuläre Matrizen](Singuläre%20Matrizen.md)
- [Ähnliche Matrizen](Ähnliche%20Matrizen.md)
- [Nilpotente Matrix](Nilpotente%20Matrix.md)

## Operationen auf eine Matrix

- [Invertieren](Gauß-Jordan-Verfahren.md)  
- [Transponieren](Transponieren.md)  
- [Matrixmultiplikation](Matrixmultiplikation.md)

## Elementare Umformungen

Eine quadratische Matrix heißt Elementarmatrix, wenn sie aus der Einheitsmatrix durch eine elementare Zeilenumformung hervorgeht. Somit können wir drei Typen von Elementarmatrizen definieren ($\mathbb{R}^{n\times n}$):

- [Vertauschungsmatrix](Vertauschungsmatrix.md) $T_{i, j}$
- [Skalierungsmatrix](Skalierungsmatrix.md) $S_i(\lambda)$
- [Additionsmatrix](Additionsmatrix.md) $R_{i, j}(\lambda)$

## Besondere Matrizen

- [Einheitsmatrix](Einheitsmatrix.md) $\mathbb{1}_{m}$ 
- [[Rotationsmatrix]] 
- [[Dreiecksmatrix]] 
- [[Diagonalmatrix]]

# Tags

- [Vektorraum](Vektorraum.md)
- [Matrixcalc.org - Matrizenrechner](https://matrixcalc.org/)