---
tags: 
aliases: []
keywords: 
subject:
  - VL
  - Mathematik 2
  - Elektrotechnik
semester: SS24
created: 10. Juni 2024
professor: 
cited:
---

# Vektorfelder

> [!def] **D1 - VECF)** Ein Vektorfeld ist eine Funktion, die jedem Punkt eines Raumes einen [Vektor](../Mathematik/Analysis/Vektor.md) zuordnet.
> Im gegensatz zu einem Skalarfeld, dass jedem Punkt einen skalaren Wert (eine Zahl) zuordnet.

# Vektorfelder in der Elektotechnik

Die Bedeutensten Vektorfelder in der Elektrotechnik sind das [elektrische Feld](Elektrisches%20Feld.md) $\mathbf{E}$ und das [magnetische Feld](magnetisches%20Feld.md) $\mathbf{B}$, welche durch die [Maxwell](Maxwell.md)-Gleichungen beschrieben werden. Diese Felder sind [konservativ](../Mathematik/Analysis/Wegunabhängig.md).

> [!tldr] Im Folgenden werden die physikalischen Ursachen der Mathematischen Operationen auf konservative Vektorfelder erläutert:
> - [Gradient](../Mathematik/Analysis/Gradient.md) und Gradientintegral ([Hauptsatz der Infinitesimalrechnung](../Mathematik/Analysis/Hauptsatz%20der%20Infinitesimalrechnung.md))
>  - Divergenz und Divergenzintegral / Gaußscher Integralsatz
>  - Rotation und Rotationintegral / Stokescher Integralsatz

## Divergenz

$$
\operatorname{div} \vec{F}\left(\vec{r}\right) = \nabla \cdot \vec{F}\left(\vec{r}\right) = \sum_{k=1}^n \frac{\partial}{\partial r_{k}} F_{k}
$$

> [!info] Bedeutung
> Die Divergenz eines Vektorfeld ist ein Skalarfeld und gibt an, wie stark dass Feld *auseinander strebt*.

## Rotation im $\mathbb{R}^{3}$

### Stokesscher Integralsatz