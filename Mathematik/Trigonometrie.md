---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 27. September 2023
professor:
---
 

# Trigonometrie

## Hyperbolische Funktionen

> $$
> \begin{aligned}
> \cosh ^2 x-\sinh ^2 x & =1, \quad \cosh (0)=1, \quad \sinh (0)=0 \\
> \sinh (x+y) & =\sinh x \cosh y+\cosh x \sinh y \\
> \cosh (x+y) & =\cosh x \cosh y+\sinh x \sinh y \\
> \cosh (2 x) & =\cosh ^2(x)+\sinh ^2(x) \\
> \sinh (2 x) & =2 \sinh x \cosh x \\
> 2 \cosh ^2(x) & =1+\cosh (2 x) \\
> 2 \sinh ^2(x) & =\cosh (2 x)-1
> \end{aligned}
> $$

### Areafunktionen

$$
\operatorname{arsinh}: \mathbb{R} \rightarrow \mathbb{R}, \quad \text { arcosh }:[1, \infty) \rightarrow \mathbb{R}_0^{+}, \quad \operatorname{artanh}:(-1,1) \rightarrow \mathbb{R}
$$

> $$
> \begin{aligned}
> \operatorname{arsinh}(x) & =\ln \left(x+\sqrt{x^2+1}\right) \\
> \operatorname{arcosh}(x) & =\ln \left(x+\sqrt{x^2-1}\right) \\
> \operatorname{artanh}(x) & =\frac{1}{2} \ln \left(\frac{x+1}{x-1}\right)
> \end{aligned}
> $$

## Trigonometrische Funktionen

> [!important] Die trigonometrischen Funktionen sind definiert wie:
> 
> $$
> \begin{align}
> \text{Sinus} &\quad \sin : \mathbb{R} \rightarrow[-1,1] \\
> \text{Cosinus} &\quad \cos : \mathbb{R} \rightarrow[-1,1]  \\
> \text{Tangens} &\quad \tan : \mathbb{R} \backslash D_1 \rightarrow \mathbb{R}, \quad x \mapsto \frac{\sin x}{\cos x} \\
> \text{Cotangens} &\quad \cot:\mathbb{R} \backslash D_2 \rightarrow \mathbb{R}, \quad x \mapsto \frac{\cos x}{\sin x}
> \end{align}
> $$
> 
> mit $D_1:=\left\{\frac{\pi}{2}+k \pi: k \in \mathbb{Z}\right\}$ und $D_2:=\{k \pi: k \in \mathbb{Z}\}$.
> Das Argument $x \in \mathbb{R}$ entspricht dabei dem Winkel in Radiant (rad), also der Länge des Bogens am Einheitskreis.
> > [!info] **==$\pi$==** bezeichnet die halbe Länge des Einheitskreises.

![invert_dark|500](assets/Einheitskreis.png)

### Winkelsätze

> $$ \sin (k \pi)= 0 =\cos \left(\frac{\pi}{2}+k \pi\right),\qquad k \in \mathbb{Z} $$

> $$
> \begin{aligned}
> \sin (-x)= & -\sin x & \cos (-x) & =\cos x \\
> \sin \left(x+\frac{\pi}{2}\right)= & \cos x & \cos \left(x+\frac{\pi}{2}\right) & =-\sin x \\
> \sin (x+\pi)= & -\sin x & \cos (x+\pi) & =-\cos x \\
> \sin (x+2 \pi)= & \sin x & \cos (x+2 \pi) & =\cos x \\
> \end{aligned}
> $$

> $$ \sin ^{2} x+\cos ^{2} x=1$$

> $$
> \begin{aligned}
> \sin (x+y) & =\sin x \cos y+\cos x \sin y \\
> \cos (x+y) & =\cos x \cos y-\sin x \sin y \\
> \sin x-\sin y & =2 \cos \left(\frac{x+y}{2}\right) \sin \left(\frac{x-y}{2}\right) \\
> \sin x+\sin y & =2 \sin \left(\frac{x+y}{2}\right) \cos \left(\frac{x-y}{2}\right) \\
> \cos x-\cos y & =-2 \sin \left(\frac{x+y}{2}\right) \sin \left(\frac{x-y}{2}\right) \\
> \cos x+\cos y & =2 \cos \left(\frac{x+y}{2}\right) \cos \left(\frac{x-y}{2}\right)
> \end{aligned}
> $$

> $$
> \begin{aligned}
> \cos (0) & =\sin \left(\frac{\pi}{2}\right)=1 & \cos (\pi) & =\sin \left(\frac{3 \pi}{2}\right)=-1 \\
> \cos (2 x) & =\cos ^2(x)-\sin ^2(x) & \sin (2 x) & =2 \sin (x) \cos (x) \\
> 1+\cos (2 x) & =2 \cos ^2(x) & 1+\sin (2 x) & =(\sin (x)+\cos (x))^2 \\
> 1-\cos (2 x) & =2 \sin ^2(x) & 1-\sin (2 x) & =(\sin (x)-\cos (x))^2
> \end{aligned}
> $$

- Die Funktion $\sin(x)$ eingeschränkt auf das Intervall $\left[-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right]$ streng monoton wachsend
- und die Funktion $\cos (x)$ eingeschränkt auf das Intervall $[0, \pi]$ streng monoton fallend, jeweils mit Bild $[-1,1]$. 

- Analog gilt, dass die Funktion $\tan (x)$ das Intervall $\left(-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right)$ streng monoton wachsend und [bijektiv](Abbild.md) nach $\mathbb{R}$ abbildet.

### Arkusfunktionen

Es gibt daher jeweils Umkehrfunktionen, genannt Arkusfunktionen:

$$
\begin{align}
\text{Arkussinus}&\quad \arcsin :[-1,1] \rightarrow\left[-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right] \\
\text{Arkuscosinus}&\quad\arccos :[-1,1] \rightarrow[0, \pi]\\
\text{Arkustangens}&\quad\arctan : \mathbb{R} \rightarrow\left(-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right)
\end{align}
$$
