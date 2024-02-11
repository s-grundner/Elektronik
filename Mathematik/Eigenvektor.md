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

## Reelle Eigenwerte

$$
A= \begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix}
$$

> [!hint] Alle [Vektoren](mathe%20(3)/Vektor.md) $\vec{x}$ die unter der [linearen Abbildung](Lineare%20Abbildungen.md) $Lx = A^{L}\vec{x}$ nur *skaliert* werden. (Der gleiche [Vektor](mathe%20(3)/Vektor.md) mit einer Anderen länge)  
>
> $$A\vec{x}=\lambda \vec{x}$$

Die Gleichung beinhaltet nun auf der einen Seite eine [Matrix](mathe%20(4)/Matrix.md) multipliziert mit einem [Vektor](mathe%20(3)/Vektor.md) und auf der anderen ein Skalar multipliziert mit einem [Vektor](mathe%20(3)/Vektor.md).

Um aus der Gleichung eine reine Matrizengleichung zu erhalten lässt sich das Skalar auch mit der [Einheitsmatrix](mathe%20(4)/Einheitsmatrix.md) anschreiben:

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
A\vec{x}-(\lambda \cdot I)\cdot\vec{x} &= \vec{0} \\
(A-\lambda \cdot I)\cdot\vec{x} &= \vec{0} \quad \text{Assotziativgesetz}\\

\left[\begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix} - \begin{pmatrix}
\lambda & 0 & 0 \\
0 & \lambda & 0 \\
0 & 0 & \lambda
\end{pmatrix}\right]\cdot\vec{x}&=\vec{0} \\

\begin{pmatrix}
7 -\lambda & -2 & 1\\
-2 & 1-\lambda & -2 \\
1 & -2 & 7-\lambda
\end{pmatrix}\cdot \vec{x}&= \vec{0}
\end{align}
$$

Eigenvektoren sind also alle [Vektoren](mathe%20(3)/Vektor.md) $\vec{x}$ mit den dazugehörigen Eigenwerten $\lambda$, die diese Gleichung erfüllen.

### Charakteristisches [Polynom](mathe%20(3)/Polynom.md)

> [!important] Die Eigenwerte werden durch [Nullstellen](mathe%20(3)/Nullstelle.md) im charakteristischen [Polynom](mathe%20(3)/Polynom.md) berechnet. 

Die [Determinante](mathe%20(4)/Determinante.md) für muss für $A-\lambda \cdot I$ gleich null sein:

$$
\begin{align}
&\det \begin{pmatrix}
7 -\lambda & -2 & 1\\
-2 & 1-\lambda & -2 \\
1 & -2 & 7-\lambda
\end{pmatrix} = 0 \\ \\

0&= (7-\lambda)(7-\lambda)(7-\lambda) + (-2)(-2)\cdot 2 \\
&- (1-\lambda)- (-2)(-2)(7- \lambda)\cdot 2 \\
\end{align}
$$

Die Gleichung wird nun zu einem [Polynom](mathe%20(3)/Polynom.md) aufgelöst:

> [!success] charakteristisches [Polynom](mathe%20(3)/Polynom.md)  
>
> $$-\lambda^{3}+15\lambda^{2}-54\lambda= 0$$
>
> Die [Nullstellen](mathe%20(3)/Nullstelle.md), also die *Eigenwerte*, dieses Polynoms sind:  
>
> $$\lambda_{1} = 0 \qquad \lambda_{2} = 6 \qquad \lambda_{3} = 9$$

### Eigenvektoren

Um nun die *Eigenvektoren* auszurechnen müssen lediglich die *Eigenwerte* in das [LGS](mathe%20(3)/Lineare%20Gleichungssysteme.md) eingesetzt und gelöst werden.

$\lambda_{3}$:

$$
\begin{align}
\left[\begin{array}{ccc|c}
-2 & -2 & 1 & 0 \\
-2 & -8 & -2 & 0 \\
1 & -2 & -2 & 0
\end{array}\right] &\to
\left[\begin{array}{ccc|c}
-2 & -2 & 1 & 0 \\
-2 & -8 & -2 & 0 \\
2 & -4 & -4 & 0
\end{array}\right]
\begin{aligned}
\\
S_{2}'=S_{2}-S_{1}\\
S_{3}'=S_{3}+S_{1}
\end{aligned}
\\
\left[\begin{array}{ccc|c}
-2 & -2 & 1 & 0 \\
0 & -6 & -3 & 0 \\
0 & -6 & -3 & 0
\end{array}\right] &\to
\left[\begin{array}{ccc|c}
-2 & -2 & 1 & 0 \\
0 & -6 & 3 & 0 \\
0 & 0 & 0 & 0
\end{array}\right]
\end{align}
$$

Mit dem Eliminieren der linearen Abhängigkeiten kann nun das [LGS](mathe%20(3)/Lineare%20Gleichungssysteme.md) gelöst werden. Pro Lineare Abhängigkeit kann ein Parameter frei gewählt werden:

$$
0x_{1}+0x_{2}+0x_{3} = 0 \to x_{3} = s, s\in \mathbb{R}
$$

$s$ ist ein für $x_{3}$ frei gewählter Parameter.

$$0x_{1}-6x_{2}+3s =0\to x_{2} = \frac{s}{2}$$

$$
-2x_{1} -2\cdot \frac{s}{2}+1\cdot s = 0 \to x_{1} = 0
$$

Mit der Lösung des [LGS](mathe%20(3)/Lineare%20Gleichungssysteme.md) ergibt sich der Eigenvektor für $\lambda_{3} = 9$ als folgender:

$$
x_{\lambda_{3}}=s\cdot \begin{pmatrix}
0 \\
\frac{1}{2} \\
1
\end{pmatrix} = s\cdot \begin{pmatrix}
0 \\
1 \\
2
\end{pmatrix}, s\in \mathbb{R}
$$

der Eigenraum für diesen Eigenvektor ist die Menge dieser Eigenvektoren bzw. deren [Lineare Hülle](mathe%20(4)/Lineare%20Hülle.md) / Erzeugenensystem. Der Eigenraum kann je nach Anzahl der Freiwählbaren Parameter mehrere Dimensionen haben, in diesem Fall jedoch nur eine.

$$
\begin{align}
E_{\lambda_{3}} &= \left\{s\cdot \begin{pmatrix}
0 \\ 1 \\ 2 \end{pmatrix}, s \in \mathbb{R}\right\} \\
&= lin \begin{pmatrix}
0 \\ 1 \\ 2
\end{pmatrix}
\end{align}
$$

# Tags

![3b1b Eigenvektoren](https://www.youtube.com/watch?v=PFDu9oVAE-g)