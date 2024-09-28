---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. September 2024
professor:
---
 

# Linearkombination

> [!important] [Definition 6.5](Basis,%20Dimension%20und%20Teilräume.md) **(a)** Sei $X$ ein $\mathbb{K}$-Vektorraum.
> Ein Element $x \in X$ heißt **Linearkombination** der $n$ Elemente $v_i \in X$, falls es $\lambda_i \in \mathbb{K}, i=1, \ldots, n$, gibt mit:
> 
$$ x=\sum_{i=1}^{k} \lambda_{i} v_{i}$$

## Beweis

Man muss nur die Eindeutigkeit der Darstellung zeigen, die Existenz folgt bereits aus der Definition einer Basis.

Annahme, es gelte für ein $x \in X$ :

$$
x=\sum_{i \in I} x_i^{(1)} b_i=\sum_{i \in I} x_i^{(2)} b_i \Longrightarrow \sum_{i \in I}\left(x_i^{(1)}-x_i^{(2)}\right) b_i=0
$$


Da die $\left\{b_i\right\}$ unabhängig sind, folgt unmittelbar: $x_i^{(1)}=x_i^{(2)}$ für alle $i \in I$.