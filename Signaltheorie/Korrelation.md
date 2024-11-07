---
tags:
  - DSP
aliases:
  - Autokorrelation
  - Kreuzkorrelation
  - AKF
  - KKF
keywords:
  - Ähnlichkeit zweier Signale
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
  - Andreas Stelzer
---
 

# Korrelation

> [!info] Die Korrelation ist ein Maß zur ähnlichkeit zweier [Signale](Signale.md)

## Kreuzkorrelation von deterministischen Signalen

Das Korrelationsprodukt $\varphi_{x y}(\tau)$ zweier Funktionen $x(t)$ und $y(t)$, kurz Korrelation oder auch Kreuzkorrelation genannt, ist ein Maß für die Ähnlichkeit von Signalen und spielt besonders bei stochastischen Signalen eine wichtige Rolle, ist aber auch für deterministische Signale definiert. Als Parameter tritt die zeitliche Verschiebung $\tau$ zwischen den Funktionen auf.

> [!important] **Kreuzkorrelation (KKF) für Energiesignale:**
> 
> **Kontinuierlich**
> 
> $$
> \varphi_{x y}^E(\tau)=\int_{-\infty}^{\infty} x^*(t) y(t+\tau) \mathrm{d} t=\langle x(t), y(t+\tau)\rangle
> $$
> 
> **Diskret**
> 
> $$
> \varphi_{x y}^E[\kappa]=\sum_{k=-\infty}^{\infty} x^*[k]\cdot y[k+\kappa]=\langle x[k], y[k+\kappa]\rangle
> $$
> 

> [!important] Kreuzkorrelation von Leistungssignalen
> Bei Leistungssignalen konvergieren vorige Ausdrücke nicht, sodass die Berechnung wie bei der Definition für Leistungssignale angepasst wird.
> 
> Kreuzkorrelation für Leistungssignale:
> - kontinuierlich
> 
> $$
> \varphi_{x y}^P(\tau)=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T x^*(t) y(t+\tau) \mathrm{d} t
> $$
> 
> - diskret
> 
> $$
> \varphi_{x y}^P[\kappa]=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{k=-N}^N x^*[k] y[k+\kappa]
> $$
> 
> 
> Die Autokorrelation $\varphi_{x x}^P$ ergibt sich für $y=x$.

> [!important] Kreuzkorrelation von **periodischen** Leistungssignalen
> Bei periodischen Signalen und gleicher Periode wiederholt sich die Korrelation ebenso, weshalb die Berechnung über eine Periode ausreicht.
> 
> Kreuzkorrelation für periodische Signale:
> - kontinuierlich
> 
> $$
> \varphi_{x y}^P(\tau)=\frac{1}{T_p} \int_{t_0}^{t_0+T_p} x^*(t) y(t+\tau) \mathrm{d} t
> $$
> 
> - diskret
> 
> $$
> \varphi_{x y}^P[\kappa]=\frac{1}{N_p} \sum_{k=k_0}^{k_0+N_p-1} x^*[k] y[k+\kappa]
> $$
> 
> 
> Die Autokorrelation $\varphi_{x x}^P$ ergibt sich wieder für $y=x$.

## Autokorrelation von deterministischen Signalen

Bei zwei unterschiedlichen Signalen $x(t) \neq y(t)$ spricht man von Kreuzkorrelation. Im Speziallfall gleicher Funktionen $x(t)=y(t)$, d.h. der Korrelation mit sich selbst, spricht man von Autokorrelation.

> [!important] **Autokorrelation (AKF) für Energiesignale:**
> 
> **Kontinuierlich**
> 
> $$
> \varphi_{x x}^E(\tau)=\int_{-\infty}^{\infty} x^*(t) x(t+\tau) \mathrm{d} t=\langle x(t), x(t+\tau)\rangle
> $$
> 
> **Diskret**
> 
> $$
> \varphi_{x x}^E[\kappa]=\sum_{k=-\infty}^{\infty} x^*[k] x[k+\kappa]=\langle x[k], x[k+\kappa]\rangle
> $$

## Eigenschaften der Korrelationsfunktion

Für die Korrelationsfunktion gilt

$$
\varphi_{y x}(\tau)=\varphi_{x y}^*(-\tau)
$$

d.h. die Korrelation ist eine konjugiert gerade Funktion.

Die Kreuzkorellation ist immer kleiner als das geometrische Mittel und das arithmetische Mittel:
$$
\left|\varphi_{x y}(\tau)\right| \leq \sqrt{\varphi_{x x}(0) \varphi_{y y}(0)} \leq \frac{1}{2}\left(\varphi_{x x}(0)+\varphi_{y y}(0)\right)
$$


Spezielle Ergebnisse der Autokorrelation ohne Verschiebung, d.h. $\tau=0$

1. Energie: $\quad E_x=\varphi_{x x}^E(0)$
2. Leistung $\quad P_x=\varphi_{x x}^P(0)$

Für die AKF gilt immer

$$
\left|\varphi_{x x}(\tau)\right| \leq \varphi_{x x}(0)
$$

d.h. der Wert bei Null ist ein Maximum!

Die Kreuzkorrelation ist identisch mit der komplex konjugierten [Faltung](../Digitaltechnik/Faltung.md) $\overline{ f(-\uptau) }_{  }$

---

# Beispiele

>[!example] 2. Bestimmen und skizzieren Sie die Kreuzkorrelation $\varphi_{x y}^P$ der beiden Signale $x(t)=\cos \left(\omega_0 t\right)$ und $y(t)=\sin \left(\omega_0 t\right)$.

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[colormap/viridis, thick]
\addplot[domain=-2*pi:0, red] {-sin(deg(x))};
\addplot[domain=0:2*pi, cyan] {cos(deg(x))};
\end{axis}
\end{tikzpicture}

\end{document}
```

$$
\begin{align}
\varphi ^{P}_{xy}(\uptau) &= \frac{1}{T_{p}}\cdot \int _{t_{0}}^{t_{0}+T_{P}} x(t)\cdot y(t)\, dt \qquad \boxed{ T_{P}=2\pi, \quad t_{0}=0 }\\
&= \frac{1}{2\pi}\cdot \int _{0}^{2\pi}\cos(\underbrace{ \omega_{0}\cdot t }_{ \beta })\cdot \sin(\underbrace{ \omega_{0}\cdot(t+\uptau) }_{ \alpha }) \, dt \qquad \text{(1)} \\
&=\frac{1}{4\pi}\cdot \int _{0}^{2\pi} \left[\sin(\omega_{0}\cdot(t+\uptau)-\omega_{0}\cdot t) + \sin(\omega_{0}\cdot(t+\uptau)+\omega_{0}\cdot t)\right]\, dt \\
&=\frac{1}{4\pi}\cdot \int _{0}^{2\pi} \left[\sin(\omega_{0}\uptau) + \sin(\omega_{0}\cdot(2t+\uptau))\right]\, dt \\
&=\frac{1}{4\pi}\cdot \left[\int _{0}^{2\pi} \sin(\omega_{0}\uptau)\,dt + \int _{0}^{2\pi} \sin(\omega_{0}\cdot(2t+\uptau))\, dt\right] \\
&=\frac{1}{4\pi}\cdot \left[  \sin(\omega_{0}\uptau)\cdot t \Big|_{0}^{2\pi}  - \cos(\omega_{0}\cdot(2t+\uptau))\cdot \frac{1}{2\omega_{0}} \Big|_{0}^{2\pi} \right] \\
&=\frac{1}{4\pi}\cdot \left[  2\pi \cdot\sin(\omega_{0}\uptau) + \frac{\cos(\omega_{0}\cdot\uptau)-\cos(\omega_{0}\cdot(4\pi+\uptau))}{2\omega_{0}} \right] \\
&=\frac{1}{8\pi \cdot\omega_{0}}\cdot \left[4\pi \cdot\omega_{0} \cdot\sin(\omega_{0}\uptau) + \underbrace{ \cos(\omega_{0}\cdot\uptau)-\cos(\omega_{0}\cdot(4\pi+\uptau)) }_{ =0\quad \text{(2)} }\right] = \boxed{ \frac{\sin(\omega_{0}\cdot\uptau)}{2} }
\end{align}
$$


> [!quote] (1) [Satz - Trig. Produkte:](../Mathematik/Trigonometrische%20Funktionen.md#Produkte%20von%20Winkelfunktionen) $\sin(\alpha)\cdot \cos(\beta)=\frac{1}{2}\cdot\left[\sin(\alpha-\beta)+\sin(\alpha+\beta)\right]$

> [!quote] (2) $\cos(\omega_{0}\cdot\uptau) \iff \cos(\omega_{0}\cdot(4\pi+\uptau))$ wegen der Periodizität des Cosinus

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[scale=2]
\begin{axis}[smooth,title={$\omega_{0}=1$}]
\newcommand\Om{1};
\addplot[domain=0:2*pi]
{(1/(8 * pi * \Om)) * (4*pi*\Om * sin(deg(\Om * x)) + cos(deg(\Om * x)) - cos(deg(\Om*(4*pi + x))))};
\end{axis}
\end{tikzpicture}

\end{document}
```

> [!success] Leichter: Kreuzkorrelation im Bildbereich (Siehe Stelzer Skriptum)

---

- [[Barker Code]]
