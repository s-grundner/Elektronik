---
tags: 
aliases:
  - Definition 4.31
  - Bemerkung 4.32
keywords: 
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 29. September 2024
professor:
---
 

# Trigonometrische Funktionen

> [!important] **Definition 4.31**: Die trigonometrischen Funktionen sind definiert wie:
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

- Die Funktion $\sin(x)$ eingeschränkt auf das Intervall $\left[-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right]$ streng monoton wachsend
- und die Funktion $\cos (x)$ eingeschränkt auf das Intervall $[0, \pi]$ streng monoton fallend, jeweils mit Bild $[-1,1]$. 

- Analog gilt, dass die Funktion $\tan (x)$ das Intervall $\left(-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right)$ streng monoton wachsend und [bijektiv](Algebra/Abbild.md) nach $\mathbb{R}$ abbildet.


## Winkelsätze

> Bemerkung 4.32

$$
\begin{gather}

\sin (k \pi)= 0 =\cos \left(\frac{\pi}{2}+k \pi\right),\qquad k \in \mathbb{Z} \\
\cos (0) =\sin \left(\frac{\pi}{2}\right)=1 \qquad\cos (\pi) = \sin \left(\frac{3 \pi}{2}\right)=-1 \\
\end{gather}
$$

### Symmetrie

$$
\begin{aligned}
\sin (-x)= & -\sin x & \cos (-x) & =\cos x \\
\sin \left(x+\frac{\pi}{2}\right)= & \cos x & \cos \left(x+\frac{\pi}{2}\right) & =-\sin x \\
\sin (x+\pi)= & -\sin x & \cos (x+\pi) & =-\cos x \\
\sin (x+2 \pi)= & \sin x & \cos (x+2 \pi) & =\cos x \\
\end{aligned}
$$
### Pythagoras

$$
\sin ^{2} x+\cos ^{2} x=1
$$

$$
\begin{align} 
\cos (2 x) & =\cos ^2(x)-\sin ^2(x) & \sin (2 x) & =2 \sin (x) \cos (x) \\
1+\cos (2 x) & =2 \cos ^2(x) & 1+\sin (2 x) & =(\sin (x)+\cos (x))^2 \\
1-\cos (2 x) & =2 \sin ^2(x) & 1-\sin (2 x) & =(\sin (x)-\cos (x))^2
\end{align} 
$$
### Summensätze
$$
\begin{aligned}
\sin (x+y) & =\sin x \cos y+\cos x \sin y \\
\cos (x+y) & =\cos x \cos y-\sin x \sin y \\
\end{aligned}
$$
### Additionstheoreme

$$
\begin{align}
\sin x-\sin y & =2 \cos \left(\frac{x+y}{2}\right) \sin \left(\frac{x-y}{2}\right) \\
\sin x+\sin y & =2 \sin \left(\frac{x+y}{2}\right) \cos \left(\frac{x-y}{2}\right) \\
\cos x-\cos y & =-2 \sin \left(\frac{x+y}{2}\right) \sin \left(\frac{x-y}{2}\right) \\
\cos x+\cos y & =2 \cos \left(\frac{x+y}{2}\right) \cos \left(\frac{x-y}{2}\right)
\end{align}
$$

### Produkte von Winkelfunktionen

$$
\begin{aligned}
& \sin x \sin y=\frac{1}{2}(\cos (x-y)-\cos (x+y)) \\
& \cos x \cos y=\frac{1}{2}(\cos (x-y)+\cos (x+y)) \\
& \sin x \cos y=\frac{1}{2}(\sin (x-y)+\sin (x+y)) \\
& \tan x \tan y=\frac{\tan x+\tan y}{\cot x+\cot y}=-\frac{\tan x-\tan y}{\cot x-\cot y} \\
& \cot x \cot y=\frac{\cot x+\cot y}{\tan x+\tan y}=-\frac{\cot x-\cot y}{\tan x-\tan y} \\
& \tan x \cot y=\frac{\tan x+\cot y}{\cot x+\tan y}=-\frac{\tan x-\cot y}{\cot x-\tan y}
\end{aligned}
$$


## Arkusfunktionen

Es gibt daher jeweils Umkehrfunktionen, genannt Arkusfunktionen:

$$
\begin{align}
\text{Arkussinus}&\quad \arcsin :[-1,1] \rightarrow\left[-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right] \\
\text{Arkuscosinus}&\quad\arccos :[-1,1] \rightarrow[0, \pi]\\
\text{Arkustangens}&\quad\arctan : \mathbb{R} \rightarrow\left(-\dfrac{\pi}{2}, \dfrac{\pi}{2}\right)
\end{align}
$$

## Integrale

$$

$$
