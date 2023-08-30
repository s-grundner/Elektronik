---
tags: ["DGL"]
aliases: [
	"lineare DGL zweiter Ordnung",
	"DGL 2. Ordnung",
	"charakteristische Gleichung",
	"Differentialgleichung 2. Ordnung", "Differentialgleichungen 2. Ordnung"]
subject: "mathe"
source: ["Rudolf Frauenschuh"]
---

# Lineare Differentialgleichungen 2. Ordnung

## Lineare [DGL]({MOC}%20DGL.md) 2. Ordnung mit konstantem Koeffizienten

$$y'' + p\cdot y'+q\cdot y=s(x) $$

### Lösung der *homogenen* [DGL]({MOC}%20DGL.md) 2. Ordnung

Die Allgemeine Lösung $y_h$ einer homogenen linearen [DGL]({MOC}%20DGL.md) 2. Ordnung erfolgt mit dem [Exponentialansatz](Exponentialansatz.md)

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

$\lambda_{1,2} = -\dfrac{p}{2}\pm \sqrt{\Big{(}\dfrac{p}{2}\Big{)}^{2}-q}$

| Fall    | Bedingung                            | Art der Lösung                                                                               | Lösungsansatz für `y`                                                                    |
| ------- | ------------------------------------ | -------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| 1. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q>0$ | $\lambda_1 \neq \lambda_2$ (2 reelle Lösungen)                                               | $y_{h}= C_{1}\cdot e^{\lambda_{1}}+C_{2}\cdot e^{\lambda_{2}x}$                          |
| 2. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q=0$ | $\lambda_{1}=\lambda_{2}=\lambda_0$ (reelle Doppellösung)                                    | $y_{h}=(C_{1}+C_{2}x)\cdot e^{\lambda_{0}x}$                                             |
| 3. Fall | $\Big{(}\dfrac{p}{2}\Big{)}^{2}-q<0$ | $\lambda_{1,2}=\sigma\pm j\cdot\omega$ (2 konjugiert [komplexe](Komplexe%20Zahlen.md) Lösungen) | $y_{h}=e^{\sigma x}\cdot\Big{[}C_{1}\cdot\cos(\omega x)+C_{2}\cdot\sin(\omega x)\Big{]}$ |

> [!note] $C_{1}$ und $C_{2}$ werden durch die Anfangsbedingung festgelegt

#### 1. Fall: Eindeutige Lösung

$\left.\begin{align*}y_{h1}&=C_{1}\cdot e^{\lambda_{1}x}\\y_{h2}&=C_{2}\cdot e^{\lambda_{2}x}\\\end{align*}\right\{y_{h}=C_{1}\cdot e^{\lambda_{1}x} + C_{2}\cdot e^{\lambda_{2}x}$

#### 2. Fall: Doppellösung

$\begin{align*} \lambda_{1}&=\lambda_{2}=- \frac{p}{2} \\ y_{h}&=(C_{1}+C_{2}x)\cdot e^{\lambda_{0}x}\end{align*}$

> [!warning] ergibt nur eine Lösung ... es fehlt also etwas
> ![Pasted image 20220601193117](Pasted%20image%2020220601193117.png)


#### 3. Fall: konjugiert [komplexe](../mathe%20(3)/Komplexe%20Zahlen.md) Lösungen

$\left( \frac{p}{2} \right)^{2}-q<0$
$\lambda_{1}=a+jb$
$\lambda_{2}=a-jb$
$a = \sigma = -\frac{p}{2}$
$b = \omega = \sqrt{q - \left( \frac{p}{2} \right)^{2}}$

> [!note] Man schreibt $\sigma$ statt $a$ und $\omega$ statt $b$.

---

### Lösung der *inhomogenen* [DGL]({MOC}%20DGL.md) 2. Ordnung

Die Vorgehensweise gleicht völlig der bei [linearen DGL 1. Ordnung](lineare%20DGL%201.%20Ordnung.md), was seinen Grund in der *Linearität* der [DGL]({MOC}%20DGL.md) hat. 

Die allgemeine Lösung $y$ der inhomogenen Gleichung ist die Summe *("Überlagerung")* der allgemeinen Lösung $y_{h}$ der zugehörigen homogenen Gleichung und irgendeiner partikulären *(speziellen)* Lösung $y_{p}$ der inhomogenen Gleichung: **$y=y_{p}+y_{h}$**. 

Das Aufsuchen einer beliebigen partikulären Lösung $y_{p}$ erfolgt wieder am Einfachsten durch einen Lösungsansatz entsprechend der Störfunktion **$s(x)$**. Dies gilt, wenn die [DGL]({MOC}%20DGL.md) konstante Koeffizienten besitzt, was vorraussetzungsgemäß der Fall ist. 

| Störterm                                                                                                       | Lösunsansatz                                                                                                                                                                                                             |
| -------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| $s(x)=A$ (konstante Funktion)                                                                                  | $y_{p}=a$                                                                                                                                                                                                                |
| $s(x)=A\cdot x+B$                                                                                              | $y_{p}=a\cdot x+b$                                                                                                                                                                                                       |
| $s(x)=A_{n}\cdot x^{n}+A_{n-1}\cdot x^{n-1}+\ldots+A_{1}\cdot x+A_{0}$                                         | $y_p=a_{n}\cdot x^{n}+a_{n-1}\cdot x^{n-1}+...+a_{1}\cdot x+a_{0}$                                                                                                                                                       |
| $s(x)=A\cdot\sin(\omega x)$<br>$s(x)=A\cdot\cos(\omega x)$<br>$s(x)=A\cdot\sin(\omega x)+B\cdot\cos(\omega x)$ | $y_{p}=a\cdot\sin(\omega x)+b\cdot\cos(\omega x)$ oder $y_{p}=a\cdot\sin(\omega x+\varphi)$<br>Wenn $j\omega$ Lösung der charakteristischen Gleichung ist: <br>$y_{p}=x\cdot[a\cdot\sin(\omega x)+b\cdot\cos(\omega x)]$ |
| $s(x)=A\cdot e^{bx}$                                                                                           | $y_{p}=a\cdot e^{bx}$ (wenn $b$ keine Lösung der charakteristischen Gleichung ist)                                                                                                                                       |


---

# Tags

[Quadratische Gleichung](Quadratische%20Gleichung)