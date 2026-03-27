---
tags:
aliases:
subject:
  - VL
  - Regelungstechnik
semester: SS26
created: 17th March 2026
professor:
release: false
title: Linearisierung
---

# Linearisierung eines Systems

> [!important] Die gezielte Beeinflussung linearer, zeitinvarianter Systeme durch Regelung bzw. Steuerung ist um Größenordnungen einfacher als die nichtlinearer Systeme.


Falls jedoch nur kleine Auslenkungen des nichtlinearen Systems um eine Ruhelage bzw. einen Arbeitspunkt oder von einer Solltrajektorie betrachtet werden, kann das nichtlineare System sehr häufig durch ein lineares mathematisches Modell hinreichend gut angenähert werden.

> [!info]- Berechnungsgrundlagen
> 
> ## Partielle Ableitung
> 
> Hier wird die vereinfachte schreibweise für die [Partielle Ableitung](../../Mathematik/Analysis/Partielle%20Ableitung.md) einer Funktion $f(\mathbf{x}) \in C^1 (\mathbb{R}^n)$ nach $x_{i}$ an der Stelle $\mathbf{x}=\mathbf{x}_{0}$ verwendet:
> 
> $$
> \frac{ \partial }{ \partial x_{i} } f(\mathbf{x})\Bigg|_{\mathbf{x}=\mathbf{x}_{0}} = \frac{ \partial }{ \partial x_{i} } f(\mathbf{x}_{0})
> $$
> 
> Dabei gelten für $\frac{\partial}{\partial x_i}$ mit $a, b \in \mathbb{R}$ folgende Rechenregeln:
> 
> $$
> \begin{align}
> \left(a \frac{\partial}{\partial x_i}+b \frac{\partial}{\partial x_j}\right) f(\mathbf{x})&=a \frac{\partial}{\partial x_i} f(\mathbf{x})+b \frac{\partial}{\partial x_j} f(\mathbf{x})
> \\
> \left(\frac{\partial}{\partial x_i} \frac{\partial}{\partial x_j}\right) f(\mathbf{x})&=\frac{\partial^2}{\partial x_i \partial x_j} f(\mathbf{x})
> \end{align}
> $$
> 
> ## Gradient
> 
> 
> Als Ableitung der Eindimensionalen Funktion $f(\mathbf{x})$ an der Stelle $\mathbf{x}=\mathbf{x}_0$ wird der [Gradient](../../Mathematik/Analysis/Vektoranalysis/Gradient.md) (Zeilenvektor)
> 
> $$
> \left[\begin{array}{cccc}
> \frac{\partial}{\partial x_1} f\left(\mathbf{x}_0\right) & \frac{\partial}{\partial x_2} f\left(\mathbf{x}_0\right) & \cdots & \frac{\partial}{\partial x_n} f\left(\mathbf{x}_0\right)
> \end{array}\right]=\frac{\partial}{\partial \mathbf{x}} f\left(\mathbf{x}_0\right)=\mathbf{J}_f\left(\mathbf{x}_0\right)
> $$
> 
> bezeichnet. Die Ableitung einer höherdimensionalen Funktion $\mathbf{f}(\mathbf{x}): \mathbb{R}^n \rightarrow \mathbb{R}^m$ an einer Stelle $\mathbf{x}=\mathbf{x}_0$ ist durch die [Jacobi-Matrix](../../Mathematik/Analysis/Vektoranalysis/Gradient.md#Jacobi%20Matrix) gegeben.
> ![Jacobi-Matrix](../../Mathematik/Analysis/Vektoranalysis/Gradient.md#^JACM)

Für das Weitere wird noch die Taylorformel mit Fehler zweiter Ordnung für Funktionen $\mathbf{f}(\mathbf{x}): \mathbb{R}^n \rightarrow \mathbb{R}^m$ benötigt:

> [!satz] **S)** Sei $\mathbf{f} : G \subseteq \mathbb{R}^n \mapsto \mathbb{R}^m$,  $\mathbf{f} \in C^2$ auf $G$, $G$ offen und beschränkt
> 
> Liegen die Punkte $\mathbf{x}_{0}$, $\mathbf{x_{0}} + \Delta \mathbf{x}$ mit ihrer Verbindungsstrecke in $G$, dann gibt es ein $M \in \mathbb{R}^+$ sodass gilt
> 
> $$
> \mathbf{f}(\mathbf{x}_{0} + \Delta \mathbf{x}) = \mathbf{f}(\mathbf{x}_{0}) + \mathbf{J}_{\mathbf{f}}(\mathbf{x}_{0})\Delta \mathbf{x} + \mathbf{r}(\mathbf{x}_{0}, \Delta \mathbf{x})
> $$
> 
> mit
> 
> $$
> \lVert \mathbf{r}(\mathbf{x}_{0}, \Delta \mathbf{x}) \rVert \leq M\lVert \Delta \mathbf{x} \rVert^2 
> $$



Für das nichtlineare zeitinvariante System

$$
\begin{aligned}
& \dot{\mathbf{x}}=\mathbf{f}(\mathbf{x}, \mathbf{u}), \quad \mathbf{x}\left(t_0\right)=\mathbf{x}_0 \\
& \mathbf{y}=\mathbf{g}(\mathbf{x}, \mathbf{u})
\end{aligned}
$$

$n$-ter Ordnung sei die $m$-dimensionale Eingangsgröße $\mathbf{u}=\tilde{\mathbf{u}}(t)$ auf einem Intervall $t_0 \leq t \leq t_1, t_0, t_1 \in \mathbb{R}, t_0<t_1$ bekannt und $\mathbf{x}_0=\tilde{\mathbf{x}}_0$ gegeben. Erfültt es die Bedingungen von Satz 2.1, dann liegt die Lösung, die hier mit $\tilde{\mathbf{x}}(t)$ bezeichnet wird, eindeutig fest. Für den $l$-dimensionalen Ausgang y gilt dann $\tilde{\mathbf{y}}=\mathbf{g}(\tilde{\mathbf{x}}(t), \tilde{\mathbf{u}}(t))$. Für hinreichend kleine Abweichungen $\Delta \mathbf{u}$ der Eingangsgröße $\mathbf{u}$ und Abweichungen $\Delta \mathbf{x}_0$ des Anfangswertes $\mathbf{x}_0$