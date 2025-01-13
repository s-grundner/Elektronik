---
tags: 
aliases:
  - Taylorreihen
  - McLaurenreihe
  - Taylorpolynom
subject:
  - Mathematik 1
  - VL
created: 24th March 2022
professor:
  - Andreas Neubauer
def:
  - TAYL
---

# Taylorreihe

> [!QUESTION] Taylorreihen werden in der Analysis verwendet um Funktionen in der Umgebung eines Punktes durch Potenzreihen darzustellen.

> [!def] **D1 - TAYL)** Sei $f$ eine beliebig oft differenzierbare Funktion, dann heißt die unendliche Reihe:
>
> $$
> \begin{align}
> T(x) &= f(a) + f'(a)(x-a)+\frac{f''(a)}{2}(x-a)^{2}+\dots+\frac{f^{(n)}(a)}{n!}(x-a)^n + \dots \\
> &= \sum_{i=0}^\infty \frac{f^{(i)}(a)}{i!}(x-a)^i\tag{TAYL}
> \end{align}
> $$
>
> Taylorreihe von $f$ mit dem Entwicklungspunkt $a$.
> Die Formulierung bis zu einem endlichen Punkt $n$ dieser Reihe heißt Taylorpolynom mit dem Grad $\deg T(x)=n$ und einem Rest der Ordnung $O(\lvert h^{n+1} \rvert)$

> [!INFO] Entwicklung an der Stelle 0 (McLaurin-Reihe)  
> Für den Fall, dass $a=0$ sprich man von einer *McLaurin-Reihe*

![#invert_dark](taylor.png)
