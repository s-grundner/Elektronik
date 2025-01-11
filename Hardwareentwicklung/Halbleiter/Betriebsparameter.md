---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 18th November 2024
professor:
---
 

# Betriebsparameter von Verstärkern

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=1cm}
\begin{document}
\newcommand{\wid}{6}
\begin{circuitikz}[thick, scale=2, transform shape]
% input
\draw (0,0) to[V, v<=$U_g$] ++(0,2) to[R, l=$R_i$] ++(2,0) coordinate(ue) to[short, i=$i_e$] ++(1,0) to[R, l=$r_e$] ++(0,-2) to[short] ++(-3,0);
\draw (ue) to[open, v=$u_e$, o-o] ++(0,-2) coordinate(uegnd);

%output
\draw (\wid,0) to[V, v<=$A_0\cdot u_e$] ++(0,2) to[R, l=$r_a$, i=$i_a$] ++(2,0) coordinate(ua) to[short] ++(1,0) coordinate(last) to[R, l=$R_L$] ++(0,-2) to[short] ++(-3,0);
\draw (ua) to[open, v=$u_a$, o-o] ++(0,-2) coordinate(uagnd);

% Bounding Box
\draw[dashed] (ue) -- ++(0, 0.5) -- ++(\wid/2, 0) coordinate(v) -- (v -| ua) -- (ua);
\draw[dashed] (uegnd) -- ++(0, -0.5) -- ++(\wid/2, 0) coordinate(g) -- (g -| uagnd) -- (uagnd);
\draw (v) node[vcc]{$U_0$};
\draw (g) node[rground]{};

%Text

\draw (last |- v) node[above]{Last};
\draw (v) ++(1,0) node[anchor=south west]{Verstärker};
\draw (0,0 |- v) node[above]{Signalquelle};
\end{circuitikz}
\end{document}
```

$U_{\mathrm{g}} \ldots$ Leerlaufspannung Signalquelle
$R_{i} \ldots$ Innenwiderstand Signalquelle
$r_e \ldots$ Eingangswiderstand
$u_e, u_{\mathrm{a}} \ldots$ Ein- und Ausgangsspannungen
$i_{\mathrm{e}}, i_{\mathrm{a}} \ldots$ Ein- und Ausgangsströme
$A_0 \ldots$ Leerlaufverstärkung
$r_{\mathrm{a}} \ldots$ Ausgangswiderstand
$R_{\mathrm{L}} \ldots$ Widerstand Last

## Eingangswiderstand und Betriebsspannungsverstärkung

> [!info] werden im Normalbetrieb (mit angeschlossener Last) ermittelt

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=1cm}
\begin{document}
\newcommand{\wid}{3}
\newcommand{\hei}{2}
\begin{circuitikz}[very thick, scale=2, transform shape]
\begin{scope}
\draw (0,0) to[V, v<=$U_g$] ++(0,\hei)
    to[R, l=$R_i$, i=$i_e$] ++(2,0) coordinate(ue)
    to[open, v=$u_e$, o-o] ++(0,-\hei) -- (0,0);
\draw[dashed] (ue) -- ++(0,0.5)
    -- ++(\wid/2,0) coordinate(v)
    -- ++(\wid/2,0)
    -- ++(0,-0.5) coordinate(ua);
\draw (ua) to[short, i=$i_a$] ++(1,0) coordinate(last) to[R, l=$R_L$] ++(0,-\hei) to[short] ++(-1,0);
\draw (ua) to[open, v^=$u_a$, o-o] ++(0,-\hei);
\draw (v) node[vcc]{$U_0$};
\draw (2+\wid/2, \hei/2) node{Verstärker};
\draw[dashed] (0,0 -| ua) -- ++(0,-0.5) -- ++(-\wid/2,0) coordinate(g) -- ++(-\wid/2,0) -- (2,0);
\draw (g) node[rground]{};
\draw (0,0 |- v) node[above]{Signalquelle};
\draw  (last |- v) node[above]{Last};
\end{scope}
\begin{scope}[xshift=9cm]
\draw (0,\hei/2) node[above=7pt, font=\LARGE]{$r_{e}=\left.\frac{u_{e}}{i_{e}}\right|_{R_{L}}$};
\draw (0,\hei/2) node[below=7pt, font=\LARGE]{$A_{u}=\left.\frac{u_{a}}{u_{e}}\right|_{R_{L}}$};
\end{scope}
\end{circuitikz}
\end{document}
```

## Leerlaufspannungsverstärkung

> [!info] wird im Leerlauf (ohne angeschlossene Last) ermittelt


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\ctikzset{bipoles/length=1cm}
\begin{document}
\newcommand{\wid}{3}
\newcommand{\hei}{2}
\begin{circuitikz}[very thick, scale=2, transform shape]
\begin{scope}
\draw (0,0) to[V, v<=$U_g$] ++(0,\hei)
    to[R, l=$R_i$, i=$i_e$] ++(2,0) coordinate(ue)
    to[open, v=$u_e$, o-o] ++(0,-\hei) -- (0,0);
\draw[dashed] (ue) -- ++(0,0.5) -- ++(\wid/2,0) coordinate(v) -- ++(\wid/2,0) -- ++(0,-0.5) coordinate(ua);
\draw (ua) to[open, v^=$u_a$, o-o] ++(0,-\hei);
\draw (v) node[vcc]{$U_0$};
\draw (2+\wid/2, \hei/2) node{Verstärker};
\draw[dashed] (0,0 -| ua) -- ++(0,-0.5) -- ++(-\wid/2,0) coordinate(g) -- ++(-\wid/2,0) -- (2,0);
\draw (g) node[rground]{};
\draw (0,0 |- v) node[above]{Signalquelle};
\end{scope}
\begin{scope}[xshift=9cm]
\draw (0,\hei/2) node[font=\LARGE]{$A_{0}=\left.\frac{u_{a}}{u_{e}} \right|_{R_{L}=\infty}$};
\end{scope}
\end{circuitikz}
\end{document}
```

## Ausgangswiderstand

> [!info] wird durch Messen am Ausgang bei angeschlossener Quelle ermittelt

![](assets/Pasted%20image%2020241118042127.png)

$$
r_{\mathrm{a}}=-\left.\frac{u_{\mathrm{a}}}{i_{\mathrm{a}}}\right|_{R_{\mathrm{i}}, \,U_{\mathrm{g}}=0}
$$
