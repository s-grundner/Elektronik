---
tags:
  - Systeme/Zeitdiskret
aliases:
subject:
  - VL
  - Optimum and Adaptive Signal Processing Systems
semester: WS26
created: 27th March 2026
professor:
release: false
title: Wiener Filter
---

# Wiener Filter

> [!question] [Optimale Filter](Optimale%20Filter.md)

Die Systemantwort sowie die Eingangssignale sind realisierungen [stochastischer Prozesse](../../Mathematik/Statistik/Stochastische%20Prozesse.md). Das Optimierungskriterium für den Wiener Filter (WF) ist der (*Bayesian Mean Square Error - MSE*)

- Für die Modellbildung sei Vorrausgesetzt, dass die Stochastischen Prozesse *mittelwertfrei* und *schwach stationär* sind.
- Für das Modell ist außerdem eine [FIR-Filter](FIR-Filter.md) Struktur vorrausgesetzt.

![](FIR-Filter.md#^FIR)

## Kostenfunktion und Optimalbedingung

Es sollen jene Filterkoeffizienten gefunden werden, die den *Mean Square Error - MSE* minimieren:

$$
\mathbf{w}_{0} = \underset{\mathbf{w}}{\operatorname{argmin}}\Big\{ E\left((  y[k]-\hat{y}[k])^{2} \right) \Big\} 
$$


Die Kostenfunktion ist demnach

$$
\begin{align}
J(\mathbf{w})
&= \mathrm{E}\left( (y[k]-\hat{y}[k])^{2} \right) \\
&= \mathrm{E}\left(( y[k] - \mathbf{w}^T\mathbf{x}[k])^2\right) \\
&= \mathrm{E}\left(y^{2}[k] - 2\mathbf{w}^T\mathbf{x}[k]y[k] + \mathbf{w}^T\mathbf{x}[k]\mathbf{x}^T[k]\mathbf{w}\right) \\
&= \mathrm{E}\left( y^{2}[k] \right) -2\mathbf{w}^T \mathrm{E}(\mathbf{x}[k] y[k]) +\mathbf{w}^T\mathrm{E}( \mathbf{x}[k]\mathbf{x}^T[k]) \mathbf{w} \\
&= { \color{orange}\sigma_{y}^{2}-2\mathbf{w}^T \mathbf{r}_{xy} +\mathbf{w}^T \mathbf{R}_{xx}\mathbf{w}}
\end{align}
$$


- $\mathbf{R}_{x x}$ ... Autokorrelationsmatrix
- $\mathbf{r}_{xy}$ ... Kreuzkorrelationsvektor

Die Kostenfunktion ist quadratisch im Vektor $\mathbf{w}$ (*hyperparaboloid*). Daher gibt es nur ein globales minimum $J(\mathbf{w}_{0})$ am Punkt $\mathbf{w}_{0}$.

> [!satz] **S - MMSE)** Minimum Mean Square Error $J(\mathbf{w}_{0})$
> 
> Das [minimum](../../Mathematik/Analysis/Kurvendiskussion/Extremwert.md) der Kostenfunktion $J$ kann gefunden werden, indem man dessen [Gradienten](../../Mathematik/Analysis/Vektoranalysis/Gradient.md) gleich null setzt:
> 
> $$
> \mathbf{g}(\mathbf{w}) := \frac{ \partial J(\mathbf{w}) }{ \partial \mathbf{w} } = -2\mathbf{r}_{xy} + 2 \mathbf{R}_{x x}\mathbf{w}\overset{!}{=}\mathbf{0}
> $$
> 
> Man erhält die [Normalgleichungen](../../Mathematik/Normalgleichungen.md)
> 
> $$
> \mathbf{R}_{xx}\mathbf{w}_{0} = \mathbf{r}_{xy}
> $$
> 
> oder äquivalent die **Wiener-Hopf** Lösung (wenn $\mathbf{R}_{x x}$ [regulär](../../Mathematik/Algebra/Reguläre%20Matrizen.md) ist)
> 
> $$
> \mathbf{w}_{0} = \mathbf{R}_{xx}^{-1}\mathbf{r}_{xy}
> $$

### Autokorrelationsmatrix

$$
\begin{align}
\mathbf{R}_{x x} &= \mathrm{E}(\mathbf{x}[k]\mathbf{x}^T[k]) \\
&= \mathrm{E} \left(
\begin{pmatrix}
x[k] \\ x[k-1] \\ \vdots \\ x[k-p+1]
\end{pmatrix}
\begin{pmatrix}
x[k] & x[k-1] & \dots & x[k-p+1]
\end{pmatrix}
\right) \\
&= \mathrm{E}\begin{pmatrix}
x^{2}[k] & x[k]x[k-1] & \dots & x[k]x[k-p+1] \\
x[k-1]x[k] & x^{2}[k-1] & & x[k-1]x[k-p+1] \\
\vdots &  & \ddots & \vdots \\
x[k-p+1]x[k] & x[k-p+1]x[k-1] & \dots & x^{2}[k-p+1]
\end{pmatrix} \\
&= \begin{pmatrix}
r_{xx}[0] & r_{xx}[1] & \dots & r_{xx}[p-1] \\
r_{xx}[1] & r_{xx}[0] & & \vdots \\
\vdots & & \ddots & \\
r_{xx}[p-1] & \dots & & r_{x x}[0] \\
\end{pmatrix}
\end{align}
$$

> [!satz] Eigenschaften der Autokorrelationsmatrix
> 
> -  $\mathbf{R}_{x x} = \mathbf{C}_{x x}$, da die stochastischen Prozesse als mittelwertfrei vorrausgesetzt sind.
> - $\mathbf{R}_{x x}$ ist symmetrisch
> - $\mathbf{R}_{x x}$ ist eine Toeplitz-Matrix
> - $\mathbf{R}_{x x}$ ist positiv semidefinit, bzw positiv definit, wenn die komonenten des $\mathbf{x}$-Vektors linear unabhängig sind.


### Kreuzkorrelationsvektor


$$
\begin{align}
\mathbf{r}_{xy} &= \mathrm{E}\left( \begin{pmatrix}
x[k] \\ x[k-1] \\ \vdots \\ x[k-p+1]
\end{pmatrix} y[k]\right) \\
&=\mathrm{E}\begin{pmatrix}
x[k]y[k] \\ x[k-1]y[k] \\ \vdots \\ x[k-p+1]y[k]
\end{pmatrix} \\
&=\begin{pmatrix}
r_{xy}[0] \\ r_{xy}[1] \\ \vdots \\ r_{xy}[p-1]
\end{pmatrix}
\end{align}
$$


Problem: Die Optimierung fordert die Kenntnis von [Momente 2. Ordnung](../../Mathematik/Statistik/Momenterzeugende%20Funktion.md), welche in der Realität schwer abzuschätzen sind.

