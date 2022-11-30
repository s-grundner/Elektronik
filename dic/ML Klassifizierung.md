---
tags: ["Machine Learning"]
aliases: ["Classification", "Klassifizierung"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 28th November 2022
---

# [[Machine Learning|ML]] Klassifizierung
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
J= - \frac{1}{m}\sum\limits_{i=1}^{m}y^{(i)}\ln(h_{\theta}(x^{(i)}))+(1-y^{(i)})\cdot\ln(1-h_{\theta})
$$
## Sigmoid funktion
Die Sigmoid Funktion ist eine Funktion, welche den Wertebereich Normalisiert.
Das $h_{\theta}$ ist bei der kosten Funktion immer mit der Sigmoid Kurve Normalisiert.

![[sigmoid.png]]

# Tags
[[Machine Learning]]