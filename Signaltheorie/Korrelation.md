---
tags:
  - DSP
aliases:
  - Autokorrelation
  - Kreuzkorrelation
keywords:
  - Ähnlichkeit zweier Signale
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
  - Andreas Stelzer
---
 

# Korrelation

> [!info] Die Korrelation ist ein Maß zur ähnlichkeit zweier Signale

## Korrelation von deterministischen Signalen

Das Korrelationsprodukt $\varphi_{x y}(\tau)$ zweier Funktionen $x(t)$ und $y(t)$, kurz Korrelation oder auch Kreuzkorrelation genannt, ist ein Maß für die Ähnlichkeit von Signalen und spielt besonders bei stochastischen Signalen eine wichtige Rolle, ist aber auch für deterministische Signale definiert. Als Parameter tritt die zeitliche Verschiebung $\tau$ zwischen den Funktionen auf.

> [!important] **Kreuzkorrelation (KKF) für Energiesignale:**
> 
> **Kontinuierlich**
> 
> $$
> \varphi_{x y}^E(\tau)=\int_{-\infty}^{\infty} x^*(t) y(t+\tau) \mathrm{d} t=\langle x(t), y(t+\tau)\rangle
> $$
> 
> **Diskret**
> 
> $$
> \varphi_{x y}^E[\kappa]=\sum_{k=-\infty}^{\infty} x^*[k]\cdot y[k+\kappa]=\langle x[k], y[k+\kappa]\rangle
> $$
> 

## Autokorrelation von deterministischen Signalen

Bei zwei unterschiedlichen Signalen $x(t) \neq y(t)$ spricht man von Kreuzkorrelation. Im Speziallfall gleicher Funktionen $x(t)=y(t)$, d.h. der Korrelation mit sich selbst, spricht man von Autokorrelation.

> [!important] **Autokorrelation (AKF) für Energiesignale:**
> 
> **Kontinuierlich**
> 
> $$
> \varphi_{x x}^E(\tau)=\int_{-\infty}^{\infty} x^*(t) x(t+\tau) \mathrm{d} t=\langle x(t), x(t+\tau)\rangle
> $$
> 
> **Diskret**
> 
> $$
> \varphi_{x x}^E[\kappa]=\sum_{k=-\infty}^{\infty} x^*[k] x[k+\kappa]=\langle x[k], x[k+\kappa]\rangle
> $$

## Eigenschaften der Korrelationsfunktion

Für die Korrelationsfunktion gilt

$$
\varphi_{y x}(\tau)=\varphi_{x y}^*(-\tau)
$$

d.h. die Korrelation ist eine konjugiert gerade Funktion.

Die Kreuzkorellation ist immer kleiner als das geometrische Mittel und das arithmetische Mittel:
$$
\left|\varphi_{x y}(\tau)\right| \leq \sqrt{\varphi_{x x}(0) \varphi_{y y}(0)} \leq \frac{1}{2}\left(\varphi_{x x}(0)+\varphi_{y y}(0)\right)
$$


Spezielle Ergebnisse der Autokorrelation ohne Verschiebung, d.h. $\tau=0$

1. Energie: $\quad E_x=\varphi_{x x}^E(0)$
2. Leistung $\quad P_x=\varphi_{x x}^P(0)$

Für die AKF gilt immer

$$
\left|\varphi_{x x}(\tau)\right| \leq \varphi_{x x}(0)
$$

d.h. der Wert bei Null ist ein Maximum!

Die Kreuzkorrelation ist identisch mit der komplex konjugierten [Faltung](../Digitaltechnik/Faltung.md) $\overline{ f(-\uptau) }_{  }$

---

- [[Barker Code]]
