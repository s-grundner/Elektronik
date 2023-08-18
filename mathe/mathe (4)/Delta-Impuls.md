---
tags: []
aliases: ["Dirac-Impuls", "Dirac-Funktion", "Nadelimpuls"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: ["Ing. Mathematik 4 - Timischl/Kaiser"]
created: 26th April 2022
last_edited: 26th April 2022
---

# Delta-Impuls $\delta(t)$ 
Der **Delta-Impuls** dient zur idealisierten, aber bequemen mathematischen Beschreibung eines sehr **kurzen Impulses**, durch etwa ein *mechanisches oder elektrisches* schwingfähiges System, dass aus dem Ruhezustand angeregt wird.
Zu seiner Einführung kann man von einem kurzen Rechtecksimpuls **$y=r(t)$** ausgehen:
$$
\begin{align*}
	(h<0): r(t) = \begin{cases}
		\frac{1}{h} & \text{für} & 0\leq t < h\\
		0 & \text{sonst} & 
	\end{cases} && = \frac{1}{h} \Big{[}\sigma(t) - \sigma(t-h) \Big{]}
\end{align*}
$$

![pseudo_d_impuls](pseudo_d_impuls.png)

Zur Normierung der *Wirkung* einer solchen Impulsfunktion wurde gewählt, dass die **Impulsfläche 1 ist**:
$$
A = \int_{-\infty}^{\infty}r(t)dt=\int_{0}^{h}r(t)dt = 1 
$$
Wird $h$ kleiner, so wird $r(t)$ wegen der konstanten "Impulsfläche" 1 während der Impulsdauer $h$ größer.
Man möchte nun den gesamten Impuls "auf einen Zeitpunkt konzentrieren", Dazu geht man zum Grenzfall $h\rightarrow 0$ über und erhält so die folgende Funktion:

$$
\begin{align*}
	\delta(t) = \lim_{h\rightarrow 0} r(t) = \begin{cases}
	\text{"}\infty\text{"} & \text{für} & t = 0 \\
	0 & \text{für} & t \neq 0
	\end{cases} && \text{mit} && \int_{-\infty}^{\infty}\delta (t)dt = 1
\end{align*}
$$
$\delta(t)$ ist jedoch im eigentlichen Sinn keine Funktion mehr, da $\infty$ kein Funktionswert ist. Ebenfalls ist das Integral $\int_{-\infty}^{\infty}\delta (t)dt = 1$ im üblichen Sinn nicht mehr möglich. [...]
Symbolisch wird der Delta-Impuls durch einen Pfeil dargestellt.
![d_impuls](d_impuls.png)

$d(t)$ ist eine verallgemeinerte Funktion bzw. Distribution

## Ausblend-Eigenschaft des $\delta$-Impuls
Wirkung des $\delta$-Impulses auf eine Zeitfunktion $f$:
$$
\begin{align*}
	\delta(t) &= \lim_{h\rightarrow 0}\begin{cases}
		\frac{1}{h} & \text{für} & 0\leq t < h\\
		0 & \text{sonst}
	\end{cases}\\
\\
	\int_{-\infty}^{\infty}f(t)\cdot\delta(t)dt &= \int_{0}^{h} f(t)\cdot\frac{1}{h}dt = \frac{1}{2} \int_{0}^{h}f(t)dt = \frac{1}{h}\Big{(} F(h) - F(0) \Big{)}\\
\\
	\underline{\underline{
		\lim_{h\rightarrow 0} \int_{-\infty}^{\infty}f(t)\cdot\delta(t)dt
	}}
	&= \lim_{h\rightarrow 0} \frac{F(h)-F(0)}{h} = \underline{\underline{f(0)}}
\end{align*}
$$

Allgemein:
![delta_impuls](delta_impuls.png)
$$
\underline{\underline{
	f(t_{0}) = \int_{-\infty}^{\infty}f(t)\cdot\delta(t-t_{0})dt
}}
$$

---
# Tags