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
 

# Maxwell Gleichungen

> [!important] Kenngrößen
>
> | $\mathbf{E}$ | elektrische Feldstärke | $\mathrm{V} / \mathrm{m}$ |
> | :---: | :--- | :---: |
> | $\mathbf{H}$ | magnetische Feldstärke | $\mathrm{A} / \mathrm{m}$ |
> | $\mathbf{D}$ | elektrische Flussdichte | $\mathrm{As} / \mathrm{m}^2$ |
> | $\mathbf{B}$ | magnetische Flussdichte | $\mathrm{Vs} / \mathrm{m}^2$ |
> | $\mathbf{J}$ | elektrische Stromdichte | $\mathrm{A} / \mathrm{m}^2$ |
> | $\rho$ | Raumladungsdichte | $\mathrm{As} / \mathrm{m}^3$ |

## Durchflutungssatz

Die erste Maxwell-Gleichung beschreibt den Zusammenhang zwischen [Strom](elektrischer%20Strom.md)(dichte) I bzw. J und magnetischer Flussdichte B:

$$
\oint_{C} \vec{H} \cdot ds = \int_{A} \vec{J}\cdot d \vec{A} 
$$

und wird als *Durchflutungssatz* bezeichnet.

> [!tldr]  
> In Worten besagt der Durchflutungssatz, dass das Integral der magnetischen *Feldstärke* $H$ entlang einer geschlossenen *Kontur* $C$ (siehe auch Einschub: Linienintegral) gleich dem Integral der *[Stromdichte](Stromdichte.md)* $J$ über die *Fläche* $A$ (siehe auch Einschub: [Flächenintegral](Flächenintegral.md)) ist, wobei die *Fläche* $A$ von der geschlossenen *Kontur* $C$ umrandet wird

## Differenzialform

$$

$$

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

gradient
divergenz
rotation