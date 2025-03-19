---
tags: 
aliases: 
keywords: 
subject:
  - Regelungstechnik
  - VL
semester: SS25
created: 14th March 2025
professor:
draft: true
title: Zustandstransformation
---
 

# Zustandstransformation

> [!question] [Zustandsgleichungen](Zustandsgleichungen.md)

Ein LTI-System wird durch die Zustandsgleichungen Beschrieben: 

![LTI-System](LTI-Systeme.md#^ZLTI)

Oft ist es Sinnvoll den Zustand des Systems zu Transformieren, z.B. um dessen [Ruhelage](../Mathematik/Analysis/Ljapunov.md) in den Ursprung zu setzen. Mit einer **Zustandstransformation** (auch Koordinatentransformation, Basistransformation oder Basiswechsel)

$$ \mathbf{x} = \mathbf{Tz} \iff \mathbf{\dot{x}} = \mathbf{T\dot{z}}  $$

erhält man durch einsetzten für $\mathbf{x}$ und $\dot{\mathbf{x}}$ das System mit dem **neuen Zustand** $\mathbf{z}$:

$$
\begin{align}
\mathbf{\dot{z}} &= \mathbf{T}^{-1}\mathbf{ATz}+\mathbf{T}^{-1} \mathbf{Bu},\quad \mathbf{z}(0) = \mathbf{z}_{0} \\
\mathbf{y} &= \mathbf{CTz} +\mathbf{Du}
\end{align}
$$

> [!warning] Vorrausgesetzt ist dabei die [Invertierbarkeit](../Mathematik/Algebra/Gauß-Jordan-Verfahren.md#^INVB) von $\mathbf{T}$

Dieses System ist wieder ein LTI-System der Form:

> [!satz] **S1 - ZTRF)** LTI-System des Transformierten Zustands: ^ZTRF
> 
> $$
> \begin{aligned}
> \dot{\mathbf{z}} &= \tilde{\mathbf{A}} \mathbf{z} + \tilde{\mathbf{B}}\mathbf{u}, \quad \mathbf{z}(0) = \mathbf{z}_{0} \\
> \mathbf{y} &= \tilde{\mathbf{C}} \mathbf{z} + \tilde{\mathbf{D}}\mathbf{u}
> \end{aligned}
> \qquad \text{mit} \qquad
> \begin{aligned}
> \tilde{\mathbf{A}} &= \mathbf{T}^{-1} \mathbf{AT} \\
> \tilde{\mathbf{B}} &= \mathbf{T}^{-1} \mathbf{B}\\
> \tilde{\mathbf{C}} &= \mathbf{CT}\\
> \tilde{\mathbf{D}} &= \mathbf{D}\\
> \end{aligned}
> $$

## Lösung der Zustandsgleichung

Die Lösung durch [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md) des Transformierten LTI-Systems ist:

$$
\mathbf{z}(t;\mathbf{z}_{0}) = \mathbf{\tilde{\Phi}}(t)\mathbf{z}_{0} + \int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\tilde{\mathbf{B}}\mathbf{u}\mathrm{~d}\tau
$$

Dabei ist $\mathbf{\tilde{\Phi}}(t)$ die [Transitionsmatrix](../Mathematik/Analysis/Fundamentalmatrix.md#^TRSM) des Zustands. Aus [ZTRF](#^ZTRF) erhält man für den Ursprünglichen Zustandsvektor $\mathbf{x}$

$$
\mathbf{x}(t;\mathbf{z}_{0}) = \mathbf{Tz}(t) = \mathbf{T\tilde{\Phi}}(t)\mathbf{z}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\mathbf{\tilde{B}u}\mathrm{~d}\tau
$$
und somit
$$
\mathbf{x}(t;\mathbf{x_{0}}) =\mathbf{T\tilde{\Phi}}(t)\mathbf{T}^{-1}\mathbf{x}_{0} + \mathbf{T}\int_{0}^{t}\mathbf{\tilde{\Phi}}(t-\tau)\mathbf{T}^{-1}\mathbf{Bu}\mathrm{~d}\tau
$$

Daraus lässt sich der Zusammenhang 

## Jordannormalform

Wir nehmen nicht irgendeine Matrix $\mathbf{T}$, sondern eine **Basis aus Hauptvektoren** $\mathbf{V}$. Es stellt sich heraus, dass für den neuen Zustandsraum von $\mathbf{z}$, die Koeffizientenmatrix $\mathbf{\tilde{A}}$ eine [Diagonalmatrix](../Mathematik/Algebra/Diagonalmatrix.md) ist. Das DGL-System wird zu einem **entkoppelten DGL-System**. Die [Fundamentalmatrix](../Mathematik/Analysis/Fundamentalmatrix.md) ist dann leicht lösbar [^1]

> [!important] Hier sind Wichtigen Kenngrößen der Eigenwerte:
> - $k_{\lambda}$ ... Algebraische Vielfachheit
> - $m_{\lambda}$ ... Geometrischen Vielfachheit

**Fälle:** Nullstellen des charakteristischen Polynoms können:

- Einfach $k_{\lambda}=1$, Mehrfach mit $k_{\lambda}=m_{\lambda} > 1$,
- Mehrfach mit $k_{\lambda}>1, k_{\lambda}\neq m_{\lambda}$
- konjugiert komplexe Eigenwerte.
- Mehrfache konjugiert komplexe Eigenwerte. (kompliziert)

### Fall 1: Nur Eigenvektoren

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

### Fall 2: Hauptvektoren

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

### Fall 3: Konjugiert komplexe Eigenwerte

---

# Tags

- [Koordinatenmatrix](../Mathematik/Algebra/Koordinatenmatrix.md)

[^1]: [Spezialfall: Exponent ist eine Diagonalmatrix](../Mathematik/Analysis/Matrix-Exponentialfunktion.md#Spezialfall%20Exponent%20ist%20eine%20Diagonalmatrix)