---
tags: 
aliases:
  - Runge-Kutta
keywords: 
subject:
  - Mathematik 3
  - VL
semester: WS24
created: 26. Februar 2025
professor: 
release: false
title: Mehrstufige Einschrittverfahren
---
 

# Mehrstufige Explizite Einschrittverfahren - Runge-Kutta

> [!question] [Diskretisierungsverfahren](Diskretisierungsverfahren.md)

Man möchte Verfahren höherer Konvergenzordnung entwickeln. Dazu eignen sich mehrstufige Einschrittverfahren.

> [!question] Unterschied zwischen **Stufe** und **Schritt**
>
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> \begin{tikzpicture}[very thick, font=\Large, scale=2]
>     \draw (0,0) -- (10,0);
>     \draw (0,0) node[below] {$t_{k-1}$} -- (0,0.2);
>     \draw (10,0) node[below] {$t_k$} -- (10,0.2);
>     
>     \foreach \x/\l in {1/$b_{1}$,4/$b_{2}$,7/$b_{3}$,8/$b_{4}$} {
>         \draw (\x,-0.1) node[below]{\l} -- (\x,0.1);
>     }
>     \draw[decorate,decoration={brace,amplitude=10pt,raise=30pt}] (0,0) -- (10,0)
>         node [midway,above=40pt] {Schritt von $k-1$ nach $k$};
>     \draw[decorate, decoration={brace,amplitude=5pt,raise=10pt}] (1,0) -- (4,0)
>         node [midway,above=15pt] {Stufe};
> \end{tikzpicture}
> \end{document}
> ```
>
 Die Koeffizienten $b_{i}\in [t_{k-1}, t_{k}]$ geben an, wie der Schritt geteilt wird. Wie mann sieht, ist die teilung nicht mehr äquidistant. Die Koeffizienten sind Gewichte zum Teilungsintervall an und ergeben in Summe 1. 

Wie bei den Quadraturformeln der Numerischen Integration macht man für Mehrstufige Einschrittverfahren eine Gewichtung der Funktionswerte an verschiedenen Stützstellen, sodass der Ansatz für die $s$-Stufige Verfahrensfunktion lautet:
 
 $$\phi_{s}(t,x,h)=\sum_{i=1}^{s}b_{i}k_{i}$$

> [!stickies]
> Selbe Idee wie bei der [Numerischen Integration](Numerische%20Integration.md):
> $$\int_{t_{k-1}}^{t_{k}}g(t)\mathrm{~d}t=\sum_{i} w_{i}g(\xi_{i})$$
> mit $\xi_{i}\in[t_{k-1},t_{k}]$

> [!def] **D5 - MESV)** explizites Mehrstufiges Einschrittverfahren nach **Runge-Kutta** ^MESV
> $$
> \begin{align}
> x_{k} &= x_{k-1} + h\cdot \sum_{i=1}^{s} b_{i}k_{i}\tag{MESV 1.1} \\
> k_{i} &= f\left(t_{k-1}+hc_{i}, x_{k-1}+h\sum_{j=1}^{i-1}a_{ij}k_{j}\right)\tag{MESV 1.2}
> \end{align}
> $$
> mit $i=1, \ldots, s$ und $c_{1}=0$. $k_{i}$ heißen Steigungswerte.

>[!example] Das [Euler-Verfahren](Euler-Verfahren.md) ist in diesem Schema enthalten
> mit $s = 1, b_{1}=1, c_{1}=0$

Man Möchte $a_{ij}, b_{i}, c_{1}$ so wählen, dass das Verfahren eine möglichst hohe Konvergenzordnung hat. Diese Parameter ordnet man in einer Tabelle an, dem sogenannten **Butcher-Tableau**.

> [!warning] Man beachte dass Ordnung $\cancel{ \iff }$ Stufe
> - Für $2$-Stufige ESV erhält man die Ordnung 2.
> - Für $3$ bzw. $4$ Stufige Verfahren erhält man auch noch de Ordnung 3 bzw 4
> - Für Verfahren $5$-Ordnung benötigt man jedoch unerwarteterweise mindestens $6$-Stufen

## Butcher Tableau

Mit dem Butcher-Tableau können die Koeffizienten $a_{ij}, b_{i}, c_{i}$ für ein $s$-Stufiges Runge-Kutta Verfahren übersichtlich dargestellt werden.
 

$$
\begin{array}{c|ccccc}
c_{1} &  & & & & \\
c_2 & a_{21} & & & & \\
c_3 & a_{31} & a_{32} & & & \\
\vdots & \vdots & \vdots & \ddots & & \\
c_s & a_{s 1} & a_{s 2} & \ldots & a_{s, s-1} & \\
\hline & b_1 & b_2 & \ldots & b_{s-1} & b_s
\end{array}
$$

## 2-Stufige Runge-Kutta Verfahren

> [!example] **Butcher-Tableau**
>
> $$
> \begin{array}{c|cc}
> 0 & & \\ c_{2} & a_{21} & \\ \hline & b_{1} & b_{2}
> \end{array}
> $$

$$
\begin{array}{c|c}
\text{expl. Heun-Verfahren} & \text{expl. Mittelpunktsregel} \\ \hline \\
\begin{array}{c|cc}
0 & & \\ 1 & 1 & \\ \hline & \frac{1}{2} & \frac{1}{2}
\end{array} & 
\begin{array}{c|cc}
0 & & \\ \frac{1}{2} & \frac{1}{2} & \\ \hline & 0 & 1
\end{array}
\end{array}
$$

## 4-Stufige Runge-Kutta Verfahren (RK4)

$$
\begin{array}{c|ccc}
0 & & & & \\
c_1 & a_{21} & & & \\
c_3 & a_{31} & a_{32} & & & \\
c_4 & a_{41} & a_{42} & a_{43} & \\
\hline & b_1 & b_2 & b_3 & b_4
\end{array} \quad \overset{ \text{RK4} }{ \implies }\quad
\begin{array}{c|ccc}
0 & & & & \\
\frac{1}{2} & \frac{1}{2} & & & \\
\frac{1}{2} & 0 & \frac{1}{2} & & & \\
1 & 0 & 0 & 1 & \\
\hline & \frac{1}{6} & \frac{1}{3} & \frac{1}{3} & \frac{1}{6}
\end{array}
$$