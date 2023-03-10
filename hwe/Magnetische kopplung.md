---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 7th March 2023
---

# Magnetische Kopplung
Bei der magnetischen Kopplung wird die Störgröße über das magnetische Feld in den Nutzkreis übertragen.

> [!warning] Ursachen für magnetische beeinflussungen sind, die Magnetfelder stromdurchflossener Leiter, welche bei einer Stromänderung Spannungen in benachbarten Leiterschleifen induzieren.

![[magn_kopplung.png|1000]]

$$
\begin{align*}
H(i_{stör}) &= \frac{i_{stör}}{2\pi\cdot r}\\
B(i_{stör}) &= \mu\cdot H(i_{stör})\\
\Phi(i_{stör}) &= B(i_{stör})\cdot A\\
u_{stör}&=N\cdot \frac{d\Phi}{dt}\\
u_{stör} &= L\cdot \frac{di}{dt}
\end{align*}
$$
Die Lastspannung $u_{L}$ erhält durch die magnetisch eingekoppelte Störspannung einen Störanteil.
## Modellierung 
Modellierung der induzierten Störspannung erfolgt durch eine weitere Spannungsquelle am Nutzkreis.
![[magn_koppl_modell.png|700]]

> [!info] Die magnetische Kopplung wird durch die Gegeninduktivität $M$ ausgeprägt.

> [!summary] Der Störanteil am Verbrauchereingang: $$
> $$
> \begin{align*}
> u_{L, stör} &= \frac{R_{L}}{R_{i}+ R_{L}}\cdot u_{stör} = \frac{R_{L}}{R_{i}+ R_{L}} \cdot M\cdot\frac{di_{stör}}{dt} \qquad&&\text{Zeitbereich}\\
> U_{L, stör} &= \frac{R_{L}}{R_{i}+R_{L}}\cdot U_{stör}= \frac{R_{L}}{R_{i}+R_{L}}\cdot j\omega M \cdot \underline{I}_{stör}\qquad&&\text{Frequenzbereich}
> \end{align*}
> $$



Die Höhe der induzierten Störspannug hängt ab von:
1. Der Größe der Gegeninduktivität $M$, zwischen Nutz- und Störkreis
2. Änderungsgeschwindigkeit des Stromes $\frac{di_{stör}}{dt}$
3. der Amplitude des Stromes $\hat{i}_{stör}$
4. der Frequenz des Störstromes $\omega\cdot\underline{I}_{stör}$

Die Gegeninduktivität wird durch die Topologie, bzw durch die Leiterbahn anordnung bestimmt.

# Tags
[[Magnetisches Feld#Magnetische Grundgrößen]]