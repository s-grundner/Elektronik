---
tags:
  - Baugruppe/OPV
  - Mathematica
aliases:
  - Integrator
  - Integrierer
  - Integratorfilter
keywords:
  - Aktiver Tiefpass
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 13. Dezember 2024
professor:
---
 

# Integrator

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[very thick, scale=1, font=\Large]
% Begin Schematic

\draw (0,0) node[op amp] (opv) {};

\draw (opv.+) to[short] ++(0,-1) node[tlground] {};
\draw (opv.-)
    to[short, *-] (opv.- |- 0, 2)
    to[C=$C$] (opv.out |- 0, 2)
    to[short, -*] (opv.out);

\draw (opv.-)
    to[R, l_=$R$, -o] (opv.- -| -3,0)
    node[left] {$U_{E}$};

\draw (opv.out)
    to[short, -o] ++(1,0)
    node[right] {$U_{A}$};

\end{circuitikz}
\end{document}
```

## Übertragungsfunktion

$$
A(j\omega)=\frac{\underline{ U }_{A}}{\underline{ U }_{E}} = -\frac{1}{j\omega R C}
$$

> [!question]- **Herleitung**
>
> [Knotenregel](../Elektrotechnik/Kirchhoffsche%20Regeln.md)
> 
> $$
> \begin{align}
> I_{R}+I_{C}=\frac{U_{e}}{R} + \frac{U_{a}}{Z_{C}} = 0\iff\frac{U_{e}}{R} =- \frac{U_{a}}{Z_{C}} \iff \frac{U_{a}}{U_{e}}= -\frac{Z_{C}}{R} = -\frac{1}{j\omega R C}
> \end{align}
> $$

> [!info]+ Bode-Diagramm
> 
> ![500](../_assets/OPV_Integrator_Bodeplot.png)                             

<center><a href="scripts/mathematica/OPV_Integrator.nb" class="internal-link">📈Mathematica Notebook</a></center>

## Funktionsweise

![invert_dark](../_assets/Pasted%20image%2020241213012458.png)

# Integratorfilter

![invert_dark](../_assets/Pasted%20image%2020241213050705.png)

Durch geschicktes Zusammenschalten von OPV Grundschaltungen können sehr einfach verschiedene [Aktive](Filter-Verstärker/Aktiver%20Filter.md) Filtertypen (Bandpass, Tiefpass, Hochpass) realisiert werden, je nachdem welcher Ausgang benutzt wird.

Im Allgemeinen bestehen solche Schaltungen aus einem [Addierer](OPV-Addierer.md), welcher das Eingangssignal mit zwei Integratorausgängen aufsummiert. 

Ein Vorteil dieser Schaltungsvariante ist, dass Filterparameter wie Güte, Kennfrequenz und Verstärkung unabhängig voneinander eingestellt werden können.

Hauptanwendung solcher Filter ist die Realisierung von Bandpässen mit sehr hohen Güten und Verstärkungen bei der Mittenfrequenz.

> [!info] Realisierungen von Integratorfiltern
> [Biquad](Filter-Verstärker/Biquad%20Filter%20Topologie.md)-Filter
> [State-Variable](State-Variable%20Topologie.md)-Filter