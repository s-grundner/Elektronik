---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 25th March 2025
professor:
draft: true
title: Kontinuierliche Systeme
---

# Dynamische Systeme

> [!question] :LiArrowBigLeftDash: [Systemtheorie]({MOC}%20Systemtheorie.md) |📍| [Lineare Systeme](Lineare%20Systeme.md) :LiArrowBigRightDash:

[Zeitdiskrete Systeme](Zeitdiskrete%20Systeme.md) ***:LiRefreshCcw:***

---

Dynamische Systeme, die sich durch eine endliche Anzahl n von Zustandsgrößen charakterisieren lassen, werden auch als Systeme mit finitem Zustand der Ordnung n bezeichnet.

Im zeitkontinuierlichen Fall werden sie durch mathematische Modelle in Form von gewöhnlichen [DGL-Systemen](../Mathematik/Analysis/DGL-System.md) und algebraischen Gleichungen beschrieben. 

$$
\begin{align}
\dot{x}_{1} &= f_{1}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), \qquad x_{1}(t_{0})=x_{1,0} \\
\dot{x}_{2} &= f_{2}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), \qquad x_{2}(t_{0})=x_{2,0} \\
& \ \ \vdots\\
\dot{x}_{n} &= f_{n}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), \qquad x_{n}(t_{0})=x_{n,0} \\

\end{align}
$$

Das System ist in Matrixschreibweise lautet:




![](Zustandsraum.md#^ZSGR)