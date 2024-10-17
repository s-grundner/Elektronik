---
tags: 
aliases:
  - Differenzialgleichungssystem
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 17. Oktober 2024
professor:
---
 

# DGL System

Um Differenzialgleichungen höherer Ordnung leichter lösen zu können, kann diese in ein System aus Differenzialgleichungen erster Ordnung überführt werden. 

> [!info] Jede DGL $n$-ter Ordnung lässt sich in ein [[DGL-System]] überführen
> $$
> F(t,x,x',\dots,x^{(n)})=0\quad \iff \begin{cases}
> z_{1}=z' \\
> z_{2}=z_{1}' \\
> \quad\vdots  \\
> z_{n} = z_{n-1}' \\
> \end{cases}
> $$
> 

Hierfür wird ein Hilfsvektor $\mathbf{z}$ mit den **Hilfsfunktionen** $z_{k}$ eingeführt. Man erhält durch die Setzung 
$$ z_{k}:=x^{(k-1)}, \quad k= 1,\dots,n$$
folgendes Differenzialgleichungs-System **erster** Ordnung:

$$ 
\begin{align}
z_{k}'&=z_{k+1}, \quad  k=1, \dots,n-1 \\
F(t,z_{1},\dots,z_{n},z_{n}') & =0
\end{align}
$$

---

[Transformation in DGL-Systeme 1. Ordnung](https://studyflix.de/mathematik/transformation-in-system-1-ordnung-943)

--- 

# Beispiele

>[!example] DGLS001:
> Überführen Sie die folgenden Differentialgleichungen in ein (falls möglich explizites) Differentialgleichungssystem erster Ordnung.
> 
> $$y^{(4)}(x)+4 y(x)=1+x+x^2$$

> [!success]+ Lösung
> 
> $F\left(x, y, y^{(4)}\right)=0=y^{(4)}(x)+4 y(x)-x^2-x-1$
> 
> Setze $z_k:=y^{(k-1)}, k=1,2,3,4$ mit $z_{k}'=z_{k+1}$, $k=1,2,3$
> dann ergibt sich der Hilfsvektor $\mathbf{z} = (z_{1},z_{2},z_{3},z_{4})$:
> 
> $$
> \begin{array}{cc}
> \underline{ \text{Hilfsvektor} }  & \underline{ \text{GLS} }\\
> z_1:=y & z_1':=z_2 \\
> z_2:=y' & z_2':=z_3 \\
> z_3:=y'' & z_3':=z_4 \\
> z_4:=y''' & z_4' = y^{(4)} \\
> \end{array}
> $$
> 
> Die Gleichung für $z_{4}'$ ergibt sich durch Einsetzen des Hilfsvektors $\mathbf{z}$ in $F(x,y,y^{(4)})$:
> 
> $$
> \begin{align}
> 0 &=y^{(4)}(x)+4 y(x)-x^2-x-1 \\
> 0 &= z_{4}'+4z_{1}-x^{2} -x -1 \\
> z_{4}' &= \boxed{ -4z_{1}+x^{2}+x+1 }
> \end{align}
> $$
> 
> Es ergibt sich das Gleichungssystem:
> 
> $$
> \begin{align}
> \frac{d}{dx} \mathbf{z} = \begin{pmatrix}
>  0 & 1 & 0 & 0 \\
>  0 & 0 & 1 & 0 \\
>  0 & 0 & 0 & 1 \\
> -4 & 0 & 0 & 0
> \end{pmatrix} \cdot \mathbf{z} + \begin{pmatrix}
> 0 \\ 0 \\ 0 \\ x^{2}+x+1
> \end{pmatrix}
> \end{align}
> $$

>[!example] DGLS002:
> Überführen Sie die folgenden Differentialgleichungen in ein (falls möglich explizites) Differentialgleichungssystem erster Ordnung.
> $$y'' y'''+3 y'' y'+y=4 \sin (x)$$
> 

> [!success]+ Lösung
> 
> $F(x,y,y'',y''')=0=y'' y'''+3 y'' y'+y-4 \sin (x)$
> 
> Setze $z_k=y^{(k-1)},\, k=1,2,3$ mit $z_k'=z_{k+1},\,k=1,2$,
> dann ergibt sich der Hilfsvektor $\mathbf{z} := (z_{1},z_{2},z_{3})$:
> 
> $$
> \begin{array}{cc} 
> \underline{ \text{Hilfsvektor} } & \underline{ \text{GLS} } \\
> z_1=y & z_1'=z_2 \\
> z_2=y' & z_2'=z_3 \\
> z_3=y'' & z_3'=y'''
> \end{array}
> $$
> 
> Die Gleichung für $z_{3}'$ ergibt sich durch Einsetzen des Hilfsvektors $\mathbf{z}$ in $F(x,y,y'',y''')$:
> 
> $$
> \begin{align}
> 0 &= y'' y'''+3 y'' y'+y-4 \sin (x) \\
> 0 &= z_{3}z_{3}'+3z_{3}z_{2}+z_{1}-4\sin(x) \\
> z_{3}z_{3}'&= -3z_{3}z_{2}-z_{1}+4\sin (x) \\
> z_{3}'&=\boxed{-\frac{z_{1}}{z_{3}}-3z_{2}+\frac{4\sin(x)}{z_{3}} }
> \end{align}
> $$
> 
> Es ergibt sich das nicht lineare Gleichungssystem:
> 
> $$
> \frac{d}{dx}\mathbf{z}=
> \begin{pmatrix}
> 0 & 1 & 0 \\
> 0 & 0 & 1 \\
> -\frac{1}{z_{3}} & -3 & 0
> \end{pmatrix}\cdot \mathbf{z} = \begin{pmatrix}
> 0 \\ 0 \\ \frac{4\sin(x)}{z_{3}}
> \end{pmatrix}
> $$
> 
