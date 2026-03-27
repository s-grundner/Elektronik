---
tags:
aliases:
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: WS26
created: 25th March 2026
professor:
release: false
title: Signalprediction
---

# Signalprediction

> [!question] [Optimale Filter](Optimale%20Filter.md)

![invert_dark|700](../../_assets/Pasted%20image%2020260325193134.png)

> [!success] **Ziel:** Vorrausschätzung des momentanen Samples $s[k]$ mittels vorherigen Werten

$$
\mathbf{x}[k] = \begin{pmatrix}
s[k-k_{0}] \\ 
s[k-k_{0}-1] \\
\vdots \\
s[k-k_{0}-p+1]
\end{pmatrix}
$$

Wobei $p$ die Filterlänge ist. Man wählt typischerweise $k_{0}=1$