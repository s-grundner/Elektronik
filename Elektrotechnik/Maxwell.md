---
tags: 
aliases:
  - Durchflutungssatz
  - MWG
  - Gaußsches Gesetz
keywords: 
subject:
  - Elektrotechnik
  - VL
semester: SS24
created: 24th January 2024
professor:
  - Bernhard Jakoby
def:
  - MW1
  - MW2
  - MW3
  - MW4
  - M1
  - M2
  - M3
---
 

# Maxwell Gleichungen

## Übersicht

> [!important] Kenngrößen
>
> | Symbol | Bedeutung | Einheit |
> | :---: | :--- | :---: |
> | $\mathbf{E}$ | elektrische [Feldstärke](Elektrisches%20Feld.md) | $\operatorname{V} / \mathrm{m}$ |
> | $\mathbf{H}$ | magnetische Feldstärke | $\mathrm{A} / \mathrm{m}$ |
> | $\mathbf{D}$ | elektrische Flussdichte | $\mathrm{As} / \mathrm{m}^2$ |
> | $\mathbf{B}$ | magnetische Flussdichte | $\mathrm{Vs} / \mathrm{m}^2$ |
> | $\mathbf{J}$ | elektrische [Stromdichte](Stromdichte.md) | $\mathrm{A} / \mathrm{m}^2$ |
> | $\rho$ | Raumladungsdichte | $\mathrm{As} / \mathrm{m}^3$ |
>
> Fettgedruckte Größen sind Vektorfelder mit den wichtigsten $\mathbf{E}$ und $\mathbf{B}$

## Differentielle und integrale Formulierung

Die Umrechnung zwischen der differentiellen und integralen Formulierung der Maxwell Gleichung erfolgt mit den Integralsätzen:

- [Gaußscher Integralsatz](../Mathematik/Analysis/Gaußscher%20Integralsatz.md)
- [Stokesscher Integralsatz](../Mathematik/Stokesscher%20Integralsatz.md)

### 1. MWG - Gaußsches Gesetz

| **differentielle Form**                                                                                           | **verknüpfender Integralsatz** | **Integralform**                                                                                                                                                |
| ----------------------------------------------------------------------------------------------------------------- | :----------------------------: | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Das $\mathbf{D}$-Feld ist ein Quellenfeld. Die Ladung (Ladungsdichte $\rho$ ) ist Quelle des elektrischen Feldes. |              Gauß              | Der (elektrische) Fluss durch die geschlossene Oberfläche $\partial V$ eines Volumens $V$ ist direkt proportional zu der elektrischen Ladung in seinem Inneren. |

> [!def] **D1 - Gaußsches Gesetz)** 
> $$
> \operatorname{div} \mathbf{B} = \nabla \cdot \mathbf{B}=0
> \quad\underset{ \text{ Gauss } }{ \iff } \quad 
> \oint_{\partial V} \mathbf{D} \cdot \mathrm{d} \mathbf{A} =\int_V \rho \mathrm{d} V \tag{MW1}
> $$

### 2. MWG - Quellenfreiheit des B-Feldes

| **differentielle Form**                                                                                                                 | **verknüpfender Integralsatz** | **Integralform**                                                                                                                                                                   |
| --------------------------------------------------------------------------------------------------------------------------------------- | :----------------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Das $\mathbf{B}$-Feld ist quellenfrei. Es gibt keine magnetischen Monopole. Das heißt es muss zu jedem Nordpol auch einen Südpol geben. |              Gauß              | Der magnetische Fluss durch die geschlossene Oberfläche eines Volumens ist gleich der magnetischen Ladung in seinem Inneren, nämlich Null, da es keine magnetischen Monopole gibt. |

$$
\boxed{ \operatorname{div} \mathbf{D} = \nabla \cdot \mathbf{D}=\rho
\quad\underset{ \text{ Gauss } }{ \iff } \quad 
\oint_{\partial V} \mathbf{B} \cdot \mathrm{d} \mathbf{A} =0 } \tag{MW2}
$$

### 3. MWG - Induktionsgesetz

> [!quote] Auch *Faradaysches Induktionsgesetz*

| **differentielle Form**                                                                                                                                                                    | **verknüpfender Integralsatz** | **Integralform**                                                                                                                                                       |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | :----------------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Jede Änderung des $\mathbf{B}$-Feldes führt zu einem elektrischen Gegenfeld.<br>Die Wirbel des elektrischen Feldes sind von der zeitlichen Änderung der magnetischen Flussdichte abhängig. |             Stokes             | Die (elektrische) Zirkulation über der Randkurve $\partial A$ einer Fläche $A$ ist gleich der negativen zeitlichen Änderung des magnetischen Flusses durch die Fläche. |

$$
\boxed{ \operatorname{rot} \mathbf{E} = \nabla \times \mathbf{E}=-\frac{\partial \mathbf{B}}{\partial t}
\quad\underset{ \text{ Stokes } }{ \iff } \quad 
\oint_{\partial A} \mathbf{E} \cdot \mathrm{d} \mathbf{s} =-\int_A \frac{\partial \mathbf{B}}{\partial t} \cdot \mathrm{d} \mathbf{A} } \tag{MW3}
$$

### 4. MWG - Durchflutungssatz

> [!quote] Auch *Ampèresches Gesetz*

| **differentielle Form**                                                                                                              | **verknüpfender Integralsatz** | **Integralform**                                                                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------ | :----------------------------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Die Wirbel des Magnetfelds hängen von der Leitungsstromdichte $\mathbf{J}_{l}$ und von der elektrischen Flussdichte $\mathbf{D}$ ab. |             Stokes             | Die magnetische Zirkulation über der Randkurve $\partial A$ einer Fläche $A$ ist gleich der Summe aus dem Leitungsstrom und der zeitlichen Änderung des elektrischen Flusses durch die Fläche. |

$$
\boxed{ \operatorname{rot} \mathbf{H} = \nabla \times \mathbf{H}=\mathbf{J}_{l}+\underbrace{ \frac{\partial \mathbf{D}}{\partial t} }_{ \mathbf{J}_{v} }
\quad\underset{ \text{ Stokes } }{ \iff }\quad
\oint_{\partial A} \mathbf{H} \cdot \mathrm{d} \mathbf{s} =\int_A \mathbf{J}_{l} \cdot \mathrm{d} \mathbf{A}+\int_A \frac{\partial \mathbf{D}}{\partial t} \cdot \mathrm{d} \mathbf{A} } \tag{MW4}
$$

> [!info] Die zeitliche änderung von $\mathbf{D}$ wrd auch als verschiebungsstromdichte $\mathbf{J}_{v}$ bezeichnet. 
> Die Summe von $\mathbf{J}_{l}$ und $\mathbf{J}_{v}$ ergibt die totale Stromdichte $\mathbf{J}_{\text{total}}=\mathbf{J}_{l}+\mathbf{J}_{v}$ 

> [!tldr]  
> In Worten besagt der Durchflutungssatz, dass das Integral der magnetischen *Feldstärke* $H$ entlang einer geschlossenen *Kontur* $C$ (siehe auch Einschub: Linienintegral) gleich dem Integral der *[Stromdichte](Stromdichte.md)* $J$ über die *Fläche* $A$ (siehe auch Einschub: [Flächenintegral](Flächenintegral.md)) ist, wobei die *Fläche* $A$ von der geschlossenen *Kontur* $C$ umrandet wird

## Materialgleichungen

$$
\begin{align}
\mathbf{B} & =\mu \mathbf{H} \tag{M1}\\
\mathbf{D} & =\varepsilon \mathbf{E} \tag{M2} \\
\mathbf{J} & =\sigma \mathbf{E} \tag{M3}
\end{align}
$$

## Mathematische Grundbegriffe

- [Nabla Operator](../Mathematik/Analysis/Nabla%20Operator.md): $\nabla$
- [Gradient](../Mathematik/Analysis/Gradient.md): $\operatorname{grad} \,\mathbf{F} = \nabla \mathbf{F}$
- Divergenz: $\operatorname{div}\, \mathbf{F} \equiv \nabla \cdot\mathbf{F}$
- Rotation: $\operatorname{rot}\, \mathbf{F} \equiv \nabla \times \mathbf{F}$

# Tags

![The 4 Maxwell Equations. Get the Deepest Intuition! - YouTube](https://www.youtube.com/watch?v=hJD8ywGrXks)
