---
tags: 
aliases:
  - Quotientenregel
  - Satz 11.14
  - Bemerkung 11.15
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. September 2024
professor:
---
 

# Produktregel (Quotientenregel)

Diese [Differentationsregeln](Analysis/Differenzialrechnung.md)**** folgen aus der [Kettenregel](Kettenregel.md)

> [!important] **Satz 11.14**. Sei $A \subset \mathbb{R}^n$ offen und $f, g: A \rightarrow \mathbb{R}$ seien differenzierbar in $x_0 \in A$. Dann gilt:
**(a)** **Produktregel**: $f g$ ist in $x_0$ differenzierbar mit:
> 
> $$
> \boxed{ (f g)^{\prime}\left(x_0\right)=f\left(x_0\right) g^{\prime}\left(x_0\right)+g\left(x_0\right) f^{\prime}\left(x_0\right) }
> $$
> 
> **(b)** **Quotientenregel**: Ist $g\left(x_0\right) \neq 0$, so ist $\frac{f}{g}$ in $x_0$ differenzierbar mit:
> 
> $$
> \boxed{ \left(\frac{f}{g}\right)^{\prime}\left(x_0\right)=\frac{g\left(x_0\right) f^{\prime}\left(x_0\right)-f\left(x_0\right) g^{\prime}\left(x_0\right)}{g\left(x_0\right)^2} }
> $$

## Beweis der Produktregel

Sei $G: A \rightarrow \mathbb{R}^2$ definiert durch $G(x):=(f(x), g(x))$ für alle $x \in A$ und $F: \mathbb{R}^2 \rightarrow \mathbb{R}$ durch $F(u, v):=u v$ für alle $(u, v) \in \mathbb{R}^2 . F$ hat die stetigen partiellen Ableitungen (Übung!):

$$
\frac{\partial F}{\partial u}\left(u_0, v_0\right)=v_0 \quad \text { und } \quad \frac{\partial F}{\partial v}\left(u_0, v_0\right)=u_0
$$


- Nach Satz 11.10 ist also $F$ differenzierbar.
- Nach Bemerkung 11.5 ist $G$ in $x_0$ differenzierbar.

Nach [Satz 11.12](Kettenregel.md) ist damit $F \circ G=f g$ in $x_0$ differenzierbar mit: $(F \circ G)^{\prime}\left(x_0\right)=F^{\prime}\left(G\left(x_0\right)\right) G^{\prime}\left(x_0\right)$. Also:

$$
\begin{aligned}
(f g)^{\prime}\left(x_0\right) & =\left(\frac{\partial F}{\partial u}\left(f\left(x_0\right), g\left(x_0\right)\right), \frac{\partial F}{\partial v}\left(f\left(x_0\right), g\left(x_0\right)\right)\right)\binom{f^{\prime}\left(x_0\right)}{g^{\prime}\left(x_0\right)} \\
& =\boxed{ g\left(x_0\right) f^{\prime}\left(x_0\right)+f\left(x_0\right) g^{\prime}\left(x_0\right) }
\end{aligned}
$$

## Beweis der Quotientenregel

Nach [Differenzialrechnung](Analysis/Differenzialrechnung.md) ist $g$ in $x_0$ stetig, also gilt wegen $g\left(x_0\right) \neq 0$ und der Offenheit von $A$ :

$$
\exists \varepsilon>0:\left(U_{\varepsilon}\left(x_0\right) \subset A \wedge \forall x \in U_{\varepsilon}\left(x_0\right): g(x) \neq 0\right)
$$


Wir ersetzen nun $A$ durch $U_{\varepsilon}\left(x_0\right)$. Dann ist $\frac{f}{g}$ auf ganz $A$ definiert. Wir gehen nun vor wie in (a) mit $G(x)=(f(x), g(x))$ und $F(u, v):=\frac{u}{v}$ (für $v \neq 0$ ). Offensichtlich gilt: $\frac{\partial F}{\partial u}\left(u_0, v_0\right)=\frac{1}{v_0}$. Sei nun $a: \mathbb{R} \backslash\{0\} \rightarrow \mathbb{R}$ definiert durch $a(t):=\frac{1}{t}$. Dann gilt für alle $h \neq 0, t \neq 0$ und $h+t \neq 0$ :

$$
\frac{a(t+h)-a(t)}{h}=\frac{\frac{1}{t+h}-\frac{1}{t}}{h}=\frac{-1}{t(t+h)}
$$


Also für alle $t \neq 0: \lim _{h \rightarrow 0} \frac{a(t+h)-a(t)}{h}=\frac{-1}{t^2}=a^{\prime}(t)$. Zusammen mit [Satz 11.11](Analysis/Faktorregel.md) folgt: $\frac{\partial F}{\partial v}\left(u_0, v_0\right)=-\frac{u_0}{v_0^2}$. Also wegen $F \circ G=\frac{f}{g}$ :

$$
\begin{aligned}
\left(\frac{f}{g}\right)^{\prime}\left(x_0\right) & =\left(\frac{\partial F}{\partial u}\left(f\left(x_0\right), g\left(x_0\right)\right), \frac{\partial F}{\partial v}\left(f\left(x_0\right), g\left(x_0\right)\right)\right)\binom{f^{\prime}\left(x_0\right)}{g^{\prime}\left(x_0\right)} \\
& =\frac{f^{\prime}\left(x_0\right)}{g\left(x_0\right)}-\frac{f\left(x_0\right) g^{\prime}\left(x_0\right)}{g\left(x_0\right)^{2}}\\
&=\boxed{ \frac{g\left(x_0\right) f^{\prime}\left(x_0\right)-f\left(x_0\right) g^{\prime}\left(x_0\right)}{g\left(x_0\right)^2} }
\end{aligned}
$$