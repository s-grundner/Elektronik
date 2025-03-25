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


> [!quote] Ein LTI System erfüllt die Eigenschaften: **Linearität** und **Zeitinvarianz**
>  Linearität $\impliedby \mathbf{A,B,C,D} \neq f(u,x)$
> Zeitinvarianz $\impliedby \mathbf{A,B,C,D}$ $\neq f(t)$

Mit der zusätzlichen beschränkung auf die Zeitinvarianz, vereinfachen sich die [Zustandsraum](Zustandsraum.md#^ZSGL) zu konstanten Koeffizientenmatrizen:

> [!def] **D1 - LTI)** LTI-System in der Zustandsraumdarstellung ^LTI
>  $$
> \begin{align}
> \dot{\mathbf{x}}(t) &= \mathbf{A}\mathbf{x}(t)+\mathbf{B}\mathbf{u}(t), \quad \mathbf{x}(0) = \mathbf{x}_{0}\tag{Zustandsgl.}\\
> \mathbf{y}(t) &= \mathbf{C} \mathbf{x}(t) + \mathbf{D} \mathbf{u}(t) \tag{Ausgangsgl.}
> \end{align}
> $$



Ist der Eingangsvektor $\mathbf{u} \neq \mathbf{0}$ handelt es sich um ein [Übertragungssystem](Zustandsraum.md#Übertragungssystem), sonst um ein **freies** System. In diesem Fall heißt das freie System aufgrund seiner Zeitinvarianz auch **autonom**.

|               | Linear                                                                                                                     | Nicht linear                                               |
| :------------ | :--------------------------------------------------------------------------------------------------------------------------: | :----------------------------------------------------------: |
| Zeitinvariant | $\begin{align}\dot{x}(t) = \mathbf{A}x(t)+ \mathbf{B}u(t)\\ y(t) = \mathbf{C} x(t)+ \mathbf{D}u(t)\end{align}$             | $\begin{align}\dot{x} = f(x,u)\\y = g(x,u)\end{align}$     |
| Zeitvariant   | $\begin{align}\dot{x}(t) = \mathbf{A}(t)x(t)+ \mathbf{B}(t)u(t)\\ y(t) = \mathbf{C}(t) x(t)+ \mathbf{D}(t)u(t)\end{align}$ | $\begin{align}\dot{x} = f(x,u,t)\\y = g(x,u,t)\end{align}$ |

^LTI-TABLE

## Lösung der Zustandsgleichungen

> [!hint] Bei der Zustandsgleichung handelt es sich um ist ein [Lineare DGL-Systeme 1. Ordung mit konstanten Koeffizienten](../Mathematik/Analysis/Lineare%20DGL-Systeme%201.%20Ordung%20mit%20konstanten%20Koeffizienten.md)

Zur Lösung der Zustandsgleichungen wird die Methode der [Variation der Konstanten](../Mathematik/Analysis/Variation%20der%20Konstanten.md) Angewandt. Da die Koeffizientenmatrizen **konstant** sind, lässt sich ein Ansatz über die Matrix-Exponentialfunktion anschreiben.

