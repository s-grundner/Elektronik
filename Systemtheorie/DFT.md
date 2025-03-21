---
tags:
  - HTL-Diplomarbeit
  - Algorithmus/Informatik
  - Analysis/Numerik
aliases:
  - Diskrete Fourier Transformation
  - IDFT
  - Synthesegleichung
  - Analysegleichung
created: 27. Dezember 2023
complexity: $\mathcal{O}(n^{2})$
semester: WS24
professor:
  - Andreas Stelzer
subject:
  - Signale und Systeme
cited: true
banner: "/assets/banner/SUSBanner.png"
banner_y: 0.8625
---

# Diskrete Fourier Transformation (DFT)

> [!quote] DFT
> Bei der Diskreten Fourier Transformation (DFT) handelt es sich um eine **numerische Näherung** der [Fourierintegrals](../../Systemtheorie/Fouriertransformation.md).
> Die Herleitung erfolgt aus der [Zeitdiskreten Fouriertransformation](Zeitdiskrete%20Fouriertransformation.md)

- Das aperiodische Signal $f_{a}(t)$ wird mit der Periode $T=\frac{2\pi}{\omega_{0}}$ **abgetastet**.
- Beschränkung auf $N$ **Abtastwerte**

> [!important] Fensterung mit einer Rechteck-Funktion
> $$f_{\mathrm{D}}[n] = \begin{cases}f[n] & \text{für} & n=0,1,2,\dots N-1 \\ 0 & \text{sonst}\end{cases}$$ 

Die endlich lange zeitdiskrete Funktion $f_{\mathrm{D}}[n]$ ist nur eine Näherung der unendlich langen Folge von Abtastwerten $f[n] = f_{a}(nT)$.

Damit ist auch die diskrete Fouriertransformierte $F_{\mathrm{D}}$ der Folge $f_{\mathrm{D}}[n]$ nur eine Näherung der Fouriertransfomrierten $f_a(t)\multimap F_{a}(j\omega)$

Wegen der endlichen Abtastwerte wird auch die Summe Beschränkt:

$$F_{D}=\sum_{n=0}^{N-1}f_{\mathrm{D}}[n]e^{ -jn\Omega }\quad \text{mit } \Omega=\omega T$$

Auch die Darstellung des eigentlich kontinuierlichen Spektrums muss auf eine begrenzte Anzahl von Abtastwerten im Frequenzbereich beschränkt werden

**Äquidistante** Verteilung der Abtastwerte im Frequenzbereich im Frequenzbereich über eine Periode von $\Omega$. Für $N$ Abtastwerte gilt somit:

$$
\begin{gathered}
\Omega_{k}=k \frac{2\pi}{N}, \quad k=0,1,2,\dots, N-1 \\
\implies F_{\mathrm{D}} = \sum_{n=0}^{N-1}f_{\mathrm{D}}[n]e^{ -jn\Omega_{k} }
\end{gathered}
$$

Es gilt die Abkürzung ([Einheitswurzel](Einheitswurzel.md)): $W_{N}=e^{ -j \frac{2\pi}{N} }$

Daraus folgt das Transformationspaar der **Diskreten Fourier Transformation**

> [!def] **D1 - DFT)** Diskrete Fourier Transformation - *Analysegleichung* ^DFT
> $$F_{\mathrm{D}}[k]=\sum_{n=0}^{N-1}f_{\mathrm{D}}[n]W^{kn}_{N}\tag{DFT}$$

> [!def] **D2 - IDFT)** Inverse Diskrete Fourier Transformation - *Synthesegleichung* ^IDFT
> $$f_{\mathrm{D}}[n]=\frac{1}{N}\sum_{k=0}^{N-1}F_{\mathrm{D}}[k]W^{-kn}_{N}\tag{IDFT}$$

## Ungenauigkeiten der DFT

Die $N$ diskreten Werte von $F_{\mathrm{D}}[k]$ ind der Grundperiode sind eine Näherung für das Fourierintegral $F_{a}(j\omega)$ mit den Folgenden Fehlerquellen:

- **Verletzung des Abtasttheorems:** Die (zu langsame) Abtastung von garnicht oder unzureichend Bandbegrenzter Signale führt zu einer Überlappung der Periodischen Spektren (**Aliasing**)
- Fensterung auf $NT$ bringt spektraöe Verschmierung (*Spectral Leakage*) wegen der Faltung mit der si-Funktion im

---
# ALT und möglicherweise falsch

Das zeitkontinuierliche Signal wird durch seinen Abtastwert $x(nT)$ und das Differential durch das Abtastintervall $T$ ersetzt. Zur Annäherung des Integrals wird die Summe verwendet:

$$ X_{s}(\omega) = \sum^{\infty}_{n = -\infty} x(nT)\cdot e^{-j\omega nT} \cdot T $$

Da eine unendliche Anzahl an Abtastwerten unmöglich zu berechnen ist, werden eine endliche Anzahl $N$ dieser herausgeschnitten/gefenstert (engl: windowing).

Außerdem kann der Faktor $T$ weggelassen werden.

$$ X_{sw}(f) = \sum^{N-1}_{n=0} x(nT) \cdot e^{-j\omega n \frac{f}{f_{s}}} $$

Dies Funktion ist $f_{s}$-periodisch und hat nur an $N$-Stellen [linear unabhängige](../../Mathematik/Algebra/Lineare%20Abhängigkeit.md) Funktionswerte.

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
> $$x[n] = \frac{1}{N}\sum^{N-1}_{k=0} X[k]\cdot e^{jkn \frac{2\pi}{N}}$$


## Matrix-Interpretation Der DFT

Führt man den Drehfaktor (engl: twiddle factor) $W_{N} = e^{-j2\pi/N}$ ein, so kann die DFT und IDFT auch folgenderweise geschrieben werden:

$$
\begin{align}
X [k] = \frac{1}{N} \sum^{N-1}_{n=0} x[n]\cdot W_{N}^{kn} && x [n] = \sum^{N-1}_{k=0} X[k]\cdot W_{N}^{-kn}
\end{align}
$$

> [!important] Beide Sequenzen lassen sich in [Vektor](../../Mathematik/Algebra/Vektor.md)form darstellen:
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

Die Werte $W$ sind Einheitswurzeln und müssen daher nicht jedes mal neu berechnet werden. Dies führt uns zur [FFT](../Softwareentwicklung/DS-Algo/FFT.md).

![[../Softwareentwicklung/DS-Algo/assets/DFT 2025-01-14 10.03.44.excalidraw]]

## Diskretisiertes Spektrum

![[../Softwareentwicklung/DS-Algo/assets/DFT 2025-01-14 09.53.12.excalidraw]]

# Quellen