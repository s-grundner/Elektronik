---
tags: 
aliases:
  - Matrix-Exponentialfunktion
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 
# Lineare [DGL-Systeme](Analysis/DGL-System.md) 1. Ordnung mit konstantem Koeffizienten

$$
\begin{aligned}
\dot{x}= A\cdot x,\quad x(t_{0}), \quad x \in\mathbb{R}^{m}, \quad A\in \mathbb{R}^{m\times m}
\end{aligned}
$$

$A$ ist jetzt nicht mehr von $t$ Abhängig

> [!question] Erinnerung an das 2-Dimensionale System $m=1$:
$$ \dot{x}=a\cdot x \implies x(t)=c\cdot e^{a\cdot t} $$

Mit diesem Ansatz kommt man auch zu einer Lösung für $m>1$: 
Und zwar mit der Matrix-Exponentialfunktion. $a$ wird zur Matrix $A$.

## Matrix-Exponentialfunktion

Die Potenz-Reihe der Exponentialfunktion kann auf Matrizen erweitert werden:



$$
e^{at} = \sum_{k=0}^{\infty}\frac{(at)^{k}}{k!}
$$

> [!important] **Definition**: Matrix-Exponentialfunktion
> $$ e^{ B } := \sum_{k=0}^{\infty}\frac{B^{k}}{k!} $$

Sei $x(t) = e^{ tA }\cdot C$ Dann gilt

$$
\begin{align}
x'(t)&=\left( \sum_{k=0}^{\infty} \frac{t^k A^k}{k!}\right)' \cdot C =\left( \sum_{k=0}^{\infty} \frac{k \cdot t^{k-1} A^k}{k!} \right) \cdot C \\
&= A \cdot \sum_{k=0}^{\infty} \frac{t^k A^k}{k!} \cdot C = A \cdot x(t)
\end{align}
$$

A wird herausgehoben und für k-1 wird ein indexshift durchgeführt. 


$e^{ At }C$ ist also die allgemeine Lösung von $\dot{x}=Ax$.

## Fundamentalmatrix

$$
e^{(t-t_{0}) A }=e^{ tA }\cdot e^{ -t_{0}A }
$$