---
tags:
  - HTL-Diplomarbeit
  - Mathe/Reihen
aliases:
  - Fourierreihen
subject:
  - mathe
source:
  - Rudolf Frauenschuh
  - Laurenz Hölzl
  - Daniel Ch. v. Grüningen
created: 24th March 2022
---

# Fourierreihe

[Zeitdiskrete Fourierreihe](Zeitdiskrete%20Fourierreihe.md) ***:LiArrowBigRightDash:***

---

Jede **periodische** [Funktion](../Mathematik/Algebra/Abbildung.md) kann als aus einer Summe von Sinus und/oder Cosinus Schwingungen zusammengesetzt werden:

![invert_light|400](../assets/Fourreihe_zerlegung.png)

## Grundlagen

> [!quote] **Theorem von Fourier:** Harmonische Analyse
> 
> Eine mit der Periode $T$ periodische Funktion $x(t)$, die bestimmte Voraussetzungen bezüglich ihrer [**Stetigkeit**](../Analysis/Stetigkeit.md), **Integrierbarkeit** und **Monotonie** erfüllt, kann in eine Fourier-Reihe entwickelt, d.h. durch eine [Linearkombination](Linearkombination.md) aus Funktionen $u_k(t)$ dargestellt werden.
> 
> Die Funktionen $u_k(t)$ bilden die Basisfunktionen eines normierten, orthogonalen Funktionensystems, genügen also der Bedingung
> 
> $$
> \int_0^T u_k(t) u_m(t) \mathrm{d} t=\left\langle u_k(t), u_m(t)\right\rangle_T=\delta_{k m}=\left\{\begin{array}{lll}
> 1 & \text { für } & k=m \\
> 0 & \text { für } & k \neq m
> \end{array}\right.
> $$
> 
> wobei $k, m$ Parameter der Funktion $u$ sind.
> 
> > [!info] $\delta_{k,m}\dots$ [Kronecker-Delta](../Mathematik/Algebra/Delta-Impuls.md): Nur der Anteil, bei dem $l=k$ ist zählt.

## Reelle Fourierreihe

> [!def] **D - $\mathbb{R}$FR)** Reelle Fourier-Reihe der reellen Funktion $x(t)$  
> 
> $$\boxed{ x(t) = \frac{a_{0}}{2} + \sum^{\infty}_{k=1} \Big[a_{k} \cdot \cos(k \omega_{0} t) + b_{k}\cdot\sin ( k \omega_{0} t)\Big] }$$
> 

mit der Grundkreisfrequenz $\omega_0$ aus der Periodendauer $T$

$$
\omega_0=2 \pi f_0=\frac{2 \pi}{T} \quad \text { und } \quad f_0=\frac{1}{T}
$$

Die Koeffizienten der reellen Fourier-Reihe werden wie folgt bestimmt:

$$
\begin{aligned}
a_k & =\frac{2}{T} \int_{t_0}^{t_0+T} x(t) \cos \left(k \omega_0 t\right) \mathrm{d} t \\
b_k & =\frac{2}{T} \int_{t_0}^{t_0+T} x(t) \sin \left(k \omega_0 t\right) \mathrm{d} t
\end{aligned}
$$


Besonderheiten:
- Ist die Funktion $x(t)$ eine gerade Funktion, sind alle $b_{k}=0$
- Ist die Funktion $x(t)$ eine ungerade Funktion, sind alle $a_{k}=0$

> [!info] Für den Fall „$k=0$“ existiert das zeitunabhängige Glied $\frac{a_{0}}{2}$, welches den arithmetischen Mittelwert darstellt.


> [!def] **D - $\mathbb{R}$PFR)** Polare Darstellung der rellen Funktion $x(t)$
>
> $$ \boxed{ x(t)=\frac{c_0}{2}+\sum_{k=1}^{\infty} c_k \cos \left(k \omega_0 t-\varphi_k\right) } $$

mit den Beziehungen

$$
\begin{aligned}
c_0 & =a_0 \\
c_k & =\sqrt{a_k^2+b_k^2} \\
\varphi_k & = \begin{cases}\arctan \left(\frac{b_k}{a_k}\right) & \text { für } a_k>0, \\
\arctan \left(\frac{b_k}{a_k}\right)+\pi & \text { für } a_k<0, \quad b_k \geq 0, \\
\arctan \left(\frac{b_k}{a_k}\right)-\pi & \text { für } a_k<0, \quad b_k<0,\end{cases}
\end{aligned}
$$

## Komplexe Fourierreihe

> [!def] **D - $\mathbb{C}$FR)** Komplexe Fourier-Reihe der rellen Funktion $x(t)$
>
> $$\boxed{ x(t)=\sum_{k=-\infty}^{\infty} X_k e^{\mathrm{j} k \omega_0 t} }$$

$X_k \ldots$ spektrale Koeffizienten, mit $X_{-k}=X_k^*$

Die Koeffizienten der komplexen Fourier-Reihe werden wie folgt bestimmt:

$$
X_k=\frac{1}{T} \int_{t_0}^{t_0+T} x(t) e^{-\mathrm{j} k \omega_0 t} \mathrm{~d} t
$$

> [!quote] Bemerkung:
> Es treten auch negative Frequenzen auf! Damit werden die Imaginärteile für das reelle Signal kompensiert. Obige Symmetrie gilt für reelle Signale.

Besonderheiten:
- Ist die Funktion $x(t)$ eine gerade Funktion, sind alle $X_{k}$ reell
- Ist die Funktion $x(t)$ eine ungerade Funktion, sind alle $X_{k}$ imaginär


---

### Periodische [Funktion](../Mathematik/Algebra/Abbildung.md)

$f(x)=f(x+a)$  
![invert_light|400](../assets/fourReihe.png)

> [!HINT] Sei $f$ eine $2\pi$-periodische [Funktion](../Mathematik/Algebra/Abbildung.md).  
> Ist das Perioden-Intervall in **endlich viele Teilintervalle** zerlegbar, in denen $f$ sowohl **stetig, als auch monoton** ist, so kann die [Funktion](../Mathematik/Algebra/Abbildung.md) in eine **Fourierreihe** zerlegt werden.
> 
> $f(x)\dots$**Trigonometrisches [Polynom](Polynom.md)**

### Amplituden-Phasenform

> [!summary] $$A_{n}\sin(b\cdot x+\varphi_{n})=a_{n}\cdot cos(n \cdot x)+b_{n} \cdot\sin(n\cdot x)$$
>
> - $A_{n}=\sqrt{a_{n}^{2}+b_{n}^{2}}$
> - $\varphi=\arctan\left(\dfrac{a_{n}}{b_{n}}\right)$

- $A_{1}\cdot\sin(x+\varphi)$: 1. Harmonische oder Grundschwingung
- $A_{2}\cdot\sin(2x+\varphi)$: 2. Harmonische oder 1. Oberschwingung
- $A_{3}\cdot\sin(3x+\varphi)$: 3. Harmonische oder 2. Oberschwingung

>[!EXAMPLE] Rechteckschwingung  
> ![Fourreihe_k](../assets/Fourreihe_k.png)  
> [Klirrfaktor](../Hardwareentwicklung/Oszillatoren/Klirrfaktor.md) … $k=\dfrac{\sqrt{(\frac{2}{\pi})^{2}+(\frac{6}{5\pi})^{2}}}{\sqrt{(\frac{6}{\pi})^{2}+(\frac{2}{\pi})^{2}+(\frac{6}{5\pi})^{2}}} = 0.3623$



> [!hint] Das Integrationsintervall kann beliebig verschoben werden

---

# Tags

[Fourierreihe HTL Mitschrift](../assets/pdf/Fourierreihe.pdf)

---

- Fejer-Kernel
- Drichlet-Kernel
- Gibbs-Phänomen
    - Überschwingen bei Unstetigkeiten um $9\%$ der Sprunghöhe
- Fejer-Gewichtung
- Lanczsos-Gewichtung
- Hamming-Gewichtung
