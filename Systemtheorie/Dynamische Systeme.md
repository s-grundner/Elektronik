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
release: false
title: Kontinuierliche Systeme
---

# Dynamische Systeme

> [!question] :LiArrowBigLeftDash: [Systemtheorie]({MOC}%20Systemtheorie.md) |📍| [Lineare Systeme](Lineare%20Systeme.md) :LiArrowBigRightDash:

[Zeitdiskrete Systeme](Zeitdiskrete%20Systeme.md) ***:LiRefreshCcw:***

---

Dynamische Systeme, die sich durch eine endliche Anzahl n von Zustandsgrößen charakterisieren lassen, werden auch als Systeme mit finitem Zustand[^1] der Ordnung $n$ bezeichnet.

Im zeitkontinuierlichen Fall werden sie durch mathematische Modelle in Form von gewöhnlichen [DGL-Systemen](../Mathematik/Analysis/DGL-System.md) und algebraischen Gleichungen beschrieben. 

$$
\begin{align}
\dot{x}_{1} &= f_{1}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), & x_{1}(t_{0})=x_{1,0} \\
\dot{x}_{2} &= f_{2}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), & x_{2}(t_{0})=x_{2,0} \\
& \ \ \vdots\\
\dot{x}_{n} &= f_{n}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}), & x_{n}(t_{0})=x_{n,0} \\ \hline
y_{1} &= g_{1}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}) \\
y_{2} &= g_{2}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}) \\
& \ \ \vdots \\
y_{n} &= g_{n}(t,x_{1},\dots,x_{n},u_{1},\dots,u_{n}) \\
\end{align}
$$

Das System ist in Matrixschreibweise lautet:

$$
\begin{align}
\mathbf{\dot{x}} &= \mathbf{f}(t,\mathbf{x},\mathbf{u}), &\mathbf{x}(t_{0}) = \mathbf{x}_{0} \tag{Zustandsgl.} \\
\mathbf{y} &= \mathbf{g}(t,\mathbf{x},\mathbf{u}) \tag{Ausgangsgl.}
\end{align}
$$


![](Zustandsgrößen.md#^ZSGR)

Die Ordnung des Systems ist dabei die Dimension des Zustandsvektors $\dim \mathbf{x}=n$.

Haben $\mathbf{f}$ und $\mathbf{g}$ eine bestimmte Form bezeichnet man das System als...

| **zeitinvariantes** System                                                                                                           | **freies** System                                                                                                   | **autonomes** System                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| $$\begin{align}\mathbf{\dot{x}}&= \mathbf{f}(\mathbf{x},\mathbf{u}) \\ \mathbf{y} &= \mathbf{g}(\mathbf{x}, \mathbf{u})\end{align}$$ | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{f}(t, \mathbf{x}) \\ \mathbf{y} &= \mathbf{g}(t,\mathbf{x})\end{align}$$ | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{f}(\mathbf{x}) \\ \mathbf{y} &= \mathbf{g}(\mathbf{x})\end{align}$$ |
| Die Zustandsfolgen sind nur indirekt über die Zustandsgrößen von $k$ abhängig                                                        | Das System besitzt keine externen Stellgrößen                                                                       | das System ist frei und zeitinvariant                                                                          |

> [!hint] Es gelten dabei auch die Sätze über DGL-Systeme:
> - Existenz einer Lösung nach [Picard-Lindelöf](../Mathematik/Analysis/Picard-Lindelöf.md)
> - Stabilität einer Lösung nach [Ljapunov](../Mathematik/Analysis/Ljapunov.md)

## Lineare Systeme

> [!question] [Lineare Systeme](Lineare%20Systeme.md)

Der Vorteil Linearer Systeme ist, dass sie in eine explizite Form gebracht werden können, für welche sich ggf. Lösungsansätze finden lassen. Diese Form heißt Zustandsraumdarstellung.

Vergleich allgemeiner Systeme zu Linearen Systemen:

|              | Zeitvariant                                                                                                                                                     | Zeitinvariant                                                                                                                                       |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| Nicht Linear | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{f}(t,\mathbf{x},\mathbf{u})\\ \mathbf{y} &= \mathbf{g}(t,\mathbf{x},\mathbf{u})\end{align}$$                         | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{f}(\mathbf{x},\mathbf{u})\\ \mathbf{y} &= \mathbf{g}(\mathbf{x},\mathbf{u})\end{align}$$                 |
| Linear       | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{A}(t)\mathbf{x}+\mathbf{B}(t)\mathbf{u}\\ \mathbf{y} &= \mathbf{C}(t)\mathbf{x}+\mathbf{D}(t)\mathbf{u}\end{align}$$ | $$\begin{align}\mathbf{\dot{x}} &= \mathbf{A}\mathbf{x}+\mathbf{B}\mathbf{u}\\ \mathbf{y} &= \mathbf{C}\mathbf{x}+\mathbf{D}\mathbf{u}\end{align}$$ |

^System-Vergleich

[^1]: Systeme mit finitem Zustand (auch konszentriert-parametrische Systeme) werden durch Gewöhnliche DGL beschrieben.
    Systeme mit infinitem Zustand (auch verteilt-parametrische Systeme) werden durch Partielle DGL beschrieben.