---
tags:
aliases:
  - Nabla
keywords:
subject:
  - VL
  - Mathematik 2
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 15th January 2026
professor:
  - Andreas Neubauer
def:
  - NABL
satz:
  - NABR
release: true
title: Nabla Operator
---
 
# Nabla Operator


> [!def] **D1 - NABL)** Nabla Operator
> Sei $x = (x_{1}, \dots, x_n) \in \mathbb{R}^{n}$. Der Nabla Operator ($\nabla$) ist alleinstehend folgendermaßend definiert
> $$
> \nabla:= \left(\begin{array}{c} \frac{\partial}{\partial x_{1}} \\ \vdots \\ \frac{\partial}{\partial x_{n}} \end{array}\right)
> $$
> 
> Wird nicht nach allen Größen differenziert, zum Beispiel wenn gilt, dass $f(\mathbf{x},t)$, wird ein Subskript eingeführt:
> $$
> \nabla_{\mathbf{x}}f= \left(\begin{array}{c} \frac{\partial f}{\partial x_{1}} \\ \vdots \\ \frac{\partial f}{\partial x_{n-1}} \\ \frac{\partial f}{\partial x_{n}} \end{array}\right) \quad\text{ \small{im Gegensatz zu }}\quad  \nabla f= \left(\begin{array}{c} \frac{\partial f}{\partial x_{1}} \\ \vdots \\ \frac{\partial f}{\partial x_{n}}\\ \frac{\partial f}{\partial t} \end{array}\right)
> $$


Im oft gebräuchlichen kartesischen Koordinatensystem $\mathbb{R}^{3}$ Lässt sich der Nabla Operator Schreiben wie:

$$
\nabla = \left(\begin{array}{c}
\frac{\partial}{\partial x} \\
\frac{\partial}{\partial y} \\
\frac{\partial}{\partial z}
\end{array}\right) = \frac{\partial}{\partial x} \mathbf{e}_x+\frac{\partial}{\partial y} \mathbf{e}_y+\frac{\partial}{\partial z} \mathbf{e}_z
$$

wobei $\mathbf{e}_{x, y, z}$ die Einheitsvektoren in $x, y, z$-Richtungen sind (manchmal auch $\hat{\imath}, \hat{\jmath}, \hat{k}$ genannt).
   
> [!hint] Der Nabla-Operator lässt sich sowohl auf
> - partiell differenzierbare **Skalarfelder** ($f:A\to \mathbb{R}$)
> - als auch auf partiell differenzierbare **Vektorfelder** ($f:A \to \mathbb{R}^{n}, n \in\mathbb{N}$)
> 
> anwenden

Der Nabla-Operator ist Operator und [Vektor](../../Algebra/Vektor.md) in einem, d.h. mit inm lässt sich wie mit einem Vektor rechnen, d.h. es gelten die Verknüpfungen wie [Skalarprodukt](../../Algebra/Skalarprodukt.md) und [Kreuzprodukt](../../Algebra/Kreuzprodukt.md)

> [!important] Verschiedene Vektorielle Verknüpfungen des Nabla Operators mit dem [index](index.md) $\mathbf{F}$ haben spezielle Namen:
> - [Gradient](Gradient.md): $\mathrm{grad} \,\mathbf{F} = \nabla \mathbf{F}$
> - [Divergenz](Divergenz.md): $\mathrm{div}\, \mathbf{F} = \nabla \cdot\mathbf{F}$
> - [Rotation](Rotor.md): $\mathrm{rot}\, \mathbf{F} = \nabla \times \mathbf{F}$

## Allgemeine Rechenregeln

Rechenregeln für den Nabla-Operator lassen sich formal aus den Rechenregeln für Skalarund Kreuzprodukt zusammen mit den Ableitungsregeln herleiten.
Dabei muss man die Produktregel anwenden, wenn der Nabla-Operator links von einem Produkt steht.

> [!satz] **S1 - NABR)** Rechenreglen mit dem Nabla-Operator ^NABR
> Sind $\psi$ und $\varphi$ differenzierbare Skalarfelder (Funktionen) und $\boldsymbol{A}$ sowie $\boldsymbol{B}$ differenzierbare Vektorfelder, so gilt:
> 

| Nr     | **Regel**                                                                                                                                                                                                                                                 | **Anmerkung**                                                                            |
| ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| (i)    | $\nabla \varphi(\psi) = \frac{\mathrm{d} \varphi}{\mathrm{d} \psi} \nabla \psi$                                                                                                                                                                           | Kettenregel für Gradient                                                                 |
| (ii)   | $\nabla(\psi \varphi) = \psi \nabla \varphi + \varphi \nabla \psi$                                                                                                                                                                                        | Produktregel für Gradient                                                                |
| (iii)  | $\nabla(\boldsymbol{A} \cdot \boldsymbol{B}) = (\boldsymbol{A} \cdot \nabla) \boldsymbol{B} + (\boldsymbol{B} \cdot \nabla) \boldsymbol{A} + \boldsymbol{A} \times (\nabla \times \boldsymbol{B}) + \boldsymbol{B} \times (\nabla \times \boldsymbol{A})$ | Produktregel für das Skalarprodukt zweier Vektorfelder                                   |
| (iv)   | $\nabla \cdot (\varphi \boldsymbol{A}) = \varphi \nabla \cdot \boldsymbol{A} + \boldsymbol{A} \cdot \nabla \varphi$                                                                                                                                       | Produktregel für die Divergenz                                                           |
| (v)    | $\nabla \cdot (\boldsymbol{A} \times \boldsymbol{B}) = \boldsymbol{B} \cdot (\nabla \times \boldsymbol{A}) - \boldsymbol{A} \cdot (\nabla \times \boldsymbol{B})$                                                                                         | Divergenz des Kreuzprodukts                                                              |
| (vi)   | $\nabla \cdot (\nabla \varphi) = \Delta \varphi$                                                                                                                                                                                                          | Divergenz des Gradienten ([Laplace Operator](Laplace%20Operator.md))                     |
| (vii)  | $\nabla \cdot (\nabla \times \boldsymbol{A}) = 0$                                                                                                                                                                                                         | Divergenz des Rotationsoperators                                                         |
| (viii) | $\nabla \times (\nabla \varphi) = 0$                                                                                                                                                                                                                      | Rotation des Gradienten                                                                  |
| (ix)   | $\nabla \times (\varphi \boldsymbol{A}) = \varphi \nabla \times \boldsymbol{A} - \boldsymbol{A} \times \nabla \varphi$                                                                                                                                    | Rotation eines Produkts mit Skalarfeld                                                   |
| (x)    | $\nabla \times (\boldsymbol{A} \times \boldsymbol{B}) = (\boldsymbol{B} \cdot \nabla) \boldsymbol{A} - \boldsymbol{B} (\nabla \cdot \boldsymbol{A}) + \boldsymbol{A} (\nabla \cdot \boldsymbol{B}) - (\boldsymbol{A} \cdot \nabla) \boldsymbol{B}$        | Rotation des Kreuzprodukts                                                               |
| (xi)   | $\nabla \times (\nabla \times \boldsymbol{A}) = \nabla (\nabla \cdot \boldsymbol{A}) - \Delta \boldsymbol{A}$                                                                                                                                             | Rotation des Rotationsoperators ($\Delta$ vektorieller [Laplace Operator](Laplace%20Operator.md)) |
^T1

Zu (xi): Rotor des Rotors $\iff$ Gradient der Divergenz $-$ Divergenz des Gradienten

---

- [[Laplace Operator]]