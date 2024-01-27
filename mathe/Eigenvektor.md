---
tags: 
aliases:
  - Eigenwert
  - Eigenwerte
  - Eigen
  - Eigenraum
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 24. Januar 2024
professor:
---
 

# Eigenwerte, Eigenvektoren, Eigenräume

> [!info]  
> Eigenwerte und Eigenvektoren sind wichtige Kenngrößen, die viel über das Verhalten einer [linearen Abbildung](Lineare%20Abbildungen.md) aussagen.  
> Eigenvektoren sind [Vektoren](mathe%20(3)/Vektor.md), die unter der [linearen Abbildung](Lineare%20Abbildungen.md) ihre Richtung nicht ändern, sondern allenfalls skaliert werden;  
> diesen Skalierungsfaktor nennt man *Eigenwert*.

> [!hint] Anwendungen  
> Sie spielen in vielen mathematischen Anwendungen
> - Hauptkomponentenanalyse in der Statistik
> - Spektraltheorie, etc.
>
> sowie in physikalischen Problemstellungen
> - Eigenfrequenzen eines schwingungsfähigen Systems
> - Hauptträgheitsrichtungen eines starren Körpers, etc.
> 
> eine große Rolle.

# Beispiele

> [!example] reelle Eigenwerte

$$
A= \begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix}
$$

Alle [Vektoren](mathe%20(3)/Vektor.md) $\vec{x}$ die unter der linearen Abbildung $Lx = A^{L}\vec{x}$ nur *skaliert* werden. (Der gleiche Vektor mit einer Anderen länge)

$$A\vec{x}=\lambda \vec{x}$$



Die Gleichung beinhaltet nun auf der einen Seite eine Matrix multipliziert mit einem Vektor und auf der anderen ein Skalar multipliziert mit einem Vektor.

Um aus der Gleichung eine reine Matrizengleichung zu erhalten lässt sich das Skalar auch mit der Einheitsmatrix anschreiben:

$$
\begin{align}
\lambda \vec{x} &= (\lambda \cdot I)\vec{x} = \lambda \cdot\begin{pmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{pmatrix}\cdot \vec{x} =\begin{pmatrix}
\lambda & 0 & 0 \\
0 & \lambda & 0 \\
0 & 0 & \lambda
\end{pmatrix}\cdot \vec{x}
\end{align}
$$

Durch Umformen und Einsetzen ergibt sich:

$$
\begin{align}
A\vec{x}&=\lambda \vec{x} \quad|-\lambda \vec{x} \\
A\vec{x}-\lambda \vec{x} &=\vec{0} \quad \text{(Nullvektor)} \\
A\vec{x}-(\lambda \cdot I)\vec{x} &= \vec{0} \\
(A-\lambda \cdot I)\vec{x} &= \vec{0} \\
\left[\begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix}-\begin{pmatrix}
\lambda & 0 & 0 \\
0 & \lambda & 0 \\
0 & 0 & \lambda
\end{pmatrix}\right]\vec{x}&=\vec{0} \\
\begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix} &= \vec{0}
\end{align}
$$


# Tags

![3b1b Eigenvektoren](https://www.youtube.com/watch?v=PFDu9oVAE-g)