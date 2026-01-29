---
tags: 
aliases:
  - Kettenmatrizen
subject:
  - hwe
source:
  - Siegbert Schrempf
created: 14th November 2022
---

# Kettenmatrix

$$
\begin{pmatrix}
U_{1}\\ I_{1}
\end{pmatrix} =
\begin{pmatrix}
A & B \\
C & D
\end{pmatrix} \cdot
\begin{pmatrix}
U_{2}\\ I_{2}
\end{pmatrix}
$$

$$
\begin{align*}
&&\left.A=\frac{U_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Leerlauf}}
&&\left.B=\frac{U_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Kurzschluss}} \\
&&\left.C=\frac{I_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Leerlauf}}
&&\left.D=\frac{I_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Kurzschluss}}
\end{align*}
$$

Mit

$$
\mathbf{A} = \begin{pmatrix}
A & B \\ C & D
\end{pmatrix} \qquad
[\mathbf{A}] = \begin{pmatrix}
1 & \Omega \\ \mathrm{S} & 1
\end{pmatrix}
$$

# Related

- [Vierpoltheorie](Vierpol.md)
- [Impedanzmatrix](Impedanzmatrix.md)
- [Admittanzmatrix](Admittanzmatrix.md)

![](https://www.youtube.com/watch?v=myrRbPjirLk)
