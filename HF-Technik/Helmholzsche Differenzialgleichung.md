---
tags:
aliases:
keywords:
  - Telegrafengleichung
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 17th January 2026
professor:
  - Reinhard Feger
release: true
title: Helmholzsche Differenzialgleichung
---
# Helmholtz Gleichung 

> [!question] [Telegrafengleichung](Telegrafengleichung.md) für Sinusgrößen 

Die Allgemeine herangehensweise nach D'Alembert im Zeitbereich betrachtet sowohl  $\frac{\partial }{\partial t}$ und $\frac{\partial }{\partial \mathbf{x}}$, welche die Analyse und Lösung der Gleichungen erschwert. Für Sinusförmige größen, welche mit nur einer Frequenz schwingen, lassen sich vereinfachungen der [komplexen Wechselstromrechnung](../Elektrotechnik/Wechselstromtechnik.md) anwenden.

> [!hint]  In der [Wechselstromtechnik](../Elektrotechnik/Wechselstromtechnik.md) kann eine Differenzation nach der Zeit durch eine Multiplikation mit $j\omega$ substituiert werden.

Die Telegraphengleichungen werden dann von der [Wellengleichung](../Mathematik/Analysis/Wellengleichung.md) zu einer gewöhnliche [DGL 2. Ordnung](../Mathematik/Algebra/lineare%20DGL%202.%20Ordnung.md).

## Telegrafengleichung - Ausbreitung des E und H-Feldes in einem Medium

Für eine Ausbreitung der gekoppelten [Vektorfelder](Vektoranalysis/index.md) $\mathbf{E}$ ([elektrisches Feld](../../Elektrotechnik/Elektrisches%20Feld.md)) und $\mathbf{H}$ ([magnetisches Feld](../../Elektrotechnik/Magnetisches%20Feld.md)), dessen Zusammenhang mit den [Maxwell](../../Elektrotechnik/Maxwell.md) Gleichungen beschreiben werden, lässt sich die Wellengleichung für die Feldkomponenten herleiten.

> [!hint] Die gleiche herangehensweise kann auch in der [Zeitbereichsbetrachtung](../Mathematik/Analysis/Wellengleichung.md) verwendet werden.

### Verlustloses Medium

> [!warning] Damit die Vereinfachung gilt, muss dass Material des Wellenleiters **linear** und **isotrop** sein. 
> - $\mu$ und $\varepsilon$ sind konstante skalare und reelle Werte und nicht ortsabhängig.

Man betrachtet die [Materialgesetze](../Elektrotechnik/Materialgesetze.md) und [Maxwell](../Elektrotechnik/Maxwell.md)-Gleichungen in [Phasorschreibweise](../Elektrotechnik/Wechselstromtechnik.md#Phasorschreibweise%20der%20Maxwellgleichungen) in einem Verlustlosen dielektrischen Medium ($\sigma = 0; \rho=0; \epsilon,\mu\in \mathbb{R}$) und erhält folgende gekoppelte DGLen:

- [M1](../Elektrotechnik/Materialgesetze.md#^MATG) $\to$ [MW1](../Elektrotechnik/Maxwell.md#^MW1): $\nabla\times\mathbf{E} = -j\omega\mu\mathbf{H}$
- [M2](../Elektrotechnik/Materialgesetze.md#^MATG) $\to$ [MW2](../Elektrotechnik/Maxwell.md#^MW2): $\nabla\times\mathbf{H} = j\omega\epsilon\mathbf{E}$

Indem man den [Rotor](../Mathematik/Analysis/Vektoranalysis/Rotor.md) auf eine der Gleichungen anwendet (z.B. MW1) erhält man

$$
\nabla\times\nabla\times\mathbf{E} = -j\omega\mu (\underbrace{ \nabla \times\mathbf{H} }_{ \text{MW2} }) =\omega^{2}\mu\epsilon\mathbf{E}
$$

Die [Rechenregel für den Rotor des Rotors (xi)](Vektoranalysis/Nabla%20Operator.md#Allgemeine%20Rechenregeln) eines Vektorfeldes:

$$
\nabla \times \nabla \times\mathbf{E} = \nabla(\underbrace{ \nabla\cdot \mathbf{E} }_{ \text{MW3} }) - \nabla^{2} \mathbf{E}
$$

[MW3](../Elektrotechnik/Maxwell.md#^MW3) besagt, dass $\nabla\cdot\mathbf{E} = \frac{\rho}{\epsilon}$. Da sich im idealen dielektrikum keine Ladungsquellen befinden ist $\rho=0$, wodurch man für die Wellengleichung im Frequenzbereich erhält ($k$ ... [Wellenzahl](../Physik/Wellenzahl.md)):

$$
\nabla^{2}\mathbf{E} + \omega^{2}\mu\epsilon\mathbf{E} = 0 \quad \text{bzw.} \quad \nabla^{2}\mathbf{E} + k^{2}\mathbf{E} = 0
$$

Durch dieselbe Betrachtung für das H-Feld erhält man parallel

$$
\nabla^{2}\mathbf{H} + \omega^{2}\mu\epsilon\mathbf{H} = 0 \quad \text{bzw.} \quad \nabla^{2}\mathbf{H} + k^{2}\mathbf{H} = 0
$$


Aus den gekoppelten DGL hat man nun nur noch eingrößen DGL erhalten und man kann die Feldausbreitung separat betrachten.

#### Lösung der Telegrafengleichung

Für ein einfaches elektrisches Feld mit nur einer Feldkomponente in $\hat{x}$ Richtung und keiner änderung in $x$ und $y$ ($\frac{\partial }{\partial x}=\frac{\partial }{\partial y}=0$), die Wellengleichung reduziert sich zu

$$
\frac{\partial^{2} E_{x}}{\partial z^{2}} + k^{2} E_{x} = 0
$$

Die Lösung für diese homogene GDGL 2. Ordnung lautet eine Lösung

$$
E_{x}(z) = E^{+}e^{ -jkz } +  E^{-} e^{ jkz }
$$

Wobei die konstanten $E^{+}$ und $E^{-}$ durch Rand- oder Anfangswerte ermittelt werden müssen.

### Verlustbehaftetes Medium



## Telegrafenleitungsgleichung - Ausbreitung von Spannungs und Stromwellen auf einer Leitung

Telegrafenleitungsgleichung: Ausgangspunkt für die [Leitungstheorie](Transmission%20Line.md).

> [!question]- Herleitung:
> ![700](../_assets/Telegraphengleichung%202025-01-21%2023.00.48.excalidraw.md)

Gekoppelte Differenzialgleichung
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



![[../_assets/Telegraphengleichung 2025-01-21 23.36.38.excalidraw]]


Der Phasenbelag ist mit der Wellenlänge des Signals verknüpft und bestimmt, wie schnell sich die Welle auf der Leitung ausbreitet.
$$\lambda=\frac{2\pi}{\beta}, \quad v_{p} = \lambda f = \frac{\omega}{\beta}$$

