---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 25th March 2026
professor:
release: false
title: Mulitplexer
---

# Multiplexer

> [!question] [Kombinatorische Logik](Kombinatorische%20Logik.md)

Ein $n$-Bit-Multiplexer ($\operatorname{MUX}_{n}$) ist ein Schaltkreis, der die folgende Funktion berechnet

$$
\operatorname{sel}_{n} : \mathbb{B}^{2n+1} \to \mathbb{B}^n
$$

$$
\operatorname{sel}_{n} (\mathbf{a}, \mathbf{b},s) = \begin{cases}
\mathbf{a}, &\text{falls } s=1 \\
\mathbf{b}, &\text{falls } s=0
\end{cases}
$$

$$
\mathbf{a} = \begin{bmatrix}
a_{0} \\ \vdots \\ a_{n-1}
\end{bmatrix} \qquad 
\mathbf{b} = \begin{bmatrix}
b_{0} \\ \vdots \\ b_{n-1}
\end{bmatrix}
$$


$$
(\operatorname{sel}_{n})_{i} = s\cdot a_{i} + \neg s\cdot b_{i}
$$

## Realisierung

$n$-Bit Multiplexer:

![](../_assets/Pasted%20image%2020260325145851.png)

Kosten eines $n$-Bit MUX

![invert_dark|200](../_assets/Pasted%20image%2020260325150033.png)

- Gatter: $3n + 1$
- Tiefe: $3$