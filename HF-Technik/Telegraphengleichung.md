---
tags:
  - RF
aliases:
  - Ausbreitungskoeffizient
  - Fortpflanzungskonstante
  - Helmholzsche Differenzialgleichung
  - Telegrafengleichung
subject:
  - HF-Systemtechnik 1
  - KV
semester: WS24
professor:
  - Reinhard Feger
created: 1st March 2023
def:
  - TFGL
---

# Telegraphengleichung

Die Telegraphengleichung ist eine gewöhnliche [DGL 2. Ordnung](../Mathematik/Algebra/lineare%20DGL%202.%20Ordnung.md) und beschreibt die Propagation einer Spannungswelle auf einer [HF-Übertragungsleitung](Transmission%20Line.md) mit Berücksichtigung der durch den materialgegebenen Signalausbreitungs-Geschwindigkeiten. 

> [!warning] Damit die Telegrafengleichung gilt, muss dass Material des Wellenleiters linear und isotrop sein. 
> - Die [Materialgleichungen](../Elektrotechnik/Maxwell.md#Materialgleichungen) gelten im gesamten Material gleich. $\mu$ und $\varepsilon$ sind konstant

## D'Alembertsche Lösung

$$\frac{\partial }{\partial z} I(z,t)= -C' \frac{\partial}{\partial t}V(z,t),\quad\frac{\partial }{\partial z}V(z,t)= -L' \frac{\partial}{\partial t}I(z,t)$$

$$
\frac{\partial}{\partial t} \frac{\partial V(z, t)}{\partial z}=-L^{\prime} \frac{\partial^2 I(z, t)}{\partial t^2},\quad \frac{\partial^2 I(z, t)}{\partial z^2}=-C^{\prime} \frac{\partial}{\partial z} \frac{\partial V(z, t)}{\partial t}
$$

Die Lösung für die Ausbreitungs-Wellen von Strom und Spannung auf einer Leitung, ist eine Überlagerung von Hin und Rücklaufender Welle:

$$
\begin{align}
u(z)&= U_{h}\left( t-\tfrac{z}{c} \right)+ U_{r}\left( t+\tfrac{z}{c} \right)\\
i(z)&= I_{h}\left( t-\tfrac{z}{c} \right) - I_{r} \left( t+\tfrac{z}{c} \right)
\end{align}
$$

Die Grenzbedingungen sind hier der Anfang und das Ende der Leitung (die Eingangs und Abschluss impedanz). Dabei haben $U_{h}, U_{r}, I_{h}$ und $I_{r}$ eine **beliebige** Wellenform

> [!question] Das $-$ vor $I_{r}\left( t+\frac{z}{c} \right)$ ist durch die Zählpfeilrichtung für [Zweitore](../Hardwareentwicklung/Vierpol.md) gegeben, da in die Tore hineinfließende Ströme positiv sind.

## Telegrafengleichung für Sinusgrößen

In der allgemeinen Lösung kommen sowohl $\frac{\partial }{\partial t}$ und $\frac{\partial }{\partial z}$ Terme vor. Betrachtet man nur eine einzige Frequenz, kann die komplexe Wechselstromrechnung zur Anwendung gebracht werden.

In der Wechselstromtechnik kann eine Differenzation nach der Zeit durch eine Multiplikation mit $j\omega$. 

> [!question]- Herleitung:
> ![700](assets/Telegraphengleichung%202025-01-21%2023.00.48.excalidraw.md)

Gekoppelte PDGL der TFGL:
$$
\frac{\partial \underline{U}}{\partial z}(z) = -(R'+j\omega L')\cdot \underline{I}(z),\quad \frac{\partial \underline{I}}{\partial z}(z) = -(G'+j\omega C')\cdot \underline{U}(z)
$$

> [!def] **D - TFGL)** Telegraphengleichung in Form einer Helmholtzschen Differenzialgleichung der Ausbreitungswelle für **Sinusgrößen**
> $$\dfrac{\mathrm{d}^{2}u}{\mathrm{d} z^{2}}=u(z)\gamma^{2}, \quad \frac{\mathrm{d}^{2}i}{\mathrm{d}z^{2}}=i(z)\gamma^{2}\tag{TFGL}$$
^TFGL


> [!success] Lösung der Telegraphengleichung für die Ausbreitungswellen für **Sinusgrößen**
>
> $$ u(z)= U_{h}\cdot e^{-\gamma\cdot z}+ U_{r}\cdot e^{\gamma\cdot z}, \quad i(z)= I_{h}\cdot e^{ -\gamma \cdot z } - I_{r}\cdot e^{ \gamma \cdot z }$$
> 
> Als Lösung der Telegraphengleichung ergibt sich die Überlagerung gegenläufiger, exponentiell gedämpfter Spannungswellen.
> 
> - $U_{h}, I_{h}$ = komplexe Amplitude der hinlaufenden Welle
> - $U_{r}, I_{r}$ = komplexe Amplitude der rücklaufenden Welle
^LSGTFGL

### Ausbreitungskoeffizient

> [!summary] komplexer Ausbreitungskoeffizient $\gamma$
> Die Ausbreitungskonstante $\gamma$ beschreibt die Verlustgrößen der Leitergeometrie. In Ihm steckt die
> 
> $$ \gamma = \sqrt{(R'+j\omega L')(G'+j\omega C')} = \alpha + j\beta  $$
> 
> $(\,\cdot\,)'\,$: **Leitungsbeläge**
> $\alpha\,$: **Dämpfungsbelag** (Dämpfung der Signalamplitude)
> $\beta\,$: **Phasenbelag** (Verzögerung der Ausbreitungsgeschwindigkeit)



![[assets/Telegraphengleichung 2025-01-21 23.36.38.excalidraw]]


Der Phasenbelag ist mit der Wellenlänge des Signals verknüpft und bestimmt, wie schnell sich die Welle auf der Leitung ausbreitet.
$$\lambda=\frac{2\pi}{\beta}, \quad v_{p} = \lambda f = \frac{\omega}{\beta}$$

# Tags