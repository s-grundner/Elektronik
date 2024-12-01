---
tags:
  - MOC
  - Infinitesimalrechnung
  - DGL
aliases:
  - DGL
  - Differenzialgleichungen
  - "#DGL"
  - AWP
subject:
  - Mathematik 3
  - VL
semester: WS24
professor:
  - Markus Passenbrunner
created: 14th March 2022
---

# Differentialgleichungen (DGL)

> [!info] Arten von Differentialgleichungen
>
> | gewöhnlich             | partiell                     |
> | --------------------- | ---------------------------- |
> | Linear                | Nichtlinear                  |
> | homogen               | inhomogen                    |
> | konstaner Koeffizient | nicht-konstanter Koeffizient | 
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > [!info] Ordunung
> > Die höchste Vorkommende [Ableitung](Analysis/Differenzialrechnung.md) in einer DGL nennen wir deren Ordnung

> [!info] Allgemeine Form
> 
> **Implizite Differenzialgleichung:** $F(t,x,x',\dots,x^{(n)}) = 0$
>  
> **Explizite Differenzialgleichung:** $x^{(n)}= f(t,x,x',\dots,x^{(n-1)})$
> 
> $\implies F(t,x,x',\dots,x^{(n)}) := x^{(n)}-f(t,x,x',\dots, x^{(n-1)})$

## Anfangswert Problem (AWP)

Ein Anfangswertproblem (AWP) ist ein Problem, bei dem eine Differentialgleichung zusammen mit einer Anfangsbedingung gegeben ist. 

> [!hint] Anfangswerte sind die Werte, die die Lösung der Differentialgleichung an **einer** bestimmten Stelle $t_{0}$ annehmen soll.
> $$ x_{0} := x(t_{0}), \quad x_{0}' := x'(t_{0}), \quad \ldots, \quad x_{0}^{(n-1)} := x^{(n-1)}(t_{0}) $$


> [!important] Gegeben seien eine offene Menge $D \subset \mathbb{R}^{m+1}$, eine Funktion $f: D \rightarrow \mathbb{R}^m$ und ein fester Punkt $\left(t_0, x_0\right) \in D$.
> 
> $x$ heißt Lösung des Anfangswertproblems, wenn es ein Intervall $I$ mit $t_0 \in I$ gibt,
> sodass $x: I \rightarrow \mathbb{R}^m$ differenzierbar ist, $g r(x) \subset D$ gilt und
> 
> $x^{\prime}(t)=f(t, x(t))$ für alle $t \in I$ und $x\left(t_0\right)=x_0$

Um die Abhängigkeit der Lösung des AWP von $t_0$ und $x_0$ anzudeuten, schreibt man auch manchmal

$$
x\left(t ; t_0, x_0\right)
$$

## Randwertproblem (RWP)

Ein Randwertproblem (RWP) ist ein Problem, bei dem eine Differentialgleichung zusammen mit Randbedingungen gegeben ist.

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
> - $u(0,t) = u(L,t) = 0$

RWP Liefern ein phänomen das es bei AWP nicht gibt:
- beim AWP: Durch die Anfangsbedingung ist eine eindeutig existente Lösung gegeben
- beim RWP: Es existieren Lösungen die nicht immer eindeutig sind, aber trotzdem eine physikalische relevanz haben.

### Spezialfall

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



Eine Lösung existiert, wenn die [[Determinante]] der Koeffizientenmatrix $\neq 0$ ist bzw die Matrix invertierbar ist:

$$
\det\begin{pmatrix}
R_{1}x_{1} & R_{2}x_{1} \\ R_{1}x_{2} & R_{2}x_{2}
\end{pmatrix} \neq 0
$$
In der Realität kann jedoch $\det = 0$ sein, dann gibt es unendlich viele, bzw garkeine Lösungen für das LGS.

> [!example] Fortsetzung des Beispiels einer Schwingenden Saite:
> Wir schreiben nun die **partielle** Differentialgleichung für die Schwingung einer Saite auf: **die Wellengleichung**
> partiell da $u(x,t)$ von zwei sich ändernenden Variablen abhängt.

$$
\frac{\partial^{2}u}{\partial t^{2}} = c^{2} \frac{\partial^{2}u}{\partial x^{2}}
$$

Beschreibung dieser Wellengleichung:

- Die zweite Ableitung nach der Zeit $t$ ist proportional zur zweiten Ableitung nach dem Ort $x$.
- Mit einem vom Ausbreitungmedium Abhängenden $c$

## Map of Content

- [lineare DGL 1. Ordnung](Analysis/lineare%20DGL%201.%20Ordnung.md)
- [lineare DGL 2. Ordnung](lineare%20DGL%202.%20Ordnung.md)
- [DGL-System](Analysis/DGL-System.md)

## Anwendungen und Beispiele

- [Schwingkreise](../Physik/Schwingkreise.md)
- Wärmeleitungsgleichung
- Schaltungsberechnung mit Induktoren und Kondensatoren
- exponentielles Wachstum

# Tags

![](https://www.youtube.com/embed/p_di4Zn4wz4)

![DGL-NOTES](assets/pdf/DGL-NOTES.pdf)
