---
tags:
aliases:
  - Wirtinger Calculus
subject:
  - SE
  - Bachelorarbeit
semester: SS26
created: 8th April 2026
professor:
release: false
title: Wirtinger Kalkül
---

# Wirtinger Kalkül


> [!def] **D - WIRT)** Sei $z = x + iy$ und $z^{*} = x - iy$
> 
> Die Wirtinger-Ableitungen sind definiert als die partielle differenzial operatoren für komplexe funktionen nach $z$ und $z^{*}$
> 
> $$
> \begin{align}
> \frac{ \partial }{ \partial z} = \frac{1}{2} \left( \frac{ \partial }{ \partial x } - i\frac{ \partial }{ \partial y } \right)  \\
> \frac{ \partial }{ \partial z^{*}} = \frac{1}{2} \left( \frac{ \partial }{ \partial x } + i\frac{ \partial }{ \partial y } \right)
> \end{align}
> $$

## Eigenschaften

### Konjugation

$$
\begin{align}
\frac{ \partial z^{*} }{ \partial z } = \frac{1}{2} \left( \frac{ \partial }{ \partial x } - i\frac{ \partial }{ \partial y } \right) (x-iy) = \frac{1}{2}(1-1) = 0 \\
\frac{ \partial z }{ \partial z^{*} } = \frac{1}{2} \left( \frac{ \partial }{ \partial x } + i\frac{ \partial }{ \partial y } \right) (x+iy) = \frac{1}{2}(1-1) = 0
\end{align}
$$

Anhand dieser identität erkennt man, dass die Ableitung nach der Konjugation so betrachtet werden kann, als würde man nach einer andern Variable ableiten, da

$$
\frac{ \partial a }{ \partial b } = 0 \quad \text{wenn} \quad a \neq f(b)
$$

### Magnitude


$$
\begin{align}
\frac{ \partial }{ \partial z } zz^{*} &= \frac{1}{2} \left( \frac{ \partial }{ \partial x } - i\frac{ \partial }{ \partial y } \right)(x^{2}+y^{2}) \\
&= \frac{1}{2}(2x -i2y) = x-iy = z^{*}
\end{align}
$$

> [!hint] $zz^{*} = \left| z \right|^{2} =x^{2}+y^{2}$

### Quadrat

$$
\begin{align}
\frac{ \partial }{ \partial z } z^{2} &= \frac{1}{2} \left( \frac{ \partial }{ \partial x } - i\frac{ \partial }{ \partial y } \right) \left( x^{2}-y^{2}+i 2xy \right) \\
&= \frac{1}{2} ( 2x+i 2y -i(-2y + i 2x))  \\
&= \frac{1}{2} ( 2x+i 2y +i2y + 2x) \\
&= \frac{4x+4y}{2} = 2x+i 2y = 2z
\end{align}
$$

> [!hint] $z^{2} = x^{2}+y^{2}-i 2xy$

Äquivalent zur klassischen Ableitung.

### Allgemeine Potenz

Methode 1: Die Potenz einer Komplexen Zahl lässt sich als [Binom](../../Binom.md) anschreiben:

$$
z^{n} = (x+iy)^{n} = \sum_{k=0}^{n} \binom{n}{k} x ^{n}(iy)^{n-k}
$$

Die Ableitung diese Terms ist dann

$$
\frac{ \partial }{ \partial z } z^{n} = \frac{1}{2} \left( \frac{ \partial }{ \partial x } - i\frac{ \partial }{ \partial y } \right) \sum_{k=0}^{n} \binom{n}{k} x ^{n}(iy)^{n-k}
$$

Methode 2: Kettenregel