---
tags: 
aliases:
  - Durchflutungssatz
keywords: 
subject:
  - Einf. ET
  - VL
semester:
  - WS23
  - B1
created: 24th January 2024
professor:
  - Bernhard Jakoby
---
 

# Maxwell

## Durchflutungssatz

Die erste Maxwell-Gleichung beschreibt den Zusammenhang zwischen [Strom](elektrischer%20Strom.md)(dichte) I bzw. J und magnetischer Flussdichte B:

$$
\oint_{C} \vec{H} \cdot ds = \int_{A} \vec{J}\cdot d \vec{A} 
$$

und wird als *Durchflutungssatz* bezeichnet.

> [!tldr]  
> In Worten besagt der Durchflutungssatz, dass das Integral der magnetischen *Feldstärke* $H$ entlang einer geschlossenen *Kontur* $C$ (siehe auch Einschub: Linienintegral) gleich dem Integral der *[Stromdichte](Stromdichte.md)* $J$ über die *Fläche* $A$ (siehe auch Einschub: [Flächenintegral](Flächenintegral.md)) ist, wobei die *Fläche* $A$ von der geschlossenen *Kontur* $C$ umrandet wird

## Integralform

$$
\begin{aligned}
\oint_{\partial A} \mathbf{H} \cdot \mathrm{d} \mathbf{s} & =\int_A \mathbf{J} \cdot \mathrm{d} \mathbf{A}+\int_A \frac{\partial \mathbf{D}}{\partial t} \cdot \mathrm{d} \mathbf{A} \\
\oint_{\partial A} \mathbf{E} \cdot \mathrm{d} \mathbf{s} & =-\int_A \frac{\partial \mathbf{B}}{\partial t} \cdot \mathrm{d} \mathbf{A} \\
\oint_{\partial V} \mathbf{D} \cdot \mathrm{d} \mathbf{A} & =\int_V \rho \mathrm{d} V \\
\oint_{\partial V} \mathbf{B} \cdot \mathrm{d} \mathbf{A} & =0
\end{aligned}
$$

## Materialgleichungen

$$
\begin{aligned}
\mathbf{B} & =\mu \mathbf{H} \\
\mathbf{D} & =\varepsilon \mathbf{E} \\
\mathbf{J} & =\sigma \mathbf{E}
\end{aligned}
$$

## Mathematische Grundbegriffe

Der Nabla-Operator ist (hier für das kartesische Koordinatensystem) definiert als
$$
\nabla:=\left(\begin{array}{c}
\frac{\partial}{\partial x} \\
\frac{\partial}{\partial y} \\
\frac{\partial}{\partial z}
\end{array}\right)=\frac{\partial}{\partial x} \mathbf{e}_x+\frac{\partial}{\partial y} \mathbf{e}_y+\frac{\partial}{\partial z} \mathbf{e}_z,
$$
wobei $\mathbf{e}_{x, y, z}$ die Einheitsvektoren in $x, y, z$-Richtungen sind
Der Nabla-Operator ist Operator und Vektor in einem, d.h. mit inm lässt sich wie mit einem Vektor rechnen
Der Nabla-Operator lässt sich sowohl auf partiell differenzierbare Skalarfelder als auch auf partiell differenzierbare Vektorfelder anwenden