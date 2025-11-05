---
tags:
aliases:
  - Gleichtaktunterdrückungsverhältnis
  - CMRR
  - Gleichtaktspannung
  - Gegentaktspannung
  - Gleichtaktverstärkung
keywords:
subject:
  - PR
  - Elektrische Messtechnik und Sensorik
semester: WS25
created: 5th November 2025
professor:
---

# Gleich und Gegentaktgrößen

Die Güte eines Differenzverstärkers ist oft dadurch gegeben, in welchem Verhältnis die Gleich und Gegentakt anteile stehen. 

- [Realer OPV](../Reale%20Eigenschaften%20von%20OPVs.md)
- [BJT-Differenzverstärker](BJT-Differenzverstärker.md)
- [MOSFET-Differenzverstärker](../Halbleiter/MOSFET-Differenzverstärker.md)


> [!hint] Anmerkung: Jede beliebige Kombination von $U_{\mathrm{N}}$ und $U_{\mathrm{P}}$ kann als Überlagerung einer Gleichtakt und einer Gegentaktaussteuerung betrachtet werden:
> 
> Sind die Differenzverstärkung $A_{\mathrm{D}}$ und die Gleichtaktverstärkung $A_{\mathrm{GL}}$ bekannt, dann kann die Ausgangsspannung als Überlagerung der Spannungen
> 
> $$
> \begin{rcases}
> & U_{\mathrm{A,D}}=A_{\mathrm{D}}\left(U_{\mathrm{P}}-U_{\mathrm{N}}\right) \\
> & U_{\mathrm{A,GL}}=\dfrac{A_{\mathrm{GL}}}{2}\left(U_{\mathrm{P}}+U_{\mathrm{N}}\right) 
> \end{rcases}\ U_{\mathrm{A}}=U_{\mathrm{A,D}}+U_{\mathrm{A,GL}}
> $$
> 
> berechnet werden.

Demnach kann der Differenzverstärker folgendermaßen dargestellt werden:

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{amplifiers/scale=0.8}
\newcommand{\summation}[2]
{
    node[draw, circle, minimum size=1cm, fill=white]{}
    node[above, inner sep=4pt]{#1}
    node[below, inner sep=4pt]{#2}
}
\begin{document}
\begin{circuitikz}[scale=2, transform shape, very thick]
    \draw (0,0) node[left]{$U_\mathrm{P}$} to[short, o-*]
        ++(1,0) coordinate(k1) -- ++(1,0) --
        ++(0,-1) coordinate(s1) to[short, -*]
        ++(0,-1) coordinate(k2) --
        ++(0,-1) coordinate(s2) -- ++(0,-1) -- ++(-1, 0) --(k1);
    \draw (k2) to[short, -o] (k2 -| 0,0) node[left]{$U_\mathrm{N}$};
    \draw (s1) \summation{+}{--} -- ++(1,0) node[plain mono amp, anchor=in](aed) {$A_{\mathrm{D}}$} (aed.out) -- ++(1,0) -- ++(0,-2);
    \draw (s2) \summation{+}{+} -- ++(1,0) node[plain mono amp, anchor=in](agl) {$\frac{A_{\mathrm{GL}}}{2}$} (agl.out) -- ++(1,0) ++(0,1) \summation{+}{+} to[short, -o] ++(1,0) node[right]{$U_\mathrm{A}$};
    
\end{circuitikz}
\end{document}
```


## Gleichtaktspannung

Als Gleichtaktspannung $U_{\mathrm{GL}}$ bezeichnet man den Mittelwert der Eingangsspannungen, der an den beiden Differenzeingängen gegenüber Masse anliegt.

> [!def] Gleichtaktspannung $U_{\mathrm{GL}}$^UGL
> $$U_{\mathrm{GL}} = \frac{U_{\mathrm{P}} + U_{N}}{2}$$

## Gleichtaktverstärkung

> [!def] Gleichtaktverstärkung $A_{\mathrm{GL}}$ ^AGL
> $$ A_\mathrm{GL} = \frac{\partial U_{\mathrm{A}}}{\partial U_{\mathrm{GL}}} $$

## Gleichtaktunterdrückung (CMRR)

> [!question] Common-Mode Rejection Ratio (CMRR)

> [!def] Das Gleichtaktunterdrückungsverhältnis ist gegeben durch
>
> $$G_{\mathrm{U}} = \left\lvert \frac{A_{\mathrm{D}}}{A_{\mathrm{GL}}} \right\rvert$$

Es gibt an wie gut der Differenzenverstärker ungleiche Eingangssignale verstärkt während er gleichanteile unterdrückt. Das Verhältnis der Differenzenverstärkung $A_{\mathrm{D}}$ zur Gleichtaktverstärkung $A_{\mathrm{GL}}$ ist im idealfall für $R_{i}\to \infty$ unendlich groß.

$$
G_{\text{U,ideal}} \to \infty\Bigg|_{R_{i}\to \infty}
$$