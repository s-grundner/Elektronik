---
tags:
  - Algorithmus/Informatik
  - HTL-Diplomarbeit
aliases:
  - Fast Fourier Transform
created: 26. Dezember 2023
complexity: $\mathcal{O}(n\cdot\log(n))$
---

# Fast Fourier Transform

> [!info] Complexity: $\mathcal{O}(n\cdot\log(n))$ 

> [!hint] FFT $\iff$ [DFT](../../Systemtheorie/Signalverarbeitung/DFT.md)
> Der FFT-Algorithmus  ist eine Möglichkeit, die [DFT](../../Systemtheorie/Signalverarbeitung/DFT.md) mit hoher Geschwindigkeit durchzuführen. James Cooley und John W. Tukey wiederentdeckten ihn im Jahr 1965.
> Wiederentdeckung deshalb, weil Carl Friedrich Gauß den Algorithmus in seiner ersten Form bereits 1805 entdeckte und verwendete, diese aber nie publizierte.
> Erst die durch diesen Algorithmus erreichte hohe Durchführungsgeschwindigkeit ermöglicht eine so breit gefächerte Anwendung.

## Vereinfachung der DFT Matrix

Beispiel in einer kleinen Dimension

$$
\begin{pmatrix}
c_{0} \\
c_{1} \\
c_{2} \\
c_{3}
\end{pmatrix}
=
\begin{pmatrix}
1 & 1 & 1 & 1 \\
1 & w & w^{2} & w^{3} \\
1 & w^{2} & 1 & w^{2} \\
1 & w^{3} & w^{2} & w
\end{pmatrix}
=
\begin{pmatrix}
y_{0} \\
y_{1} \\
y_{2} \\
y_{3}
\end{pmatrix}
$$

Diese Matrix lässt sich durch elementare Umformungen nu aufstellen.

$$
\left(\begin{array}{c}
c_0 \\
c_2 \\
c_1 \\
c_3
\end{array}\right)=\left(\begin{array}{cc|cc}
1 & 1 & 1 & 1 \\
1 & w^2 & 1 & w^2 \\
\hline 1 & w & w^2 & w^3 \\
1 & w^3 & w^2 & w
\end{array}\right)\left(\begin{array}{l}
y_0 \\
y_1 \\
y_2 \\
y_3
\end{array}\right)=\left(\begin{array}{cc|cc}
1 & 1 & 0 & 0 \\
1 & w^2 & 0 & 0 \\
\hline 0 & 0 & 1 & 1 \\
0 & 0 & 1 & w^2
\end{array}\right)\left(\begin{array}{cc|cc}
1 & 0 & 1 & 0 \\
0 & 1 & 0 & 1 \\
\hline 1 & 0 & w^2 & 0 \\
0 & w & 0 & w^3
\end{array}\right)\left(\begin{array}{l}
y_0 \\
y_1 \\
y_2 \\
y_3
\end{array}\right)
$$


> [!important] Die DFT der Ordnung 4 kann man mit 2 DFT der Ordnung 2 berechnen.
> Ist N eine zweierpotenz, kann dieses verfahren für höhere Ordnungen rekursiv angewandt werden.
> *Dieses Verfahren heißt FFT - Fast Fourier Transform*
