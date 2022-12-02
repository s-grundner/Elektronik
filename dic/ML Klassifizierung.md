---
tags: ["Machine Learning"]
aliases: ["Classification", "Klassifizierung", "Logistische Regression"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 28th November 2022
---

# Logistische Regression
$$
\begin{align*}
Cost (h_{\theta}(x), y) &=
\begin{cases}
-\ln(h_{\theta}(x^{(n)}))\cdot y^{(i)}\\
-\ln(1-h_{\theta}(x^{(n)}))
\end{cases}
\end{align*}
$$
$$
J= - \frac{1}{m}\sum\limits_{i=1}^{m}y^{(i)}\ln(h_{\theta}(x^{(i)}))+(1-y^{(i)})\cdot\ln(1-h_{\theta}(x^{(i)}))
$$
Man Verändert $\theta^{(i)}$ so, dass $J$ minimal ist
- [[Gradient Descent]]

Output: $h_{\theta}(x)=\dfrac{1}{1+e^{-\Theta^{T}x}}$
## Sigmoid funktion
Die Sigmoid Funktion ist eine Funktion, welche den Wertebereich Normalisiert.
Das $h_{\theta}$ ist bei der kosten Funktion immer mit der Sigmoid Kurve Normalisiert.

![[sigmoid.png]]

# Tags
[[Machine Learning]]