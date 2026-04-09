## Hesse Matrix

> [!def] **D2 - HESM)** Die Matrix die sich bei der zweiten partiellen Ableitung ergibt ist die Hessematrix
> 
> $$
> H_f(x):=\begin{pmatrix}
> \dfrac{\partial^2 f}{\partial x_1^2} & \cdots & \dfrac{\partial^2 f}{\partial x_1 \partial x_n} \\
> \vdots & \ddots & \vdots \\
> \dfrac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \dfrac{\partial^2 f}{\partial x_n^2}
> \end{pmatrix}
> $$
> 
> Die Symmetrie der Hessematrix ist durch den [Satz von Schwarz](../Partielle%20Ableitung.md) gegeben.


> [!example] $f: \mathbb{R}^{n}\mapsto \mathbb{R}, \quad \vec{x}=(x,y)$
> 
> $$
> \begin{gather}
> f(x,y):=x^{2}y+3x^{2}-\sin(xy) \\
> 
> \downarrow \frac{\partial }{\partial \vec{x}} \\
> 
> \nabla f(x,y) = J_{f} = \begin{pmatrix}
> 2 x y+6 x-\cos (x y) \cdot y \\
> x^2-x \cdot \cos (x y) \\
> \end{pmatrix} \\
> 
> \downarrow \frac{\partial }{\partial \vec{x}} \\
> 
> \boxed{ H_{f(x, y)} = \begin{pmatrix}
> 2 y+6+\sin (x y) y^2 & 2 x+\sin (x y) \cdot y^2 \\
> x-(\cos (x y)+x \cdot \sin (x y) \cdot y & \sin (x y) x^2
> \end{pmatrix} } 
> \end{gather}
> $$