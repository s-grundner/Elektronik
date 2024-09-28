---
tags:
  - HTL-Diplomarbeit
  - incomplete
  - Algorithmus/Informatik
aliases:
  - Diskrete Fourier Transformation
  - IDFT
  - Synthesegleichung
  - Analysegleichung
created: 27. Dezember 2023
source:
  - Laurenz Hölzl
  - Daniel Ch. v. Grüningen
cited: true
complexity: $\mathcal{O}(n^{2})$
---

# Diskrete [Fourier Transformation](Fourier%20Transformation.md)

> [!info] Complexity: `$=dv.current().complexity`

> [!INFO]  
> Tatsächlich handelt es sich bei der Diskreten [Fourier Transformation](Fourier%20Transformation.md) (DFT) um eine Annäherung der [Fourier Transformation](Fourier%20Transformation.md), welche es ermöglicht sie effizient von einem digitalen Rechner berechnen zu lassen.  
Hierbei wird die Formel für die [Fouriertransformierte](Fourier%20Transformation.md#Fouriertransformierte) als Ausgangspunkt genutzt.

Das zeitkontinuierliche Signal wird durch seinen Abtastwert $x(nT)$ und das Differential durch das Abtastintervall $T$ ersetzt. Zur Annäherung des Integrals wird die Summe verwendet:

$$ X_{s}(\omega) = \sum^{\infty}_{n = -\infty} = x(nT)\cdot e^{-j\omega nT} \cdot T $$

Da eine unendliche Anzahl an Abtastwerten unmöglich zu berechnen ist, werden eine endliche Anzahl $N$ dieser herausgeschnitten/„gefenstert“ (engl: windowing).

Außerdem kann der Faktor $T$ aus „Bequemlichkeit“ weggelassen werden.

$$ X_{sw}(f) = \sum^{N-1}_{n=0} x(nT) \cdot e^{-j\omega n \frac{f}{f_{s}}} $$

Dies [Funktion](../../Mathematik/Algebra/Abbild.md) ist $f_{s}$-periodisch und hat nur an $N$-Stellen [linear unabhängig](../../Mathematik/Algebra/Basis,%20Dimension%20und%20Teilräume.md)e Funktionswerte.

Ausgewertet wird sie an $N$ gleichweit entfernten Frequenzstellen $f= \{0, \frac{f_{s}}{N}, 2\cdot\frac{f_{s}}{N}, \dots,(N-1)\frac{f_{s}}{N}\}$.

Werden der Einfachheit halber wieder einige Faktoren ($\frac{f_{s}}{N}, T$) und die Kennzeichnung $sw$ weggelassen ergibt sich die Definition (Analysegleichung) der DFT:

> [!hint] Analysegleichung
>
> $$
> X[k] = \sum^{N-1}_{n=0} x[n]\cdot e^{-jkn \frac{2\pi}{N}}
> $$

Die [inverse](Gauß-Jordan-Verfahren.md) DFT (IDFT) (Synthesegleichung) ist definiert als:

> [!hint] Synthesegleichung
>
> $$
> x[n] = \frac{1}{N}\sum^{N-1}_{k=0} X[k]\cdot e^{jkn \frac{2\pi}{N}}
> $$

[8, p. 163 ff.] [^1]

## [Matrix](Matrix.md)-Interpretation Der DFT

Führt man den Drehfaktor (engl: twiddle factor) $W_{N} = e^{-j2\pi/N}$ ein, so kann die DFT und IDFT auch folgenderweise geschrieben werden:

$$
\begin{align}
X [k] = \sum^{N-1}_{n=0} x[n]\cdot W_{N}^{kn} && x [n] = \sum^{N-1}_{k=0} X[k]\cdot W_{N}^{-kn}
\end{align}
$$

> [!important] Beide Sequenzen lassen sich in [Vektor](Vektor.md)form darstellen:
>
> $$
\begin{align}  
\mathbf{X}_{N} = \begin{pmatrix}  
X[0] \\  
X[1] \\  
\vdots \\  
X[N-1]  
\end{pmatrix} &&  
\mathbf{x}_{N} = \begin{pmatrix}  
x[0] \\  
x[1] \\  
\vdots \\  
x[N-1]  
\end{pmatrix}  
\end{align}
> $$

Definiert man nun noch die DFT-[Matrix](Matrix.md):

$$
\mathbf{W}_{N} = \begin{pmatrix}
1 & 1 & \cdots & 1  \\
1 & W_{N}^{1,1} & \cdots & W_{N}^{1,N-1}  \\
\vdots  & \vdots & \ddots & \vdots \\
1 & W^{N-1, 1} & \cdots & W_{N} ^{N-1, N-1}
\end{pmatrix}
$$

Die Werte $W$ sind Einheitswurzeln und müssen daher nicht jedes mal neu berechnet werden. Dies führt uns zur [FFT](FFT.md).

## Eigenschaften der DFT

- „Die DFT einer [Basis, Dimension und Teilräume](../../Mathematik/Algebra/Basis,%20Dimension%20und%20Teilräume.md) von Signalen ist gleich der [Basis, Dimension und Teilräume](../../Mathematik/Algebra/Basis,%20Dimension%20und%20Teilräume.md) ihrer DFTs.“ [8, p. 169] [^1]
- „Die DFT und die IDFT sind $N$-periodisch.“ [8, p. 169] [^1]
- „Die Energie des Signals im Zeitbereich ist gleich der Energie des Signals im Frequenzbereich geteilt durch $N$.“ (Parceval-Theorem) [8, p. 170] [^1]
- „Die DFT eines reellen Signals ist bezüglich dem Punkt $k= N/2$ symmetrisch.“ [8, p. 170] [^1]

# Quellen

[^1]: Digitale Signalverarbeitung - Daniel ch. v. Grüningen