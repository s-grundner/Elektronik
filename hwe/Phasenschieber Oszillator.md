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
## Bedingung für die Schwingfrequenz

[[Übertragungsfunktion]] vom RC-Tiefpass:
$$
\frac{U_{2}}{U_{1}}= \dfrac{\dfrac{1}{j\omega C}}{R+\dfrac{1}{j\omega C}} =\dfrac{1}{1+j\omega\uptau}
$$
### Phasenbedingung
$\varphi=\dfrac{\beta}{3}=60\degree\rightarrow$ 360° auf 3 Tiefpässe geteilt (Tiefpass 3. Ordnung)
$\varphi = \arctan\left(\dfrac{Im}{Re}\right)=\arctan(\omega RC)=60\degree$
$\omega RC = \tan(60\degree) = \sqrt{3}\approx 1.73$
$$\omega=\dfrac{\sqrt{3}}{RC}\rightarrow\omega^{2}=\dfrac{3}{R^{2}C^{2}}$$
### Amplitudenbedingung
$$
\begin{align*}
\dfrac{U_{2}}{U_{1}}&=\dfrac{1}{1+j\omega RC}\rightarrow\\
\left|\dfrac{U_{2}}{U_{1}}\right|&=\frac{1}{\sqrt{1+\omega^{2}R^{2}C^{2}}}
\end{align*}
$$
Nach einsetzen der Phasenbedingung: $\omega^{2}=\dfrac{3}{R^{2}C^{2}}$
$$
\begin{align*}
&=\frac{1}{\sqrt{1+3\cdot \dfrac{R^{2}C^{2}}{R^{2}C^{2}}}}=\frac{1}{\sqrt{4}}= \frac{1}{2}
\end{align*}
$$
> [!important] Tiefpass 3. Ordnung
> 3 Filterstufen mit $\left|\dfrac{U_{2}}{U_{1}}\right|=\dfrac{1}{2}\rightarrow\dfrac{1}{2}\cdot\dfrac{1}{2}\cdot\dfrac{1}{2} = \dfrac{1}{8}$ 

## Herleitung des gepufferten PSO
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