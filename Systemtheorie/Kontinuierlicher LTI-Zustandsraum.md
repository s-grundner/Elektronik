---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 24th March 2025
professor:
draft: true
title: kontinuierlicher LTI-Zustandsraum
---
 
# Zustandsbeschreibung von LTI-Systemen

> [!question] :LiArrowBigLeftDash: [LTI-Systeme](LTI-Systeme.md) |📍

[Zeitdiskreter LTI-Zustandsraum](Zeitdiskreter%20LTI-Zustandsraum.md) ***:LiRefreshCcw:***

---

Mit der zusätzlichen beschränkung auf die Zeitinvarianz, vereinfacht sich die Zustands- / Ausgangsgleichung zu konstanten Koeffizientenmatrizen. 

> [!quote] Ein LTI System erfüllt die Eigenschaften: **Linearität** und **Zeitinvarianz**
>  Linearität $\impliedby \mathbf{A,B,C,D} \neq f(u,x)$
> Zeitinvarianz $\impliedby \mathbf{A,B,C,D}$ $\neq f(t)$

Das mathematische Modell für die Zustandsgleichung und die algebraische Ausgangsgleichung bilden ein LTI-System, wenn sie folgende Form haben:

> [!satz] **S1 - LTI)** Lineares zeitinvariantes Übertragungssystem in der Zustandsraumdarstellung ^LTI
> 
>  $$
> \begin{align}
> \dot{\mathbf{x}}(t) &= \mathbf{A}\mathbf{x}(t)+\mathbf{B}\mathbf{u}(t), \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> \mathbf{y}(t) &= \mathbf{C} \mathbf{x}(t) + \mathbf{D} \mathbf{u}(t) \tag{Ausgangsgl.}
> \end{align}
> $$
> 
> Die Matrizen $\mathbf{A}$,$\mathbf{B}$, $\mathbf{C}$ und $\mathbf{D}$ sind die Koeffizienten(matrizen) der **Zustandsraumdarstellung** ^ZSRM
> $$
> \begin{align}
> &\mathbf{A} \text{ : Dynamikmatrix } (n\times n)
> &&\mathbf{B} \text{ : Eingangsmatrix } (n \times p) \\
> &\mathbf{C} \text{ : Ausgangsmatrix } (q\times n) && \mathbf{D} \text{ : Durchgangsmatrix } (q\times p)
> \end{align}
> $$

Ist der Eingangsvektor $\mathbf{u} \neq \mathbf{0}$ handelt es sich um ein [Übertragungssystem](Zustandsraum.md#Übertragungssystem), sonst um ein **freies** System. In diesem Fall heißt das freie System aufgrund seiner Zeitinvarianz auch **autonom**.

|               | Linear                                                                                                                     | Nicht linear                                               |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------: |
| Zeitinvariant | $\begin{align}\dot{x}(t) = \mathbf{A}x(t)+ \mathbf{B}u(t)\\ y(t) = \mathbf{C} x(t)+ \mathbf{D}u(t)\end{align}$             | $\begin{align}\dot{x} = f(x,u)\\y = g(x,u)\end{align}$     |
| Zeitvariant   | $\begin{align}\dot{x}(t) = \mathbf{A}(t)x(t)+ \mathbf{B}(t)u(t)\\ y(t) = \mathbf{C}(t) x(t)+ \mathbf{D}(t)u(t)\end{align}$ | $\begin{align}\dot{x} = f(x,u,t)\\y = g(x,u,t)\end{align}$ |

^LTI-TABLE

## Lösung der Zustandsgleichung

> [!hint] Bei der Zustandsgleichung handelt es sich um ist ein [Lineare DGL-Systeme 1. Ordung mit konstanten Koeffizienten](../Mathematik/Analysis/Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md)

Zur Lösung der Zustandsgleichungen wird die Methode der [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md) Angewandt. Da die Koeffizientenmatrizen **konstant** sind, lässt sich ein Ansatz über die Matrix-Exponentialfunktion anschreiben.

