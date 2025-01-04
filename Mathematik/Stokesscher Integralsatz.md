---
tags: 
aliases:
  - Satz von Stokes
keywords: 
subject:
  - VL
  - Mathematik 3
semester: SS24
created: 10. Oktober 2024
professor:
  - Andreas Neubauer
satz:
  - STOI
---
 

# Stokesscher Integralsatz

Der Stokessche Integralsatz ist ein Satz aus der Vektoranalysis, der die Beziehung zwischen einem Linienintegral über den Rand einer Fläche und einem Oberflächenintegral über die Fläche selbst beschreibt.

> [!satz] **S1 - STOI)** Stokesscher Integralsatz
> Sei $\boldsymbol{F}$ ein Vektorfeld und $A$ eine Fläche, die von einer geschlossenen Kurve $L$ umgeben ist. Dann gilt:
> $$\int_{A}(\nabla \times \boldsymbol{F}) \cdot \mathrm{d} \boldsymbol{a}=\oint_L \boldsymbol{F} \cdot \mathrm{d} \boldsymbol{l}$$
> 

## Erläuterung

Rechte Seite: $\oint_{L} \boldsymbol{F}\cdot \mathrm{d}$

- $\mathrm{d} \boldsymbol{l}$ ist das Inifitesimales Stück der Kurve $L$
- Das Ringintegral setzt vorraus das die Kurve $L$ geschlossen ist, das bedeutet, dass der Startpunkt gleich dem Endpunkt ist.

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}[font=\huge, L/.style={line width=2pt}]

\draw[fill=black,fill opacity=0.2, L]
    (-2, 1.5) .. controls (-1, 2.5) and (4, 2)..
    (2.5, 1.25) .. controls (1.5, 0.5) and (1, -0.5)..
    (2.5, -1.75) .. controls (4,-3) and (-1, -2)..
    (-2, -1.5) .. controls (-3,-1) and (-3,0) ..
    (-2, 1.5) -- cycle;
\draw[red, L, <-] (1.75,0.71) -- (1.83,.69) ;

\newcommand{\SET}{-4,-3,-2,-1,0.1,1,2,3,4}
\foreach \x in \SET {
    \foreach \y in \SET {
        \pgfmathsetmacro{\vx}{-\y}
        \pgfmathsetmacro{\vy}{\x}
        \pgfmathsetmacro{\vnorm}{sqrt(\vx*\vx + \vy*\vy)}
        \pgfmathsetmacro{\ux}{\vx/\vnorm}
        \pgfmathsetmacro{\uy}{\vy/\vnorm}        
        \draw[->, very thick, cyan] (\x,\y) -- ++(0.5*\ux,0.5*\uy);
    }
}

% Text Nodes
\draw (1.29,.96) node [anchor=north west, inner sep=0.75pt] {$L$};
\draw (1.90,.98) node [anchor=north west, inner sep=0.75pt] {$A$};
\draw (1.68,0.5) node[anchor=north west,inner sep=0.75pt,red] {$\mathrm{d}\boldsymbol{l}$};

\end{tikzpicture}
\end{document}
```

---

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}
\begin{tikzpicture}
\newcommand{\SET}{-4,-3,-2,-1,0.1,1,2,3,4}
\foreach \x in \SET {
    \foreach \y in \SET {
        \pgfmathsetmacro{\vx}{-\y}
        \pgfmathsetmacro{\vy}{\x}
        \pgfmathsetmacro{\vnorm}{sqrt(\vx*\vx + \vy*\vy)}
        \pgfmathsetmacro{\ux}{\vx/\vnorm}
        \pgfmathsetmacro{\uy}{\vy/\vnorm}        
        \draw[->, very thick, cyan] (\x,\y) -- ++(0.5*\ux,0.5*\uy);
    }
}
\end{tikzpicture}
\end{document}
\end{tikzpicture}
\end{document}

```