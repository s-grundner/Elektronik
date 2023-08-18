---
tags: []
aliases: ["Kondensator"]
subject: ["hwe"]
source: ["Michael Offenhuber", "Siegbert Schrempf"]
reference: []
created: 11th April 2023
---

# Kapazität
## Idealer Kondensator
$$
jX_{C}=\frac{1}{j\omega C}\qquad Z\approx \frac{1}{f}
$$
> [!summary] ESB
> ![500](assets/cap_esb.png)
> - $R_{ESR}$: dielektrische und elektrische Verluste
> - $ESR$: equivalent series resistance
> - $L$: intrinsische parasitäre [Induktivität](Induktivitäten.md)

$$
\begin{align*}
\underline{Z} &= R_{ESR}+j\omega L+ \frac{1}{j\omega C}\\
\text{bei } f_{r}:X&=0\\
f_{0} &= \frac{1}{2\pi}\cdot \frac{1}{\sqrt{LC}}
\end{align*}
$$
> [!info] Wertebereich von der Bauform abhängig
> $C\approx1nF$
> $L\approx1\mu H$
> $R_{ESR}\approx0.1\Omega$

# Tags