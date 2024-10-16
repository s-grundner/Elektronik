---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 17. Oktober 2024
professor:
---
 

# DGL System

Um Differenzialgleichungen höherer Ordnung leichter lösen zu können, kann diese in ein System aus Differenzialgleichungen erster ORdnung überführt werden. 

> [!info] Jede DGL $n$-ter Ordnung lässt sich in ein [[DGL-System]] überführen
> $$
> F(t,x,x',\dots,x^{(n)})=0\quad \iff \begin{cases}
> x_{1}=x' \\
> x_{2}=x_{1}'' \\
> \quad\vdots  \\
> x_{n-1} = x_{n-1}' \\
> \end{cases}
> $$
> 

Hierfür werden Hilfsfunktionen $x_{k}$ eingeführt. Man erhält durch die Setzung 
$$ x_{k}:=x^{(k-1)}, \quad k= 1,\dots,n$$
folgendes DGL-System erster Ordnung:

$$ 
\begin{align}
x_{k}'&=x_{k+1}, \quad  k=1, \dots,n-1 \\
F(t,x_{1},\dots,x_{n},x_{n}') & =0
\end{align}
$$

[Transformation in DGL-Systeme 1. Ordnung](https://studyflix.de/mathematik/transformation-in-system-1-ordnung-943)