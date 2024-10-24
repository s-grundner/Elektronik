---
tags: 
aliases:
  - Durchflutungssatz
  - MWG
keywords: 
subject:
  - Elektrotechnik
  - VL
semester: SS24
created: 24th January 2024
professor:
  - Bernhard Jakoby
---
 

# Maxwell Gleichungen

## Übersicht

> [!important] Kenngrößen
>
> | $\mathbf{E}$ | elektrische Feldstärke | $\operatorname{V} / \mathrm{m}$ |
> | :---: | :--- | :---: |
> | $\mathbf{H}$ | magnetische Feldstärke | $\mathrm{A} / \mathrm{m}$ |
> | $\mathbf{D}$ | elektrische Flussdichte | $\mathrm{As} / \mathrm{m}^2$ |
> | $\mathbf{B}$ | magnetische Flussdichte | $\mathrm{Vs} / \mathrm{m}^2$ |
> | $\mathbf{J}$ | elektrische [Stromdichte](Stromdichte.md) | $\mathrm{A} / \mathrm{m}^2$ |
> | $\rho$ | Raumladungsdichte | $\mathrm{As} / \mathrm{m}^3$ |


## Differentielle und integrale Formulierung


| differentielle Form | verknüpfender Integralsatz | Integralform |
| ------------------- | :------------------------: | ------------ |
|                     | Gauß                       |              |

### Differenzialform

$$
\begin{align}
\operatorname{rot} \mathbf{H} & = \nabla \times \mathbf{H}=\mathbf{J}+\frac{\partial \mathbf{D}}{\partial t} \tag{D.1}\\
\operatorname{rot} \mathbf{E} & = \nabla \times \mathbf{E}=-\frac{\partial \mathbf{B}}{\partial t} \tag{D.2} \\
\operatorname{div} \mathbf{D} & = \nabla \cdot \mathbf{D}=\rho \tag{D.3} \\
\operatorname{div} \mathbf{B} & = \nabla \cdot \mathbf{B}=0\tag{D.4}
\end{align}
$$

### Integralform

$$
\begin{align}
\oint_{\partial A} \mathbf{H} \cdot \mathrm{d} \mathbf{s} & =\int_A \mathbf{J} \cdot \mathrm{d} \mathbf{A}+\int_A \frac{\partial \mathbf{D}}{\partial t} \cdot \mathrm{d} \mathbf{A} \tag{I.1}\\
\oint_{\partial A} \mathbf{E} \cdot \mathrm{d} \mathbf{s} & =-\int_A \frac{\partial \mathbf{B}}{\partial t} \cdot \mathrm{d} \mathbf{A} \tag{I.2}\\
\oint_{\partial V} \mathbf{D} \cdot \mathrm{d} \mathbf{A} & =\int_V \rho \mathrm{d} V \tag{I.3} \\
\oint_{\partial V} \mathbf{B} \cdot \mathrm{d} \mathbf{A} & =0 \tag{I.4}
\end{align}
$$



### Materialgleichungen

$$
\begin{align}
\mathbf{B} & =\mu \mathbf{H} \tag{M.1}\\
\mathbf{D} & =\varepsilon \mathbf{E} \tag{M.2} \\
\mathbf{J} & =\sigma \mathbf{E} \tag{M.3}
\end{align}
$$

### Mathematische Grundbegriffe

- [Nabla Operator](../Mathematik/Nabla%20Operator.md): $\nabla$
- [Gradient](../Mathematik/Gradient.md): $\operatorname{grad} \,\mathbf{F} = \nabla \mathbf{F}$
- Divergenz: $\operatorname{div}\, \mathbf{F} = \nabla \cdot\mathbf{F}$
- Rotation: $\operatorname{rot}\, \mathbf{F} = \nabla \times \mathbf{F}$

## Durchflutungssatz

Die erste Maxwell-Gleichung beschreibt den Zusammenhang zwischen [Strom](elektrischer%20Strom.md)(dichte) I bzw. J und magnetischer Flussdichte B:

$$
\oint_{C} \vec{H} \cdot ds = \int_{A} \vec{J}\cdot d \vec{A} 
$$

und wird als *Durchflutungssatz* bezeichnet.

> [!tldr]  
> In Worten besagt der Durchflutungssatz, dass das Integral der magnetischen *Feldstärke* $H$ entlang einer geschlossenen *Kontur* $C$ (siehe auch Einschub: Linienintegral) gleich dem Integral der *[Stromdichte](Stromdichte.md)* $J$ über die *Fläche* $A$ (siehe auch Einschub: [Flächenintegral](Flächenintegral.md)) ist, wobei die *Fläche* $A$ von der geschlossenen *Kontur* $C$ umrandet wird


# Tags