---
tags:
  - Analysis/DGL
  - Analysis/Numerik
aliases:
  - äquidistante diskretisierung
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 18. Dezember 2024
professor: 
satz: 
def:
  - ESV
  - ORD
  - LDF
  - GDF
---
 

# Diskretisierungsverfahren

## Verfahren für Anfangswertprobleme

> [!question] Siehe: [Numerische Lösungsverfahren von DGL](Numerische%20Lösungsverfahren%20von%20DGL.md)
> Mit äquidistanten Diskretisierungsverfahren werden Anfangswertprobleme ([AWP](GDGL.md#^AWP)) numerisch gelöst.

Das Zeitintervall $[a, b]$ auf dem man sich die Lösung des AWP ausrechnen möchte, wird in $N$ Teilintervalle unterteilt. 

> [!info] **Äquidistande Diskretisierung**: Man nimmt sich also endlich viele Punkte und berechnet sich an diesen Punkten eine Näherungslösung berechnet:
> 
> **Intervall**: $I=[a,b], t \in I$
> **Diskretisierung** (äquidistand):
>
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> \begin{tikzpicture}[very thick, font=\Large, scale=2]
>     \draw (0,0) -- (10,0);
>     \draw (0,-0.1) node[below] {$a=t_0$} -- (0,0.1);
>     \draw (10,-0.1) node[below right] {$b=t_N$} -- (10,0.1);
>     \foreach \x/\label in {1/$t_1$, 2/$t_2$, 3/$t_3$} {
>         \draw (\x,-0.1) node[below] {\label} -- (\x,0.1);
>         \draw[draw=none] (\x-1,0) -- (\x,0) node[midway, above] {$h$};
>     }
>     \draw (3,0) -- (9.5,0) node[midway, below=7pt] {$\dots$};
>     \draw (9.5,-0.1) node[below] {$t_{N-1}$} -- (9.5,0.1);
>     \draw[draw=none] (9.5, 0) -- (10,0) node[midway, above] {$\leq h$};
> \end{tikzpicture}
> \end{document}
> ```
>
> Das intervall wird also in gleiche Teile mit der länge $h$ unterteilt. Der letzte Teil ist jedoch möglicherweise kleiner, da $N$ nicht unbedingt durch $h$ teilbar ist.
> Der Abbildung kann man entnehmen, dass:
> $$t_{k}=t_{k-1}+h_{k} \quad \text{ mit } k=1, \ldots, N,\quad t_{0}=a, \quad t_{N}=b$$
> Da in dem äquidistanten Gitter alle Schrittweiten gleich sind:
> $$h_{k}=h:= \frac{b-a}{N},\quad t_{k}=t_{0}+kh$$

> [!hint] **Vorraussetzung:** Eindeutige Lösbarkeit
>  Wir nehmen an: das [AWP](GDGL.md)
>  $$x^{\prime}=f(t, x), \quad x\left(t_0\right)=x_0\tag{AWP}$$
> ist eindeutig lösbar in $I$ für alle $t_0 \in I$ und $x_0 \in \mathbb{R}^m$ mit $f \in C\left(I \times \mathbb{R}^m, \mathbb{R}^m\right), \quad I:=[a, b], \quad a<b$.
>
> > [!question] Ob ein AWP auf einem Intervall $I$ eindeutig lösbar ist, lässt sich mittels den Sätzen nach [Peano](Peano.md#^PEAN) und [Picard-Lindelöf](Picard-Lindelöf.md#^PILF) zeigen 

Wir möchten Näherungen $x_{k}$ für $x(t_{k})$ berechnen.

### Verfahrensarten

Verfahren bei denen eine Äquidistante Diskretisierung angewandt wird, sind:

- [Explizite Einschrittverfahren](Explizite%20Einschrittverfahren.md)

## Verfahren für Rand- und Eigenwertprobleme