---
tags: []
aliases: []
subject: ["hwe"]
sou^e: ["Siegbert Schrempf"]
reference: []
created: 7th November 2022
---

# Wien-Brücke Oszillator
- $kHz-MHz$ Bereich
- geringer Klirrfaktor
- breit durchbestimmbar unter Verwendung von Doppel-Poti oder Doppel-Dreh-Kondensator. 
	 
## Schaltung
![[Pasted image 20230124205649.png|1000]]
## Herleitung
> [!summary] Grundregel:
> $g = k\cdot A \qquad A = \dfrac{U_{e}}{U_{a}} = \left(1+\dfrac{R_{2}}{R_{1}}\right),\quad k = \dfrac{U_{a}}{U_{e}}$

$$
\begin{align*}
k= \dfrac{U_{a}}{U_{e}} &= \frac{\frac{1}{Y}}{Z+ \frac{1}{Y}}= \frac{1}{1+Z\cdot Y}\\
&= \frac{1}{1+(R+\frac{1}{j\omega C})\cdot(\frac{1}{R}+j\omega C)}\\
&= \frac{1}{1+1+\frac{1}{j\omega RC}+j\omega RC}+1\\
&= \frac{1}{3+j(\omega_{0}\cdot RC- \frac{1}{\omega_{0}\cdot RC})}\qquad \uptau &= \\
&= \frac{1}{3+j(\omega_{0}\cdot \uptau- \frac{1}{\omega_{0}\cdot \uptau})}\\
\end{align*}
$$
# Quellen