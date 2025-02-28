---
tags: ["ML"]
aliases: ["Classification", "Klassifizierung"]
subject: ["dic"]
source: ["Robert Vogl"]
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
- [Gradient Descent](../../Softwareentwicklung/DS-Algo/Gradient%20Descent.md)

Zum normalisieren setzt man $h_{\theta}(x)$ in die [Sigmoid Funktion](Sigmoid%20Funktion.md) ein.  
Das $h_{\theta}$ ist bei der kosten Funktion immer mit der Sigmoid Kurve Normalisiert.

Output: $h_{\theta neu}(x)=\dfrac{1}{1+e^{-\Theta^{T}x}}$

# Tags

[Machine Learning](Machine%20Learning.md)