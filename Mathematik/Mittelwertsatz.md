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
\begin{tikzpicture}[x=5pt, y=5pt, font=\Large, line width=1.5]

%Shape: Axis 2D
\draw[<->] (0,50) -- (0,0) -- (70,0);

%Shape: Parabola
\draw[cyan] (0,0) .. controls (20,40) and (40,40) .. (60,0);

%Straight Lines
\draw[green]  (0,18) -- (40,48); % Tangente
\draw[red]    (0,10) -- (40,37); % Differenzenquotient
\draw[dashed] (30,0) -- (30,30);
\draw[dashed] (10,0) -- (10,17);

% Text Nodes
\draw (40,50) node[green]{Differenzialquotient};
\draw (40,40) node[red]{Differenzenquotient};
\draw (60,20) node[cyan]{($f(x)$ ist stetig)};
\draw (0,50) node[anchor=south]{$f(x)$};
\draw (70,0) node[anchor=west]{$x$};

\draw[decorate, decoration={brace,amplitude=5pt,raise=5pt, mirror}]
    (10,0) -- (30,0) node [midway,below=15pt] {Intervall um $x_0$};

\end{tikzpicture}
\end{document}
```