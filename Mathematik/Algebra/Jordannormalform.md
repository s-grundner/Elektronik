---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 20th March 2025
professor:
  - Markus Schöberl
release: false
title: Jordannormalform
---
 

# Jordannormalform

> [!question] Ausgangspunkt ist hier ein System $\mathbf{\dot{x}}=\mathbf{Ax}$, zu dem man ein Fundamentalsystem sucht.

Für ein lineares System kann auf dessen lineare Abbildung ein beliebeiger Basiswechsel bzw. Zustandstransformation vorgenommen werden

![](../../Systemtheorie/Zustandstransformation.md#^TRF)

> [!success] Wir nehmen hier jedoch nicht irgendeine Matrix $\mathbf{T}$, sondern eine **Basis aus Hauptvektoren** $\mathbf{V}$.
> Es stellt sich heraus, dass für den neuen Zustandsraum von $\mathbf{z}$, die Koeffizientenmatrix $\mathbf{\tilde{A}}$ eine [Diagonalmatrix](Diagonalmatrix.md) ist. Das DGL-System wird zu einem **entkoppelten DGL-System**. Die [Fundamentalmatrix](../Analysis/Fundamentalmatrix.md) ist dann leicht zu bestimmen [^1]

Im allgemeinen besteht $\mathbf{V}$ aus allen Hauptvektoren. Diese sind ein Überbegriff für alle reell und komplexwertigen Eigenvektoren und Nebeneigenvektoren, 

Die neue Matrix $\mathbf{\tilde{A}}$ ist dann in der **Jordannormalform** der Ursprünglichen Abbildung $\mathbf{A}$

$$

$$
$$
\mathbf{\tilde{A}} = \mathbf{V}^{-1}\mathbf{AV} =\begin{pmatrix}
\mathbf{J}_{1} & \mathbf{0} & \dots & \mathbf{0} \\
\mathbf{0} & \mathbf{J}_{2} & \dots & \mathbf{0} \\
\vdots & \vdots & \ddots & \vdots \\
\mathbf{0} & \mathbf{0} & \dots & \mathbf{J}_{l}
\end{pmatrix}
$$

Dabei werden $\mathbf{J}$ als die **Jordanblöcke** bezeichnet. Diese Unterscheiden sich je nach Vielfachheit der Eigenwerte von $\mathbf{A}$ und ob diese reell oder konjugiert komplex sind. Mit ihnen lassen sich zugehörige Teiltransitionsmatrizen einfach bestimmen.

> [!important] Hier sind Wichtigen Kenngrößen der Eigenwerte $\lambda$ von $\mathbf{A}$:
> - $k_{\lambda}$ ... Algebraische Vielfachheit
> - $m_{\lambda}$ ... Geometrischen Vielfachheit

**Fälle:** Nullstellen des charakteristischen Polynoms können:

1. Einfach $k_{\lambda}=1$, Mehrfach mit $k_{\lambda}=m_{\lambda} > 1$,
2. Mehrfach mit $k_{\lambda}>1, k_{\lambda}\neq m_{\lambda}$
3. konjugiert komplexe Eigenwerte.
4. Mehrfache konjugiert komplexe Eigenwerte. (kompliziert)

## Fall 1: Eigenvektoren

> [!tldr] Jordanblöcke haben die Form
> $$\mathbf{J} = (\lambda)$$ 

Die Hauptvektoren sind für den Allgemeinen Fall die Eigenvektoren. Kommen mehere Eigenvektoren vor $k_{\lambda}>1$ kann ebenfalls diese Vorhergehensweise gewählt werden, wenn für diesen Eigenwert trotzdem genügend Eigenvektoren hervorgehen *(es gibt $\dim\mathbf{A}$ Eigenvektoren)*

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

## Fall 2: Nebeneigenvektoren

> [!tldr] Jordanblöcke haben die Form:
>  $$
> \mathbf{J} = \begin{pmatrix}
> \lambda & 1 & 0 & \cdots & 0 \\
> 0 & \lambda & 1 & \cdots & 0 \\
> \vdots & \vdots & \ddots & \ddots & \vdots \\
> 0 & 0 & \cdots & \lambda & 1 \\
> 0 & 0 & \cdots & 0 & \lambda
> \end{pmatrix}
> $$
> Die Ordnung des Jordanblocks entspricht der algebraischen Vielfachheit des Eigenwertes $\lambda$

Fall 1 gilt nur, wenn die geometrische Vielfachheit $m_{\lambda}$ für diese Eigenwerte gleich der Algebraischen Ist, da mann nur dann genügend Eigenvektoren hat um eine Basis zu erzeugen.

Findet man nicht genügend EV muss mann weitere linear unabhängige Vektoren finden, genannt **Nebeneigenvektor**.

Die zu $\mathbf{\tilde{A}} = \mathbf{J}$ zugehörige Transitionsmatrix lautet:

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

[^1]: [Spezialfall: Exponent ist eine Diagonalmatrix](../Analysis/Matrix-Exponentialfunktion.md#Spezialfall%20Exponent%20ist%20eine%20Diagonalmatrix)