---
tags:
  - Analysis/Numerik
aliases:
  - Einseitige z-Transformation
keywords:
  - z-Ebene
subject:
  - VL
  - Signale und Systeme
  - Signalverarbeitung
semester: WS24
created: 8. Februar 2025
professor:
  - Mario Huemer
title: Einseitige z-Transformation
---
 

# z-Transformation

- :LiRefreshCcw: [Laplace-Transformation](Laplacetransformation.md) ***:LiArrowBigRightDash:***
- [q-Transformation](q-Transformation.md)

---

> [!quote]- Die z-Transformation ist eine Erweiterung der [Zeitdiskrete Fouriertransformation](Poissonsche%20Summenformel.md#**Zeitdiskrete**%20Fouriertransformation)
>
> **Zur Erinnerung:** Die Zeitdiskrete Fouriertransformation stellt ein zeitdiskretes signal in Form einer gewichteten Summe von komplexen Exponentialfunktionen der form $\exp (j\Omega)$ dar
> 
> **Motivation:** Es gibt zeitdiskrete Signale (bzw. Impulsantworten von Systemen), die keine Fourier-Transformierte haben, da die Summe der zeitdiskreten Fourier-Transformation nicht konvergiert.
>
> Die z-Transformation spielt bei zeitdiskreten Signalen die gleiche Rolle wie die [Laplacetransformation](Laplacetransformation.md) bei kontinuierlichen Signalen.

Die z-Transformation verwendet die Exponential funktionen der Form:

$$
z=r\cdot\exp(j\Omega)
$$

Die $z$-Transformierte einer Folge ist die **analytische Fortsetzung** der zeitdiskreten Fouriertransformierten vom [Einheitskreis](../Mathematik/Kreis.md) in die komplexe Zahlenebene

## Einseitige z-Transformation

> [!question] [Zweiseitige z-Transformation](Zweiseitige%20z-Transformation.md)

---

> [!def] **D2 - 1ZTR)** Einseitige z-Transformation ^1ZTR
> $$F(z) = \mathcal{Z}_{I}\{f[n]\}(z) = \sum_{n=0}^{\infty}f[n]z^{-n}\tag{1ZTR}$$

Hier werden nur der [kausale](Kausalität.md) teil der Folge transformiert, bzw sind die einseitige und zweiseitige Transformierte äquivalent, wenn die Folge sowieso kausal ist. 

Praktische Anwendungen betrachten nur realitätsgetreue kausale Signale, weswegen die überwiegend Einseitige Transformation angewandt wird.

### Rationale z-Transformierte

Zur Einfacheren Handhabung beschränken wir uns auf die z-Transformierte als rationales Polynom, mit
- Zählergrad $M$ $\leq$ Nennergrad $N$
- $F_{0} = \dfrac{a_{M}}{b_{N}}$
- und nur einfachen Polen in der Partialbruchdarstellung

$$
\begin{align}
F(z) &= \frac{Z(z)}{N(z)} = \frac{\sum_{j=0}^{M}a_{j}z^{j}}{\sum_{i=0}^{N}b_{i}z^{i}} &\text{rational gebrochenes Polynom}\\
&=F_{0} \frac{\prod^{M}_{j=1} (z-z_{0j})}{\prod^{N}_{i=1} (z-z_{\infty i})}&\text{Faktorisierte Null- und Polstellen} \\
&=A_{0} + \left( \sum_{i=0}^{N} \frac{A_{i}\cdot z}{z-z_{\infty i}} \right) \cdot \frac{1}{z}&\text{Partialbruchdarstellung}
\end{align}
$$

### Existenzbedingung

Ausreichend für die Existenz der z-Transformierten ist die Forderung:

> [!satz] **S - ZEXT)** Existenzbedingunge der z-Transformation
>
> $$ \lvert f[n] \rvert \leq BA^{n}  $$
> für geeignete reelle konstanten $A$ und $B$. Die z-Transformierte 

### Konvergenzgebiet

> [!quote] Region of Convergence - ROC

> [!satz] **S - ZKNV)** Konvergenzgebiet der z-Transformierten ist gegeben durch
> $$\lvert z \rvert > \underset{ i=1 }{ \overset{ N }{ \max } } \lvert z_{\infty i} \rvert $$

Das Heißt, die z-Transformierte konvergiert für alle $z$ mit größerem Betrag als der größten Polstelle.


Es konvergieren alle werte vom $z$ **außerhalb** des **Konvergenzkreises** mit dem **Konvergenzradius** $R^{-}$ dessen Wert gleich dem Betrag des größten Poles ist.

![invert_dark|400](../_assets/Pasted%20image%2020250208225644.png)

in dem Kreis befinden sich also alle Polstellen.

### Stabilität

Das Konvergenzgebiet der z-Transformierten eines stabilen Signals schiließt den **Einheitskreis** ein, also alle $z$ mit Betrag kleiner als 1.

> [!satz] **S - BIBO)** BIBO-Stabilität ^BIBO
> 1. Die folge ist [stabil](Stabilität%20und%20Beschränktheit.md#^BIBO) d.h. absolut summierbar.
> 2. Die z-Transformierte konvergiert auf und außerhalb des Einheitskreises ($\to$ alle Pole liegen innerhalb des Einheitskreises)
> 3. Die z-Transformierte ist für $z=\exp (j\Omega)$ (am Einheitskreis, also $r=1$) identisch mit der [DTFT](Zeitdiskrete%20Fourier-Transformation.md)

3. $\implies$ Der **Frequenzgang** ist auf der Zylinderebene des Einheitskreises Abgebildet (siehe [Zeitdiskrete Übertragungsfunktion](Zeitdiskrete%20Übertragungsfunktion.md)) 

## Rechenregeln

> [!satz] **S - ZTR)** Sätze zu den Rechenregeln der z-Transfomrmation
>
> > [!question]- Signalschreibweise
> > ![](Korrespondenzen/zTransformation.md#^Z-T1) 
> 
> > [!question]- Folgenschreibweise
> > ![](Korrespondenzen/zTransformation.md#^Z-T2) 

|     | Endwertsatz     | $\lim_{ n \to \infty } f[n]=\lim_{ z \to 1 } (z-1) F(z)$ |
| --- | --------------- | -------------------------------------------------------- |
|     | Anfangswertsatz | $f[0]=\lim_{ z \to \infty } F(z)$                        |

Anfangs und Endwertsatz gelten nur, sofern der Grenzwert im Zeitbereich existiert.

> [!satz] **S - )** Parsevalsches Theorem der z-Transformation - **Energie des Signals**
> 
> 
> $$
> \begin{align}
> E&=\sum_{n=0}^{\infty} \lvert f[n] \rvert^{2} = \sum_{n=0}^{\infty} f[n]f^{*}[n] \\
> &= \frac{1}{2\pi j} \oint_{C} F(z)F^{*}\left( \frac{1}{z^{*}} \right)z^{-1}\mathrm{~d}z 
> \end{align}
> $$
> 

## Korrespondenzen

für die Kausalen Folgen $f[n] : \mathcal{Z}_{I}\left\{ f[n]\cdot \sigma[n] \right\}(z) = F(z)$ mit dem zeitdiskreten Einheitssprung $\sigma[n]$ 

> [!satz]- **S)**
> ![zTransformation](Korrespondenzen/zTransformation.md#^Z-T3)

# Motivation der Z-TRF für DZGL

> [!info] [Differenzengleichung](../Mathematik/Analysis/Differenzengleichung.md)

## Blockschaltbild

Mit der Darstellung der Übertragungsfunktion als rationale Funktion folgt:

$$
\frac{Y(z)}{X(z)} = H(z) = \frac{Z(z)}{N(z)} = \frac{\sum_{i=0}^{M}c_{i}z^{i}}{\sum_{j=0}^{N}d_{j}z^{j}}
$$
welche direkt in ein Blockschaltbild überführt werden kann. Für eine allfällige Praktische Realisierung auch in der z-Transformation der Übergang auf $z^{-1}$ (also auf kausal realisierbare) Verzögerungselemente (Delay) durchgeführt. Dies lässt sich durch die Division mit der größten Potenz von $z$ in $Z(z)$ und $N(z)$ immer erreichen.

$$
H(z) = \frac{\sum_{i=0}^{M}b_{i}z^{-i}}{\sum_{j=0}^{N}a_{j}z^{-j}} = \frac{b_{0} + b_{1}z^{-1} + b_{2}z^{-2} + \ldots + b_{M}z^{-M}}{a_{0} + a_{1}z^{-1} + a_{2}z^{-2} + \ldots + a_{N}z^{-N}}
$$

$$
X(z) \left( b_{0} + b_{1}z^{-1} + \ldots + b_{M}z^{-M} \right) = Y(z) \left( a_{0} + a_{1}z^{-1} + \ldots + a_{N}z^{-N} \right) 
$$

### Direktform I

| Normal                                                          | vertauschte Reihenfolge                                         |
| --------------------------------------------------------------- | --------------------------------------------------------------- |
| ![invert_dark\|900](../_assets/Pasted%20image%2020250208232743.png) | ![invert_dark\|900](../_assets/Pasted%20image%2020250208233416.png) |

### Direktform II

kanonische Form, minimaler Speicher
![invert_dark](../_assets/Pasted%20image%2020250208232843.png)


---

# z-Transformation mit Software-Tools

Operationen wie Partialbruchzerlegung oder Ermitteln der Übertragungsfunktion kann mittels softwarepakete leicht berechnet werden.

## Matlab (Propertiary)

## Python (FOSS)

- [Signal processing (scipy.signal) — SciPy v1.15.2 Manual](https://docs.scipy.org/doc/scipy-1.15.2/reference/signal.html)
- [Matplotlib — Visualization with Python](https://matplotlib.org/)

# Beispiele

- Einheitssprung
- Kausale Exponentialfolge