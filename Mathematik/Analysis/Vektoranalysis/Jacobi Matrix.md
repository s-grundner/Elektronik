## Jacobi Matrix

Allgemein kann die Differentation als [lineare Abbildung](../../Algebra/Lineare%20Abbildungen.md) verstanden werden. Die [Matrix](../../Algebra/Matrix.md) welche eine Funktion $\mathbf{f}$ auf dessen Ableitung Transformiert, ist die Jacobi Matrix.

> [!def] **D2 - JACM)** Jakobi [Matrix](../../Algebra/Matrix.md). Sei $A \subset \mathbb{R}^n$ offen. Sei $\mathbf{f}=\left(f_1, \ldots, f_m\right): A \rightarrow \mathbb{R}^m$ und $\mathbf{x} \in A$. ^JACM
> 
> Falls $\dfrac{\partial f_i}{\partial x_j}(x)$ für alle $i \in\{1, \ldots, m\}$ und $j \in\{1, \ldots, n\}$ existiert, so heißt die Matrix
> 
> $$
> \mathbf{J_{f}}(\mathbf{x}):=\begin{bmatrix}
> \dfrac{\partial f_1}{\partial x_1}(\mathbf{x}) & \ldots & \dfrac{\partial f_1}{\partial x_n}(\mathbf{x}) \\
> \vdots & \ddots & \vdots \\
> \dfrac{\partial f_m}{\partial x_1}(\mathbf{x}) & \ldots & \dfrac{\partial f_m}{\partial x_n}(\mathbf{x})
> \end{bmatrix}
> $$
> 
> *Jacobi-Matrix* (oder *Funktionalmatrix*) von $\mathbf{f}$ an der Stelle $\mathbf{x}$.

Die Jacobimatrix ist die verallgemeinerung des [Gradienten](Gradient.md) auf Mehrdimensionale Funktionen. Es gilt daher auch

$$
\mathbf{J}_{f}(\mathbf{x}) = \operatorname{grad}f(\mathbf{x}) = \nabla f(\mathbf{x})
$$

(Man beachte dass das Subscript $f$ der Jacobimatrix nicht Fett geschrieben ist.)

## Referenzen


![](https://www.youtube.com/watch?v=0CHZMY02Dhk)