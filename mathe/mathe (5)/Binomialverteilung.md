---
tags: []
aliases: []
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 16th November 2022
---

# Binomialverteilung

- Bei einem Zufallsexperiment gibt es nur $2$ Ergebnisse: $A$ oder $\neg{A}$
- Es werden $n$ gleichartigen Versuche durchgeführt.
- Die Einzelversuche sind voneinander unabhängig.
- Die Zufallsvariable $X$ gibt an, wie oft bei $n$ Versuchen das Ergebnis $A$ eintritt.
$$p=P(A)$$
Dann ist $X$ binomialverteilt mit den Parametern $n\&p$
$$
\begin{align*}
P(X=k)&=\binom{n}{k}\cdot p^{k} \cdot (1-p)^{n-k}\\\\
E(X)&=n\cdot p\\
V(X)&=n\cdot p\cdot(1-p)&& \text{Varianz}\\
\sigma(X)&=\sqrt{n\cdot p\cdot(1-p)}&&\text{Standardabweichung}
\end{align*}
$$



# Quellen