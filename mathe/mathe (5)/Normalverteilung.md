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
Sei

# Konfidenzintervalle
Wenn $\sigma$ bekannt ist (z.B. aus langjähriger Erfahrung) und eine Zufallsvariable $X\sim N(\mu;\sigma^{2})$, dann ist die 

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