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
Die Kostenfunktion $J$ wird zunächst über $\theta$ aller Eigenschaften partiell Differenziert:

$$
\begin{align*}
J&=\frac{\partial J}{\partial\theta_{j}}= \frac{1}{m}\sum^{m}_{i=1}(h_{\theta}(x^{(i)})-y^{(i)})\cdot x_{j}^{(i)}\\
\text
h_{\theta}(x^{(i)})&= \frac{1}{1+e^{-\Theta^{T}\cdot x}}
\end{align*}
$$
$j\dots$Anzahl der Eigeschaften
$i\dots$Anzahl der Samplepoints
$^{T}\dots$Matrix ist Transponiert

# Beispiel
$$
\begin{array}{}
P_{1}(1|10): y=0\\
P_{2}(1|30): y=0\\
P_{3}(2|20): y=0\\
&\theta_{init}=\begin{pmatrix}-50\\10\\1\end{pmatrix}\\
P_{4}(4|50): y=1\\
P_{5}(6|40): y=1\\
P_{6}(6|150): y=1\\
\end{array}
$$

# Tags



