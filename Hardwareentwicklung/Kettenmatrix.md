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
U_{1}\\I_{1}
\end{pmatrix}
=
\begin{pmatrix}
A_{11} & A_{12}\\
A_{21} & A_{22}
\end{pmatrix}
\cdot
\begin{pmatrix}
U_{2}\\I_{2}
\end{pmatrix}
$$

$$
\begin{align*}
&&\left.A_{11}=\frac{U_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Leerlauf}}
&&\left.A_{12}=\frac{U_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Leerlauf}}
&&\left.A_{21}=\frac{I_{1}}{U_{2}}\right|_{I_{2}=0, \text{ Kurzschluss}}
&&\left.A_{22}=\frac{I_{1}}{I_{2}}\right|_{U_{2}=0, \text{ Kurzschlus}}
\end{align*}
$$

# Related

- [Vierpoltheorie](Vierpol.md)
- [Impedanzmatrix](Impedanzmatrix.md)
- [Admittanzmatrix](Admittanzmatrix.md)

![](https://www.youtube.com/watch?v=myrRbPjirLk)
