---
tags: 
aliases:
  - Definition 4.29
  - Bemerkung 4.30
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 29. September 2024
professor:
---
 

# Hyperbolische Funktionen

> [!important] **Definition 4.29**: Die hyperbolischen Funktionen sind wie folgt definiert:
> 
> $$
> \begin{align}
> \text{Sinus hyperbolicus:} &\quad\sinh : \mathbb{R} \rightarrow \mathbb{R} x \mapsto \frac{e^x-e^{-x}}{2}\\
> \text{Cosinus hyperbolicus:} &\quad\cosh : \mathbb{R} \rightarrow \mathbb{R}, x \mapsto \frac{e^x+e^{-x}}{2}\\
> \text{Tangens hyperbolicus:} &\quad \tanh : \mathbb{R} \rightarrow \mathbb{R}, \quad x \mapsto \frac{\sinh x}{\cosh x}\\
> \text{Cotangens hyperbolicus:} &\quad \coth : \mathbb{R} \backslash\{0\} \rightarrow \mathbb{R}, \quad x \mapsto \frac{\cosh x}{\sinh x}\\
> \end{align}
> $$

## Bemerkung 4.30

$$
\begin{aligned}
\cosh ^2 x-\sinh ^2 x & =1, \quad \cosh (0)=1, \quad \sinh (0)=0 \\
\sinh (x+y) & =\sinh x \cosh y+\cosh x \sinh y \\
\cosh (x+y) & =\cosh x \cosh y+\sinh x \sinh y \\
\cosh (2 x) & =\cosh ^2(x)+\sinh ^2(x) \\
\sinh (2 x) & =2 \sinh x \cosh x \\
2 \cosh ^2(x) & =1+\cosh (2 x) \\
2 \sinh ^2(x) & =\cosh (2 x)-1
\end{aligned}
$$
### Areafunktionen

$$
\operatorname{arsinh}: \mathbb{R} \rightarrow \mathbb{R}, \quad \text { arcosh }:[1, \infty) \rightarrow \mathbb{R}_0^{+}, \quad \operatorname{artanh}:(-1,1) \rightarrow \mathbb{R}
$$

$$
\begin{aligned}
\operatorname{arsinh}(x) & =\ln \left(x+\sqrt{x^2+1}\right) \\
\operatorname{arcosh}(x) & =\ln \left(x+\sqrt{x^2-1}\right) \\
\operatorname{artanh}(x) & =\frac{1}{2} \ln \left(\frac{x+1}{x-1}\right)
\end{aligned}
$$

## Ableitung Hyperbolischer Funktionen

#incomplete 

$$
\begin{align}
(\sinh t)' &= \cosh t  && (\operatorname{arsinh})' &= \frac{1}{\sqrt{ 1+x^{2} }}\\
(\cosh t)' &= \sinh t && (\operatorname{arcosh})' &= \frac{1}{\sqrt{ x^{2}-1 }}\\
(\tanh t )' &= \frac{1}{\cosh ^{2}(t)} = 1 - \tanh ^{2}(t)  \\
(\operatorname{artanh})' &= 

\end{align}
$$

## Integrale Hyperbolischer Funktionen

$$
\begin{align}
& \int \frac{1}{\sqrt{x^2-1}} d x= \begin{cases}\operatorname{arcosh} x & \text { auf }(1,+\infty), \\
-\operatorname{arcosh}(-x) & \text { auf }(-\infty,-1),\end{cases} \\
\end{align}
$$