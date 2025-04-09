---
tags:
  - Schaltungsanalyse
  - Algorithmus/Elektrotechnik
aliases:
  - Knotenpotential
  - Knotenspannung
  - Knotenspannungs
  - KCL
keywords: 
subject:
  - VL
  - Elektrotechnik
semester: SS24
created: 8. Januar 2024
professor:
  - Andreas Springer
---
 

# Knotenpotential Verfahren

> [!hint] Grundidee
> 1. In einem Netzwerk kann man einen Knoten als Bezugsknoten frei wählen. 
> 2. Die Spannungen aller anderen Knoten (den **Knotenspannungen**) werden relativ zu diesem Bezugsknoten angegeben.
> 3. Dadurch werden die Maschengleichunge eliminiert.
>  
> Aus Einem Netzwerk mit $k$ Knoten lässt sich ein [LGS](../Mathematik/Analysis/Lineare%20Gleichungssysteme.md) mit $k-1$ Gleichungen aufstellen.
>

Wichtige Schritte:

| **Stromquellen:**         | Treten in dem Netzwerk Spannungsquellen auf, werden diese mit Hilfe des [Norton](../Elektrotechnik/lineare%20Quellen.md)-Ersatzbildes in Stromquellen umgewandelt.<br>(Nur bei realen Quellen mit Innenwiderstand möglich - siehe [Ideale Quellen](Knotenpotentialverfahren.md#Ideale%20Quellen)) |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Vereinfachen:**         | Sichtbare Vereinfachungen wie Zusammenführen der Leitwerte und Überlagerung von Quellen können natürlich im Vorhinein durchgefüht werden.                                                                                                                                                         |
| **Leitwert Darstellung:** | Man verwendet Leitwerte, um die Berechnung zu vereinfachen, da man nach dem *Strom* Lösen möchte und dann $G\cdot U=I$ schreiben kann anstatt eines Bruches.                                                                                                                                      |
| **Masse als Bezug:**      | Bei der Analyse eines Sternförmigen Netzwerks den Knotenpunkt als Bezugspunkt wählen (meistens Masse).                                                                                                                                                                                            |


> [!success] Allgemeines Ergebnis:
> - mit der *Knotenadmittanz*-[Matrix](../Mathematik/Algebra/Matrix.md) $\mathbf{G}$,
> - dem *Lösungs-[Vektor](../Mathematik/Algebra/Vektor.md)* $\mathbf{U}$ der unbekannten *Knotenspannungen*
> - und dem Vektor der Quellströme $\mathbf{I}_{q}$
> ![1200](../assets/Excalidraw/Knotenpotentialverfahren%202024-03-13%2021.34.50.excalidraw)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\begin{document}
\newcommand{\voltColor}{blue!50!white}
\newcommand{\ampColor}{red!50!white}
\begin{circuitikz}[thick, scale=1.5, transform shape]
\draw (-1, 2) node[left, \ampColor]{m}
    to[R, l_=$G$, v^=$u_{mn}$, i>^=$i_{mn}$, *-*] (1, 2)
    node[right, \ampColor]{n} to[open, -*] (0,0) node[below]{0};
\draw[\voltColor] (-1, 2) to[open, v=$u_{m0}$, color=\voltColor] (0,0);
\draw[\voltColor] (1, 2) to[open, v^=$u_{n0}$, color=\voltColor] (0,0);
\draw (2,1)
node[anchor=south west, \voltColor] {Zweigspannung: $u_{mn}=u_{m0}-u_{n0}$}
node[anchor=north west, \ampColor] {Zweigstrom: $i_{mn}=G\cdot u_{mn}=G\cdot(u_{m0}-u_{n0})$};
\end{circuitikz}
\end{document}
```

## Spannugsquellen-Umwandlung 

> [!success] Wenn eine Reale Lineare Spannungsquelle vorliegt kann diese in das [Norton](../Elektrotechnik/lineare%20Quellen.md) ESB umgewandelt werden

### Ideale Quellen

> [!warning] Ist die Spannungsquelle aber ideal, kann man sie wegen $R_{i}=0$ nicht in eine (ideale) Stromquelle umwandeln.
> 
> Mit einer Bereits Bekannten Spannung liegt eine Aussage über die **Differenz zweier Knotenspannungen** vor, sodass sich die Anzahl der Aufzustellenden Knotengleichungen **verringert**.
> 
> Es gibt 2 Methoden um damit umzugehen:
> 1. Bezugsknoten passend wählen
> 2. Spannungsquelle über einen Knoten "schieben"
> 

**Methode 1:** Bei unabhängigen Soannungsquellen, die mit einem Anschluss gemeinsam an einem Knote liegen, kann dieser als Bezugsknoten gewählt werden. Damit ist die Gleichung für den Knoten $n$ an dieser Spannugsquelle $U_{q}$ gelöst. In der Matrix äußert sich diese Gleichung als:
$$
\begin{bmatrix}
\cdot & \cdots & \cdots & \cdot \\
\cdot & \cdots & \cdots & \cdot \\
0 & 0 & 1 & 0 \\
\cdot & \cdots & \cdots & \cdot \\
\end{bmatrix} \cdot \begin{bmatrix}
\cdot \\ \cdot \\ U_{n 0}\\ \cdot
\end{bmatrix} = \begin{bmatrix}
\cdot \\ \cdot \\ U_{q}\\ \cdot
\end{bmatrix}
$$
Die 1 liegt immer auf der Diagonale in der Spalte des Bezugsknotens.

**Methode 2:** Die Spannungsquelle wird über einen anliegenden Knoten *geschoben*, dabei teilt sich die Spannungsquelle in mehrere auf. Je nach Anzahl der anliegenden Zweige wird die Spannungsquelle in mehrere Quellen aufgeteilt.

```tikz
\usepackage{tikz} % Required for inserting images
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath, amssymb}
\ctikzset{bipoles/length=0.7cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[scale=2, transform shape, thick]

\begin{scope}
\draw (0,0)
    to[V, v<=$U_x$, *-] ++(0,1)
    to[R, l=$G_1$] ++(0,1.5) -- ++(1,0) coordinate (k1)
    to[V, v<=$Uq$, -*] ++(1.5,0) coordinate(e2);
\draw (k1) to[R, l_=$G_2$, *-] ++(0,-1.5) to[short, -*] ++(0,-1) coordinate (e1);

\draw (0,0) -- ++(0.2,-0.2);
\draw (0,0) -- ++(-0.2,-0.2);
\draw (e2) -- ++(0.2,0.2);
\draw (e2) -- ++(0.2,-0.2);
\draw (e2) -- ++(0.2,0);
\draw (e1) -- ++(0.2,-0.2);
\draw (e1) -- ++(-0.2,-0.2);

\draw[color=orange, line width=2pt] (k1) circle [radius=3pt] node[above] {!};
\node at (3,1.5) {$\implies$};
\end{scope}

\begin{scope}[xshift=5cm]
\draw (0,0) to[V, v<=$U_x+U_q$, *-]
    ++(0,1) to[R, l=$G_1$]
    ++(0,1.5) to[short,-*]
    ++(0.5,0.5) coordinate (k1);
\draw (k1) --
    ++(0.5,-0.5) to[V, v_=$U_q$]
    ++(0,-1.5) to[R, l_=$G_2$, -*]
    ++(0,-1) coordinate (e1);

\draw (0,0) -- ++(0.2,-0.2);
\draw (0,0) -- ++(-0.2,-0.2);
\draw (e1) -- ++(0.2,-0.2);
\draw (e1) -- ++(-0.2,-0.2);
\draw (k1) -- ++(0,0.2);
\draw (k1) -- ++(0.2,0.2);
\draw (k1) -- ++(-0.2,0.2);

\draw[color=green!50!black, line width = 2pt] (k1) circle [radius=3pt] node[right]{$\checkmark$};
\end{scope}

\end{circuitikz}
\end{document}
```

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=1cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=1.5, transform shape]

\end{circuitikz}
\end{document}
```


- Es ist immer der Knoten mit den *geringsten* Zweigen zu wählen. 
- Auf dem Zweig bereits vorhandene Spannungsquellen überlagern sich.
- Die Anzahl an Knoten reduziert sich um 1, da der Ursprüngliche zweig nun ein Kurzschluss ist. 
    - (wäre das nicht so hätte man ja keine Ideale Spannugsquell auf diesem Zweig)

### Gesteuerte Quellen

---

# Quellen

![Knotenpotentialverfahren - Schaltungen berechnen, ohne nachzudenken](https://www.youtube.com/watch?v=SxBQ7VUgzEM)