---
tags:
aliases:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 14th February 2026
professor:
release: false
title: Diskrete Verteilung
---

# Diskrete Verteilung

Ist $\mathbb{P}$ eine diskrete Verteilung mit dem Träger $\mathbb{T}_{\mathbb{P}}\subseteq \mathbb{R}$ so gilt für alle $B\subseteq \mathbb{R}$

$$
\mathbb{P}(B) = \mathbb{P}(B \cap \mathbb{T_{P}}) = \sum_{z \in B \cap \mathbb{T_{P}}} \mathbb{P}(\{ z \})\tag{1}
$$

Die diskrete Verteilung $\mathbb{P}$ ist somit durch die Wahrscheinlichkeiten $\mathbb{P}(\{ z \})$ mit $z \in \mathbb{T_{P}}$ vollständig bestimmt.

> [!def] **D - PDF)** Unter eine **Verteilungsdichte** (*Probability Density Funciton - PDF*) $\mathbb{f_{P}}$ einer **diskreten Verteilung** $\mathbb{P}$ mit dem Träger $\mathbb{T_{P}} \subseteq \mathbb{R}$ versteht man die Abbildung
> 
> $$
> \mathbb{f_{P}} : \mathbb{R} \to \mathbb{R} \quad \text{mit} \quad \mathbb{f_{P}} (z) = \begin{cases}
> \mathbb{P}(\{ z \}) & \text{für } z \in \mathbb{T_{P}} \\
> 0 & \text{sonst}
> \end{cases}
> $$
> 
> Wegen $(1)$ ist die diskrete Verteilung $\mathbb{P}$ duchr ihre Verteilungsdichte $\mathbb{f_{P}}$ vollständig bestimmt.

Die Punkte an den Stellen $z\in \mathbb{T_{P}}$ entsprechen dabei den Wahrscheinlichkeiten $\mathbb{f_{P}}(z)=\mathbb{P}(\{ z \})$

![invert_dark](../../_assets/DPDF.png)

> [!info] Für die Verteilungsdichte $\mathbb{f_{P}}$ einer diskreten Verteilung $\mathbb{P}$ gilt
> 
> 1. Für alle $z \in \mathbb{R}$ ist $\mathbb{f_{P}} = \mathbb{P}(\{ z \}) \geq 0$
> 2. Die Summe über alle Werte $\mathbb{f_{P}}(z)$ mit $z \in \mathbb{T_{P}}$ ergibt den Wert $1$, es gilt also
> 
> $$
> \sum_{z \in \mathbb{T_{P}}} \mathbb{f_{P}}(z)=1
> $$


## Arten von disktreten Verteilungen

- Disktrete Gleichverteilung
- Binomialverteilung
- Poissonverteilung

## Verteilungsdichten diskreter Zufallsvariablen

> [!def] **D)** Unter eine **Verteilungsdichte** $\mathbb{f}_{Z}$ einer **diskreten Zufallsvariable** $Z$ versteht man die Verteilungsdichte der Verteilung $\mathbb{P}_{Z}$ von $Z$, also die Abbilung
> 
> $$
> \mathbb{f}_{Z} : \mathbb{R} \to \mathbb{R} \quad \text{mit} \quad \mathbb{f}_{Z} (z) = \begin{cases}
> \mathbb{P}(\{ Z=z \}) & \text{für } z \in \mathbb{T_{P}} \\
> 0 & \text{sonst}
> \end{cases}
> $$
> 
> Wegen $(1)$ ist die Verteilung $\mathbb{P}_{Z}$ der diskreten Zufallsvariable $Z$ durch ihre Verteilungsdichte $\mathbb{f}_{Z}$ vollständig bestimmt.
