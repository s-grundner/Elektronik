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

%set default line width to 0.75pt
\tikzset{every picture/.style={line width=0.75pt}} 

\begin{tikzpicture}[x=0.75pt,y=0.75pt,yscale=-2,xscale=2, font=\Large]
%uncomment if require: \path (0,310); %set diagram left start at 0, and has height of 310

%Shape: Axis 2D
\draw[line width=1.5] (187.28,194.5) -- (377.48,194.5) (206.3,75.34) -- (206.3,207.74) (370.48,189.5) -- (377.48,194.5) -- (370.48,199.5) (201.3,82.34) -- (206.3,75.34) -- (211.3,82.34);
%Shape: Parabola
\draw[color={rgb, 255:red, 59; green, 209; blue, 217 }  ,draw opacity=1 ][line width=1.5]  (206.3,194.5) .. controls (247.87,76.5) and (289.43,76.5) .. (331,194.5) ;
%Straight Lines
\draw[color={rgb, 255:red, 255; green, 0; blue, 0 }  ,draw opacity=1 ]   (292,79.67) -- (268.74,104.16) -- (198,178.67) ;
%Straight Lines
\draw[dashed] (269.2,194.6) -- (268.74,104.16);
%Straight Lines
\draw[dashed] (223.2,194.4) -- (222.65,152);
%Straight Lines
\draw[green] (292,68.67) -- (198,167.67) ;

% Text Node
\draw (294,65.27) node[anchor=south west][inner sep=0.75pt][color={rgb, 255:red, 5; green, 198; blue, 0}  ,opacity=1 ]  {$\text{Differenzialquotient}$};
% Text Node
\draw (294,83.07) node [anchor=north west][inner sep=0.75pt][color={rgb, 255:red, 254; green, 0; blue, 0 }  ,opacity=1 ]  {$\text{Differenzenquotient}$};
% Text Node
\draw (327,147) node [anchor=north west][inner sep=0.75pt][color={rgb, 255:red, 59; green, 209; blue, 217 }  ,opacity=1 ] [align=left] {(stetig)};
% Text Node
\draw (191,54.4) node [anchor=south][inner sep=0.75pt]{$f(x)$};
% Text Node
\draw (385,185.4) node [anchor=west][inner sep=0.75pt]{$x$};


\end{tikzpicture}

\end{document}
```