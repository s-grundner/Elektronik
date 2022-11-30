---
tags: ["Machine Learning"]
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 18th November 2022
---
# Linear Regression

$X\dots 100\times3$
$\Theta\dots 3\times1$
$$
\begin{align*}
h_{\theta}(x) &= \Theta' \cdot X_{(n)}\\
&= \theta_{0}+\theta_{1}\cdot x_{1}+\theta_{2}\cdot x_{2}+\theta_{3}\cdot x_{3}+\theta_{4}\cdot x_{4}\\
J &= \frac{1}{2m}\cdot \sum\limits_{n=1}^{m}(\Theta'\cdot X_{(n)}-Y_{(n)})
\end{align*}
$$
| $\Theta' \cdot X_{(n)} =$                                                                                     | $$\begin{pmatrix}1 & 2 & 3\end{pmatrix}$$                                                                                                                                 |
| ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| $$\left.\begin{pmatrix}1 & 94 & 72\\1 & 93 & 87\\1 & 91 & 43\\1 & 100 & 12\end{pmatrix}\right\downarrow_{m}$$ | $$\begin{pmatrix}1\cdot1 &+ 94\cdot2 &+ 72\cdot3 \\1\cdot1 &+ 93\cdot2 &+ 87\cdot3 \\1\cdot1 &+ 91\cdot2 &+ 43\cdot3 \\1\cdot1 &+ 100\cdot2 &+ 12\cdot3 \\\end{pmatrix}$$ |

# Logistic Regression


# Quellen#
