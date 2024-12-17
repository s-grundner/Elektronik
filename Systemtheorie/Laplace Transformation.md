---
tags: 
aliases:
  - s-Domäne
keywords: 
subject:
  - VL
  - Mathematik 3
  - Signale und Systeme
semester: WS24
created: 4. März 2024
professor:
  - Markus Passenbrunner
  - Andreas Stelzer
---

# Laplace Transformation

- Bei Einschaltvorgängen interessiert uns nur, was nach dem [Einschalten](Schaltvorgänge.md) $(t=0)$ passiert.
- Wir betrachten also nur kausale [Signale](Signale.md), die für $t<0$ sind.
- Um mehr Funktionen transformieren zu können, wird eine [Dämpfung](../../Hardwareentwicklung/Dämpfung.md) $e^{-\sigma t}$ eingeführt. $(\sigma\in\mathbb{R}^{+})$

> [!def] **LPT D1)** Ist eine Funktion auf $t\in\mathbb{R}$ definiert mit $f(t):[0,\infty)$ für $t>0$, so heißt:
>
> $$\boxed{ F(s) = \int_{0}^{\infty}f(t)\cdot e^{-st}dt \qquad s\in\mathbb{C} }\tag{LPT}$$
> 
> Die Laplace Transformation von $f$, kurz $\mathcal{L}\{f(t)\}(s)$

Die Laplacetransformation ist im Sinne des Uneigentliche Integrals zu verstehen: 

$$\lim_{ x \to \infty } \int_{0}^{x}f(t)e^{-st}\mathrm{~d}t$$

> [!def] **KAZ D2)** Definition der Konvergenzabzisse
> Existiert für das uneigentliche Integral der **LPT** ein $s_{0}\in\mathbb{R}$, so kann man zeigen, dass es eine Zahl $\sigma \in\mathbb{R}$ gibt, bei dem das Integral für alle $s \in\mathbb{C}$ mit:
> - $\mathrm{Re}\,s>\sigma$ *konvergiert*. 
> - $\mathrm{Re}\,s<\sigma$ *divergiert*.
> 
> Dieses $\sigma$ heißt **Konvergenzabzisse** von $f$

> [!hint] Das Ergebnis einer Laplace Transformation ist immer ein rationales [Polynom](../Mathematik/Algebra/Polynom.md) 
> 
> $$F(s)=\dfrac{Z(s)}{N(s)}$$ 
> 
> - Nullstellen von $N(s)$ heißen **Pole**.
> - Nullstellen von $Z(s)$ heißen **Nullstellen**.
> 
> Wie nach dem [Fundamentalsatz der Algebra](Polynom.md) gibt es so viele Nullstellen wie der Grad des Polynoms, als (vielfache) relle und konjugiert komplexe


```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[very thick, scale=1, font=\Large]
\begin{axis}[
    width=15cm, height=15cm,
    title=\Huge{Pol-Nullstellen Diagramm},
    xlabel=$\Re(s)$, ylabel=$\Im(s)$,
    xmin=-5, xmax=5, ymin=-5, ymax=5,
    axis lines=center,
    xtick={-4,-3,...,4}, ytick={-4,-3,...,4},
    grid=major,
    legend pos=north west, legend cell align=left,
    axis line style={line width=1.5pt}
]

% Konvergenzabszisse
\addplot[red, thick, dashed] coordinates {(1,-5) (1,5)};
\addlegendentry{Konvergenzabszisse}

% Pole
\addplot[cyan, very thick, only marks, mark=x, mark size=5pt] coordinates {
    (-2,3) (-2,-3) (-3,1) (-3, -1) (0,0) (1,0)
};
\addlegendentry{Pole}

% Nullstellen
\addplot[green, very thick, only marks, mark=o, mark size=5pt] coordinates {
    (-1,2) (-1,-2) (3,0) (2, 1) (2, -1)
};
\addlegendentry{Nullstellen}

% Konvergenzbereich
\fill[blue!10, opacity=0.3] (1,-5) rectangle (5,5);
\node at (3,3.5) {Konvergenzbereich};

\end{axis}
\end{tikzpicture}

\end{document}
```


> [!hint] **Transformierbare Funktionen:** Für welche Funktionen funktioniert die Laplace Transformation?
> 
> 
> Für spezielle Funktionen lassen sich Abschätzungen für $\sigma$ angeben: Mit $\mathcal{E}$ bezeichnen wir die Menge der Funktionen $f:[0, \infty) \rightarrow \mathbb{R}$, für die gilt, dass $f$ stückweise stetig ist und dass $f$ höchstens exponentiell wächst.

## Sätze

> [!satz] Sätze zu den Rechenregeln für Laplace-Transformationen

| Nr     | Satz                           |                                                                                                         | Anmerkungen                                                                                                                                                    |
| ------ | ------------------------------ | ------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| (i)    | **Linearität**                 | $$\mathcal{L}\left\{c_1 f_1 + c_2 f_2\right\} = c_1 \mathcal{L} f_1 + c_2 \mathcal{L} f_2$$             | $c_1, c_2 \in \mathbb{R}$                                                                                                                                      |
| (ii)   | **[Faltung](Faltung.md)**      | $$\mathcal{L}\left\{f_1 * f_2\right\} = \mathcal{L} f_1 \cdot \mathcal{L} f_2$$                         | Die Faltung ist definiert durch <br>$\left(f_1 * f_2\right)(t) := \int_0^t f_1(t-\tau) f_2(\tau) d\tau$                                                        |
| (iii)  | **Integration**                | $$\mathcal{L}\left\{\int_0^t f(\tau) d\tau\right\}(s) = \frac{1}{s} \mathcal{L} f(s)$$                  |                                                                                                                                                                |
| (iv)   | **Differentiation**            | $$\mathcal{L}\left\{f^{(n)}\right\}(s) = s^n \mathcal{L} f(s) - \sum_{k=0}^{n-1} s^{n-1-k} f^{(k)}(0)$$ | Gilt für $f(t) \in C^n, t \in[0, \infty)$. <br>Dies ist eine wesentliche Grundlage für<br>die Anwendbarkeit zur Lösung von [AWP](../Mathematik/{MOC}%20DGL.md) |
| (v)    | **Verschiebung**               | $$\mathcal{L}\{f(t-a)\}(s) = e^{-a s} \mathcal{L} f(s)$$                                                | $a > 0$<br>$f$ wird für $t < 0$ durch 0 fortgesetzt.<br>Formal mit dem [Einheitssprung](Einheitssprungfunktion.md) $\sigma(t)$.                                |
| (vi)   | **Ähnlichkeit**<br>(Streckung) | $$\mathcal{L}\{f(at)\}(s) = \frac{1}{a} \mathcal{L} f\left(\frac{s}{a}\right)$$                         | $a > 0$<br>$s > a\alpha$                                                                                                                                       |
| (vii)  | **Dämpfung**                   | $$\mathcal{L}\left\{e^{-a t} f(t)\right\}(s) = \mathcal{L} f(s+a)$$                                     | $a \in \mathbb{R}$<br>$s > \alpha - a$                                                                                                                         |
| (viii) | **Multiplikation**             | $$\mathcal{L}\left\{t^n f(t)\right\}(s) = (-1)^n (\mathcal{L} f)^{(n)}(s)$$                             | Multiplikation mit einem Polynom<br>ist der Gegensatz zu (iv)                                                                                                  |
| (ix)   | **Division**                   | $$\mathcal{L}\left\{\frac{f(t)}{t}\right\}(s) = \int_s^{\infty} (\mathcal{L} f)(\sigma) d\sigma$$       | $\sigma$ hat hier nur eine Bedeutung<br>als andere Integrationsvariable                                                                                        |

### Endwertsatz

Endwert satz gilt nur dann, wenn alle Pole Links stehen, außer der Pol bei 0.
Bevor der Endwertsatz angewandt wird muss die Funktion auf stabilität geprüft werden. 

> [!satz] **Endwertsatz**
> Kausale stabile Exponentialfunktion:
> 
> $$
> \lim _{s \rightarrow 0} \frac{s}{s-a}=0=\lim _{t \rightarrow \infty} e^{a t} \sigma(t)
> $$
> 
> Sprungfunktion:
> 
> $$
> \lim _{s \rightarrow 0} s \frac{1}{s}=1=\lim _{t \rightarrow \infty} \sigma(t)
> $$
> 

## Weitere Korrespondenzen

$$
\mathcal{L}\{\sin (\omega t)\}(s)=\frac{\omega}{s^2+\omega^2} \quad \text { und } \quad \mathcal{L}\{\cos (\omega t)\}(s)=\frac{s}{s^2+\omega^2}, \quad s>0,
$$

$$
\mathcal{L}\{\sin(\omega_{0} t+\varphi_{0})\} = \frac{\omega_{0} \sin \varphi_{0}+s \cos \varphi_{0}}{s^{2}+\omega_{0}^{2}}
$$


> [!success]- Wir zeigen nur die linke, der Beweis der rechten geht analog:
> Mittels [Partieller Integration](../Analysis/Partielle%20Integration.md)
> $$
> \begin{aligned}
> \int_0^{\infty} \sin (\omega t) e^{-s t} d t & =-\left.\frac{\cos (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}-\frac{s}{\omega} \int_0^{\infty} \cos (\omega t) e^{-s t} d t \\
> & =\frac{1}{\omega}-\frac{s}{\omega}\left(\left.\frac{\sin (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}+\frac{s}{\omega} \int_0^{\infty} \sin (\omega t) e^{-s t} d t\right) \\
> & =\frac{1}{\omega}-\frac{s^2}{\omega^2} \int_0^{\infty} \sin (\omega t) e^{-s t} d t
> \end{aligned}
> $$
> 
> 
> Also: $\int_0^{\infty} \sin (\omega t) e^{-s t} d t=\frac{\omega}{s^2+\omega^2}$

## Stabilität des Systems

Polstellenlage vs. Zeitbereichssignal

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[scale=2]
\newcommand{\samples}{50}
\newcommand{\pltsize}{8cm}
\newcommand{\grid}{7}
\foreach \x in {0, 7, 14} {
  \foreach \y in {0, 7, 14} {
    \begin{axis}[
      at={(\x cm, \y cm)},
      anchor=south west,
      width=6cm,
      height=6cm,
      axis lines=middle,
      xlabel={Zeit $t$},
      ylabel={Re},
      zlabel={Im},
      xtick=\empty, ytick=\empty, ztick=\empty,
      enlargelimits=false,
      view={45}{30}, % Change the view to adjust axes orientation
    ]
      % Curves for each quadrant
      \ifnum \x=0 \ifnum \y=0
        % Bottom-Left: Decaying spiral
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {-exp(-0.2*x)*cos(deg(2*x))}, {exp(-0.2*x)*sin(deg(2*x))});
      \fi \fi

      \ifnum \x=7 \ifnum \y=0
        % Bottom-Center: Faster decaying spiral
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {-exp(-0.5*x)*cos(deg(3*x))}, {exp(-0.5*x)*sin(deg(3*x))});
      \fi \fi

      \ifnum \x=14 \ifnum \y=0
        % Bottom-Right: Growing spiral
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {exp(0.5*x)*cos(deg(3*x))}, {exp(0.5*x)*sin(deg(3*x))});
      \fi \fi

      \ifnum \x=0 \ifnum \y=7
        % Center-Left: Slower exponential decay
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {-exp(-0.1*x)}, {0});
      \fi \fi

      \ifnum \x=7 \ifnum \y=7
        % Center: Stable oscillation
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {0}, {cos(deg(3*x))});
      \fi \fi

      \ifnum \x=14 \ifnum \y=7
        % Center-Right: Growing exponential
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {exp(0.3*x)}, {0});
      \fi \fi

      \ifnum \x=0 \ifnum \y=14
        % Top-Left: Slowly decaying spiral
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {-exp(-0.1*x)*cos(deg(2*x))}, {exp(-0.1*x)*sin(deg(2*x))});
      \fi \fi

      \ifnum \x=7 \ifnum \y=14
        % Top-Center: Pure oscillation
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {cos(deg(3*x))}, {sin(deg(3*x))});
      \fi \fi

      \ifnum \x=14 \ifnum \y=14
        % Top-Right: Growing spiral
        \addplot3[domain=0:10, samples=40, samples y=0, thick, ->]
        ({x}, {exp(0.2*x)*cos(deg(2*x))}, {exp(0.2*x)*sin(deg(2*x))});
      \fi \fi
    \end{axis}
  }
}
\end{tikzpicture}

\end{document}
```

![600](assets/Pasted%20image%2020241203095524.png)

## Rücktransformation

Funktionen im Bildbereich treten als rationales Polynom $\frac{z(s)}{n(s)}$ auf

> [!important] Vorhergehensweise
> 1. Polynomdivision wenn  $\deg z(s) \geq \deg n(z)$
> 2. $s$ sollte soweit es geht faktorisiert werden
> 3. Null und Polstellen berechnen:
> 

# Tags

- [Invers Laplace Transformation Rechner](https://de.symbolab.com/solver/inverse-laplace-calculator)
- [Delta-Impuls](Delta-Impuls.md)
- [korrespondenztabelle - Google Suche](https://www.google.com/search?q=korrespondenztabelle&oq=korrespondenztabelle&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQLhhA0gEINzcwMmowajGoAgCwAgA&sourceid=chrome&ie=UTF-8)

