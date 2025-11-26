---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 24. November 2024
professor:
  - Andreas Stelzer
---

# Energiesignal

Ein Signal ist ein Energiesignal wenn die Energie des Signals endlich ist:

## Energie eines Signals

> [!info] **Kontinuierlich:**
> $$
> E=\int_{-\infty}^\infty \left|x(t)\right| ^{2} dt = \int _{-\infty}^\infty x(t)\cdot x^{*}(t) \, dx  
> $$
> $x^*$: Konjugation von $x$ (quadrat unabh. von der Phase)

> [!info] **Diskret**
> 
> $$
> E=\sum_{n=-\infty}^{\infty}|x[n]|^2=\sum_{n=-\infty}^{\infty} x[n] x^*[n]
> $$

Ein periodisches Signal kann kein Energiesignal sein, da:
- Integrationsbereich ist $-\infty$ bis $\infty$
