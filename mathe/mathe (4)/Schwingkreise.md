---
tags: ["DGL", "Baugruppen/Oszillator"]
aliases: ["Schwingkreis"]
subject: ["mathe", "hwe", "physik"]
---

# Schwingungen

## Zusammenhang mit [[{MOC} DGL|Differentialgleichgungen]]

Jede Schwingung besteht aus einem Einschwingvorgang und einem eingeschwungenen Zustand.
Auf beide dieser Zustände kann mithilfe von Differentialgleichungen zurückgerechnet werden.

Die Komponenten einer schwingung in der [[lineare DGL 2. Ordnung|lineare DGL zweiter Ordnung]] sind wiefolgt:
1. Die Funktion $y_{h}(t)$ des Einschwingvorganges ist die [[lineare DGL 2. Ordnung|homogenen Lösung der DGL 2. Ordnung]] 
	$\rightarrow y_{h}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = 0$
2. die Funktion $y_{p}(t)$ des eingeschwungenen Zustandes ist eine partikuläre Lösung [[lineare DGL 2. Ordnung#Lösung der inhomogenen DGL 2 Ordnung|der inhomogenen DGL 2. Ordnung]]
	$\rightarrow y_{p}$ aus $\ddot y + 2\delta\cdot\dot y + \omega_{0}^{2}\cdot y = s(x)$

Die Funktion der Gesamten Schwingung ist somit: $y(t) = y_{p}(t) + y_{h}(t)$

## Mechanischer Schwingkreis
> ![[m_schwingk.png|400]]
$$
\begin{align*}
	F_{feder} &= -k\cdot y & F_{a} &= F_{feder} + F_{reibung}\\
	F_{reibung} &= -d \cdot \dot{y} & m \cdot \ddot{y}&=-k\cdot y + -d \cdot \dot{y}\\
	F_{a} &= m \cdot \ddot{y} & \ddot{y} + \frac{d}{m} \cdot \dot{y} + \frac{k}{m}\cdot y &= 0\\
\end{align*}
$$

### Bezeichnungen
| Ausdruck | Bezeichnung        |
| -------- | ------------------ |
| $m$      | Masse              |
| $d$      | Dämpfungskonstante |
| $k$      | Federkonstante     |

Man kommt durch umformen auf die finale lineare homogene [[lineare DGL 2. Ordnung|Differentialgleichung 2. Ordnung]]: 
$\ddot{y} + \frac{d}{m} \cdot \dot{y} + \frac{k}{m}\cdot y = 0$

Daraus ergibt sich durch die [[lineare DGL 2. Ordnung#Lösung der homogenen DGL 2 Ordnung|charakteristische Gleichung]] folgende Formel für $\lambda$:
$\lambda_{1,2}=- \frac{d}{2m}\pm\sqrt{(\frac{d}{2m})^{2}- \frac{k}{m}}$

### Bezeichnungen
| Ausdruck                                                | Bezeichnung                                                        |
| ------------------------------------------------------- | ------------------------------------------------------------------ |
| $2\delta = \frac{d}{m} \rightarrow \frac{d}{2m}=\delta$ | [Abklingkonstante](https://de.wikipedia.org/wiki/Abklingkonstante) |
| $\omega_{0} = \sqrt{\frac{k}{m}}$                      | Resonanzkreisfrequenz                                              |


## Freie Schwingungen im realen Serienschwingkreis
Freie Schwingungen führt ein Schwingfähiges System aus, das – nach einer Störung/Auslenkung sich selbst überlassen – je nach [[Dämpfung]] oszillierend oder „kriechend“ in den Gleichgewichtszustand zurückkehrt. Die Frequenz der freien Schwingung ist die [Eigenfrequenz](https://de.wikipedia.org/wiki/Eigenfrequenz "Eigenfrequenz") des Schwingers.

> ![[e_serien_schwingk_frei.png|400]]

Um die Spannung der einzelnen Komponenten ab dem Zeitpunkt $t=0$ zu betrachten, wird nun aus den bekannten Eingenschaften der Bauteile eine [[lineare DGL 2. Ordnung|Differentialgleichung 2. Ordnung]] hergeleitet.

| Einfluss der [[Impedanz\|Spule]] | Einfluss des [[Impedanz\|Kondensator]]       | Einfluss des [[Impedanz\|Widerstand]] |
| -------------------------------- | -------------------------------------------- | ------------------------------------- |
| $u_{L}(t)=L\cdot\frac{di}{dt}$   | $u_{C}(0) = U_{0}$                           | $u_{R}=i(t)\cdot R$                   |
|                                  | $q(t)=C\cdot u_{C}(t)$                       |                                       |
|                                  | $i(t)=C\cdot\frac{du_{c}}{dt}$               |                                       |
|                                  | $\frac{di}{dt}=C\cdot \frac{d^{2}u}{dt^{2}}$ |                                       |

$$
\begin{align*}
	u_{R}+u_{L}+u_{C} &= 0\\
	
	i\cdot R+L\cdot \frac{di}{dt}+u_{C} &= 0\\
	
	R\cdot C\cdot \frac{du_{c}}{dt}+L\cdot C\cdot \frac{d^{2}u}{dt^{2}} + u_{C} &= 0 \Big|:LC\\
	
	\frac{d^{2}u_{c}}{dt^{2}}+ \frac{du_{c}}{dt}\cdot \frac{R}{L}+u_{c}\cdot \frac{1}{LC} &= 0\\
\end{align*}
$$
$$
\underline{\underline{
	\frac{d^{2}u_{c}}{dt^{2}}+ \frac{du_{c}}{dt}\cdot 2\delta+u_{c}\cdot \omega^{2}_{0} = 0
}}
$$
Ebenfalls kann die Ladung über die Zeit betrachtet werden, sodass man auf einen ähnlichen Ansatz für die Differentailgleichung kommt.

$$
\begin{align*}
 R\cdot \frac{dq}{dt} + L\cdot \frac{d^{2q}}{dt^{2}} + \frac{q}{c} = 0 \qquad \Big{|}:L
\end{align*}
$$

$$
\underline{\underline{
	\frac{d^{2q}}{dt^{2}} + \frac{dq}{dt}\cdot \frac{R}{L}+q\cdot \frac{1}{LC} = 0
}}
$$

Nun kann man aus einer der [[{MOC} DGL|DGL]] die [[lineare DGL 2. Ordnung#Lösung der homogenen DGL 2 Ordnung|charakteristische Gleichung]] erzeugen
$$
\begin{align*}
	\lambda^{2}+ \underbrace{\frac{R}{L}}_{2\delta}\lambda + \underbrace{\frac{1}{LC}}_{\omega_{0}^{2}} &= 0\\	
\end{align*}
$$
$$
\underline{\underline{
	\lambda^{2}+ 2\delta\cdot\lambda + \omega_{0}^{2} = 0
}}
$$
### Bezeichnungen
| Ausdruck                                                | Bezeichnung                                                        |
| ------------------------------------------------------- | ------------------------------------------------------------------ |
| $2\delta = \frac{R}{L} \rightarrow \frac{R}{2L}=\delta$ | [Abklingkonstante](https://de.wikipedia.org/wiki/Abklingkonstante) |
| $\omega_{0} = \frac{1}{\sqrt{LC}}$                      | Resonanzkreisfrequenz                                              |

### Lösung der Gleichung
$\lambda_{1} = -\delta+\sqrt{\delta^{2}-\omega^{2}_{0}}$

die 3. Fälle der [[lineare DGL 2. Ordnung|DGL 2. Ordnung]] sind wiefolgt

| Fall                                                                                    |      Bedingung      | Bezeichnung                                                                      |
| --------------------------------------------------------------------------------------- |:-------------------:| -------------------------------------------------------------------------------- |
| [[lineare DGL 2. Ordnung#1 Fall Eindeutige Lösung\|1. Fall]]                            | $\delta>\omega_{0}$ | Kriechfall                                                                       |
| [[lineare DGL 2. Ordnung#2 Fall Doppellösung\|2. Fall]]                                 | $\delta=\omega_{0}$ | [aperiodischer Grenzfall](https://de.wikipedia.org/wiki/Aperiodischer_Grenzfall) |
| [[lineare DGL 2. Ordnung#3 Fall konjugiert Komplexe Zahlen komplexe Lösungen\|3. Fall]] | $\delta<\omega_{0}$ | Schwingfall                                                                      |


>![[faelle_e_sk.png|400]]
>![[Federpendel_verschiedene_Dämpfungen.gif]]

## Erzwungene Schwingung im realen Serienschwingkreis
>![[e_serien_schwingk_erzw.png|400]]

Bei einem erzwungenen Schwingkreis leigt am Eingang eine beliebige [Spannung](https://de.wikipedia.org/wiki/Ohmsches_Gesetz) $U_{e}$, oder auch eine funktion der Spannung $U_{e}(t)$ an.

| Einfluss der [[Impedanz\|Spule]] | Einfluss des [[Impedanz\|Kondensators]]      | Einfluss des [[Impedanz\|Widerstands]] |
| -------------------------------- | -------------------------------------------- | -------------------------------------- |
| $u_{L}(t)=L\cdot\frac{di}{dt}$   | $i(t)=C\cdot\frac{du_{c}}{dt}$               | $u_{R}=i(t)\cdot R$                    |
|                                  | $\frac{di}{dt}=C\cdot \frac{d^{2}u}{dt^{2}}$ |                                        |

$$
\begin{align*}
	u_{R}+u_{L}+u_{C}&=U_{e}\\
	
	R\cdot i + L\cdot\frac{di}{dt} + u_{C}&=U_{e}\\
	
	R\cdot C\cdot\frac{du_{c}}{dt} + L\cdot C\cdot \frac{d^{2}u}{dt^{2}} + u_{C} &= U_{e} \Big| :LC\\
	
	\frac{d^{2}u}{dt^{2}} +\frac{R}{L}\cdot\frac{du_{c}}{dt} + \frac{1}{LC}\cdot u_{C} &= \frac{U_{e}}{LC}\\
\end{align*}
$$

$$
\underline{\underline{
	\frac{d^{2}u_{C}}{dt^{2}} +2\delta\cdot\frac{du_{C}}{dt} + \omega^{2}\cdot u_{C} = \omega^{2}\cdot U_{e}\\
}}
$$

Mit dem Auflösen der [[Kirchhoffsche Regeln#Maschen Regel|Masche]] ergibt sich eine [[lineare DGL 2. Ordnung#Lösung der inhomogenen DGL 2 Ordnung mit Störterm|lineare inhomogene DGL 2. Ordnung mit konstanten koeffizienten]]$(R,L,C)$.

### Bestimmung der Amplituden-Phasen-Form
Die Lösung in der Amplituden-Phasen-Form hat die Form $y(t)_{p} = \hat{y}_{p}\cdot \sin(\omega\cdot t+\varphi)$ und beschreibt nur die Funktion nach dem Einschwingvorgang.

``` ad-example
Serienschwingkreis mit einer Eingangsspannung der Funktion: $u_{e}(t)=\hat{u}_{e}\cdot\sin(\omega\cdot t)$
![[e_serien_schwingk_erzw.png|300]]
Zu ermitteln ist eine Funktion für die Kondensatorspannung $u_{c}$
Um den eingeschwungenen Zustand zu definieren, wird zunächst  $u_{h}$ - die homogene Lösung - ignoriert.
$$
\omega^{2}_{0}\cdot\hat{u}_{e}\sin(\omega\cdot t) = \ddot u_{c} + 2\delta\dot u_{c} + \omega^{2}_{0}\cdot u_{c}
$$


Die [[lineare DGL 2. Ordnung\|partikuläre Lösung]] wird daher ermittelt:
$$
\begin{align*}
	u_{cp} &= a\cdot\sin(\omega t)+b\cdot\cos(\omega t)\\
	\dot u_{cp} &= a\omega\cdot\cos(\omega t)-b\cdot\sin(\omega t)\\
	\ddot u_{cp} &= -a\omega^{2}\cdot\sin(\omega t) - b\omega^{2}\cdot\cos(\omega t)\\
\\
	\omega^{2}_{0}\cdot\hat{u}_{e}\sin(\omega\cdot t)
	&= -a\omega^{2}\cdot\sin(\omega t) - b\omega^{2}\cdot\cos(\omega t)\\
	&+ 2\delta\cdot (a\omega\cdot\cos(\omega t) - b\omega\cdot\sin(\omega t))\\
	&+ \omega^{2}_{0}\cdot (a\cdot\sin(\omega t) + b\cdot\cos(\omega t))\\
\\
	\omega^{2}_{0}\cdot\hat{u}_{e}\sin(\omega\cdot t)
	&= -a\omega^{2}\cdot\sin(\omega t) - b\omega^{2}\cdot\cos(\omega t)\\
	&+ 2\delta\cdot a\omega\cdot\cos(\omega t) - 2\delta\cdot b\omega\cdot\sin(\omega t)\\
	&+ \omega^{2}_{0}\cdot a\cdot\sin(\omega t) + \omega^{2}_{0}\cdot b\cdot\cos(\omega t)\\
\\
	0 &= \left.
		-b\cdot\omega^{2}+2\delta\cdot a\cdot\omega + \omega^{2}_{0}\cdot b
	\right|t=0\\
	\omega^{2}_{0}\cdot\hat{u}_{e} &= \left.
		-a\cdot\omega^{2}-2\delta\cdot b\cdot\omega + \omega^{2}_{0}\cdot a
	\right|{t=\frac{\pi}{2\omega}}
\end{align*}
$$
```
#### Koeffizienten $a$ und $b$ der partikulären Lösung 
Durch umformen erhält man einer Formel für $a$ und $b$, die sich allgemein für die Berechnung von Schwingungen, mit einer trigonometrischen Funktion als Störterm, anwenden lässt:
$$
\begin{align*}
	a&= \frac{\omega^{2}_{0}\cdot\hat{u}_{e}(\omega^{2}_{0}-\omega^{2})}{(\omega^{2}_{0}-\omega^{2})^{2}+4\delta^{2}\omega^{2}}\\
	b&= \frac{-\omega^{2}_{0}\cdot\hat{u}_{e}\cdot2\delta\omega}{(\omega^{2}_{0}-\omega^{2})^{2}+4\delta^{2}\omega^{2}}
\end{align*}
$$
#### Amplitude von $u_{cp}$ (Allgemein auch als $A(\omega)$)
$$
\begin{align*}
	\hat{u}_{cp} &= \sqrt{a^{2}+b^{2}}\\
	&=\frac{\omega^{2}_{0}}{\sqrt{(\omega^{2}_{0} - \omega^{2})^{2}+4\delta^{2}\omega^{2}}}\cdot\hat{u}_{e}
\end{align*}
$$
#### Phase von $u_{cp}$
$$
\begin{align*}
	\varphi_{p}&=\arctan\left(\frac{b}{a}\right)\\
	&=\arctan\left(\frac{-2\delta\omega}{\omega^{2}_{0} - \omega^{2}}\right)
\end{align*}
$$

#### Frequenzgang der Amplitude:
Die Amplitude ist maximal, wenn der Ausdruck unter der Wurzel minimal ist. $d$ ist der Ausdruck unter der Wurzel.
$$
\begin{align*}
	d(\omega) &= (\omega^{2}_{0} - \omega^{2})^{2}+4\delta^{2}\omega^{2}\\
	d'(\omega) &= 2(\omega^{2}_{0} - \omega^{2})\cdot(-2\omega)+4\delta^{2}2\omega\\
\end{align*}
$$
```ad-note
Das [[{MOC} Kurvendiskussion\|globale Minimum]] wird durch das Null setzen der [[Differenzialrechnung\|ersten Ableitung]] ermittelt.
```

$$
\begin{align*}
	d'(\omega) &= 0\\
	4\delta^{2}\cdot2\omega &= -4\omega(\omega_{0}^{2} - \omega^{2})\\
	2\delta^{2} &= \omega_{0}^{2} - \omega^{2}\\
	\omega_{r} &= \sqrt{\omega_{0}^{2}-2\delta^{2}}
\end{align*}
$$

$$
\begin{align*}
	\omega_{r} = \sqrt{\omega_{0}^{2}-2\delta^{2}} &\dots\text{Resonanzkreisfrequenz}\\
	D = \frac{\delta}{\omega_{0}} &\dots\text{Dämpfungsgrad}
\end{align*}
$$
 >![[frequ_gang_e_serien_schwingk.png|700]]

## Freie Schwingung im realen Parallelschwingkreis
![[Pasted image 20221201122606.png]]
### Herleitung
$$
\begin{align*}
\omega_{1}&
\begin{cases}
R&= \omega_{1}\cdot L- \frac{1}{\omega_{1}\cdot C}\\
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
B&= \frac{f_{r}}{Q}=\frac{\omega_{0}\cdot RC}{2\pi\sqrt{LC}}
\end{align*}
$$

# Hardware Implementationen
- [[LC Oszillatoren]]
- [[Colpitts Oszillator]]
- 