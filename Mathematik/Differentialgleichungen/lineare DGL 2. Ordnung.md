---
tags:
  - DGL
aliases:
  - lineare DGL zweiter Ordnung
  - DGL 2. Ordnung
  - Differentialgleichung 2. Ordnung
  - Differentialgleichungen 2. Ordnung
subject: mathe
---

# Lineare Differentialgleichungen 2. Ordnung

## Lineare DGL 2. Ordnung mit konstantem Koeffizienten

$$y'' + p\cdot y'+q\cdot y=s(x) $$

### Lösung der *homogenen* DGL 2. Ordnung

Die Allgemeine Lösung $y_h$ einer homogenen linearen [DGL](index.md) 2. Ordnung erfolgt mit dem [Exponentialansatz](Exponentialansatz.md)

$$
\begin{align*}
	y_{h} &= c\cdot e^{\lambda x}\\
	y'_{h} &= c\cdot\lambda\cdot e^{\lambda x}\\
	y''_{h} &= c\cdot\lambda^{2}\cdot e^{\lambda x}
\end{align*}
$$

Daraus folgt:

$$
\begin{align*}
	0 &= y'' + p\cdot y'+q\cdot y\\
	0 &= \lambda^{2}\cdot c \cdot e^{\lambda x} + p \cdot\lambda\cdot c\cdot e^{\lambda x} + q \cdot c\cdot e^{\lambda x} \\
	0 &= \lambda^{2}+\lambda\cdot p+q
\end{align*}
$$

Mit dem [Exponentialansatz](Exponentialansatz.md) gewinnt man die **charakteristische Gleichung**: $\lambda^{2}+\lambda\cdot p+q=0$.  
Je nach Art der Lösungen $\lambda_{1}$ und $\lambda_{2}$ sind drei Fälle zu unterscheiden: 

$$\boxed{\lambda_{1,2} = -\dfrac{p}{2}\pm \sqrt{\Big{(}\dfrac{p}{2}\Big{)}^{2}-q}}$$

- [P-Q-Formel](../../Quadratische%20Gleichung.md)

| Fall    | Bedingung                            | Art der Lösung                                                                                                 | Lösungsansatz für `y`                                                                    |
| ------- | ------------------------------------ | -------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| 1. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q>0$ | $\lambda_1 \neq \lambda_2$ <br>(2 reelle Lösungen)                                                                 | $y_{h}= C_{1}\cdot e^{\lambda_{1}}+C_{2}\cdot e^{\lambda_{2}x}$                          |
| 2. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q=0$ | $\lambda_{1}=\lambda_{2}=\lambda_0$ <br>(reelle Doppellösung)                                                      | $y_{h}=(C_{1}+C_{2}x)\cdot e^{\lambda_{0}x}$                                             |
| 3. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q<0$ | $\lambda_{1,2}=\sigma\pm j\cdot\omega$ <br>(2 konjugiert [komplexe](../Analysis/Komplexe%20Zahlen.md) Lösungen) | $y_{h}=e^{\sigma x}\cdot\Big{[}C_{1}\cdot\cos(\omega x)+C_{2}\cdot\sin(\omega x)\Big{]}$ |

> [!NOTE] $C_{1}$ und $C_{2}$ werden durch die Anfangsbedingung festgelegt  
> Es müssen immer 2 Lösungen existieren, da die Anfangsbedingungen der Differentialgleichung 2. Ordnung $\frac{dy(x_0)}{dx}$ und $y(x_0)$ sind. Um eine eindeutige Lösung erhalten benötigen wir also 2 Anfangsbedingungen. (z.B. Bei Bewegungsgleichung: Start-[Geschwindigkeit](../../../Physik/Kinematik/Kinematik.md) und Startpunkt)

#### 1. Fall: Eindeutige Lösung

$$
\left.\begin{align*}
y_{h1}&=C_{1}\cdot e^{\lambda_{1}x}\\y_{h2}&=C_{2}\cdot e^{\lambda_{2}x}\\
\end{align*}\quad\right\}\quad
y_{h}=C_{1}\cdot e^{\lambda_{1}x} + C_{2}\cdot e^{\lambda_{2}x}
$$

> [!SUCCESS] Diese Lösung ist eindeutig, da 2 Lösungen existieren  
> Die Summe der beiden Lösungen der homogenen DGL ist auch eine Lösung, da die Differenzialgleichung *linear* ist.

#### 2. Fall: Doppellösung

$\begin{align*} \lambda_{1}&=\lambda_{2}=- \frac{p}{2} \\ y_{h}&=(C_{1}+C_{2}x)\cdot e^{\lambda_{0}x}\end{align*}$

> [!WARNING] ergibt nur eine Lösung … es fehlt also etwas  
> ![Pasted image 20220601193117](../../../_assets/Pasted%20image%2020220601193117.png)

#### 3. Fall: konjugiert komplexe Lösungen

$\left( \frac{p}{2} \right)^{2}-q<0$  
$\lambda_{1}=\sigma+j\omega$  
$\lambda_{2}=\sigma-j\omega$  
$\sigma = -\frac{p}{2}$  
$\omega = \sqrt{q - \left( \frac{p}{2} \right)^{2}}$

---

### Lösung der *inhomogenen* DGL 2. Ordnung

Die Vorgehensweise gleicht völlig der bei [linearen DGL 1. Ordnung](lineare%20DGL%201.%20Ordnung.md), was seinen Grund in der *Linearität* der [DGL](index.md) hat. 

Die allgemeine Lösung $y$ der inhomogenen Gleichung ist die Summe *("Überlagerung")* der allgemeinen Lösung $y_{h}$ der zugehörigen homogenen Gleichung und irgendeiner partikulären *(speziellen)* Lösung $y_{p}$ der inhomogenen Gleichung: **$y=y_{p}+y_{h}$**. 

Das Aufsuchen einer beliebigen partikulären Lösung $y_{p}$ erfolgt wieder am Einfachsten durch einen Lösungsansatz entsprechend der Störfunktion **$s(x)$**. Dies gilt, wenn die [DGL](index.md) konstante Koeffizienten besitzt, was vorraussetzungsgemäß der Fall ist.

- [DGL Störterm-Ansätze](DGL%20Störterm-Ansätze.md)