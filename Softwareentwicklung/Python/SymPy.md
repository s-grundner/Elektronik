---
tags: 
aliases: 
created: 9th May 2025
title: 
release: false
---

# SymPy

```py
import sympy as sp
```

---

## Symbole Definieren

Importieren von *single letter* symbolen `'a'` und `'c'`:

```py
from sympy.abc import a, c
```

Erzegen von mehreren, multiletter symbolen `'a'` und `'beta'` auf einmal und speichern in den variablen `a` und `c`.

```py
a, c = sp.symbols('a beta')
```

## Lineare Algebra 

Definiere Vektoren und Matrixen, welche Symbole beinhalten mit der `Matrix` Klasse. 

$$
\mathbf{A} = \begin{bmatrix}
a & 1 \\ 2 & 1
\end{bmatrix}, \quad \mathbf{b} = \begin{bmatrix} 2 \\ \beta \end{bmatrix}
$$

```py
A = sp.Matrix([[a, 1], [2, 1]])
b = sp.Matrix([3, c])
```

Matrizen können wie Arrays indeziert werden. z.B. ist `A[1, 0]=2`.

### Substitutions and Evaluation

To evaluate equations to retrieve a numeric value, the symbols can be substituted.

```py
t = 1
A.subs(a, 0) * b.subs(c, t) # = [1, 5]
```

Here, a Matrix-Vector Multiplication is performed, resulting in a new vector of size $2 \times 1$ 

### Lösen von LGS mit Symbolen



---

- https://youtu.be/1yBPEPhq54M?si=kfBM31jLGguCffFR
- https://www.sympy.org/en/index.html