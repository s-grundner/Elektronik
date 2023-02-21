---
tags: []
aliases: []
subject: ["mathe"]
source: [""]
reference: []
created: 10th January 2023
---

# Normalverteilung
![[PNG-Bild.png]]
## Eigenschaften
## Symmetrische Intervalle von $\mu$
## Standardisierte Normalverteilung

## Zentraler Grenzwertsatz
Eine [[Zufallsvariable#Stetige Zufallsvariablen|stetige Zufallsvariable]], die sich als Summe sehr vieler unabhängiger Einflussgrößen ergibt, von denen keine dominierend ist, ist näherungsweise normalverteilt.
## Näherung der [[Binomialverteilung]]
Wenn bei einer [[Binomialverteilung]] $\sigma^{2}n\cdot p>9$ ist, kann man sie durch eine Normalverteilung annähern.
> [!warning] Mit Taschenrechner nicht mehr nötig

## Verteilung von Stichprobenkennwerte
Sei $X$ eine [[Zufallsvariable]] für einen Merkmalswert eines Merkmalsträger.

>[!summary] Stichprobe
> $$
> \begin{align*}
> X_{1},&&X_{1},&&X_{1}&&\dots&& X_{n}&&\dots \text{n...Zufallsvariable}\\
> \downarrow&&\downarrow&&\downarrow&& &&\downarrow&&\\
> x_{1},&&x_{1},&&x_{1}&&\dots&& x_{n}&&\dots \text{n-Tupel (eine Stichprobe)}\\
> \end{align*}
> $$

> [!summary] Stichprobenmittel
> $\overline{x}=\sum\limits_{i=1}^{n}x_{i}\qquad$ ... $\overline{x}$ ist auch eine [[Zufallsvariable]]

> [!done] Wenn $X$ Normalverteilt sind mit $X\sim (\mu|\sigma^{2})$, dann ist $\overline{X}\sim(\mu| \frac{\sigma^{2}}{n})$

# Konfidenzintervalle (Vertrauensbereich)
Wenn $\sigma$ bekannt ist (z.B. aus langjähriger Erfahrung) und eine [[Zufallsvariable]] $X\sim N(\mu;\sigma^{2})$, dann ist die Stichprobe $\overline{X}\sim N(\mu; \frac{\sigma^{2}}{n})$. 
$\mu$ muss "in der Nähe" von $\overline{X}$ liegen.
> [!important] Wir akzeptieren dabei eine Irrtumswahrscheinlichkeit $\alpha$
> $\rightarrow (1-\alpha)$ ... Vertrauungsbereich

| [[Erwartungswert]] | Stichprobe                                                  | Vertrauensbereich |
| -------------- | ----------------------------------------------------------- | ----------------- |
| $\mu_{unten}=$ | $\overline{X}-1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
| $\mu_{oben}=$  | $\overline{X}+1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
| $\mu_{oben}=$  | $\overline{X}+2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |
| $\mu_{oben}=$  | $\overline{X}+U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |