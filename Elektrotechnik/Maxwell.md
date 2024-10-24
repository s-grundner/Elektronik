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

### 1. MWG - Gaußsches Gesetz

| differentielle Form |                     verknüpfender Integralsatz                      | Integralform |
| ------------------- |:-------------------------------------------------------------------:| ------------ |
|                     | [Gaußscher Integralsatz](../Mathematik/Gaußscher%20Integralsatz.md) |              |

$$
\operatorname{div} \mathbf{B} = \nabla \cdot \mathbf{B}=0
\quad\underset{ \text{ Gauss } }{ \iff } \quad 
\oint_{\partial V} \mathbf{D} \cdot \mathrm{d} \mathbf{A} =\int_V \rho \mathrm{d} V \tag{MW.1}

$$

### 2. MWG - Quellenfreiheit des B-Feldes

| differentielle Form | verknüpfender Integralsatz | Integralform |
| ------------------- | :------------------------: | ------------ |
|                     |   Gaußscher Integralsatz   |              |

$$
\operatorname{div} \mathbf{D} = \nabla \cdot \mathbf{D}=\rho
\quad\underset{ \text{ Gauss } }{ \iff } \quad 

$$

### 3. MWG - Induktionsgesetz

| differentielle Form |                       verknüpfender Integralsatz                        | Integralform |
| ------------------- |:-----------------------------------------------------------------------:| ------------ |
|                     | [Stokesscher Integralsatz](../Mathematik/Stokesscher%20Integralsatz.md) |              |

$$
\operatorname{rot} \mathbf{E} = \nabla \times \mathbf{E}=-\frac{\partial \mathbf{B}}{\partial t}
\quad\underset{ \text{ Stokes } }{ \iff } \quad 
\oint_{\partial A} \mathbf{E} \cdot \mathrm{d} \mathbf{s} =-\int_A \frac{\partial \mathbf{B}}{\partial t} \cdot \mathrm{d} \mathbf{A}
$$

### 4. MWG - Durchflutungssatz

> [!quote] Auch *Ampèresches Gesetz*

| differentielle Form | verknüpfender Integralsatz | Integralform |
| ------------------- |:--------------------------:| ------------ |
|                     |  Stokesscher Integralsatz  |              |

$$
\operatorname{rot} \mathbf{H} = \nabla \times \mathbf{H}=\mathbf{J}+\frac{\partial \mathbf{D}}{\partial t}
\quad\underset{ \text{ Stokes } }{ \iff }\quad
\oint_{\partial A} \mathbf{H} \cdot \mathrm{d} \mathbf{s} =\int_A \mathbf{J} \cdot \mathrm{d} \mathbf{A}+\int_A \frac{\partial \mathbf{D}}{\partial t} \cdot \mathrm{d} \mathbf{A}
$$

### Differenzialform

$$
\begin{align}

\end{align}
$$

### Integralform

$$
\begin{align}
\oint_{\partial V} \mathbf{B} \cdot \mathrm{d} \mathbf{A} =0
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