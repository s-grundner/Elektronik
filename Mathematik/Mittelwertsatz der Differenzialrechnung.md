---
tags:
  - Analysis
aliases: []
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 10. April 2024
professor:
  - Andreas Neubauer
satz:
  - MWSD
title: Mittelwertsatz der Differenzialrechnung
draft: false
---
 

# Mittelwertsatz der Differenzialrechung

> [!satz] **S1 - MWSD)** 
> In einem beliebigen Intervall $I$ einer stetigen Funktion $f(x)$ gibt es mindestens eine Stelle $x_{0}$, an der der *Differenzenquotient* dieses Intervalls gleich der [Ableitung](Analysis/Differenzialrechnung.md) ist.

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}
\begin{tikzpicture}[x=5pt, y=5pt, font=\Large, line width=1.5]

\draw[<->] (0,50) -- (0,0) -- (70,0); % Achsen
\draw[cyan] (0,0) .. controls (20,40) and (40,40) .. (60,0); % Kurve

% Linien
\draw[green]  (0,13.5) -- (40,40); % Tangente
\draw[red]    (0,10) -- (40,36.5); % Differenzenquotient
\draw[dashed] (30,0) -- (30,30);
\draw[dashed] (10,0) -- (10,17);
\draw[dashed] (21,0) -- (21,27);

% Text Nodes
\draw (40,40)   node[green, anchor=west]
    {Differenzialquotient $\frac{df}{dx}\big|_{x_{0}}$};
\draw (40,36.5) node[red, anchor=west]{Differenzenquotient};
\draw (60,20)   node[cyan]{($f(x)$ ist stetig)};
\draw (0,50)    node[anchor=south]{$f(x)$};
\draw (70,0)    node[anchor=west]{$x$};
\draw (21,28)   node[anchor=south]{$x_{0}$};
\node[circle,fill=black,inner sep=0pt,minimum size=5pt] at (21,27.35) {};

% Deko
\draw[decorate, decoration={brace,amplitude=5pt,raise=5pt, mirror}]
    (10,0) -- (30,0) node [midway,below=15pt] {Intervall $I$, $x_0\in I$};

\end{tikzpicture}
\end{document}
```
---

