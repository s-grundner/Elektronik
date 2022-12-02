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

# Beispiel
$$
\begin{array}{cll}
P_{1}(1|10): y=\\
P_{2}(1|10): y=\\
P_{3}(1|10): y=1\\
&\theta_{init}=\begin{pmatrix}-50\\10\\1\end{pmatrix}\\
P_{4}(1|10): y=1\\
P_{5}(1|10): y=1\\
P_{6}(1|10): y=1\\
\end{array}
$$

# Tags



