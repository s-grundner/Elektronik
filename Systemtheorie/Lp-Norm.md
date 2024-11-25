---
tags: 
aliases:
  - Norm für Kontinuierliche Signale
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 22. Oktober 2024
professor:
---
 
# Norm für kontinuierliche Signale

## $L_{p}$-Norm

Die gebräuchlichsten Normen für kontinuierliche [Signale](Signale.md) sind die $L_p$-[Norm](../Mathematik/Algebra/Norm.md). Ein Signal wird dem Signalraum $L_p(a, b)$ zugeordnet, wenn nachfolgendes [Integral](../Mathematik/Analysis/Integralrechnung.md) im Intervall $[a, b]$ existiert.

$$
\|\mathbf{x}\|_p=\|x(t)\|_p=\left(\int_a^b|x(t)|^p \mathrm{~d} t\right)^{1 / p}=\sqrt[p]{\int_a^b|x(t)|^p \mathrm{~d} t}
$$

- $L_1$-Norm, erfordert absolute Integrierbarkeit

$$
\|\mathbf{x}\|_1=\|x(t)\|_1=\int_a^b|x(t)| \mathrm{d} t
$$

- $L_2$-Norm, erfordert quadratische Integrierbarkeit

$$
\|\mathbf{x}\|_2=\|x(t)\|_2=\sqrt{\int_a^b|x(t)|^2 \mathrm{~d} t}
$$

- $L_{\infty}$-Norm, ist die [Maximumnorm](../Mathematik/Maximumsnorm.md)

$$
\|\mathbf{x}\|_{\infty}=\|x(t)\|_{\infty}=\underset{a \leq t \leq b}{\operatorname{ess} \sup }|x(t)|
$$

