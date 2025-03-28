> [!example] **(c)** Wie lautet nun die [Zustandstransformation](../../../../Systemtheorie/Zustandstransformation.md), die die Zustände $\mathbf{x}$ und $\mathbf{\bar{x}}$ ineinander überführt? Es soll mittels einer expliziten Zustandstransformation durchgeführt verifiziert werden. 

$$
\begin{align}
\mathbf{\bar{x}} = \mathbf{\bar{T}x} \to& \begin{pmatrix}
cz \\ dz+m\dot{z}
\end{pmatrix} = \mathbf{\bar{T}} \begin{pmatrix}
z \\ \dot{z}
\end{pmatrix}&\text{ mit }\mathbf{\bar{T}} = \begin{pmatrix}
\bar{\tau}_{11} & \bar{\tau}_{12} \\ \bar{\tau}_{21} & \bar{\tau}_{22}
\end{pmatrix} \\
&\begin{pmatrix}
cz \\ dz+m\dot{z}
\end{pmatrix} = \begin{pmatrix}
\bar{\tau}_{11}z & \bar{\tau}_{12}\dot{z} \\ \bar{\tau}_{21}z & \bar{\tau}_{22}\dot{z}
\end{pmatrix} &\implies\mathbf{\bar{T}}= \begin{pmatrix}
c & 0 \\ d  & m
\end{pmatrix}\tag{Koeff. Vgl.} \\
\end{align}

$$

> [!hint] Auch Möglich mit dem Ansatz wie in der Definition: $\mathbf{x} = \mathbf{T\bar{x}}$. Aber so ist die Matrix schöner.

Mit [invertieren einer 2x2 Matrix](Mathematik/Algebra/Gauß-Jordan-Verfahren.md#2x2%20Matrix) folgt.

$$
\mathbf{\bar{T}}^{-1} = \mathbf{T} = \dfrac{1}{cm} \begin{pmatrix}
m & 0 \\ -d & c
\end{pmatrix} = \begin{pmatrix}
\frac{1}{c} & 0 \\ -\frac{d}{cm} & \frac{1}{m}
\end{pmatrix}
$$
Gleichungen für die neuen Zustandsmatrizen wie in der Definition.

$$
\begin{align}
\mathbf{\bar{A}} = \mathbf{\bar{T}}\mathbf{AT} &= \begin{pmatrix}
c & 0 \\ d  & m
\end{pmatrix} \cdot\begin{pmatrix}
0 & 1 \\ -\frac{c}{m} & -\frac{d}{m}
\end{pmatrix} \cdot \begin{pmatrix}
\frac{1}{c} & 0 \\ -\frac{d}{cm} & \frac{1}{m}
\end{pmatrix}  \\
&= \begin{pmatrix}
0 & c \\ -c & 0
\end{pmatrix} \cdot \begin{pmatrix}
\frac{1}{c} & 0 \\ -\frac{d}{cm} & \frac{1}{m}
\end{pmatrix} = {\color{green}\begin{pmatrix}
-\frac{d}{m} & \frac{c}{m} \\ -1 & 0
\end{pmatrix}\quad \checkmark} 
\end{align}
$$

$$
\begin{align}
\mathbf{\bar{b}} = \mathbf{\bar{T}}\mathbf{b} &= \begin{pmatrix}
c & 0 \\ d  & m
\end{pmatrix} \cdot \begin{pmatrix}
0 \\ \frac{1}{m}
\end{pmatrix} = {\color{green}\begin{pmatrix}
0 \\ 1
\end{pmatrix}\quad\checkmark}
\end{align}
$$

$$
\mathbf{\bar{c}} = \mathbf{cT} = \begin{pmatrix}
1 \\ 0
\end{pmatrix} \cdot \begin{pmatrix}
\frac{1}{c} & 0 \\ -\frac{d}{cm} & \frac{1}{m}
\end{pmatrix} = {\color{green}\begin{pmatrix}
\frac{1}{c} \\ 0
\end{pmatrix}\quad\checkmark}
$$

$$
\mathbf{\bar{d}} = \mathbf{d} = {\color{green}\begin{pmatrix}
0 \\ 0
\end{pmatrix}\quad\checkmark}
$$