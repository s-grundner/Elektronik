---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 6th March 2023
---

# Kapazitive Kopplung

Die Übertragung der Störgröße auf den Nutzkreis erfolgt über das
elektrische Feld.
Ursache für Kapazitive Beeinflussung sind parasitäre (d.h. nicht beabsichtigte)
Kapazitäten zwischen Leitern die zu verschiedenen Stromkreisen gehören.
![600](assets/Pasted%20image%2020230316093012.png)
Für den (allgemeinen) Fall, dass die [Impedanz](Impedanz.md) der Koppelkapazität sehr viel
größer ist als die [Impedanz](Impedanz.md) des Nutzkreises folgt:

$$
\begin{align*}
\text{für }\dfrac{1}{j\omega C_{K}}&\gg(R_{i}||R_{L})\text{ gilt}\\
i_{\text{stör}}&\approx C\cdot \frac{du_{\text{stör}}}{dt}\\
\end{align*}
$$

> [!summary] 
> $$
> \begin{align*}
> u_{L}&= u_{SIG}\cdot \frac{R_{L}}{R_{L}+ R_{i}} + i_{\text{stör}}\cdot \frac{R_{i}\cdot R_{L}}{R_{i}+R_{L}}\\
> u_{L}&= \frac{R_{L}}{R_{L}+ R_{i}}\cdot (u_{SIG}+ i_{\text{stör}}\cdot R_{i})\\
> \end{align*}
> $$

> [!info] Eine [Schirmung](Schirmung.md) hilft gegen kapazitive Kopplung

# Tags