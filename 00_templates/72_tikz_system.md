```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows, positioning}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=2]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=2cm, line width=1pt]
\tikzstyle{sum} = [draw, shape=circle, node distance=1.5cm, line width=1pt, minimum width=1.25em]
\tikzstyle{branch} = [fill,shape=circle,minimum size=4pt,inner sep=0pt]

%Creating Blocks and Connection Nodes
\node at (0,0) (input) {$x[n]$};
\node [block, right of=input] (h1) {$h_1[n]$};
\node [block, right of=h1] (h2) {$h_2[n]$};
\node [sum, right of=h2] (sum) {};
\node at (sum) (plus) {{\footnotesize$+$}};
\node [right = of sum] (output) {$y[n]$};

\path (h1) -- coordinate (med) (h2);
\path (input) -- coordinate(branch1) (h1);
\node [block, below of=med] (h3) {$h_3[n]$};

%Conecting Blocks
\begin{scope}[line width=1pt]
     \draw[->] (input) -- (h1);
     \draw[->] (h1) -- (h2);
     \draw[->] (h2) -- (sum);
     \draw[->] (sum) -- (output);
     \draw[->] (branch1) node[branch] {} |- (h3);
     \draw[->] (h3) -| (sum);
\end{scope}

\end{tikzpicture}
\end{document}
```
