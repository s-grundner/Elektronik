---
tags: []
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 7th November 2022
---

# Gradient Descent
Der Gradient Descent ist ein Algorithmus zur Annäherung von der Kostenfunktion $J$ der [[Lineare Regression|Lineare-]] oder [[Logistische Regression|Logistische]] Regression.

Der Algorithmus ist eine Kombination aus dem [[Newton'sches Näherungsverfahren|Newton'schen Annäherungsverfahren]] und der [[Sigmoid Funktion]].

$$
\begin{align*}
J&=\frac{\partial J}{\partial\theta_{j}}= \frac{1}{m}\sum^{m}_{i=1}(h_{\theta}(x^{(i)})-y^{(i)})\cdot x_{j}^{(i)}\\
h_{\theta}(x^{(i)})&= \frac{1}{1+e^{-\Theta^{T}\cdot x}}
\end{align*}
$$
$j\dots$Anzahl der Eigeschaften
$i\dots$Anzahl der ....
# Quellen
Gradient Descent Wiki



