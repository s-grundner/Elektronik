---
tags: []
aliases: []
subject: ["mathe"]
source: [""]
created: 10th January 2023
---

# Normalverteilung

$F: M_{x}\rightarrow[0;1]$ mit $F(x)=P(X\leq x)$

Ist $F$ differenzierbar, so nennt man die [Ableitung](Differenzialrechnung.md) von $F$ die Dichtefunktion von $X$, kurz Dichte.

Anstelle von $F'$ schreibt man sie als $f$

$$
\int^{b}_{a} f(x)dx= F(b)-F(a) = P(a\leq X\leq b)
$$
Ist die Dichtefunktion gegeben, so ist:
$$
F(x)=\int^{x}_{c}f(t)dt\qquad M_{x}=[c;d]\text{ z.B. } \mathbb{R}
$$

![PNG-Bild](PNG-Bild.png)


- Bisher waren [Wahrscheinlichkeitsverteilungen](Wahrscheinlichkeitsverteilung.md) gegeben (z.B. [Binomialverteilung](Binomialverteilung.md)).
- jetzt nurmehr eine Funktion, die die Verteilung angibt

Verteilungen können unterschiedlicher Wertebereiche annehmen.

>[!EXAMPLE] Lebensdauer  
>![1175](PNG-Bild%201.png)

## Eigenschaften

## Symmetrische Intervalle von $\mu$

## Standardisierte Normalverteilung

## Zentraler Grenzwertsatz

Eine [](Zufallsvariable.md#Stetige%20Zufallsvariablen|stetige%20Zufallsvariable), die sich als Summe sehr vieler unabhängiger Einflussgrößen ergibt, von denen keine dominierend ist, ist näherungsweise normalverteilt.

## Näherung der [Binomialverteilung](Binomialverteilung.md)

Wenn bei einer [Binomialverteilung](Binomialverteilung.md) $\sigma^{2}n\cdot p>9$ ist, kann man sie durch eine Normalverteilung annähern.
> [!WARNING] Mit Taschenrechner nicht mehr nötig

## Verteilung von Stichprobenkennwerte

Sei $X$ eine [Zufallsvariable](Zufallsvariable.md) für einen Merkmalswert eines Merkmalsträger.

>[!summary] Stichprobe
> $$
> \begin{align*}
> X_{1},&&X_{1},&&X_{1}&&\dots&& X_{n}&&\dots \text{n...Zufallsvariable}\\
> \downarrow&&\downarrow&&\downarrow&& &&\downarrow&&\\
> x_{1},&&x_{1},&&x_{1}&&\dots&& x_{n}&&\dots \text{n-Tupel (eine Stichprobe)}\\
> \end{align*}
> $$

> [!summary] Stichprobenmittel  
> $\overline{x}=\sum\limits_{i=1}^{n}x_{i}\qquad$ … $\overline{x}$ ist auch eine [Zufallsvariable](Zufallsvariable.md)

> [!done] Wenn $X$ Normalverteilt sind mit $X\sim (\mu|\sigma^{2})$, dann ist $\overline{X}\sim(\mu| \frac{\sigma^{2}}{n})$

# Konfidenzintervalle (Vertrauensbereich)

Wenn $\sigma$ bekannt ist (z.B. aus langjähriger Erfahrung) und eine [Zufallsvariable](Zufallsvariable.md) $X\sim N(\mu;\sigma^{2})$, dann ist die Stichprobe $\overline{X}\sim N(\mu; \frac{\sigma^{2}}{n})$.  
$\mu$ muss "in der Nähe" von $\overline{X}$ liegen.
> [!IMPORTANT] Wir akzeptieren dabei eine Irrtumswahrscheinlichkeit $\alpha$  
> $\rightarrow (1-\alpha)$ … Vertrauungsbereich

| [Erwartungswert](Erwartungswert.md) | Stichprobe                                                  | Vertrauensbereich |
| -------------- | ----------------------------------------------------------- | ----------------- |
| $\mu_{unten}=$ | $\overline{X}-1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
| $\mu_{oben}=$  | $\overline{X}+1.96\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=95\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
| $\mu_{oben}=$  | $\overline{X}+2.57\dfrac{\sigma^{2}}{n}$                    | $1-\alpha=99\%$   |
|                |                                                             |                   |
| $\mu_{unten}=$ | $\overline{X}-U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |
| $\mu_{oben}=$  | $\overline{X}+U_{1- \frac{\alpha}{2}}\dfrac{\sigma^{2}}{n}$ | $1-\alpha=$       |
