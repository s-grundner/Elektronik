---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 1. Dezember 2024
professor:
---
 

# Randwertproblem (RWP)

Ein Randwertproblem (RWP) ist ein Problem, bei dem eine [Differenzialgleichungen]({MOC}%20DGL.md) zusammen mit Randbedingungen gegeben ist.

> [!important] Bei RWP werden an mindestens zwei verschiedenen Punkten des Lösungsintervalls Bedingungen vorgeschrieben.
> $x' = f(t,x) \in \mathbb{R}^{m}$ wie bisher mit $t \in[a,b]$
> Aber statt an $x_{0}(t_{0})=x_{0}$ (Anfangswert) betrachten wir Randwerte
> 
> $$
> \begin{align}
> g(x(a), x(b)) = 0 \\
> g: \mathbb{R}^{m}\times R^{m} \rightarrow \mathbb{R}^{m}
> \end{align}
> $$

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

## Spezialfall

$$
\begin{align}
x'' \overset{ (*) }{ = } a_{0}(t)x + a_{1}(t)x' \\
R_{1}x:=\alpha_{1} x(a) + \alpha_{2}x'(a) = \rho_{1} \\
R_{2}x:=\beta_{1} x(b) + \beta_{2}x'(b) = \rho_{2}
\end{align}
$$

Seien $x_{1}, x_{2}$ zwei linear unabhangige Lösungen von $(*)$ auf $[a,b]$.

- Können wir $x(t)=c_{1}x_{1}(t)+ c_{2}x_{2}(t)$ (alle Linearkombinationen) so wählen, sodass $Rx_{1}=\rho_{1}, Rx_{2}=\rho_{2}$?

Einsetzen liefert:

$$
\begin{align}
R_{1}x = c_{1}R_{1}x_{1}+c_{2}R_{2}x_{2} \overset{ ! }{ = } \rho_{1} \\
R_{2}x = c_{1}R_{1}x_{1}+c_{2}R_{2}x_{2} \overset{ ! }{ = } \rho_{2}
\end{align}
\qquad \text{ als LGS: }\qquad\begin{pmatrix}
R_{1}x_{1} & R_{2}x_{1} \\ R_{1}x_{2} & R_{2}x_{2}
\end{pmatrix} \cdot \begin{pmatrix}
c_{1} \\ c_{2}
\end{pmatrix} = \begin{pmatrix}
\rho_{1} \\ \rho_{2}
\end{pmatrix}
$$



Eine Lösung existiert, wenn die [[Determinante]] der Koeffizientenmatrix $\neq 0$ ist bzw die [Matrix](Algebra/Matrix.md) invertierbar ist:

$$
\det\begin{pmatrix}
R_{1}x_{1} & R_{2}x_{1} \\ R_{1}x_{2} & R_{2}x_{2}
\end{pmatrix} \neq 0
$$
In der Realität kann jedoch $\det = 0$ sein, dann gibt es unendlich viele, bzw garkeine Lösungen für das [LGS](Analysis/Lineare%20Gleichungssysteme.md).

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

Annahme: $x, t$ sind separiert in der Form: $u(x,t) = X(x)\cdot T(t)$

$$
\begin{align}
\frac{\partial^{2}u}{\partial t^{2}} = X(x)\cdot T''(t) \\
\frac{\partial^{2}u}{\partial x^{2}} = X''(x)\cdot T(t)
\end{align} \begin{cases}

\end{cases}
$$

