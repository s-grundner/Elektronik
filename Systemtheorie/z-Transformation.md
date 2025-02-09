---
tags:
  - Analysis/Numerik
aliases: 
keywords:
  - z-Ebene
subject:
  - Signale und Systeme
  - VL
semester: WS24
created: 8. Februar 2025
professor:
---
 
# z-Transformation

> [!quote] Die z-Transformation ist eine Erweiterung der [Zeitdiskrete Fouriertransformation](Poissonsche%20Summenformel.md#**Zeitdiskrete**%20Fouriertransformation)
> **Zur Erinnerung:** Die Zeitdiskrete Fouriertransformation stellt ein zeitdiskretes signal in Form einer gewichteten Summe von komplexen Exponentialfunktionen der form $\exp (j\Omega)$ dar

Die z-Transformation verwendet die Exponential funktionen der Form:

$$
z=r\cdot\exp(j\Omega)
$$

Die $z$-Transformierte einer Folge ist die **analytische Fortsetzung** der zeitdiskreten Fouriertransformierten vom [Einheitskreis](../Mathematik/Kreis.md) in die komlexe Zahlenebene

> [!hint] *Diskrekt* $\to$ $z$-Transformation $\iff$ Laplacetransformation $\gets$ *Kontinuierlich*
> Die z-Transformation spielt bei zeitdiskreten Signalen die gleiche Rolle wie die [Laplacetransformation](Laplacetransformation.md) bei kontinuierlichen Signalen.

## Zweiseitige z-Transformation

> [!def] **D1 - 2ZTR)** Zweiseitige z-Transformation ^2ZTR
$$F(z) = \mathcal{Z}_{II} \{f[n]\} = \sum_{n=-\infty}^{\infty} f[n]z^{-n} = \sum_{n=-\infty}^{\infty} f[n] \cdot r^{-n}\cdot e^{ -j\Omega n } \impliedby z = r\cdot e^{ j\Omega } \tag{2ZTR}$$

Lässt sich auch im Zusammenhang der zeitdiskreten Fouriertransformation schreiben:

$$F(z) = \sum_{n=-\infty}^{\infty}\left( f[n]r^{-n} \right)e^{ -jn\Omega } =\mathcal{F}\{f[n]\cdot r^{-n}\}$$

$\implies$ die z-Transformation der Folge $f[n]$ ist gleich der zeitdiskreten Fouriertransformation der Folge $f[n]r^{-n}$. Wenn $r=1$ ist, dann stimmen beide Transformationen überein (sofern sie existieren)

### Existenzbedingung

> [!important] Existenzbedingung für die Existenz der z-Transformierten einer Folge $f[n]$:
> $$\sum_{n=-\infty}^{\infty}\left| f[n]r^{-n} \right|< M <\infty $$
> Mit dem Betrag $r$ kann also die Konvergenzeigenschaft der z-Transformierten beeinflusst werden. 

Äquivalent zum Realteil $\Re (s) = \sigma$ der Laplace-Transformation

## Umkehrintegral

> [!def] **D - IZTR)** Umkehrintegral der z-Transformation ^IZTR
>  $$f[n] = \frac{1}{j2\pi}\oint_{C}F(z)z^{n-1}\mathrm{~d}z$$

Die Kontur $C$ verläuft im Mathematisch positiven Sinn (gegen den Uhrzeigersinn) innerhalb des Konvergenzgebietes

> [!question] Liegt der Einheitskreis der z-Ebene im konvergenzgebiet

## Einseitige z-Transformation

> [!def] **D2 - 1ZTR)** Einseitige z-Transformation ^1ZTR
> $$F(z) = \mathcal{Z}_{I}\{f[n]\} = \sum_{n=0}^{\infty}f[n]z^{-n}\tag{1ZTR}$$

Hier werden nur der [kausale](Kausalität.md) teil der Folge transformiert, bzw sind die einseitige und zweiseitige Transformierte äquivalent, wenn die Folge sowieso kausal ist. 

Praktische Anwendungen betrachten nur realitätsgetreue kausale Signale, weswegen die überwiegend Einseitige Transformation angewandt wird.

### Existenzbedingung

Ausreichend für die Existenz der z-Transformierten ist die Forderung:

$$
\lvert f[n] \rvert \leq BA^{n} 
$$
für geeignete reelle konstanten $A$ und $B$

### Rationale z-Transformierte

Zur Einfacheren Handhabung beschränken wir uns auf die z-Transformierte als rationales Polynom, mit
- Zählergrad $M$ $\leq$ Nennergrad $N$
- $F_{0} = \dfrac{a_{M}}{b_{N}}$
- und nur einfachen Polen in der Partialbruchdarstellung

$$
\begin{align}
F(z) &= \frac{Z(z)}{N(z)} = \frac{\sum_{j=0}^{M}a_{j}z^{j}}{\sum_{i=0}^{N}b_{i}z^{i}} \tag{rational gebrochenes Polynom}\\
&=F_{0} \frac{\prod^{M}_{j=1} (z-z_{0j})}{\prod^{N}_{i=1} (z-z_{\infty i})}\tag{Faktorisierte Null- und Polstellen} \\
&=A_{0} + \left( \sum_{i=0}^{N} \frac{A_{i}\cdot z}{z-z_{\infty i}} \right) \cdot \frac{1}{z}\tag{Partialbruchdarstellung}
\end{align}
$$

### Konvergenz

> [!satz] **S - )** Konvergenz der z-Transformierten ist gegeben durch
> $$\lvert z \rvert > \underset{ i=1 }{ \overset{ N }{ \max } } \lvert z_{\infty i} \rvert $$

Das Heißt, die z-Transformierte konvergiert für alle $z$ mit größerem Betrag als der größten Polstelle. Es konvergieren alle werte vom $z$ **ausßerhalb** des **Konvergenzkreises** mit dem **Konvergenzradius** $R^{-}$ dessen Wert gleich dem Betrag des größten Poles ist.

![600](assets/Pasted%20image%2020250208225644.png)

in dem Kreis befinden sich also alle Polstellen.

### Stabilität

> [!satz] **S - )** Stabile Folgen
>  Eine folge ist Stabil wenn sie absolut summierbar ist:
>  $$\sum_{n=0}^{\infty} \lvert f[n] \rvert < M < \infty$$

Das Konvergenzgebiet der z-Transformierten eines stabilen Signals schiließt den **Einheitskreis** ein, also alle $z$ mit Betrag kleiner als 1.

> [!satz] **S - )** Stabile und kausale Folgen
> Die z-Transformierte konvergiert auf und außerhalb des Einheitskreises ($\to$ alle Pole liegen innerhalb des Einheitskreises)
> Die z-Transformierte ist für $z=\exp (j\Omega)$ (am Einheitskreis, also $r=1$) identisch mit der zeitdiskreten Fouriertransformation

## Rechenregeln und Sätze

> [!satz] **S - )** Anfangswertsatz
> $$f[0]=\lim_{ z \to \infty } F(z)$$

> [!satz] **S - )** Endwertsatz
> $$\lim_{ n \to \infty } f[n]=\lim_{ z \to 1 } (z-1) F(z)$$

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

| Normal                                             | vertauschte Reihenfolge                            |
| -------------------------------------------------- | -------------------------------------------------- |
| ![900](assets/Pasted%20image%2020250208232743.png) | ![900](assets/Pasted%20image%2020250208233416.png) |

### Direktform II

kanonische Form, minimaler Speicher
![](assets/Pasted%20image%2020250208232843.png)