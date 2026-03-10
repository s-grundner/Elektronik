---
tags:
  - tikz
aliases:
created: 9th May 2025
title: system
release: false
---


# Systeme in tikz

## Beispiel 1

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
\node at (sum) (plus) {\footnotesize$+$};
\node [right = of sum] (output) {$y[n]$};

\path (h1) -- coordinate (med) (h2);
\path (input) -- coordinate(branch1) (h1);
\node [block, below of=med] (h3) {$h_3[n]$};

%Connecting Blocks
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

## Beispiel 2

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, shapes, arrows, positioning}
% set globally in preamble
\tikzset{
	block/.style={draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=3cm, line width=1pt},
	factor/.style={
		draw, shape=isosceles triangle, isosceles triangle stretches,
		minimum height=3em, minimum width=4em,
		node distance=3cm, line width=1pt, inner sep=2pt},
	sum/.style={draw, shape=circle, node distance=1.5cm, line width=1pt, minimum width=1.25em, node distance=3cm},
	branch/.style={fill,shape=circle,minimum size=4pt,inner sep=0pt}
}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=0.8]

% Creating Blocks and Connection Nodes
\node at (0,0) (input) {};
\node [sum, right of=input, node distance=2cm] (s1) {$+$};
\node [block, right of=s1, node distance=2cm] (regler) {$R(s)$};
\node [factor, right of=regler] (k1) {$5$};
\node [block, right of=k1] (motor) {$G_1(s)$};
\node [block, above of=motor, node distance=2cm] (stoer) {$G_2(s)$};
\node [sum, right of=motor, node distance=2cm] (s2) {$+$};
\node [factor, right of=s2, node distance=2cm] (tacho) {$k_3$};

% Annotations
\node [below left=0pt of s1] {$-$};
\node [above left=0pt of s1] {$+$};
\node [below=9pt of regler] {PI-Regler};
\node [below=9pt of k1, text width=3cm, align=center] {Leistungs-verstärker};
\node [below=9pt of motor, text width=3cm, align=center] {Motorüber-tragungsfunktion};
\node [above=9pt of stoer, text width=3cm, align=center] {Störgrößenüber-tragungsfunktion};
\node [below=9pt of tacho, text width=3cm, align=center] {Tachogenerator};

% Connecting Blocks
\begin{scope}[line width=1pt]
\draw[->] (input) node[midway]{$u_\text{soll}(s)$} -- (s1);
\draw[->] (s1) -- (regler);
\draw[->] (regler) -- (k1) node[midway,above]{$u_\text{stell}(s)$};
\draw[->] (k1) -- (motor) node[midway,above]{$u_\text{A}(s)$};
\draw[->] (motor) -- (s2) node[midway,above]{$\tilde{n}(s)$};
\draw[->] (s2) -- (tacho) node[midway,above]{$n_\text{ist}(s)$};
\draw[->] (k1 |- stoer) -- (stoer) node[midway,above]{$M_\text{L}(s)$};
\draw[->] (stoer) -| (s2) node[midway,above]{$n_\text{stör}(s)$};
\draw[->] (tacho) -- ++(2,0) node[midway]{$u_\text{ist}(s)$} -- ++(0,-3) -| (s1);
\end{scope}
\end{tikzpicture}
\end{document}
```