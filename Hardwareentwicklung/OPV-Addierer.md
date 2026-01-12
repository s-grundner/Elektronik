---
tags:
  - Baugruppe/OPV
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

![invert_dark](../_assets/Pasted%20image%2020241213005737.png)

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
\begin{circuitikz}[thick, scale=1.5, font=\Large, transform shape]
% Begin Schematic

\draw (0,0) node[op amp] (opv) {};
\draw (opv.+) to[short] ++(0,-0.5) node[rground] {};
\draw (opv.-)
    to [R, l_=$R_1$, i<_=$I_1$, *-o] (opv.- -| -4,0)
    node[left] {$U_{E1}$};
\draw (opv.-)
    to[short, *-*] (opv.- |- 0, 2)
    to[R, l_=$R_2$, i<_=$I_2$, -o] (-4, 2)
    node[left] {$U_{E2}$};
\draw (opv.- |- 0, 2)
    to[R=$R$, i<=$I$] (opv.out |- 0, 2)
    to[short, -*] (opv.out)
    to[short, -o] ++(1,0) node[right] {$U_A$};

\end{circuitikz}
\end{document}
```

Da der nicht invertierende Eingang auf Masse liegt, ist der invertierende Eingang eine virtuelle Masse. Somit lautet die Knotengleichung

$$
\begin{gathered}
\frac{U_{\mathrm{E}1}}{R_2}+\frac{U_{\mathrm{E} 2}}{R_1}+\frac{U_\mathrm{A}}{R}=0 \\
U_{\mathrm{A}}=-R\left(\frac{U_{\mathrm{E 1}}}{R_{2}} +\frac{U_{\mathrm{E 2}}}{R_{1}} \right)
\end{gathered}
$$

Diese Schaltung invertiert also die Summe.

### Mit einer generischen Anzahl von Eingängen

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large, transform shape]
% Begin Schematic

\draw (0,0) node[op amp] (opv) {};
\draw (opv.+) to[short] ++(0,-0.5) node[rground] {};
\draw (opv.-)
    to [R, l_=$R_2$, i<_=$I_2$, *-o] (opv.- -| -4,0)
    node[left] {$U_{\mathrm{E2}}$};
\draw (opv.-)
    to[short, *-*] (opv.- |- 0, 2)
    to[R, l_=$R_1$, i<_=$I_3$, -o] (-4, 2)
    node[left] {$U_{\mathrm{E1}}$};
\draw (opv.- |- 0, 2)
    to[R=$R$, i<=$I$] (opv.out |- 0, 2)
    to[short, -*] (opv.out)
    to[short, -o] ++(1,0) node[right] {$U_A$};

\draw (opv.- |- 0, 2) -- ++(0,2) coordinate(A)
    to[R, l_=$R_n$, i<_=$I_n$, -o] (-4, 4) coordinate(B)
    node[left]{$U_{\mathrm{En}}$};

\draw ($(A)!0.5!(B)$) node[below=10pt]{$\vdots$};

\end{circuitikz}
\end{document}
```

Wieder folgt aus der Knotenregel:

$$
\begin{align}
\frac{U_{\mathrm{A}}}{R}+ \sum_{i=1}^{n} \frac{U_{\mathrm{E}i}}{R_{i}} = 0\implies U_{\mathrm{A}} = -R \sum_{i=1}^{n} \frac{U_{\mathrm{E}i}}{R_{i}}
\end{align}
$$