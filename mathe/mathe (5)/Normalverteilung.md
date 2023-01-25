---
tags: []
aliases: []
subject: ["mathe"]
source: [""]
reference: []
created: 10th January 2023
---

# Normalverteilung

## Eiganschaften
## Symmetrische Intervalle von $\mu$
## Standartisierte Normalverteilung

## Zentraler Grenzwertsatz
Eine [[Zufallsvariable#Stetige Zufallsvariablen|stetige Zufallsvariable]], die sich als Summe ser vieler unabhängiger Einflussgrößen ergibt, von denen keine dominierend ist, ist näherungsweise normalverteilt.
## Näherung der Binomialverteilung
Wenn bei einer [[Binomialverteilung]] $\sigma^{2}n\cdot p>9$ ist, kann man sie durch eine Normalverteilung annähern.
> [!warning] Mit Taschenrechner nicht mehr nötig

## Verteilung von Stichprobenkennwerte
Sei $X$ eine Zufallsvariable für einen Merkmalswert eines Merkmalsträger.

Stichprobe:
$$
\begin{align*}
X_{1},&&X_{1},&&X_{1}&&\dots&& X_{n}&&\\
\downarrow&&\downarrow&&\downarrow&& &&\downarrow&&\\
x_{1},&&x_{1},&&x_{1}&&\dots&& x_{n}&&\qquad\dots \text{n-Tupel(eine Stichprobe)}

\end{align*}
$$

# Konfidenzintervalle
Wenn $\sigma$ bekannt ist (z.B. aus langjähriger Erfahrung) und eine Zufallsvariable $X\sim N(\mu;\sigma^{2})$, dann ist die Stichprobe $\overline{X}\sim N(\mu; \frac{\sigma^{2}}{n})$. 
$\mu$ muss "in der Nähe" von $\overline{X}$ liegen.
> [!important] Wir akzeptieren dabei eine Irrtumswahrscheinlichkeit $\alpha$
> $\rightarrow (1-\alpha)$ ... Vertrauungsbereich

| Erwartungswert | Stichprobe                                                  | Vertrauensbereich |
| -------------- | ----------------------------------------------------------- | ----------------- |
| $\mu_{unten}=$ | $\overline{X}-1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
| $\mu_{oben}=$  | $\overline{X}+1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
| $\mu_{oben}=$  | $\overline{X}+2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |
| $\mu_{oben}=$  | $\overline{X}+U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |