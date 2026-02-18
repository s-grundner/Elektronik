---
tags:
  - Wahrscheinlichkeitstheorie
  - Statistik
aliases:
keywords:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 15th October 2025
professor:
release: false
title: Laplace Experiment
---

# Laplace Experiment

Eine wichtige Klasse von Zufallsexperimenten sind die sogenannten **Laplace Experimente**:

> [!def] **D)** Laplace Experiment
> Unter einem **Laplace-Experimente** versteht man ein Zufallsexperiment mit endlich vielen Ausgängen $\omega_{1},\omega_{2},\dots,\omega_{n}$, bei dem auf Grund von geometrisch oder physikalischen Symmetrieüberlegungen alle Elementarereignisse $\{ \omega_{i} \}$ **gleich wahrscheinlich** sind
> 


Beispiele für Laplace-Experimente sind

- (Mehrfaches) werfen eines **homogenen** Würfels / Münze.
- Zufälliges Verteilen von Spielkarten auf Spieler.

$$
\forall\{ \omega_{i}\}\subset\Omega:\mathbb{P}(\omega_{1})=\mathbb{P}(\omega_{2})=\dots=\mathbb{P}(\omega_{n})
$$

>[!summary] $\mathbb{P}(\omega_{i})=\dfrac{1}{|\Omega|}$  
> - $\mathbb{P}(\omega_{i})$ ... die Wahrscheinlichkeit des Elementarereginisses $\omega$
> - $|\Omega|$ ... die Anzahl der möglichen [Ereignisse](Ereignis.md)

>[!summary] $\mathbb{P}(A)=\dfrac{\left| A \right|}{|\Omega|}$  
> - $\mathbb{P}(A)$ ... die Wahrscheinlichkeit eines [Ereignis](Ereignis.md) $A$
> - $\left| A \right|$ ... die Anzahl der günstigen [Ereignisse](Ereignis.md)
> - $|\Omega|$ ... die Anzahl der möglichen [Ereignisse](Ereignis.md) 
