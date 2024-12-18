---
tags:
  - tikz
aliases:
  - Fundamentalsatz der Algebra
  - Nullstellen
  - Nullstelle
  - NST
keywords: 
subject:
  - VL
  - Mathematik 1
  - KV
semester: WS23
created: 30. Oktober 2023
professor: 
satz:
  - FUND
---
 

# Polynom

> [!def] **D1 - POLY)** $f(x) = \sum_{i=0}^na_{i}x^{i}$ mit $a_{n}\neq 0$  
> über $\mathbb{R}$: $f: \mathbb{R}\to \mathbb{R}$  
> über $\mathbb{C}$: $f: \mathbb{C}\to \mathbb{C}$

> [!satz] **FUND S1)** Fundamentalsatz der Algebra:
> Ein Polynom $n$-ten Grades über den komplexen Zahlen (d.h. $a_i \in \mathbb{C} \forall i$ und $x \in \mathbb{C}$ ) hat **genau** $n$ Nullstellen (Vielfachheiten mitgezählt). Mit der Menge aller Nullstellen definiert als:
> 
> $$N_f=\{x \mid f(x)=0\}\tag{NST}$$
>
> Komplexe Nullstellen treten bei Polynomen mit reellen Koeffizienten $\left(a_i \in \mathbb{R} \forall i\right.$ ) immer als komplex-konjugierte Paare auf, also in der Form $z=x\pm iy$.

> [!example] Beispiel:
> - $n$-te Wurzel aus $y$ berechnen (siehe Vorlesungseinheit zu den komplexen Zahlen) $\Leftrightarrow x^n=y$ lösen $\Leftrightarrow$ Nullstellen des Polynoms $f(x)=-y+x^n$ berechnen

![invert_dark](polyGraph.png)

## Rationale Funktion

> [!info] $f(x)=\frac{p(x)}{q(x)}$ wobei $p(x), q(x)$ teilerfremde Polynome
> 
$f: \mathbb{R}(\mathbb{C}) \backslash N_q \rightarrow \mathbb{R}(\mathbb{C})$
> - $f(x)$ hat über $\mathbb{C}$ wieder $n$ Nullstellen, wenn $n$ der Grad von $p(x)$ ist
> - an den Nullstellen des Polynoms im Nenner $(q(x))$ muss das asymptotische Verhalten von $f(x)$ untersucht werden
> - weitere Details siehe Mathematik-Vorlesung



![invert_dark](polyPolstellen.png)

## Koeffizientenvergleich

Zwei Polynomfunktionen $p(x) := \sum_{i=0}^n a_{i}x^i$ und $q(x)=\sum_{i=0}^n b_{i}x^i$ sind äquivalent, wenn deren Koeffizienten $a_{i} b_{i}$ gleich sind

# Tags

[Polynomdivision](Polynomdivision.md)