---
tags:
  - OPV
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
\begin{circuitikz}[very thick, scale=2, font=\LARGE]
% Begin Schematic

\draw (0,0) node[op amp] (opv) {};

\draw (opv.out) to[short, *-] ++(0, 1) to[C, l_=$C$] (-1, 1) to[short, -*] (opv.- -| -1, 1) to[short] (opv.-);
\draw (opv.+) to[short] ++(0, -1) node[tlground] {};
\draw (opv.- -| -1, 1) to[R, l_=$R$, -o] (opv.- -| -2, 0);
\draw (opv.out) to[short, -o] ++(1, 0) to[open, v=$U_a$, -o] ++(0, -1) to[short] ++(0, -0.25) node[tlground] {};
\draw (opv.- -| -2, 0) to[open, v=$U_e$, -o] ++(0, -1.25) to[short] ++(0, -0.25) node[tlground] {};


\end{circuitikz}
\end{document}
```

## Übertragungsfunktion

$$
\boxed{ A(j\omega)=\frac{\underline{ U }_{a}}{\underline{ U }_{e}} = -\frac{1}{j\omega R C} }
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

> [!info]+ Bode-Diagramm - [Mathematica Notebook](Simulationen/OPV_Integrator.nb)
> 
> ![500](assets/OPV_Integrator_Bodeplot.png)                             

## Funktionsweise

![](assets/Pasted%20image%2020241213012458.png)

# Integratorfilter

![](assets/Pasted%20image%2020241213050705.png)

Durch geschicktes Zusammenschalten von OPV Grundschaltungen können sehr einfach verschiedene Filtertypen (Bandpass, Tiefpass, Hochpass) realisiert werden, je nachdem welcher Ausgang benutzt wird.

Im Allgemeinen bestehen solche Schaltungen aus einem [Addierer](OPV-Addierer.md), welcher das Eingangssignal mit zwei Integratorausgängen aufsummiert. 

Ein Vorteil dieser Schaltungsvariante ist, dass Filterparameter wie Güte, Kennfrequenz und Verstärkung unabhängig voneinander eingestellt werden können.

Hauptanwendung solcher Filter ist die Realisierung von Bandpässen mit sehr hohen Güten und Verstärkungen bei der Mittenfrequenz.

> [!info] Realisierungen von Integratorfiltern
> [Biquad](Biquad%20Filter%20Topologie.md)-Filter
> [State-Variable](State-Variable%20Topologie.md)-Filter