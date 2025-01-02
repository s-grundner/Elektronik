---
tags:
  - Analysis/Infinitesimalrechnung
aliases:
  - MWS
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 10. April 2024
professor:
  - Andreas Neubauer
satz:
  - MWS
---
 

# Mittelwertsatz

> [!satz] **S1 - MWS)** 
> In einem beliebigen Intervall einer Stetigen funktion gibt es mindestens eine Stelle an der der Differenzenquotient dieses Intervalls gleich der Ableitung ist.

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}
\begin{tikzpicture}[x=0.75pt, y=0.75pt, scale=2, font=\Large]

%Shape: Axis 2D
\draw[line width=1.5] (20,20) -- (20,5) -- (40,5);

%Shape: Parabola
\draw[cyan][line width=1.5]  (206.3,194.5) .. controls (247.87,76.5) and (289.43,76.5) .. (331,194.5);

%Straight Lines
\draw[red] (292,79.67) -- (268.74,104.16) -- (198,178.67) ;
\draw[green] (292,68.67) -- (198,167.67) ;
\draw[dashed] (269.2,194.6) -- (268.74,104.16);
\draw[dashed] (223.2,194.4) -- (222.65,152);

% Text Nodes
\draw (294,65.27) node[anchor=south west][inner sep=0.75pt][green]  {$\text{Differenzialquotient}$};
\draw (294,83.07) node [anchor=north west][inner sep=0.75pt][red]  {$\text{Differenzenquotient}$};
\draw (327,147) node [anchor=north west][inner sep=0.75pt] [align=left] {(stetig)};
\draw (191,60) node [anchor=south][inner sep=0.75pt]{$f(x)$};
\draw (385,185.4) node [anchor=west][inner sep=0.75pt]{$x$};

\end{tikzpicture}
\end{document}
```