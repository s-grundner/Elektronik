---
tags: []
aliases: []
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 17th November 2022
---

# LC Oszillatoren
- Prinzip der Schwingungserzeugnung: Entladung eines [[Schwingkreise|Schwingkreis]]es
- Resonanzfrequenz des LC-SK bestimmt die Frequenz
- sowohl Reihen- als auch Parallelschwingkreis möglich 
- Steiler Phasengang $\rightarrow$ hohe Frequenzstabilität
- geeignet für hohe Frequenzen

## Schaltung

## Herleitung
$\dfrac{u_{1}}{u_{2}}=1+\dfrac{(A-1)\cdot R_{1}}{R_{1}}=1+A-1=A$
mit 
$$
\begin{align*}
&u_{L}=L\cdot\dfrac{di}{dt}
&&i_{L}=\frac{1}{L}\int u_{L}dt\\
&i_{C}=C\cdot\dfrac{du_{c}}{dt}
&&U_{C}=\frac{1}{C}\int idt\\
\end{align*}
$$

Bildung einer [[{MOC} DGL|DGL]]:
$$
\begin{align*}
i_{R}-i_{C}-i_{L}&=0\\
\frac{u_{2}-u_{1}}{R}-C\cdot \dot{u}- \frac{1}{L}\int u_{1}dt &= 0 \quad\Big| \frac{d}{dt}\\
\frac{}{}-C\cdot \dot{u}- \frac{1}{L}\int u_{1}dt &= 0 \quad\Big| \frac{d}{dt} \quad\Big| \frac{d}{dt}\\
\dots
\end{align*}
$$

### Herleitung der [[lineare DGL 2. Ordnung|linearen Differentialgleichung 2. Ordnung]]
$$
\begin{align*}
\ddot{u}_{1}+2\delta \cdot\dot{u}_{1} - \frac{1}{LC}\cdot u_{1}&=0 \qquad \delta= \frac{1-A}{2RC}  \qquad \omega_{0}^{2} = \frac{1}{LC} 
\end{align*}
$$
$\delta \dots$ Dämpfung
- Der Störterm muss $0$ betragen, damit das System schwingfähig ist
  
```ad-question
title: Lösungsansatz
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
u_{1}(t) &= 
\end{align*}
$$
```


# Colpitts Oszillator
Besteht aus Emitter/Basis/Collector Schaltung mit einer Rückkopplung:
1. kapazitiv
2. [[Induktivitäten|induktiv]]
3. transformatorisch

Häufigste Kombination: Colpitts Oszillator (mit kapazitiver Rückkopplung)
Vorteil: 
- einfache Kapazitäten
- nur eine [[Induktivitäten|Induktivität]]


# Quellen




