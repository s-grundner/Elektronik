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

Das Euler-Verfahren ist ein einfaches numerisches Verfahren zur Lösung von Differentialgleichungen. 

> [!def] **D Eulerverfahren (EV)**  Sei eine Explizites AWP gegeben durch: $x'(t) = f(t,x(t))$
> Das Eulerverfahren nähert den [Differenzialquotienten](Differenzialrechnung.md) durch einen Differenzenquotienten an:
> 
> $$
> \frac{\mathrm{d}x}{\mathrm{d}t} \approx \frac{x_{k}-x_{k-1}}{h} \qquad h := t_{k}-t_{k-1}
> $$
> 
> Es ergibt sich ein rekursives verfahren, bei dem der momentanwert aus den vorherigen werten berechnet werden kann:
> 
> $$
> \begin{align}
> \frac{x_{k}-x_{k-1}}{h} = f(t_{k-1},x_{k-1}) \\
> x_{k} = x_{k-1} + h\cdot f(t_{k-1}, x_{k-1})
> \end{align}
> $$



```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}

\begin{document}
\begin{tikzpicture}[scale=2, font=\Large, very thick]

% Achsen
\draw[->] (-0.2, 0) -- (5, 0) node[below] {$t$};
\draw[->] (0, -0.5) -- (0, 3) node[left] {$x$};

% Zeitpunkte t_0 und t_1
\draw[dashed] (1,0) -- (1,1) ;
\draw[dashed] (4,0) -- (4,2.5);

% Markierungen der Achsen
\node[below] at (1,0) {$a = t_0$};
\node[below] at (4,0) {$t_1$};
\draw[blue!50, decorate, decoration={brace, amplitude=5pt, raise=3pt}] (1, 0) -- (4, 0)
    node[color=blue!50, midway,above=7pt] {$h$};

% Kurve x(t)
\draw[] (0.2, 0.2) 
    .. controls (1.2, 2) and (2.5, 0.5) ..
    (5, 2) node[midway, below] {$x(t)$};

% Tangente
\draw[orange] (1, 1) -- (4,2.5) node[above,orange] {Tangente};
\filldraw[orange] (1,1) circle (1pt);
\filldraw[orange] (4,2.5) circle (1pt);
% Hilfslinien für x_0 und x_1
\draw[dashed] (0,1) node[left] {$x_0$} -- (1,1);
\draw[dashed] (0,2.5) node[left] {$x_1$} -- (4,2.5);

\end{tikzpicture}
\end{document}
```

$$
\begin{gathered}
x_{1} = x_{0}+h\cdot x'= x_{0}+h\cdot f(t_{0}, x_{0}) \\
x_{2} = x_{1}+h\cdot x'= x_{1}+h\cdot f(t_{1}, x_{1}) \\
\dots \\
\boxed{ x_{k} = x_{k-1} + h\cdot f(t_{k-1}, x_{k-1}) }
\end{gathered}
$$

Beim Expliziten Eulerverfahren geht man in kleinen Schritten $h$ von einem Anfangswert $x_{0}$ aus und berechnet den nächsten Wert $x_{1}$ durch die Tangente an der Stelle $x_{0}$. Das Eulerverfahren ist ein [explizites Einschrittverfahren](Diskretisierungsverfahren.md#Explizite%20Einschrittverfahren), bei dem die Verfahrensfunktion die Differenzialgleichung selbst ist.

> [!exmple] [Phils Lab - DSP Series #1](https://www.youtube.com/watch?v=VDhmVrbSpqA)
> ![invert_dark](../../_assets/Pasted%20image%2020260124154831.png)
## Butcher-Tableau

$$
\begin{array}{c|cc}
0 & 0 \\ \hline
& 1 & 0
\end{array}
$$