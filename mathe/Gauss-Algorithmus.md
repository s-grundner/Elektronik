---
tags:
  - Algorithmus
aliases: 
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 27. Januar 2024
professor:
  - Andreas Neubauer
---
 

# Gauss-Algorithmus

# Beispiel

Gegeben ist ein Lineares Gleichungssystem

$$
\begin{align}
0&=A+B+C\\
1&=4A+D\\
4&=6A-2B-4C\\
10&=4A-4B-4D
\end{align}
$$

Das LGS lässt sich als Matrix anschreiben:

$$
\begin{pmatrix}
1 & 1 & 1 & 0 \\
4 & 0 & 0 & 1 \\
6 & -2 & -4 & 0 \\
4 & -4 & 0 & -4
\end{pmatrix} \cdot
\begin{pmatrix}
A \\ B \\ C \\ D
\end{pmatrix} =
\begin{pmatrix}
0 \\ 1 \\ 4 \\ 10
\end{pmatrix}
$$

Lässt sich nun leicht mit dem Gauss-Algorithmus Lösen:

$$
\begin{align}
\left[\begin{array}{cccc|c}
1 &  1 &  1 &  0 &  0 \\
4 & -7 &  4 &  0 &  1 \\
6 & -2 & -4 &  0 &  4 \\
4 & -4 &  0 & -4 & 10  
\end{array}\right] &\quad\begin{aligned}
\\
S_{2}'=4S_{1}-S_{2}\\
S_{3}'=6S_{1}-S_{3}\\
S_{4}'=4 S_{1}-S_{4}
\end{aligned} \\ \\

\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 8 & 8 & 0 &  -4 \\
0 & 8 & 4 & 4 & -10  
\end{array}\right] &\quad\begin{aligned}
\\ \\
S_{3}''=2S_{2}'-S_{3}'\\
S_{4}''=2S_{2}'-S_{4}'
\end{aligned} \\ \\
\begin{aligned}
\\ \\
\downarrow\uparrow
\end{aligned}
\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 0 & 0 & -2 &  2 \\
0 & 0 & 4 & -6 & 8  
\end{array}\right] 
&\to
\left[\begin{array}{cccc|c}
1 & 1 & 1 & 0 &  0 \\
0 & 4 & 4 & -1 &  -1 \\
0 & 0 & 4 & -6 & 8 \\ 
0 & 0 & 0 & -2 &  2
\end{array}\right]
\end{align}
$$

Mit der unteren linken Stufenform kann das LGS von unten nach oben gelöst werden

$$
\begin{align}
-2D&=2 &&\to D=-1\\
4C-6\cdot(-1) &= 8 &&\to C=\frac{1}{2} \\
4B+4\cdot \frac{1}{2}-1\cdot(-1) &= -1 &&\to B=-1\\
A+1\cdot(-1)+1\cdot \frac{1}{2}+0\cdot(-1) &=0 &&\to A=-2
\end{align}
$$