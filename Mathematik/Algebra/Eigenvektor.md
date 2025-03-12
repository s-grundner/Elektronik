---
tags: 
aliases:
  - Eigenwert
  - Eigenwerte
  - Eigen
  - Eigenraum
  - charakteristisches Polynom
keywords: 
subject:
  - Mathematik 1
semester: WS23
created: 24. Januar 2024
professor: 
def:
  - EIGV
---
 

# Eigenwerte, Eigenvektoren

> [!quote]  Eigenwerte und Eigenvektoren sind wichtige Kenngrößen, die viel über das Verhalten einer [linearen Abbildung](Algebra/Lineare%20Abbildungen.md) aussagen.  

Eigenvektoren ($v$) sind [Vektoren](../Algebra/Vektor.md), die unter der [linearen Abbildung](../Algebra/Lineare%20Abbildungen.md) $A$ ihre Richtung nicht ändern, sondern allenfalls skaliert werden;  diesen Skalierungsfaktor nennt man *Eigenwert* $\lambda$:

$$Av = \lambda v$$

|            $A$            |         $v$         |     $\lambda$     |
| :-----------------------: | :-----------------: | :---------------: |
| Lineare Abbildung: Matrix | Eigenvektor: Vektor | Eigenwert: Skalar |

> [!def] **D1 - EIGV)** Ein Vektor $v\neq 0 \in \mathbb{C}^{m}$ heißt **Eigenvektor** der linearen Abbildung  $A$ zum **Eigenwert** $\lambda$,
> falls $(A-\lambda \mathbb{1})\cdot v=0$ ist.
> 
> - Eigenvektoren zu verschiedenen Eigenwerten sind linear unabhängig.
> - Die [Determinante](../Algebra/Determinante.md) ist das Produkt aller Eigenwerte: $\det A = \prod^{n}_{i=1}\lambda_{i}$
> - Ist $\det A=0$, so ist *mindestens* ein Eigenwert 0.

> [!def] **D2 - CHAP)** Charakteristisches Polynom
> Eigenwerte sind nun alle $\lambda \in\mathbb{C}$, für die $\det(A-\lambda \mathbb{1})=0$ ist. Das Charakteristische Polynom zur Linearen Abbildung $A$ ist definiert wie:
> $$p_{A}(\lambda) := \det(A-\lambda \mathbb{1})$$
> 

Die Eigenwerte sind also Nullstellen des charateristischen Polynoms. Warum? Es gibt nur dann Eigenvektoren ungleich null, wenn die Matrix $A-\lambda \mathbb{1}$ **nicht vollen rang** hat also wenn die determinante null ist. Wir Suchen daher eigenwerte sodass diese Bedingung erfüllt ist.

Äquivalente Aussagen für $A-\lambda \mathbb{1}$ sind:
- hat nicht vollen Rang
- Determinante = 0
- Das System ist nicht linear Unabhängig

## Eigenraum

der Eigenraum für einen bestimmten Eigenvektor ist die Menge dieser Eigenvektoren bzw. deren [Koordinatenmatrix](Algebra/Koordinatenmatrix.md) / Erzeugenensystem. Der Eigenraum kann je nach Anzahl der Freiwählbaren Parameter mehrere Dimensionen haben,

---

> [!quote] Anwendungen  
> Sie spielen in vielen mathematischen Anwendungen
> - Hauptkomponentenanalyse in der Statistik
> - Spektraltheorie, etc.
>
> sowie in physikalischen Problemstellungen
> - Eigenfrequenzen eines schwingungsfähigen Systems
> - Hauptträgheitsrichtungen eines starren Körpers, etc.
> 
> eine große Rolle.

---

# Beispiele

## Reelle Eigenwerte

$$
A= \begin{pmatrix}
7 & -2 & 1\\
-2 & 1 & -2 \\
1 & -2 & 7
\end{pmatrix}
$$

> [!hint] Alle [Vektoren](../Algebra/Vektor.md) $\vec{x}$ die unter der [linearen Abbildung](Algebra/Lineare%20Abbildungen.md) $Lx = A^{L}\vec{x}$ nur *skaliert* werden. (Der gleiche [Vektor](../Algebra/Vektor.md) mit einer Anderen länge)  
>
> $$A\vec{x}=\lambda \vec{x}$$

Die Gleichung beinhaltet nun auf der einen Seite eine [Matrix](Matrix.md) multipliziert mit einem [Vektor](../Algebra/Vektor.md) und auf der anderen ein Skalar multipliziert mit einem [Vektor](../Algebra/Vektor.md).

Um aus der Gleichung eine reine Matrizengleichung zu erhalten lässt sich das Skalar auch mit der [Einheitsmatrix](Einheitsmatrix.md) anschreiben:

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

Eigenvektoren sind also alle [Vektoren](../Algebra/Vektor.md) $\vec{x}$ mit den dazugehörigen Eigenwerten $\lambda$, die diese Gleichung erfüllen.

### Charakteristisches [Polynom](Polynom.md)

> [!important] Die Eigenwerte werden durch [Nullstellen](Nullstelle.md) im charakteristischen [Polynom](Polynom.md) berechnet. 

Die [Determinante](Determinante.md) für muss für $A-\lambda \cdot I$ gleich null sein:

$$
\begin{align}
&\det \begin{pmatrix}
7 -\lambda & -2 & 1\\
-2 & 1-\lambda & -2 \\
1 & -2 & 7-\lambda
\end{pmatrix} = 0 \\ \\

0&= (7-\lambda)(1-\lambda)(7-\lambda) + (-2)(-2)\cdot 2 \\
&- (1-\lambda)- (-2)(-2)(7- \lambda)\cdot 2 \\
\end{align}
$$

Die Gleichung wird nun zu einem [Polynom](Polynom.md) aufgelöst:

> [!success] charakteristisches [Polynom](Polynom.md)  
>
> $$-\lambda^{3}+15\lambda^{2}-54\lambda= 0$$
>
> Die [Nullstellen](Nullstelle.md), also die *Eigenwerte*, dieses Polynoms sind:  
>
> $$\lambda_{1} = 0 \qquad \lambda_{2} = 6 \qquad \lambda_{3} = 9$$

### Eigenvektoren

Um nun die *Eigenvektoren* auszurechnen müssen lediglich die *Eigenwerte* in das [LGS](Lineare%20Gleichungssysteme.md) eingesetzt und gelöst werden.

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

Mit dem Eliminieren der linearen Abhängigkeiten kann nun das [LGS](Lineare%20Gleichungssysteme.md) gelöst werden. Pro [Lineare Abhängigkeit](Algebra/Lineare%20Abhängigkeit.md) kann ein Parameter frei gewählt werden:

$$
0x_{1}+0x_{2}+0x_{3} = 0 \to x_{3} = s, s\in \mathbb{R}
$$

$s$ ist ein für $x_{3}$ frei gewählter Parameter.

$$0x_{1}-6x_{2}+3s =0\to x_{2} = \frac{s}{2}$$

$$
-2x_{1} -2\cdot \frac{s}{2}+1\cdot s = 0 \to x_{1} = 0
$$

Mit der Lösung des [LGS](Lineare%20Gleichungssysteme.md) ergibt sich der Eigenvektor für $\lambda_{3} = 9$ als folgender:

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

der Eigenraum für diesen Eigenvektor ist die Menge dieser Eigenvektoren bzw. deren [Koordinatenmatrix](Algebra/Koordinatenmatrix.md) / Erzeugenensystem. Der Eigenraum kann je nach Anzahl der Freiwählbaren Parameter mehrere Dimensionen haben, in diesem Fall jedoch nur eine.

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