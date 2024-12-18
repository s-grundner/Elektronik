---
tags:
  - DGL/Numerisch
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 18. Dezember 2024
professor:
---
 

# Euler Verfahren

> [!info] Euler-Verfahren (EV)
> 
>```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> \begin{tikzpicture}[scale=2, font=\Large, very thick]
> 
> % Achsen
> \draw[->] (-0.2, 0) -- (5, 0) node[below] {$t$};
> \draw[->] (0, -0.5) -- (0, 3) node[left] {$x$};
> 
> % Zeitpunkte t_0 und t_1
> \draw[dashed] (1,0) -- (1,1) ;
> \draw[dashed] (4,0) -- (4,2.5);
> 
> % Markierungen der Achsen
> \node[below] at (1,0) {$a = t_0$};
> \node[below] at (4,0) {$t_1$};
> \draw[blue!50, decorate, decoration={brace, amplitude=5pt, raise=3pt}] (1, 0) -- (4, 0)
>     node[color=blue!50, midway,above=7pt] {$h$};
> 
> % Kurve x(t)
> \draw[] (0.2, 0.2) 
>     .. controls (1.2, 2) and (2.5, 0.5) ..
>     (5, 2) node[midway, below] {$x(t)$};
> 
> % Tangente
> \draw[orange] (1, 1) -- (4,2.5) node[above,orange] {Tangente};
> \filldraw[orange] (1,1) circle (1pt);
> \filldraw[orange] (4,2.5) circle (1pt);
> % Hilfslinien für x_0 und x_1
> \draw[dashed] (0,1) node[left] {$x_0$} -- (1,1);
> \draw[dashed] (0,2.5) node[left] {$x_1$} -- (4,2.5);
> 
> \end{tikzpicture}
> \end{document}
>```
>
> $$
> \begin{gathered}
> x_{1} = x_{0}+h\cdot x'= x_{0}+h\cdot f(t_{0}, x_{0}) \\
> \dots \\
> \boxed{ x_{k} = x_{k-1} + h\cdot f(t_{k-1}, x_{k-1}) }
> \end{gathered}
> $$