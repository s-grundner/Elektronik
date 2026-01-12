---
tags: 
aliases:
  - RWP
  - Randwertprobleme
keywords:
  - harmonischer Oszillator
  - Wellengleichung
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 1. Dezember 2024
professor:
  - Markus Passenbrunner
---
 

# Randwertproblem (RWP)

Ein Randwertproblem (RWP) ist ein Problem, bei dem eine [Differenzialgleichungen](GDGL.md) zusammen mit Randbedingungen gegeben ist.

> [!important] Bei RWP werden an mindestens zwei verschiedenen Punkten des Lösungsintervalls Bedingungen vorgeschrieben.
> $x' = f(t,x) \in \mathbb{R}^{m}$ wie bisher mit $t \in[a,b]$
> Aber statt an $x_{0}(t_{0})=x_{0}$ (Anfangswert) betrachten wir Randwerte
> 
> $$x(a) = x(b) = 0$$

> [!example] Zum Beispiel betrachten wir die Schwingung einer Saite:
> 
> Auslenkung einer Saite aus der Ruhelage bei der Position $x$ zum Zeitpunkt $t$:
> 
> (Unterschiedlich gefärbte Schwingungen zu verschiedenen Zeitpunkten $t$)
>
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> 
> \begin{tikzpicture}[font=\Large]
> \begin{axis}[very thick, axis lines=middle,
>     xmin=0, ymin=0, xmax=4, ymax=1,
>     restrict y to domain=0:1.5,
>     xlabel={$x(t)$}, ylabel={$u(x,t)$},
>     xtick={0,1,3.141529},
>     yticklabels={},
>     xticklabels={$0$, $x$, $L$},
>     height=7cm,
>     width=20cm,
> ]
> 
> \plot[domain=0:4, samples=100, color=cyan] {0.5*sin(deg(x))};
> \plot[domain=0:4, samples=100, color=red] {0.2*sin(deg(x))};
> \plot[domain=0:4, samples=100, color=green] {0.1*sin(deg(x))};
> 
> \draw[->, color=cyan] (axis cs:1,0) -- (axis cs:1,0.42073);
> \draw[->, color=red] (axis cs:1,0) -- (axis cs:1,0.16829);
> \draw[->, color=green] (axis cs:1,0) -- (axis cs:1,0.08414);
> 
> \end{axis}
> \end{tikzpicture}
> 
> \end{document}
> ```
>
> - Die Saite ist von $x=0$ bis $x=L$ gespannt.
> - die **Randbedingungen** sind hier: $u(0,t) = u(L,t) = 0$

RWP Liefern ein phänomen das es bei AWP nicht gibt:
- beim AWP: Durch die Anfangsbedingung ist eine eindeutig existente Lösung gegeben
- beim RWP: Es existieren Lösungen die nicht immer eindeutig sind, aber trotzdem eine physikalische relevanz haben.


$$
\begin{align}
x'' &\overset{ (*) }{ = } a_{0}(t)\cdot x + a_{1}(t)\cdot x' \\
R_{1}x:&=\alpha_{1}\cdot x(a) + \alpha_{2}\cdot x'(a) = \rho_{1} \\
R_{2}x:&=\beta_{1}\cdot x(b) + \beta_{2}\cdot x'(b) = \rho_{2}
\end{align}
$$

Seien $x_{1}, x_{2}$ zwei linear unabhangige Lösungen von $(*)$ auf $[a,b]$.

> [!question] Können wir $x(t)=c_{1}x_{1}(t)+ c_{2}x_{2}(t)$ (alle Linearkombinationen) so wählen, sodass $Rx_{1}=\rho_{1}, Rx_{2}=\rho_{2}$?

> [!success] Einsetzen liefert:
> 
> $$
> \begin{align}
> R_{1}x = c_{1}R_{1}x_{1}+c_{2}R_{2}x_{2} \overset{ ! }{ = } \rho_{1} \\
> R_{2}x = c_{1}R_{1}x_{1}+c_{2}R_{2}x_{2} \overset{ ! }{ = } \rho_{2}
> \end{align}
> \qquad \text{ als LGS: }\qquad\begin{pmatrix}
> R_{1}x_{1} & R_{2}x_{1} \\ R_{1}x_{2} & R_{2}x_{2}
> \end{pmatrix} \cdot \begin{pmatrix}
> c_{1} \\ c_{2}
> \end{pmatrix} = \begin{pmatrix}
> \rho_{1} \\ \rho_{2}
> \end{pmatrix}
> $$
> 


Eine Lösung existiert, wenn die [[../Algebra/Determinante]] der Koeffizientenmatrix $\neq 0$ ist bzw die [Matrix](../Algebra/Matrix.md) invertierbar ist:

$$
\det\begin{pmatrix}
R_{1}x_{1} & R_{2}x_{1} \\ R_{1}x_{2} & R_{2}x_{2}
\end{pmatrix} \neq 0
$$
In der Realität kann jedoch $\det = 0$ sein, dann gibt es unendlich viele, bzw garkeine Lösungen für das [LGS](Lineare%20Gleichungssysteme.md).

## Spezialfall: Eigenwertprobleme (EWP)

> [!example] Fortsetzung des Beispiels einer Schwingenden Saite:
> Wir schreiben nun die **partielle** Differentialgleichung für die Schwingung einer Saite auf: 
> die **[Wellengleichung](Wellengleichung.md)**
> partiell da $u(x,t)$ von zwei sich ändernenden Variablen abhängt.
> 
> $$
> \frac{\partial^{2}u}{\partial t^{2}} = c^{2} \frac{\partial^{2}u}{\partial x^{2}}
> $$
> 
> Beschreibung dieser Wellengleichung:
> 
> - Die zweite Ableitung nach der Zeit $t$ ist proportional zur zweiten Ableitung nach dem Ort $x$.
> - Mit einem vom Ausbreitungmedium Abhängenden $c$

>[!satz] **Separationsansatz**: Bestimmen der Form unter Annahme: $x, t$ sind separiert in der Form: $u(x,t) = X(x)\cdot T(t)$
> 
> $$
> \begin{rcases}
> \dfrac{\partial^{2}u}{\partial t^{2}} = X(x)\cdot T''(t) \\
> \dfrac{\partial^{2}u}{\partial x^{2}} = X''(x)\cdot T(t)
> \end{rcases}\implies
> \begin{align}
>  X(x)\cdot T''(t) &= c^{2}\cdot X''(x)\cdot T(t) \\
> \frac{T''(t)}{T(t)}&= c^{2}\cdot \frac{X''(x)}{X(t)}
> \end{align}
> $$
> 
> 
> Da die Linke Seite nur von $t$ Abhängt und die Rechte seite nur von $x$ muss gelten, dass
> 
> $$
> c^{-2}\cdot\frac{T''(t)}{T(t)} = \lambda = \frac{X''(x)}{X(x)} \qquad \text{ mit der \textbf{konstanten} } \lambda
> $$


>[!example] Ansätze zur Allgemeinen Lösung von $X''(x)=\lambda \cdot X(x)$:
> 
> Fall unterscheidung:
> - Fälle für den Harmonischen Oszillator
> - aus dem Charakteristischen Polynom $p(z)$ hergeleitet
>     - wobei $z$ die [Eigenwerte](../Algebra/Eigenvektor.md) sind da der Name $\lambda$ schon vergeben ist
> 
> $$
> \text{ Ansatz }\to\begin{cases}
> \lambda < 0: c_{1}\cdot \cos(\sqrt{ -\lambda }\cdot x) + c_{2}\cdot \sin(\sqrt{ -\lambda }\cdot x) \\
> \lambda > 0: c_{1}\cdot \cos(\sqrt{ \lambda }\cdot x) + c_{2}\cdot \sin(\sqrt{ \lambda }\cdot x) \\
> \lambda=0:c_{1}+c_{2}\cdot x
> \end{cases}
> $$

>[!example] Einsetzen in RWP: $X(0)=X(L) = 0$
> 
> $$
> \begin{align}
> \lambda=0&: c_{1}=0, \quad c_{1}+c_{2}\cdot L=0 &&\implies c_{1}=c_{2}=0 \\
> \lambda>0&: c_{1}+c_{2}=0, \quad c_{1}\cdot e^{ \sqrt{ X(t) }\cdot L }+c_{2}\cdot e^{ -\sqrt{ X(t) }\cdot L } &&\implies c_{1}=c_{2}=0 \\
> \end{align}
> $$
> 
> Für den nun Interessanten Ansatz $\lambda<0$ lautet die Allgemeine Lösung:
> 
> $$
> X(x)=c_{1} \cos(\sqrt{ -\lambda }\cdot x)+c_{2}\sin(\sqrt{ -\lambda }\cdot x) 
> $$
> mit $X(0)=X(L)=0$:
> 
> $$
> \begin{align}
> X(0) &= c_{1} = 0 \\
> X(L) &= c_{2}\sin(\sqrt{ -\lambda }\cdot L) = 0
> \end{align}
> $$
> 
> $X(L)$ ist erfüllt wenn:
> $$
> \sin(\sqrt{ -\lambda }\cdot L) \iff \sqrt{ -\lambda }\cdot L =k\pi \iff \boxed{ -\lambda=\frac{k^{2}\pi^{2}}{L^{2}} }, \quad k \in\mathbb{Z}
> $$
> (oder triviale Lösung $c_{2} = 0$)

> [!hint] WIr erhalten also nur für $-\lambda = \frac{k^{2}\pi^{2}}{L^{2}}, k \in\mathbb{Z}$ nicht triviale Lösungen von
> $$ X''(x) = \lambda \cdot X(x), \quad X(0)=X(L)=0 $$
> und in diesem Fall ist die Lösung:
> $$ X(x) = c_{2}\sin\left(\frac{k\pi}{L}\cdot x\right), c_{2} \in \mathbb{R}$$
>
> Diese $\lambda$ heißen Eigenwerte des Problems.
> Dir Lösungen $X_{k}(x) = \sin\left(\frac{k\pi}{L}\cdot x\right)$ heißen Eigenfunktionen des Problems.
>
> 
> > [!question] Zur Erinnerung: Was bedeutet Eigenwert?
>     >- Ein Eigenwert ist ein Wert bei dem ein LGS potenziell mehrere d.h. wo die Lösung nicht eindeutig bestimmt ist. 
>     

Nun wird noch eine Lösung für $T(t)$ gesucht:

$$
\begin{align}
\frac{T''(t)}{T(t)} &= \lambda_{k}\cdot c^{2} \\
T(t) &= a_{k}\cdot \cos\left(\sqrt{ -\lambda_{k} }\cdot c\cdot t\right) + b_{k}\cdot \sin\left(\sqrt{ -\lambda_{k} }\cdot c\cdot t\right) \\
&= a_{k}\cdot \cos\left(\frac{k\pi}{L}\cdot c\cdot t\right) + b_{k}\cdot \sin\left(\frac{k\pi}{L}\cdot c\cdot t\right)
\end{align}
$$

> [!success] Lösung
> 
> $$
> \sum_{k=1}^{\infty}\sin\left(\frac{k\pi}{L}\cdot x\right)\cdot\left( a_{k}\cdot \cos\left(\frac{k\pi}{L}\cdot c\cdot t\right) + b_{k}\cdot \sin\left(\frac{k\pi}{L}\cdot c\cdot t\right) \right)
> $$
> $k=1$: Grundton
> $k>1$: Obertöne

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    colormap/viridis,
    height=7cm,
    width=20cm,
    domain=0:25.13,
    xmin=0,
    xmax=25.13,
    xlabel=Standing Wave,
    yticklabels={$\lambda=2L$,$\lambda_4=\frac{1}{2}L$,$\lambda_3=\frac{2}{3}L$,$\lambda_2=\:\:\:L$,$\lambda_1=2L$},
    xtick={},
    xticklabels={},
    ymax=0.9,
    ymin=-1.4,
    ylabel={},
    grid=both,
    major grid style={line width=.2pt},
    samples=400,
    ylabel=,
    every axis/.append style={axis line style={line width=0.75pt}}
]
\addplot[smooth, very thick, surf] {0.5+(0.2*sin(deg(0.125*((x)))};
\addplot[smooth, very thick, surf] {0.5+(0.2*sin(deg(0.125*(x-3.14*8)))};

\addplot[smooth, very thick, surf] {0+(0.2*sin(deg(0.25*((x)))};
\addplot[smooth, very thick, surf] {0+(0.2*sin(deg(0.25*(x-3.14*4)))};

\addplot[smooth, very thick, surf] {-0.5+(0.2*sin(deg((0.375*x)-9.42477))))};
\addplot[smooth, very thick, surf] {-0.5+(0.2*sin(deg((0.375*x)))))};

\addplot[smooth, very thick, surf] {-1+(0.2*sin(deg((0.5*x)-3.14))))};
\addplot[smooth, very thick, surf] {-1+(0.2*sin(deg((0.5*x)))))};

\end{axis}
\end{tikzpicture}

\end{document}
```