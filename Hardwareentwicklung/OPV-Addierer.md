---
tags:
  - OPV
  - tikz/circuitikz
aliases:
  - OPV-Umkehrsummierer
  - Umkehrsummierer
  - Addierer
keywords: 
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 23. September 2023
professor:
  - Bernhard Jakoby
  - Christian Diskus
---

# Addierer

Das Eingangssignal kann an den nicht invertierenden Eingang oder an den invertierenden Eingang gelegt werden, die Rückkopplung muss jedoch bei einer Verstärkerschaltung IMMER eine Gegenkopplung sein.

## Nicht-Invertierender Addierer

![](assets/Pasted%20image%2020241213005737.png)

Die Spannung am invertierenden Eingang ist $U_N=U_A \frac{R}{R+R}=\frac{U_A}{2}$. Wenn der OP korrekt arbeitet, dann versucht er $U_D$ auf 0 zu bringen, also $U_N=U_P$. Bei idealerweise verschwindendem Eingangsstrom des OP gilt dann die Knotengleichung:

$$
\begin{gathered}
\frac{U_{E 1}-\frac{U_A}{2}}{R_1}+\frac{U_{E 2}-\frac{U_A}{2}}{R_2}=0 \\
U_A=\frac{2}{R_1+R_2}\left(R_2 U_{E 1}+R_1 U_{E 2}\right)
\end{gathered}
$$

## Umkehrsummierer (Invertierender Addierer)

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1, font=\Large]
% Begin Schematic

\draw (0,0) node[op amp] (opv) {};
\draw (opv.+) to[short] ++(0,-0.5) node[tlground] {};
\draw (opv.-)
    to [R, l_=$R_2$, *-o] (opv.- -| -3,0)
    node[left] {$U_{E2}$};
\draw (opv.-)
    to[short, *-*] (opv.- |- 0, 2)
    to[R, l_=$R_1$, -o] (-3, 2)
    node[left] {$U_{E1}$};
\draw (opv.- |- 0, 2)
    to[R=$R_3$] (opv.out |- 0, 2)
    to[short, -*] (opv.out)
    to[short, -o] ++(1,0) node[right] {$U_A$};

\end{circuitikz}
\end{document}
```


Da der nicht invertierende Eingang auf Masse liegt, ist der invertierende Eingang eine virtuelle Masse. Somit lautet die Knotengleichung

$$
\begin{gathered}
\frac{U_{E 1}}{R_2}+\frac{U_{E 2}}{R_1}+\frac{U_A}{R_3}=0 \\
U_A=-\frac{R_3}{R_1 R_2}\left(R_1 U_{E 1}+R_2 U_{E 2}\right)
\end{gathered}
$$

Diese Schaltung invertiert also die Summe.