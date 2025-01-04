---
tags: 
aliases:
  - Rotation
  - Curl
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: SS24
created: 4. Januar 2025
professor:
  - Andreas Springer
def:
  - ROT
---
 

# Rotor

Der Rotor ist ein Vektoroperator, der auf ein Vektorfeld im $\mathbb{R}^3$ angewendet wird.

> [!warning] Nur im $\mathbb{R}^3$
> Der Rotor eines Vektorfeldes liefert wiederum Vektorfeld, das die lokale Drehung des ursprünglichen Vektorfeldes beschreibt.


> [!def] **D1 - ROT)** Der Rotor eines $\mathbb{R}^3$ Vektorfeldes $\mathbf{F} = (F_x, F_y, F_z)$ ist definiert als:
>
>$$\mathrm{rot} \,\mathbf{F} := \nabla \times \mathbf{F}$$

Konservative Vektorfelder sind wirbelfrei. Das bedeutet, dass das Vektorfeld in einem konservativen Vektorfeld keine Drehung aufweist bzw. einen verschwindenden Rotor haben. 

> [!satz] Der Rotor eines Gradientenfeldes ist immer Null:
>
> $$\operatorname{rot}\operatorname{grad}f = 0 \iff \nabla \times \nabla f = 0$$
> 
> Das Vektorfeld ist genau dann der Gradient einer Funktion, wenn die Rotation des Vektorfeldes im betrachteten Gebiet gleich null ist.
