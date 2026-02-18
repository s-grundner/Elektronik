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
  - Andreas Stelzer 🕊️
---
 

# Leistungssignal

Ein Leistungssignal liegt vor, wenn gilt:

$$
0 \leq P<\infty
$$


## Leistung eines Signals

Die Leistung $P$ eines Signals berechnet sich zu:

> [!info] **Kontinuierlich**
> 
> $$
> P=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T|x(t)|^2 \mathrm{~d} t=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T x(t) x^*(t) \mathrm{d} t
> $$

> [!info] **Diskret**
> 
> $$
> P=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N|x[n]|^2=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N x[n] x^*[n]
> $$
> 


Für periodische zeitdiskrete Signale mit der Periode $N$:

$$
\frac{1}{N} \sum_{n=0}^{N-1} \lvert x[n] \rvert ^{2}
$$