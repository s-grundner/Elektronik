---
tags: [tikz]
aliases:
  - Fundamentalsatz der Algebra
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester: 1
created: 30. Oktober 2023
professor:
---
 

# Polynom

> [!INFO] $f(x) = \sum_{i=0}^na_{i}x^{i}$ mit $a_{n}\neq 0$  
> über $\mathbb{R}$: $f: \mathbb{R}\to \mathbb{R}$  
> über $\mathbb{C}$: $f: \mathbb{C}\to \mathbb{C}$

> [!important] Fundamentalsatz der Algebra:
Ein Polynom $n$-ten Grades über den komplexen Zahlen (d.h. $a_i \in \mathbb{C} \forall i$ und $x \in \mathbb{C}$ ) hat genau $n$ Nullstellen $N_f=\{x \mid f(x)=0\}$ (Vielfachheiten mitgezählt).
Komplexe Nullstellen treten bei Polynomen mit reellen Koeffizienten $\left(a_i \in \mathbb{R} \forall i\right.$ ) immer als komplex-konjugierte Paare auf.

> [!example] Beispiel:
> - $n$-te Wurzel aus $y$ berechnen (siehe Vorlesungseinheit zu den komplexen Zahlen) $\Leftrightarrow x^n=y$ lösen $\Leftrightarrow$ Nullstellen des Polynoms $f(x)=-y+x^n$ berechnen

![invert_dark](polyGraph.png)

## Rationale Funktion

> [!INFO] $f(x)=\frac{p(x)}{q(x)}$ wobei $p(x), q(x)$ teilerfremde Polynome
> 
$f: \mathbb{R}(\mathbb{C}) \backslash N_q \rightarrow \mathbb{R}(\mathbb{C})$
> - $f(x)$ hat über $\mathbb{C}$ wieder $n$ Nullstellen, wenn $n$ der Grad von $p(x)$ ist
> - an den Nullstellen des Polynoms im Nenner $(q(x))$ muss das asymptotische Verhalten von $f(x)$ untersucht werden
> - weitere Details siehe Mathematik-Vorlesung

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[thick, axis lines=middle, xmin=0, ymin=0, xmax=1, ymax=1]
\addplot[]
1/x;


\end{axis}
\end{tikzpicture}

\end{document}
```

![invert_dark](polyPolstellen.png)

## Koeffizientenvergleich

Zwei Polynomfunktionen $p(x) := \sum_{i=0}^n a_{i}x^i$ und $q(x)=\sum_{i=0}^n b_{i}x^i$ sind äquivalent, wenn deren Koeffizienten $a_{i} b_{i}$ gleich sind

# Tags

[Polynomdivision](Polynomdivision.md)