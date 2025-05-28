---
tags: 
aliases: []
keywords: 
subject:
  - VL
  - Mathematik 3
  - Regelungstechnik
semester: WS24
created: 26th May 2025
professor: 
release: false
title: Autonomes DGL-System
---

# Autonomes DGL-System

> [!def] **D)** Autonomes DGL-System
> 
> $$\dot{x}= \mathbf{A}\cdot x,\quad x(t_{0}) = x_{0}, \quad x \in\mathbb{R}^{m}, \quad \mathbf{A}\in \mathbb{R}^{m\times m}$$

> [!question] Erinnerung an das 2-Dimensionale System $m=1$:
$$ \dot{x}=a\cdot x \implies x(t)=c\cdot e^{a\cdot t} $$

Mit diesem Ansatz kommt man auch zu einer Lösung für $m>1$: Und zwar mit der [Matrix-Exponentialfunktion](Matrix-Exponentialfunktion.md#^EXPM). $a$ wird zur Matrix $\mathbf{A}$.

> [!success]- Gezeigt, dass $C\cdot e^{ \mathbf{A}t }$ eine Lösung ist:
> Sei $x(t) = e^{ t\mathbf{A} }\cdot C$, dann gilt
> 
> $$
> \begin{align}
> x'(t) &= \left( e^{ t \mathbf{A} } \cdot C \right)'= \left( \sum_{k=0}^{\infty} \frac{t^k \mathbf{A}^k}{k!}\right)' \cdot C = \left( \sum_{k=0}^{\infty} \frac{k \cdot t^{k-1} \mathbf{A}^k}{k!} \right) \cdot C \\
> &= \mathbf{A} \cdot \sum_{k=0}^{\infty} \frac{t^k \mathbf{A}^k}{k!} \cdot C = \mathbf{A} \cdot x(t)
> \end{align}
> $$
> 
> A wird herausgehoben und für $k-1$ wird ein indexshift durchgeführt. $e^{ \mathbf{A}t }C$ ist also die allgemeine Lösung von $\dot{x}=\mathbf{A}x$.

### Fundamentallösung

Für die [Fundamentalmatrix](Analysis/Fundamentalmatrix.md#^FUMA) $\mathbf{X(t)}$ bzw. der [Transitionsmatrix](Fundamentalmatrix.md#^TRSM) $\mathbf{\Phi}(t)$ ergibt sich.

$$\mathbf{X}(t) = e^{ \mathbf{A}t } \qquad \mathbf{\Phi}(t)=e^{ \mathbf{A}(t-t_{0}) }$$

Jedoch ist das Auswerten einer Unendlichenreihe unpraktisch.

> [!success] Lösung dazu ist es, die Koeffizienten-Matrix $\mathbf{A}$ in ihre Diagonalform, die **Jordan-Form** $\tilde{\mathbf{A}}$ zu Transformieren. [^1]
> 
> Wir suchen **Vektoren**, die dazumultipliziert werden können, um eine **endliche** Summe zu erhalten. Diese Vektoren sind im folgenden Eigenvektoren und Hauptvektoren. 


### Eigen und Hauptvektoren

> [!question] [Eigenvektor](../Algebra/Eigenvektor.md)

Durch erweiterung von $e^{tA}$ erhalten wir folgendes:

$$
e^{ tA } = e^{ \lambda t \mathbb{1} +t(A-\lambda \mathbb{1}) } = e^{ \lambda t \mathbb{1} } \cdot e^{ t(A-\lambda \mathbb{1}) } = e^{ \lambda t \mathbb{1} } \cdot \sum_{k=0}^{\infty}\frac{t^k}{k!} (A-\lambda \mathbb{1})^k
$$

> [!info] Zum Exponenten wird $+t\lambda \mathbb{1}-t\lambda \mathbb{1}$ hinzugerechnet.
> $e^{t\mathbf{A}}=e^{ t\mathbf{A}+t\lambda \mathbb{1}-t\lambda \mathbb{1} }=$

> [!important] Durch Umformung erhalten wir den bekannten Ausdruck $A-\lambda \mathbb{1}$ zu den [Eigenvektoren](../Algebra/Eigenvektor.md): 
> - Die Vektoren $v$ werden für den Lösungsansatz dazumultipliziert, um die Diagonale Form der Exponenzialmatrix zu erhalten.
> - Das ist möglich da ja gilt, dass die Linearkombination aller Lösungen wieer eine Lösung ist.  
> $$
> \begin{align}
> e^{ \lambda t \mathbb{1}} \cdot \sum_{k=0}^{\infty}\frac{t^k}{k!} (A-\lambda \mathbb{1})^k \cdot v = e^{ \lambda t\cdot \mathbb{1} } \cdot v 
> \end{align}
> $$
> Falls $v$ ein Eigenvektor ist, dann gilt $(A-\lambda \mathbb{1})\cdot v=0$. 


> [!success] Die Summe bricht nach $k=0$ ab da für die restlichen Glieder $(A-\lambda \mathbb{1})\cdot v=0$ gilt. 
> Es zählt nur der erste Summand da $0^{0}$ als $\mathbb{1}$ definiert ist.

> [!important] Um nun eine Fundamentalmatrix zu erhalten, müssen wir **genügend linear unabhängige Eigenvektoren** finden. 
> 
> Gibt es nicht genug linearunabhängige Eigenvektoren z.B. wenn es Eigenwerte mit einer algebraische Vielfachheit $>1$ gibt, sucht man bildet man zusätzliche Nebeneigenvektoren
> - [Hauptvektoren](../Algebra/Eigenvektor.md#Hauptvektoren)
> - [Jordannormalform](../Algebra/Jordannormalform.md)

### Asymptotische Stabilität

> [!question] Stabilität nach [Ljapunov](Ljapunov.md)

Im allgemeinen kann die Lösung (erste Zeile der Fundamentalmatrix) als Linearkombination der Größen

$$
t^k e^{ \alpha t} \cos(\omega t), \quad t^k e^{ \alpha t } \sin(\omega t), \quad \text{mit } 0 \leq k<n
$$

dargestellt werden.

Dabei sind die Eigenwerte der Matrix $\mathbf{A}$ in der Form $\lambda = \alpha+j\omega$.

Ersichtlich ist, dass die Lösung asymptotisch Stabil ist, wenn für alle Eigenwerte gilt, dass $\Re(\lambda) = \alpha<0$.

Eine Matrix mit der Eigenschaft, dass ihre Eigenwerte einen **negativen Realteil** besitzen, nennt man [Hurwitz-Matrix](Hurwitz-Matrix.md)


[^1]:  Eine Eigenschaft des Matrixexponential ist, dass für Diagonalmatrizen die Exponentialfunktion auf deren einzelne Elemete übertragen wird: [hier](Matrix-Exponentialfunktion.md#Spezialfall%20Exponent%20ist%20eine%20Diagonalmatrix) gezeigt.