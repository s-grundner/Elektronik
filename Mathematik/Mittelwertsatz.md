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
\begin{tikzpicture}[x=5pt, y=5pt, font=\Large]

%Shape: Axis 2D
\draw[<->, line width=1.5] (0,50) -- (0,0) -- (100,0);

%Shape: Parabola
\draw[cyan][line width=1.5]  (0,0) .. controls (20,40) and (40,40) .. (60,0);

%Straight Lines
\draw[red]    (0,10) -- (40,38);
\draw[green]  (0,18) -- (40,48);
\draw[dashed] (30,0) -- (30,30);
\draw[dashed] (10,0) -- (10,10);

\end{tikzpicture}
\end{document}
```