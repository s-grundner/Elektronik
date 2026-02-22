---
tags:
aliases:
subject:
  - KV
  - Wahrscheinlichkeitstheorie und stochastische Prozesse
semester: WS25
created: 21st February 2026
professor:
release: false
title: Stochastische Prozesse
---

# Stochastische Prozesse

Ein Stochastischer Prozess ist eine Sammlung von Zufallsvariablen welche durch **Zeit** indiziert sind.

- Diskrete Zeit: $\{ X_{0},X_{1},X_{2},\ldots \}$
- Kontinuierliche Zeit: $\{X_{t}\}_{t\geq 0}$

![invert_dark|500](../../_assets/Excalidraw/Stochastische%20Prozesse%202026-02-21%2002.04.25.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Stochastische%20Prozesse%202026-02-21%2002.04.25.excalidraw.md)%%

**Alternative Definition**

Einer Wahrscheinlichkeitsverteilung über den Raum aller Möglichen Pfade.

## Arten von Stochastischen Prozessen

- [Brownsche Bewegung](Brownsche%20Bewegung.md)
- [Symmetrische Irrfahrt](Symmetrische%20Irrfahrt.md)

## Stationäre stochastische Prozesse

> [!def] **D - Stationäre Stochastische Prozesse)** Ein stochastischer Prozess $\{ Y_{t} \}_{t \in T}$ von den reellen quadratisch integrierbaren zufallsvariablen heißt
> 
> **mittelwertstationär**, wenn $\mu_{t}$ Zeitlich konstant ist:
> 
> - $\mu_{t} =: \mu \quad\forall t \in T$
> - d.h. $\mathbb{E}(Y_{t_{1}}) = \mathbb{E}(Y_{t_{1}+k})$
> - und $\mathbb{E}(Y_{t_{1}}Y_{t_{2}}) = \mathbb{E}(Y_{t_{1}+k}Y_{t_{2}+k}) \quad \forall t_{1},t_{2},k \in T$
> 
> **varianzwertstationär**, wenn $\sigma^{2}$ Zeitlich konstant ist:
> 
> - $\sigma_{t}^{2} =: \sigma^{2} \quad\forall t \in T$
> - d.h. $\operatorname{Var}(Y_{t})+\operatorname{Var}(Y_{t_{1}+k})\quad\forall t_{1},t_{2},k \in T$
> 
> **kovarianzstatinoär**, wenn die Kovarianzfunktion $\gamma(t,s)$ des Prozesses nur von der Entfernung $t-s$ abhängig
> 
> $$
> \gamma(s,t):= \operatorname{Cov}(Y_{t},Y_{s}) = \operatorname{Cov}(Y_{t-s},Y_{0}) =: \gamma(t-s,0)
> $$
> 
> - Daraus folgt, dass die *Autokovarianzfunktion* $\gamma(t), t \in T$ nur von einem Parameter $t$ abhängt.
> 
> **schwach stationär**, wenn er *mittelwert-* und *kovarianzstationär* ist.


## Referenzen

![](https://www.youtube.com/watch?v=TuTmC8aOQJE)