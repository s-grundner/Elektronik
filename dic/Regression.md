---
tags: [""]
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 18th November 2022
---

# Linear Regression
$$
\begin{align*}
X &= 
\begin{pmatrix}
1 & 1\\
5 & 8
\end{pmatrix}\\
h_{\theta}(x) &= \theta_{0}+\theta_{1}\cdot x_{1}+\theta_{2}\cdot x_{2}+\theta_{3}\cdot x_{3}+\theta_{4}\cdot x_{4}\\
&= \Theta' \cdot X_{(n)}\\
J &= \frac{1}{2m}\cdot \sum\limits_{n=1}^{m}(\Theta'\cdot X_{(n)}-Y_{(n)})\\\\
Cost (h_{\theta}(x), y) &=
\begin{cases}
-\log(h_{\theta}(x^{(n)}))\cdot y^{(i)}\\
-\log(1-h_{\theta}(x^{(n)}))
\end{cases}
\end{align*}
$$
# Logistic Regression



# Quellen#
