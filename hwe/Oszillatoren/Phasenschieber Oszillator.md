---
tags: []
aliases: ["PSO", "Phaseshift "]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 7th November 2022
---

# Phasenschieber Oszillator
- Einfacher Aufbau
	- Invertierender Verstärker
	- RC-Netzwerk

# ungepuffert

# gepuffert

## Schaltung
![[Pasted image 20230124215050.png|925]]
- 3-4x Tiefpass 1. Ordnung
- $f_{0}$ mit $180\degree$ Phase ($\beta=180\degree$([[Barkhausen Kriterium|BHK]]))
- verstärker kompensiert die Rückkopplungsdämpfung
## Herleitung des ungepufferten PSO
> [!tip] [[Kettenmatrix|Kettenmatrizen]] für die Herleitung
> ![[PSO-kette.png|975]]

$$
A = \begin{pmatrix}
1+j\omega RC & R\\
j\omega C & 1
\end{pmatrix}\qquad
\begin{align*}
&A_{11}=1+j\omega RC
&&A_{12}=j\omega C\\
&A_{21}=R
&&A_{22}=1\\
\end{align*}
$$
[[Matrixrechnung|Multiplikation der Matrizen:]] $A_{gesamt}=A=A_{a}\cdot A_{b}\cdot A_{c}$
Terme $A_{11}\dots A_{22}$ sind sehr lang

$$
\begin{align*}
\underline{k}=\frac{1}{A_{11}}&=\frac{1}{s^{3}R^{3}C^{3}+5s^{2}R^{2}C^{2}+6sRC+1}\qquad s = \sigma+j\omega\\
&= \dots
\end{align*}
$$
$\sigma$ in unserem Fall meistens 0
#incomplete 
bei Resonanz: $\rightarrow \{Im\}=0:$
$$
\begin{align*}
6RC&=\omega^{2}R^{3}C^{3}\\
\omega_{0}&=\dfrac{\sqrt{6}}{RC}
\end{align*}
$$
# Tags
[[Kettenmatrix]]