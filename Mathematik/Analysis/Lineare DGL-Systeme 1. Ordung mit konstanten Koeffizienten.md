---
tags: 
aliases:
  - Hauptvektoren
  - Hauptvektor
keywords:
  - Hauptvektoren
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 30. Oktober 2024
professor:
---
 

# Lineare [DGL-Systeme](Analysis/DGL-System.md) 1. Ordnung mit konstantem Koeffizienten

> [!question]  Diese Ansätze dienen zur Lösung von LTI-Systemen. Diese haben die Form:
> $$\dot{x} = \mathbf{A}x(t) + \mathbf{B}u$$
> 

$$
\begin{aligned}
\dot{x}= \mathbf{A}\cdot x,\quad x(t_{0}), \quad x \in\mathbb{R}^{m}, \quad \mathbf{A}\in \mathbb{R}^{m\times m}
\end{aligned}
$$

$A$ ist nicht von $t$ Abhängig

## Homogene Lösung

> [!question] Erinnerung an das 2-Dimensionale System $m=1$:
$$ \dot{x}=a\cdot x \implies x(t)=c\cdot e^{a\cdot t} $$

Mit diesem Ansatz kommt man auch zu einer Lösung für $m>1$: Und zwar mit der [Matrix-Exponentialfunktion](Matrix-Exponentialfunktion.md#^EXPM). $a$ wird zur Matrix $\mathbf{A}$.

Sei $x(t) = e^{ t\mathbf{A} }\cdot C$, dann gilt

$$
\begin{align}
x'(t)&=\left( \sum_{k=0}^{\infty} \frac{t^k \mathbf{A}^k}{k!}\right)' \cdot C =\left( \sum_{k=0}^{\infty} \frac{k \cdot t^{k-1} \mathbf{A}^k}{k!} \right) \cdot C \\
&= \mathbf{A} \cdot \sum_{k=0}^{\infty} \frac{t^k \mathbf{A}^k}{k!} \cdot C = \mathbf{A} \cdot x(t)
\end{align}
$$

A wird herausgehoben und für $k-1$ wird ein indexshift durchgeführt. 

$e^{ \mathbf{A}t }C$ ist also die allgemeine Lösung von $\dot{x}=\mathbf{A}x$.

## Fundamentalmatrix

$$
\underbrace{ e^{(t-t_{0}) \mathbf{A} } }_{ \text{ Mit } t=t_{0} \text{ der Matrizant}}=\underbrace{ e^{ tA } }_{ \text{ Fundamentalmatrix } }\cdot \underbrace{e^{ -t_{0}A }}_{ \text{gehört zu } C }
$$

Die [Fundamentalmatrix](Analysis/Fundamentalmatrix.md) ist also $e^{ tA }$.

Der Matrizant ergibt sich mit $t_{0}$, da für das Matrixexponential gilt $e^{0}=\mathbb{1}$.

> [!question] Warum?
> $$ e^{0} = \sum_{k=0}^{\infty}\frac{0^k}{k!} = \mathbb{1} $$
> Da $0^{0}$ als $1$ definiert ist, ergibt sich $\mathbb{1}$ für $k=0$.
> 
> Alternative Begründung: $e^{0}=e^{A - A}=e^{A} \cdot e^{ -A }$
> Da für beliebeige Matrizen gilt $A \cdot A^{-1} = \mathbb{1}$, gilt das auch für das Matrix-Exponential.

> [!question] Nun haben wir eine explizite Formel für die Fundamentalmatrix. Können wir diese benutzen, um die tatsächliche Lösung anzugeben?

### Spezialfall: $B$ ist eine Diagonalmatrix



$$
B = \begin{pmatrix}
\lambda_{1} & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}
\end{pmatrix} \implies B^k = \begin{pmatrix}
\lambda_{1}^k & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}^k
\end{pmatrix}
$$

> [!hint] Dass der Exponent der Matrix auf die Einzelkomponenten übergeht Funktioniert nur für Diagonalmatrizen!

$$
e^{B} = \sum_{k=0}^{\infty}\frac{B^k}{k!} = \sum_{k=0}^{\infty}\frac{1}{k!}
\underbrace{ \begin{pmatrix} 
\lambda_{1}^k & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & \lambda_{m}^k
\end{pmatrix} }_{ \operatorname{diag}(\lambda_{1}^{k},\dots,\lambda_{m}^{k}) }
$$
Durch das hineinziehen der Summe in die Matrix, erhalten wir eine Diagonalmatrix mit den Exponentialfunktionen der Diagonalelemente. 

$$
e^{B} = \begin{pmatrix}
e^{ \lambda_{1} } & 0 & 0 \\
0 & \ddots & 0 \\
0 & 0 & e^{ \lambda_{m} }
\end{pmatrix}
$$

> [!important] Überlegungen zum Allgemeinen fall:
> Wir suchen **Vektoren**, die dazumultipliziert werden können um eine **endliche** Summe zu erhalten.
> Diese Vektoren sind im folgenden Eigenvektoren und Hauptvektoren

Man möchte A auf B Überführen. Dabei ist $B$ die Jordanform von $A$

### Eigen und Hauptvektoren

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
>
> Gibt es nicht genug linearunabhängige Eigenvektoren z.B. wenn es Eigenwerte mit einer algebraische Vielfachheit $>1$ gibt, sucht man bildet man die Hauptvektoren

#### Hauptvektoren und Jordanform

> [!def] **D2 - HPTV)** Ein Vektor $v \in \mathbb{C}^m, v \neq 0$, heißt Hauptvektor der Stufe $l \in \mathbb{N}$ zum Eigenwert $\lambda \in \sigma(A)$, wenn
> 
> $\left(A-\lambda I_m\right)^l v=0 \quad$ und $\quad\left(A-\lambda I_m\right)^p v \neq 0 \quad$ für alle $\quad p=1, \ldots, l-1$
> 
> Ein Hauptvektor der Stufe $l=1$ ist offensichtlich ein Eigenvektor.

Diese lassen sich mit der obigen Gleichung **rekursiv** ermitteln



### Prozedur zur ermittlung der Fundamentalmatrix

Man verfolgt die Prozedur:

1. Eigenwerte $\lambda$ von $A$ bestimmen
2. Eigenvektoren $v$ zu den Eigenwerten bestimmen