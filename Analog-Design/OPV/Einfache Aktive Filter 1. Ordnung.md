---
tags:
aliases:
  - Aktiver Tiefpass 1. Ordnung
  - Aktiver Hochpass 1. Ordnung
keywords:
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 16. Dezember 2024
professor:
release: false
---
 

# Einfache Aktive Filter 1. Ordnung

> [!info] **Siehe:** [Aktiver Filter](Aktiver%20Filter.md)

## Tiefpass

 Nicht-Invertierend / Invertierend

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}

\begin{circuitikz}[thick, scale=1, font=\Large]
\begin{scope}

% Begin Schematic
\draw (0,0) node[op amp, yscale=-1] (opv) {};
\draw (opv.+)
    to[short, -*] (opv.+ -| -2, 0)
    to[R, l_=$R$, -o] ++(-2,0)
    node[left] {$U_E$};
\draw (opv.+ -| -2, 0)
    to[C, l_=$C$] (-2, -4)
    node[tlground] {};
\draw (opv.out)
    to[short, -o] ++(1, 0)
    node[right] {$U_A$};
\draw (opv.-)
    to[short] (opv.- |- 0, -2)
    to[short,-*] (opv.out |- 0, -2)
    to[R, l_=$R_1$] ++(0,2)
    to[short, *-] (opv.out);
\draw (opv.out |- 0, -2)
    to[R, l=$R_2$] (opv.out |- 0, -4)
    node[tlground] {};

\end{scope}
\end{circuitikz}

\begin{circuitikz}[thick, scale=1, font=\Large]
\begin{scope}[xshift=7cm, yshift=-2cm]

% Begin Schematic
\draw (0,0) node[op amp] (opv) {};
\draw (opv.+)
    to[short] ++(0,-1)
    node[tlground] {};
\draw (opv.-)
    to [R, l_=$R_1$, *-o] ++(-2,0)
    node[left] {$U_E$};
\draw (opv.-)
    to[short, -*] (opv.- |- 0, 1.5)
    to[C=$C$] (opv.out |- 0, 1.5)
    to[short, *-] ++(0,-1.5)
    to[short] (opv.out);
\draw (opv.-)
    to[short] (opv.- |- 0, 3)
    to[R, l=$R_2$] (opv.out |- 0, 3)
    to[short] ++(0,-2)
    to[short, -*](opv.out);
\draw (opv.out)
    to[short, -o] ++(1, 0)
    node[right] {$U_A$};

\end{scope}
\end{circuitikz}
\end{document}
```

### Übertragungsfunktion

$$
\begin{array}{ccc}
\text{Nicht Invertierend} &  & \text{Invertierend} \\
\boxed{ A(j \omega)=\dfrac{1}{1+j \omega R C}\cdot \left( 1+\dfrac{R_{1}}{R_{2}} \right) } & \hspace{ 1cm } &  \boxed{ A(j \omega)=-\dfrac{\frac{R_{1}}{R_{2}}}{1+j \omega R_{1} C} }  \\
\tiny{\implies V_{0} = \left( 1+\frac{R_{1}}{R_{2}} \right)}, \, \omega_{0}=\frac{1}{RC} &  & \tiny{\implies V_{0} = -\frac{R_{1}}{R_{2}}, \, \omega_{0}=\frac{1}{R_{1}C}} 
\end{array}
$$

## Hochpass

Nicht-Invertierend / Invertierend

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}

\begin{circuitikz}[thick, scale=1, font=\Large]
\begin{scope}

% Begin Schematic
\draw (0,0) node[op amp, yscale=-1] (opv) {};
\draw (opv.+)
    to[short, -*] (opv.+ -| -2, 0)
    to[C, l_=$C$, -o] ++(-2,0)
    node[left] {$U_E$};
\draw (opv.+ -| -2, 0)
    to[R, l_=$R$] (-2, -4)
    node[tlground] {};
\draw (opv.out)
    to[short, -o] ++(1, 0)
    node[right] {$U_A$};
\draw (opv.-)
    to[short] (opv.- |- 0, -2)
    to[short,-*] (opv.out |- 0, -2)
    to[R, l_=$R_1$] ++(0,2)
    to[short, *-] (opv.out);
\draw (opv.out |- 0, -2)
    to[R, l=$R_2$] (opv.out |- 0, -4)
    node[tlground] {};

\end{scope}
\end{circuitikz}

\begin{circuitikz}[thick, scale=1, font=\Large]
\begin{scope}[xshift=8cm, yshift=-2cm]

% Begin Schematic
\draw (0,0) node[op amp] (opv) {};
\draw (opv.+)
    to[short] ++(0,-1)
    node[tlground] {};
\draw (opv.-)
    to[R, l_=$R_1$, *-] ++(-2,0)
    to[C, l_=C, -o] ++(-1,0)
    node[left] {$U_E$};
\draw (opv.-)
    to[short] (opv.- |- 0, 1.5)
    to[R=$R_2$] (opv.out |- 0, 1.5)
    to[short] ++(0,-1.5)
    to[short] (opv.out);
\draw (opv.out)
    to[short, *-o] ++(1, 0)
    node[right] {$U_A$};

\end{scope}
\end{circuitikz}
\end{document}
```

### Übertragungsfunktion

$$
\begin{array}{ccc}
\text{Nicht Invertierend} &  & \text{Invertierend} \\
\boxed{ A(j \omega)=\dfrac{j \omega R C}{1+j \omega R C}\cdot \left( 1+\dfrac{R_{1}}{R_{2}} \right) } & \hspace{ 1cm } &  \boxed{ A(j \omega)=-\dfrac{\frac{R_{1}}{R_{2}} \cdot j \omega R_{1} C}{1+j \omega R_{1} C} }  \\
\tiny{\implies V_{0} = \left( 1+\frac{R_{1}}{R_{2}} \right)}, \, \omega_{0}=\frac{1}{RC} &  & \tiny{\implies V_{0} = -\frac{R_{1}}{R_{2}}, \, \omega_{0}=\frac{1}{R_{1}C}} 
\end{array}
$$
