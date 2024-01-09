---
tags: ["Baugruppen/Oszillator"]
aliases: ["LC-Oszillator", "LC-Oszillatoren", "LC Oszillator"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
created: 17th November 2022
---

# LC [Oszillatoren](Clock%20Generierung.md)

- Prinzip der Schwingungserzeugung: Entladung eines [Schwingkreis](../../Mathe/mathe%20(4)/Schwingkreise.md)
- Resonanzfrequenz des LC-SK bestimmt die Frequenz
- sowohl Serienals auch Parallelschwingkreis möglich 
- Steiler Phasengang $\rightarrow$ hohe Frequenzstabilität
- geeignet für hohe Frequenzen

# Parallel [Schwingkreis](../../Mathe/mathe%20(4)/Schwingkreise.md) mit [OPV](../Operations-Verstärker.md)

> [!INFO] Schaltung  
>![LC-osz](../assets/LC-osz.png)

## Herleitung mit [BHK](Barkhausen%20Kriterium.md)

## Herleitung mit [DGL](../../Mathe/{MOC}%20DGL.md)

$$
\frac{u_{1}}{u_{2}}=1+\frac{(A-1)\cdot R_{1}}{R_{1}}=1+A-1=A
$$

mit 

$$
\begin{align*}
&u_{L}=L\cdot\dfrac{di}{dt}
&&i_{L}=\frac{1}{L}\int u_{L}dt\\
&i_{C}=C\cdot\dfrac{du_{c}}{dt}
&&U_{C}=\frac{1}{C}\int idt\\
\end{align*}
$$

Bildung einer [DGL](../../Mathe/{MOC}%20DGL.md):

$$
\begin{align*}
i_{R}-i_{C}-i_{L}&=0\\
\frac{u_{2}-u_{1}}{R}-C\cdot \dot{u}- \frac{1}{L}\int u_{1}dt &= 0 \quad\Big| \frac{d}{dt}\\
\frac{}{}-C\cdot \dot{u}- \frac{1}{L}\int u_{1}dt &= 0 \quad\Big| \frac{d}{dt} \quad\Big| \frac{d}{dt}\\
\dots
\end{align*}
$$

### Herleitung der [linearen Differentialgleichung 2. Ordnung](../../Mathe/mathe%20(4)/lineare%20DGL%202.%20Ordnung.md)

$$
\begin{align*}
\ddot{u}_{1}+2\delta \cdot\dot{u}_{1} - \frac{1}{LC}\cdot u_{1}&=0 \qquad \delta= \frac{1-A}{2RC}  \qquad \omega_{0}^{2} = \frac{1}{LC} 
\end{align*}
$$

> [!check] Lösung
>
> $$
> \begin{align*}
> u_{c}(t)= \underbrace{\underbrace{(C_{1}+C_{2})}_{\tilde{C_{1}}}\cdot\cos(\omega t)}_{\mathcal{Re}} + j \underbrace{\underbrace{(C_{1}-C_{2})}_{\tilde{C_{2}}}\cdot\sin(\omega t)}_{\mathcal{Im}}
> \end{align*}
> $$

> [!INFO] Anmerkung  
> Sowohl Real, als auch Imaginärteil sind Lösungen der Differentailgleichung  
> Das erkennt man durch Einsetzen  
> Daher ist die Summe aus imaginärteil und realteil eine Lösung -> Allgemeine Lösung

![](../assets/Pasted%20image%2020221201121517.png)

$$
\begin{align*}
u_{c}(t)&= \tilde{C_{1}}\cdot\cos(\omega t)+\tilde{C_{2}}\sin(\omega t)\\
&= A\cdot\sin(\omega t+\varphi)\\
\tan(\varphi)&= \frac{\tilde{C_{2}}}{\tilde{C_{1}}}
\end{align*}
$$

- Damit die Schaltung ein [Selbstschwingendes](../../Mathe/mathe%20(4)/Schwingkreise.md) System sein kann, muss der [](../../Mathe/mathe%20(4)/Schwingkreise.md#Freie%20Schwingungen%20im%20realen%20Serienschwingkreis|Störterm) $0$ sein (Selbsterregt) und ein [](../../Mathe/mathe%20(4)/lineare%20DGL%202.%20Ordnung.md#3%20Fall%20konjugiert%20Komplexe%20Zahlen%20komplexe%20Lösungen.md|Schwingfall) ($\delta<\omega_{0}$)

> [!question] Lösungsansatz

$$
\begin{align*}
u_{1}(t) &= C\cdot e^{\lambda t}\\
\dot{u}_{1}(t) &= C\cdot \lambda \cdot e^{\lambda t}\\
\ddot{u}_{1}(t) &= C\cdot \lambda^{2}\cdot e^{\lambda t}
\\\\
C\cdot e^{\lambda t}(\lambda^{2}+2\delta\lambda + \omega_{0}^{2}) &= 0\\
\lambda^{2}+2\delta\lambda + \omega_{0}^{2} &= 0
\\\\
\lambda_{1,2} &= -\frac{2\delta}{2} \pm \sqrt{\frac{(2\delta)^{2}}{4}-\omega_{0}^{2}}\\
&= - \delta \pm \sqrt{\delta^{2}-\omega_{0}^{2}}
\\\\
u_{1}(t) &= \dots
\end{align*}
$$

### Herleitung der Schwingfrequenz

$$
\begin{align*}
\omega_{1}&
\begin{cases}
R&= \omega_{1}\cdot L- \dfrac{1}{\omega_{1}\cdot C}\\
&\dots\\
\omega_{1,1}&= \frac{R}{2L}+\sqrt{\dfrac{R^{2}}{4L^{2}}+ \dfrac{1}{LC}} =\dfrac{R}{2L}+\sqrt{x}\\
\end{cases}\\
\omega_{2}&
\begin{cases}
R&= -\left(\omega_{2}\cdot L - \dfrac{1}{\omega_{2}\cdot C}\right)\\
\omega_{2}\cdot RC &= -\omega_{2}^{2}\cdot LC+1\\

\end{cases}
\end{align*}
$$

#### Abkürzung

$$
\begin{align*}
Q&= \dfrac{U_{L,R}}{U} =\dfrac{U_{C,R}}{U} = \frac{\omega_{0}\cdot L}{R}=\frac{1}{\omega_{0}\cdot RC}\\
B&= \frac{f_{r}}{Q}=\frac{\omega_{0}\cdot RC}{2\pi\sqrt{LC}}\\
&\dots\\
&= \frac{1}{2\pi}\cdot \frac{R}{L}\\
\end{align*}
$$

![600](../assets/Pasted%20image%2020221212102110.png)

$$
\begin{align*}
\underline{Y} &= \frac{1}{R} + j\left(\omega\cdot C - \frac{1}{\omega L}\right)\qquad \text{Y wird zu null bei Resonanz}\\
\omega_{0}\cdot C &= \frac{1}{\omega_{0}\cdot L} = \frac{1}{\sqrt{LC}}
\end{align*}
$$

![600](../assets/ParallelZeiger.png)

- $Y\rightarrow0$ bei $\omega = \omega_{r}$
- $Z$ wird ein Maximum
- Spannungsmaximum bei Resonanz
- bewirkt $\underline{I}_{L}$, $\underline{I}_{C}$ welche größer als $\underline{I}$ 

Bandbreite: Obere minus untere [Grenzfrequenz](../Grenzfrequenz.md)

# Serien [Schwingkreis](../../Mathe/mathe%20(4)/Schwingkreise.md) mit [OPV](../Operations-Verstärker.md)

> [!INFO] Schaltung  
> ![Pasted image 20221213082043](../assets/Pasted%20image%2020221213082043.png)

## Herleitung mit [BHK](Barkhausen%20Kriterium.md)

## Herleitung mit [DGL](../../Mathe/{MOC}%20DGL.md)

man betrachtet den Fall der ungedämpften Schwingung mit $\delta = \frac{R}{2L}= 0$

Es gilt: $v= 1+ \dfrac{R_{1}}{R_{2}}=\dfrac{u_{a}}{u_{p}}$

# Typen

[Colpitts Oszillator](Colpitts%20Oszillator.md)

# Quellen

![Clock_und_Reset_Generierung](../assets/pdf/Clock_und_Reset_Generierung.pdf)