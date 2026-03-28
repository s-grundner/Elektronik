---
tags:
aliases:
  - Linear Least Squares
  - LLS
subject:
  - SE
  - Bachelorarbeit
semester: SS26
created: 25th March 2026
professor:
release: false
title: Lineare Methode der kleinsten Quadrate
---

# Lineare Methode der kleinsten Quadrate

> [!question] [Methode der kleinsten Quadrate](Methode%20der%20kleinsten%20Quadrate.md)

Die Modellfunktion ist bei der LLS-Methode ein [Polynom](Algebra/Polynom.md) 1. Ordnung

$$
f(x) = \theta_{0} + \theta_{1} x
$$

Für eine gegebene Reihe  an $n$ Trainings- / Messdaten der

$$
\text{Eingänge: } (x_{1},\ldots,x_{n}) \qquad \text{Ausgänge: }(y_{1},\ldots,y_{n})
$$

werden die Koeffizienten $\theta_{1}, \theta_{2}$ gesucht, damit eine optimale Gerade die durch die Messdaten verläuft entsteht.

Zur optimierung werden nun die *Abweichungen / Anpassungsfehler* zur Modellfunktion $e = f(x_{i})-y_{i}$ berechnet, also

$$
\begin{align}
e_{1} &= \theta_{1} + \theta_{2}x_{1} -y_{1} \\
e_{2} &= \theta_{1} + \theta_{2}x_{2} -y_{2} \\
&\vdots \\
e_{n} &= \theta_{1} + \theta_{2}x_{n} -y_{n}
\end{align}
$$
Oft werden die Parameter $\theta_{1}$ und $\theta_{1}$ auch zu einem Parametervektor $\boldsymbol{\theta}=\begin{pmatrix}\theta_{1} \\ \theta_{2}\end{pmatrix}$ zusammengefasst

> [!hint] $x$ und $y$ sind [Zufallsvariablen](Statistik/Zufallsvariable.md) bzw. Realisierungen eines [stochastischen Prozesses](Statistik/Stochastische%20Prozesse.md). Dabei ist $y$ eine *Abhängige Zufallsvariable* und zwar von der *unabhängigen Zufallsvariable*. $x$
> Dabei ist es Hier das Ziel, diese Abhängigkeit, mit einer Modellfunktion optimal abzuschätzen.

#incomplete 

## Vektorparameterfall

Angenommen ein gemessenes Signal $\{ x[n] \}_{n=0}^{N-1}$ ist eine gestörte Version des unbekannten Signals $\{ s[n] \}_{n=0}^{N-1}$. Die realisierung dieser [stochastischen Prozesse](Statistik/Stochastische%20Prozesse.md) lassen sich als Vektor von Zufallsvariablen aufschreiben:

$$
\mathbf{s} = \begin{pmatrix}
s[0] \\ s[1] \\ \vdots \\ s[N-1]
\end{pmatrix} \qquad \mathbf{x} = \begin{pmatrix}
x[0] \\ x[1] \\ \vdots \\ x[N-1]
\end{pmatrix}
$$

- $\mathbf{s}$ ... zu Modellierendes Signal
- $\mathbf{x}$ ... Messwerte

### Modell

Ein Lineares Modell für das Signal ist dann,

$$
s[n] = \sum_{k=1}^{P}\theta_{k}h_{k}[n]
$$

Oder in Matrix Schreibweise

$$
\underbrace{ \begin{pmatrix}
s[0] \\ s[1] \\ \vdots \\ s[N-1]
\end{pmatrix} }_{ \mathbf{s} }
=
\underbrace{ \begin{pmatrix}
h_{1}[0] & h_{2}[0] & \ldots & h_{P}[0] \\
h_{1}[1] & h_{2}[1] & \ldots & h_{P}[1] \\
\vdots & \vdots & \ddots & \vdots \\
h_{1}[N-1] & h_{2}[N-1] & \ldots & h_{P}[N-1]
\end{pmatrix} }_{ \mathbf{H} }
\underbrace{ \begin{pmatrix}
\theta_{1} \\ \theta_{2} \\ \vdots \\ \theta_{P}
\end{pmatrix} }_{ \boldsymbol{\theta} }
$$

Der unbekannte Zufallsvektor $\mathbf{s}$ ist linear in den unbekannten Modellparameter $\boldsymbol{\theta}$

$$
\mathbf{s} = \mathbf{H}\boldsymbol{\theta}
$$

Dabei ist $\mathbf{H} \in \mathbb{R}^{N\times P}$ mit $N > P$ eine *bekannte Matrix*, welche [vollen Rang](Algebra/Rang%20einer%20Matrix.md) haben muss. Diese Matrix bezeichnet man als **Beobachtungsmatrix** oder **Design Matrix** (*en. observation Matrix*).

### Design Matrix

Die Design-Matrix besteht aus $N$ Zeilenvektoren von funktionen $(h_{k}[n])_{k=0}^{P}$, welche die Form des Modells Festlegen.

> [!example]- Typische Formen von $\mathbf{H}$ sind z.B.
> 
> #### Gerade
> 
> $$
> s[n] = \theta_{1} + \theta_{2}n \implies h_{1}[n] = 1, h_{2}[n] = n
> $$
> 
> $$
> \mathbf{H} = \begin{pmatrix}
> 1 & 0 \\ 1 & 1 \\ 1 & 2 \\ \vdots & \vdots \\ 1 & N-1
> \end{pmatrix}
> $$
> 
> #### Polynome im Allgemeinen
> 
> $$
> s[n] = \sum_{k=1}^{P} \theta_{k}n^{k-1} = \theta_{1} + \theta_{2}n + \theta_{3}n^{2} \dots \implies h_{k}[n] = n^{k-1}
> $$
> 
> $$
> \mathbf{H} = \begin{pmatrix}
> 1 & 0 & 0 & \ldots & 0 \\
> 1 & 1 & 1 & \ldots & 1 \\
> 1 & 2 & 4 & \ldots & 2^{P} \\
> 1 & 3 & 9 & \ldots & 3^{P} \\
> \vdots &\vdots & \vdots & \ddots & \vdots \\
> 1 & N-1 & (N-1)^{2} & \ldots & (N-1)^{P} \\
> \end{pmatrix}
> $$
> 
> - Mit $0^{0} := 1$
> 
> 
> #### Trigonometrische Funktionen
> 
> Das Lineare Modell liefert die Fourierreihe des Signals. Mit den Parametern werden dann die Spektralanteile abgeschätzt.
> 
> $$
> \begin{align}
> s[n] &= \sum_{k=1}^{P} \alpha_{k}\sin(k\omega_{0}n) + \beta_{k}\cos(k\omega_{0}n) \\
> \implies \mathbf{h}_{k}[n] &= \begin{pmatrix}
> \sin(k\omega_{0}n) & \cos(k\omega_{0}n)
> \end{pmatrix}, \quad \boldsymbol{\theta}_{k}
> =\begin{pmatrix}
> \alpha_{k} \\ \beta_{k}
> \end{pmatrix}
> \end{align}
> $$
> 
> 
> - $l:=N-1$
> 
> $$
> \mathbf{H} = \begin{pmatrix}
> 0 & 1 & 0 & 1 & \ldots & 0 & 1 \\
> \sin(\omega_{0}) & \cos(\omega_{0}) & \sin(2\omega_{0}) & \cos(2\omega_{0}) & \ldots & \sin(P\omega_{0}) & \cos P(\omega_{0}) \\
> \sin(2\omega_{0}) & \cos(2\omega_{0}) & \sin(4\omega_{0}) & \cos(4\omega_{0}) & \ldots & \sin(2P\omega_{0}) & \cos (2P\omega_{0}) \\
> \vdots & \vdots & \vdots & \vdots & \ddots & \vdots & \vdots  \\
> \sin(l\omega_{0}) & \cos(l\omega_{0}) & \sin(2l\omega_{0}) & \cos(2l\omega_{0}) & \ldots & \sin(Pl\omega_{0}) & \cos (Pl\omega_{0}) \\
> \end{pmatrix}
> $$

### Kostenfunktion

- With the measurements $\mathbf{x}$ we regarded the cost function

$$
J(\boldsymbol{\theta})=\sum_{n=0}^{N-1}(x[n]-y[n ; \boldsymbol{\theta}])^2=\sum_{n=0}^{N-1} e^2[n]=\mathbf{e}^T \mathbf{e}=(\mathbf{x}-\mathbf{H} \boldsymbol{\theta})^T(\mathbf{x}-\mathbf{H} \boldsymbol{\theta})
$$

- The minimum of $J$, and therefore the LS solution is given by

$$
\begin{aligned}
\hat{\boldsymbol{\theta}} &= \left(\mathbf{H}^T \mathbf{H}\right)^{-1} \mathbf{H}^T \mathbf{x}, \\
\hat{\mathbf{y}} &= \mathbf{H} \hat{\boldsymbol{\theta}} = \mathbf{H}\left(\mathbf{H}^T \mathbf{H}\right)^{-1} \mathbf{H}^T \mathbf{x}
\end{aligned}
$$

# Referenzen

[Lineare Modellfunktionen für LLS - Wikipedia](https://de.wikipedia.org/wiki/Methode_der_kleinsten_Quadrate#Lineare_Modellfunktion)


