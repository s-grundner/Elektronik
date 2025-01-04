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

\begin{tikzpicture}[
    x=0.75pt,y=0.75pt,
    yscale=2,xscale=2,
    font=\huge, L/.style={line width=2pt}]

\draw[fill=black,fill opacity=0.2, L] (159,76) .. controls (179,66)
    and (269,56) .. (249,76) .. controls (238.51,86.49)
    and (233.52,94.23) .. (234.04,103.55) .. controls (234.51,112)
    and (239.49,121.74) .. (249,136) .. controls (269,166)
    and (179,166) .. (159,136) .. controls (139,106)
    and (139,86) .. (159,76) -- cycle;
\draw[red, L, <-] (175,71) -- (183.33,69.33) ;

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
\draw (129,96.4) node [anchor=north west, inner sep=0.75pt] {$L$};
\draw (190,98.4) node [anchor=north west, inner sep=0.75pt] {$A$};
\draw (168.67,50.4) node[anchor=north west,inner sep=0.75pt,red] {$\mathrm{d}\boldsymbol{l}$};

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