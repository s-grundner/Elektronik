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

> [!summary] 
> Resonanzfrequenz: $\omega=\dfrac{1}{RC}$
> Verstärkung: $
## Herleitung
> [!summary] Grundregel:
> $g = k\cdot A \qquad A = \dfrac{U_{e}}{U_{a}},\quad k = \dfrac{U_{a}}{U_{e}}$

### Verstärkung $A$
$$
\begin{align*}
A = \dfrac{U_{e}}{U_{a}} = \left(1+\dfrac{R_{2}}{R_{1}}\right)
\end{align*}
$$
### Rückkopplungsfaktor $k$
$$
\begin{align*}
k= \dfrac{U_{a}}{U_{e}} &= \frac{\frac{1}{Y}}{Z+ \frac{1}{Y}}= \frac{1}{1+Z\cdot Y}\\
&= \frac{1}{1+(R+\frac{1}{j\omega C})\cdot(\frac{1}{R}+j\omega C)}\\
&= \frac{1}{1+1+\frac{1}{j\omega RC}+j\omega RC}+1\\
&= \frac{1}{3+j(\omega_{0}\cdot RC- \frac{1}{\omega_{0}\cdot RC})}\qquad (\uptau =R\cdot C)\\
&= \frac{1}{3+j(\omega_{0}\cdot \uptau- \frac{1}{\omega_{0}\cdot \uptau})}\\
\end{align*}
$$

>[!Help] Barkhausenkriterium
> $k\cdot v = 1$
> $v = v_{0}= \dfrac{1}{k}=3+j\left(\omega\uptau- \dfrac{1}{\omega\uptau}\right)$
> für Resonanz $\righ$
# Quellen