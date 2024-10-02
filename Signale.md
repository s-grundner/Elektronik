---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
---
 

# Signale

## Klassifizierung von Signalen

### Energiesignal

**Kontinuierlich:**
$$
\int_{-\infty}^\infty \mid x(t)\mid^{2} dt = \int _{-\infty}^\infty x(t)\cdot x^{*}(t) \, dx  
$$
$x^*$: Konjugation von $x$ (quadrat unabh. von der Phase)

**Diskret**

$$
E=\sum_{n=-\infty}^{\infty}|x[n]|^2=\sum_{n=-\infty}^{\infty} x[n] x^*[n]
$$

Ein periodisches Signal kann kein Energiesignal sein, da:
- Integrationsbereich ist $-\infty$ bis $\infty$

### Leistungssignal

Die Leistung $P$ eines Signals berechnet sich zu:

**Kontinuierlich**

$$
P=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T|x(t)|^2 \mathrm{~d} t=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T x(t) x^*(t) \mathrm{d} t
$$

**Diskret**

$$
P=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N|x[n]|^2=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N x[n] x^*[n]
$$


Ein Leistungssignal liegt vor, wenn gilt:

$$
0 \leq P<\infty
$$
[Korrelation](Korrelation.md)