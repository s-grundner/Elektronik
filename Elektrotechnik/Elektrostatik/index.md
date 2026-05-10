---
tags:
aliases:
  - Elektrostatik
keywords:
subject:
  - VL
  - Elektrotechnik
  - Theoretische Elektrotechnik
semester: SS26
created: 8th May 2026
professor:
title: index
release: true
---
 

# Elektrostatik

> [!info] In der Elektrostatik betrachten wir nur das zeitlich konstante elektrische Feld
> 
> Daher reduzieren sich die für das E-Feld relevanten [Maxwellgleichungen](Maxwell.md) 1 und 3 zu:
>
> $$
> \begin{align}
> \nabla \times \mathbf{E}&=0, && \oint_{\partial A} \mathbf{E} \cdot \mathrm{d} \mathbf{s}=0 \tag{MW1}\\
> \varepsilon\nabla \cdot \mathbf{E} &=\rho, && \varepsilon\oint_{\partial V} \mathbf{E} \cdot \mathrm{d} \mathbf{A}=\int_V \rho \mathrm{d} V\tag{MW3}
> \end{align}
> $$
> 

- MW3: Wird verwendet, um die **elektrische Feldstärke** aus einer **Ladungsverteilung** in einem Volumen zu beschreiben.
- MW1: Wird verwendet um das **elektrische Potenzial** aus der **elektrischen Feldstärke** zu berechnen

## Elektrisches Feld

Zur Ermittlung des Elektrischen Feldes $\mathbf{E}$ bei einer **bekannten Raumladungsverteilung** $\rho(\mathbf{r})$ im Material werden die Integrale der [3. Maxwellgleichung](../Maxwell.md#3.%20MWG%20-%20Gaußsches%20Gesetz) (*Satz vom Hüllenfluss / Gaußsches Gesetz*) - gelößt.

$$
\varepsilon\oint_{\partial V} \mathbf{E}\cdot\mathrm{d}\mathbf{a} = \int_{V}\rho(\mathbf{r})\mathrm{~d}V(\mathbf{r})\tag{MW3}
$$

> [!hint] Hinweise:
> 
> - Man kann ein geeignetes Volumen so wählen, dass sich das [innere Produkt](../../Mathematik/Algebra/Skalarprodukt.md) $\mathbf{E} \cdot\mathrm{d}\mathbf{a}$ vereinfacht.
> - Es können dann Annahmen getroffen werden, welche Vektorkomponenten von $\mathbf{E}$ wegfallen.
> - Es ist Hilfreich ein geeignetes [Koordinatensystem](../../Physik/Koordinatensysteme.md) zu Wählen.

>[!success] Für unterschiedliche [Leitergeometrien](Leitergeometrie.md) erhält man bestimmte Lösungen für das Elektrische Feld.

## Elektrisches Potenzial

Der Ausdruck $\oint \mathbf{E}\cdot\mathrm{d}\mathbf{s} = 0$ impliziert, dass das $\mathbf{E}$ Feld [Wegunabhängig](../../Mathematik/Analysis/Vektoranalysis/Wegunabhängig.md) ist. Das bedeutet, dass das Elektrische Feld als [Gradient](../../Mathematik/Analysis/Vektoranalysis/Gradient.md) eines Skalarfelds dargestellt werden kann.

> [!satz] **S)** Das Elektrische Feld ist der negative Gradient des Potenzials.
> 
> $$
> \mathbf{E} = -\nabla\varphi
> $$

- Minus per definition

Woraus Folgt, dass das statische Elektrische Feld ein konservatives Kraftfeld ist. Die *Arbeit* in diesem Kraftfeld ist die Potenzialdifferenz oder [elektrische Spannung](elektrische%20Spannung.md):

$$
\implies \int_{\mathbf{r}_{a}}^{\mathbf{r}_{b}} \mathbf{E}(\mathbf{r})\cdot\mathrm{d}\mathbf{s} = -
\int_{\mathbf{r}_{a}}^{\mathbf{r}_{b}} \nabla\varphi(\mathbf{r}) \cdot \mathrm{d}\mathbf{s} =
\varphi(\mathbf{r}_{a})-\varphi(\mathbf{r}_{b})
$$


| Potenzial Trichter                                                  | Draufsicht                                                          |
| :-----------------------------------------------------------------: | :-----------------------------------------------------------------: |
| ![invert_dark](../../xEDU/1800CD47-2327-4D71-88A1-73E3FE7B55BC.jpg) | ![invert_dark](../../xEDU/B8D70F2D-0B18-4C65-8494-F4B336AF2BDD.jpg) |

> [!success] Das Potenzial lässt sich durch einsetzen des Vorherig berechneten E-Feld $\mathbf{E}(\mathbf{r})$ ermitteln.

Das Potenzial ergibt per obiger definition nur als Differenz einen Sinn. Gibt man das Potenzial als alleinstehenden Wert an, muss man einenen Referenzpunkt Wählen. Zum Beispiel kann man das Potenzial im Unendlichen $\varphi(r\to \infty) = 0$ wählen.

> [!satz] **S)** $\nabla \times \mathbf{E} = 0$ bedeuted auch, dass das eletrostatische Feld **keine geschlossenen Feldlinien aufweist**

