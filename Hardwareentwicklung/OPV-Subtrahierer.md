---
tags: ["OPV"]
aliases: ["Subtrahierer"]
created: 23. September 2023
---

# Subtrahierer

## Helmholzsches [Überlagerungsprinzip](../Elektrotechnik/Superpositionsprinzip.md)

1. $U_{e1},U_{e2}=0, U_{a}1$
2. $U_{e1}=0, U_{e2}, U_{a}2$
$$
\begin{align*}
U_{e}'&=U_{e1}\cdot \frac{R_{3}}{R_{3}+R_{4}}\\
U_{a2}&= - \frac{R_{1}}{R_{2}}\cdot U_{e2}\\
U_{a1}&= (1+ \frac{R_{1}}{R_{2}})\cdot U_{e1}'= (1+ \frac{R_{1}}{R_{2}})\cdot(\frac{1}{1+ \frac{R_{4}}{R_{3}}})\cdot U_{e}\\
U_{a}&= U_{a1}+U_{a2}=(1+\frac{R_{1}}{R_{2}})
\end{align*}
$$