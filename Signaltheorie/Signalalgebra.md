---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 23. Oktober 2024
professor:
---
 

# Signale und Algebraische Strukturen

## Skalarprodukt auf Signale

Das [innere Produkt](../Mathematik/Algebra/Skalarprodukt.md) für:

- zeitkontinuierliche [Signale](Signale.md) $\mathbf{x}, \mathbf{y} \in L_2(a, b)$ lautet

$$
\langle\mathbf{x}, \mathbf{y}\rangle=\langle x(t), y(t)\rangle=\int_a^b x^*(t) y(t) \mathrm{d} t
$$

- und für zeitdiskrete Signale $\mathbf{x}, \mathbf{y} \in l_2\left(n_1, n_2\right)$ gilt

$$
\langle\mathbf{x}, \mathbf{y}\rangle=\langle x[n], y[n]\rangle=\sum_{n=n_1}^{n_2} x^*[n] y[n]
$$


> [!warning] Anmerkung:
> Beachte, die Konjugation wurde definitionsgemäß am ersten Parameter durchgeführt.

### diskrete Signale

In Matrixschreibweise kann man dies vereinfacht schreiben als

$$
\langle\mathbf{x}, \mathbf{y}\rangle=\langle x[n], y[n]\rangle=\mathbf{x}^H \mathbf{y}
$$

wobei

$$
\mathbf{x}=\left(x\left[n_1\right], x\left[n_1+1\right], \ldots, x\left[n_2\right]\right)^T \quad \text { und } \quad \mathbf{y}=\left(y\left[n_1\right], y\left[n_1+1\right], \ldots, y\left[n_2\right]\right)^T
$$

Spaltenvektoren sind.

> [!question] Dabei bedeutet $(\cdot)^H$ eine Hermitsche Transposition.
> d.h. Konjugation $(\cdot)^*$ und Transposition $(\cdot)^T$ zusammen.

Im rellen vereinfacht sich dies zu

$$
\langle\mathbf{x}, \mathbf{y}\rangle=\mathrm{x}^T \mathbf{y}=\mathbf{y}^T \mathbf{x}=\mathbf{x} \cdot \mathbf{y}
$$

mit $(\cdot)$ als dem bekannten Skalarprodukt von Vektoren im $\mathbb{R}^n$.
Für Zeilenvektoren gilt

$$
\langle\mathbf{x}, \mathbf{y}\rangle=\mathrm{x}^T \mathbf{y}^T=\mathbf{y} \mathbf{x}^T
$$
