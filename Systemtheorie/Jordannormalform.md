# Jordannormalform

> [!question] Ausgangspunkt ist hier ein System $\mathbf{\dot{x}}=\mathbf{Ax}$, zu dem man ein Fundamentalsystem sucht.

Für ein lineares System kann auf dessen lineare Abbildung ein beliebeiger Basiswechsel bzw. Zustandstransformation vorgenommen werden



Wir nehmen nicht irgendeine Matrix $\mathbf{T}$, sondern eine **Basis aus Hauptvektoren** $\mathbf{V}$. Es stellt sich heraus, dass für den neuen Zustandsraum von $\mathbf{z}$, die Koeffizientenmatrix $\mathbf{\tilde{A}}$ eine [Diagonalmatrix](../Mathematik/Algebra/Diagonalmatrix.md) ist. Das DGL-System wird zu einem **entkoppelten DGL-System**. Die [Fundamentalmatrix](../Mathematik/Analysis/Fundamentalmatrix.md) ist dann leicht lösbar [^1]
 
Die neue Matrix $\mathbf{\tilde{A}}$ ist dann in der **Jordannormalform**:

$$
\mathbf{\tilde{A}} = \begin{pmatrix}
J_{1} & 0 & \dots & 0 \\
0 & J_{2} & \dots & 0 \\
\vdots & \vdots & \ddots & \vdots \\
0 & 0 & \dots & J_{l}
\end{pmatrix}
$$

Dabei werden $J$ als die Jordanblöcke bezeichnet

> [!important] Hier sind Wichtigen Kenngrößen der Eigenwerte:
> - $k_{\lambda}$ ... Algebraische Vielfachheit
> - $m_{\lambda}$ ... Geometrischen Vielfachheit

**Fälle:** Nullstellen des charakteristischen Polynoms können:

- Einfach $k_{\lambda}=1$, Mehrfach mit $k_{\lambda}=m_{\lambda} > 1$,
- Mehrfach mit $k_{\lambda}>1, k_{\lambda}\neq m_{\lambda}$
- konjugiert komplexe Eigenwerte.
- Mehrfache konjugiert komplexe Eigenwerte. (kompliziert)

## Fall 1: Eigenvektoren

Die Hauptvektoren sind für den Allgemeinen Fall die Eigenvektoren. Kommen mehere Eigenvektoren vor $k_{\lambda}>1$ kann ebenfalls diese Vorhergehensweise gewählt werden, wenn für diesen Eigenwert trotzdem genügend Eigenvektoren hervorgehen.

Durch die Eigenwertgleichung ergibt sich:

$$
\begin{align}
\mathbf{Av}_{1} &= \lambda_{1}\mathbf{v}_{1} \\
\mathbf{Av}_{2} &= \lambda_{2}\mathbf{v}_{2} \\
&\vdots \\
\mathbf{Av}_{n} &= \lambda_{n}\mathbf{v}_{n}
\end{align} \iff \mathbf{A} \left( \mathbf{v}_{1},\mathbf{v}_{2}, \cdots \mathbf{v}_{n} \right) = \left( \mathbf{v}_{1},\mathbf{v}_{2}, \cdots \mathbf{v}_{n} \right)  \underbrace{ \begin{pmatrix}
\lambda_{1} & 0 & \cdots & 0 \\
0 & \lambda_{2} & \ddots & 0 \\
\vdots & \ddots & \ddots & 0 \\
0 & 0 & 0 & \lambda_{n}
\end{pmatrix} }_{ \mathbf{\tilde{A}} }
$$


Fasst man die Eigenvektoren $\mathbf{v}$ zur matrix $\mathbf{V} = \begin{pmatrix}\mathbf{v}_{1} & \mathbf{v}_{2} & \cdots & \mathbf{v}_{n}\end{pmatrix}$

$$
\mathbf{AV} = \mathbf{V \tilde{A}} \to \mathbf{\tilde{A}} = \mathbf{V}^{-1}\mathbf{AV}
$$



Für die Fundamentalmatrix gilt $\mathbf{\Phi}(t)=e^{ \mathbf{\tilde{A}}t} \implies$

$$
\tilde{\mathbf{\Phi}}(t) = \begin{pmatrix}
e^{ \lambda_{1}t } & 0 & \cdots & 0 \\
0 & e^{ \lambda_{2}t } & \cdots & 0 \\
\vdots & \ddots & \ddots & 0 \\
0 & 0 & \cdots & e^{ \lambda_{n}t }
\end{pmatrix}
$$

## Fall 2: Hauptvektoren

Obiges gilt nur, wenn die geometrische Vielfachheit $m_{\lambda}$ für diese Eigenwerte gleich der Algebraischen Ist, da mann nur dann genügend Eigenvektoren hat um eine Basis zu erzeugen.

Findet man nicht genügend EV muss mann weitere linear unabhängige Vektoren finden, genannt **Hauptvektoren**

$$
\tilde{\mathbf{\Phi}} (t) = e^{ \lambda t } \begin{pmatrix}
1 & t & \frac{t^{2}}{2!}  & \cdots & \frac{t^{n-1}}{(n-1)!} \\
0 & 1 & t & \cdots & \frac{t^{n-2}}{(n-2)!} \\
\vdots & \vdots & \ddots & \ddots & \vdots \\
0 & 0 & \cdots & 1 & t \\
0 & 0 & \cdots & 0 & 1
\end{pmatrix}
$$

## Fall 3: Konjugiert komplexe Eigenwerte

---

[^1]: [Spezialfall: Exponent ist eine Diagonalmatrix](../Mathematik/Analysis/Matrix-Exponentialfunktion.md#Spezialfall%20Exponent%20ist%20eine%20Diagonalmatrix)