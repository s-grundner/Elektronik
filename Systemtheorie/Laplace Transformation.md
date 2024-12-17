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
- Wir betrachten also nur kausale Signale, die für $t<0$ sind.
- Um mehr Funktionen transformieren zu können, wird eine [Dämpfung](../../Hardwareentwicklung/Dämpfung.md) $e^{-\sigma t}$ eingeführt. $(\sigma\in\mathbb{R}^{+})$

> [!def] **LPT D1)** Ist eine Funktion auf $t\in\mathbb{R}$ definiert mit $f(t):[0,\infty)$ für $t>0$, so heißt:
>
> $$\boxed{ F(s) = \int_{0}^{\infty}f(t)\cdot e^{-st}dt \qquad s\in\mathbb{C} }\tag{LPT}$$
> 
> Die Laplace Transformation von $f$, kurz $\mathcal{L}\{f(t)\}(s)$

> [!hint]- Für welche Funktionen funktioniert die Laplace Transformation?
> Die Laplacetransformation beinhaltet das Uneigentliche Integral 
> $$\lim_{ x \to \infty } \int_{0}^{x}f(t)e^{-st}\mathrm{~d}t$$
> 


> [!def] **KAZ D2)** Definition der Konvergenzabzisse
> Existiert für das uneigentliche Integral der **LPT** ein $s_{0}\in\mathbb{R}$ so kann man zeigen, dass es eine Zahl $\sigma \in\mathbb{R}$ gibt sodass das Integral für alle $s \in\mathbb{C}$ mit:
> - $\mathrm{Re}\,s>\sigma$ konvergiert. 
> - $\mathrm{Re}\,s<\sigma$ divergiert.
> 
> Dieses $\sigma$ heißt Konvergenzabzisse von $f$

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[very thick, font=\Large]
\begin{axis}[
    width=20cm,
    height=20cm,
    xlabel=$\Re(s)$,
    ylabel=$\Im(s)$,
    xmin=-5, xmax=5,
    ymin=-5, ymax=5,
    axis lines=center,
    xtick={-4,-3,...,4},
    ytick={-4,-3,...,4},
    grid=major,
    legend pos=north east
]

% Konvergenzabszisse
\addplot[red, thick, dashed] coordinates {(1,-5) (1,5)} (1,4) node[right] {Konvergenzabszisse};

% Pole
\addplot[cyan, very thick, only marks, mark=x, mark size=10pt] coordinates {
    (-2,2) (-2,-2) (0,0) (1,0)
};
\addlegendentry{Pole}

% Nullstellen
\addplot[green, only marks, mark=o, mark size=5pt] coordinates {
    (-1,1) (-1,-1) (3,0)
};
\addlegendentry{Nullstellen}

% Konvergenzbereich
\fill[blue!10, opacity=0.2] (1,-5) rectangle (5,5);
\node at (3,3) {Konvergenzbereich};

\end{axis}
\end{tikzpicture}

\end{document}
```

## Sätze

> [!satz] Sätze zu den Rechenregeln für Laplace-Transformationen
> 
> | Nr     | Satz                           |                                                                                                                         | Anmerkungen                                                                                                                    |
| ------ | ------------------------------ | ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------ |
| (i)    | **Linearität**                 | $$\mathcal{L}\left\{c_1 f_1 + c_2 f_2\right\} = c_1 \mathcal{L} f_1 + c_2 \mathcal{L} f_2$$ |  $c_1, c_2 \in \mathbb{R}$                                                                                                                              |
| (ii)   | **[Faltung](Faltung.md)**      | $$\mathcal{L}\left\{f_1 * f_2\right\} = \mathcal{L} f_1 \cdot \mathcal{L} f_2$$                                         | Die Faltung ist definiert durch <br>$\left(f_1 * f_2\right)(t) := \int_0^t f_1(t-\tau) f_2(\tau) d\tau$                        |
| (iii)  | **Integration**                | $$\mathcal{L}\left\{\int_0^t f(\tau) d\tau\right\}(s) = \frac{1}{s} \mathcal{L} f(s)$$                                  |                                                                                                                                |
| (iv)   | **Differentiation**            | $$\mathcal{L}\left\{f^{(n)}\right\}(s) = s^n \mathcal{L} f(s) - \sum_{k=0}^{n-1} s^{n-1-k} f^{(k)}(0)$$                 | Gilt für $f(t) \in C^n, t \in[0, \infty)$. <br>Dies ist eine wesentliche Grundlage für<br>die Anwendbarkeit zur Lösung von AWP |
| (v)    | **Verschiebung**               | $$\mathcal{L}\{f(t-a)\}(s) = e^{-a s} \mathcal{L} f(s), \, a > 0$$                                                      | $f$ wird für $t < 0$ durch 0 fortgesetzt.<br>Formal mit dem Einheitssprung                                                     |
| (vi)   | **Ähnlichkeit**<br>(Streckung) | $$\mathcal{L}\{f(at)\}(s) = \frac{1}{a} \mathcal{L} f\left(\frac{s}{a}\right), \, a > 0, \, s > a\alpha$$               |                                                                                                                                |
| (vii)  | **Dämpfung**                   | $$\mathcal{L}\left\{e^{-a t} f(t)\right\}(s) = \mathcal{L} f(s+a), \, a \in \mathbb{R}, \, s > \alpha - a$$             |                                                                                                                                |
| (viii) | **Multiplikation**             | $$\mathcal{L}\left\{t^n f(t)\right\}(s) = (-1)^n (\mathcal{L} f)^{(n)}(s)$$                                             | Multiplikation mit einem Polynom<br>ist der Gegensatz zu (iv)                                                                  |
| (ix)   | **Division**                   | $$\mathcal{L}\left\{\frac{f(t)}{t}\right\}(s) = \int_s^{\infty} (\mathcal{L} f)(\sigma) d\sigma$$                       |                                                                                                                                |

### Bei der Faltung

> [!info] Es muss bei der Faltung die historie mittgenommen werden.
> Durch mitnahme der Anfangswerte der 

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

## Pol-Nullstellen

![600](assets/Pasted%20image%2020241203095822.png)

Polstellenlage vs. Zeitbereichssignal

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

