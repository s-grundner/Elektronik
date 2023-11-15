---
tags: []
aliases: ["Kondensator"]
subject: ["hwe"]
source: ["Michael Offenhuber", "Siegbert Schrempf"]
created: 11th April 2023
---

# Der Kondensator - ein Ladungsspeicher

> [!INFO] Der Kondensator – ein Ladungsspeicher
>  Ein Kondensator ist eine Anordnung von zwei Elektroden, bei der durch räumliche Nähe eine elektrostatische Beeinflussung der Ladungen auf den beiden Elektroden stimuliert oder ausgenützt wird. Die entsprechende Kenngröße heißt Kapazität. Da die im folgenden beschriebenen Effekte im Prinzip zwischen allen Leitern auftreten (also auch welchen die räumlich weiter entfernt sind), tritt die Kapazität im Prinzip zwischen allen Leitern auf – oft auch unerwünschter Weise, man spricht von parasitären Kapazitäten.

![InlineL|450](assets/Pasted%20image%2020231115091143.png)

> [!TIP] Ladungen verschieben sich solange, bis das E-Feld in den Leitern verschwindet und im Kondensator verteilt ist:
> 1. Spannungsquelle von elektrischem Feld umgeben
> 2. Feld wirkt auf bewegliche Elektronen im eingebrachten Kondensator und Anschlussdrähten
> 3. Die Ladungen verschieben sich solange, bis das Feld in allen Leitern verschwindet (Platten und Drähte), d.h. dort dann konstantes Potenzial. Das Feld wird dadurch verzerrt.
> 4. Im Zuge dieser Verschiebungen wurden die Platten geladen. Das Feld zwischen den Platten ist mit der Potenzialdifferenz (durch Spannungsquelle vorgegeben) verknüpft, erzeugt wird es vornehmlich durch die Ladungen auf dem Platten.

## Ladung und Kapazität im Kondensator

$$
Q=C\cdot U
$$

## Energie im Kondensator

$$
\begin{align}
W_m(t)-W_m(0)&=\int_0^t p(\tau) d \tau \\
&=\int_0^t i(\tau) u(\tau) d \tau \\
&=\int_0^t u C \frac{d u}{d \tau} d \tau \\
&=\int_0^{u(t)} C\cdot u\cdot d u \\
&=\frac{C u(t)^2}{2}
\end{align}
$$


## Idealer Kondensator

$$
jX_{C}=\frac{1}{j\omega C}\qquad Z\approx \frac{1}{f}
$$
## Realer Kondensator

> [!summary] ESB  
> ![InlineL|500](assets/cap_esb.png)
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

> [!INFO] Wertebereich von der Bauform abhängig  
> $C\approx1nF$  
> $L\approx1\mu H$  
> $R_{ESR}\approx0.1\Omega$

# Tags

[Abblockkondensator](Abblockkondensator.md)