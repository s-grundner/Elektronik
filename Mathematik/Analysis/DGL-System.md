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

Um **Differenzialgleichungen** *höherer* Ordnung leichter lösen zu können, kann diese in ein **System aus Differenzialgleichungen** *erster* Ordnung überführt werden. 

> [!info] Jede DGL n-ter Ordnung lässt sich in ein DGL-System 1. Ordnung überführen
> $$
> \underbrace{ F(t,x,x',\dots,x^{(n)})=0 }_{ \text{implizite DGL n-ter Ordnung} }\quad \iff \begin{cases}
> x&:= z_{1} \\
> x'&:= z_{2}=z_{1}' \\
> x''&:= z_{3}=z_{2}' \\
> \quad&\vdots  \\ 
> x^{(n-1)}&:= z_{n}=z_{n-1}' \\
> x^{(n)} &:= z_{n}'
> \end{cases}\iff \underbrace{ \mathbf{z}'=F(t,\mathbf{z}) }_{ \text{explizites DGL-System 1. Ordnung} }
> $$
> 

> [!success] Hierfür wird ein Hilfsvektor $\mathbf{z}$ mit den **Hilfsfunktionen** $z_{k}$ eingeführt.
> Man erhält durch die Setzung 
$$ z_{k}:=x^{(k-1)}, \quad k= 1,\dots,n$$
folgendes Differenzialgleichungs-System **erster** Ordnung:
> 
> $$z_{k}'=z_{k+1}, \quad  k=1, \dots,n-1$$
> 

Hat man Dieses DGL-System erster Ordnung aufgestellt, so kann man es mit Ansätzen lösen. Der Ansatz kann je nach Art des DGL-Systems aufgestellt werden:

- [Lineare DGL n-ter Ordnung](Lineare%20DGL%20n-ter%20Ordnung.md)
- [Lineare DGL-Systeme](Lineare%20DGL-Systeme.md)
- [Lineare DGL-Systeme mit konstanten Koeffizienten](Lineare%20DGL-Systeme%20mit%20konstanten%20Koeffizienten.md)

---

# Beispiele

>[!example] Allgemeines Beispiel
> 1. DGL $n$-ter Ordnung: (hier linear)
> $$x^{(n)}+\alpha_n x^{(n-1)}+\ldots+\alpha_3 \ddot{x}+\alpha_2 \dot{x}+\alpha_1 x=u$$
> 
> 2. Substitutionen:
> 
> $$
> \begin{aligned}
> x_1 & =x \\
> x_2 & =\dot{x}_1=\dot{x} \\
> x_3 & =\dot{x}_2=\ddot{x} \\
> \vdots & =\vdots \\
> x_{n-1} & =\dot{x}_{n-2}=x^{(n-2)} \\
> x_n & =\dot{x}_{n-1}=x^{(n-1)}
> \end{aligned}
> $$
> 
> 3. Ergebnis DGL-System: hat die Form wie in [Lineare DGL n-ter Ordnung](Lineare%20DGL%20n-ter%20Ordnung.md)
> 
> $$
> \begin{aligned}
> \dot{x}_1 & =x_2 \\
> \dot{x}_2 & =x_3 \\
> \ldots & =\ldots \\
> \dot{x}_{n-1} & =x_n \\
> \dot{x}_n & =-\alpha_n x_n-\ldots-\alpha_3 x_3-\alpha_2 x_2-\alpha_1 x_1+u
> \end{aligned}
> $$
> 


>[!example] DGLS001:
> Überführen Sie die folgenden Differentialgleichungen in ein (falls möglich explizites) Differentialgleichungssystem erster Ordnung.
> 
> $$y^{(4)}(x)+4 y(x)=1+x+x^2$$

> [!success]- Lösung
> 
> $F\left(x, y, y^{(4)}\right)=0=y^{(4)}(x)+4 y(x)-x^2-x-1$
> 
> Setze $z_k:=y^{(k-1)}, k=1,2,3,4$ mit $z_{k}'=z_{k+1}$, $k=1,2,3$
> dann ergibt sich der Hilfsvektor $\mathbf{z} = (z_{1},z_{2},z_{3},z_{4})$:
> 
> $$
> \begin{array}{ll}
> \underline{ \text{Hilfsvektor} }  & \underline{ \text{GLS} }\\
> z_1:=y & z_1':=z_2 \\
> z_2:=y' & z_2':=z_3 \\
> z_3:=y'' & z_3':=z_4 \\
> z_4:=y''' & z_4' = y^{(4)} \gets \boxed{ -4z_{1}+x^{2}+x+1 } \\
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

> [!success]- Lösung
> 
> $F(x,y,y'',y''')=0=y'' y'''+3 y'' y'+y-4 \sin (x)$
> 
> Setze $z_k=y^{(k-1)},\, k=1,2,3$ mit $z_k'=z_{k+1},\,k=1,2$,
> dann ergibt sich der Hilfsvektor $\mathbf{z} := (z_{1},z_{2},z_{3})$:
> 
> $$
> \begin{array}{ll} 
> \underline{ \text{Hilfsvektor} } & \underline{ \text{GLS} } \\
> z_1=y & z_1'=z_2 \\
> z_2=y' & z_2'=z_3 \\
> z_3=y'' & z_3'=y'''\gets \boxed{ -\frac{z_{1}}{z_{3}}-3z_{2}+\frac{4\sin(x)}{z_{3}} }
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
> z_{3}'&=\boxed{ -\frac{z_{1}}{z_{3}}-3z_{2}+\frac{4\sin(x)}{z_{3}}}
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
> \end{pmatrix}\cdot \mathbf{z} + \begin{pmatrix}
> 0 \\ 0 \\ \frac{4\sin(x)}{z_{3}}
> \end{pmatrix}
> $$
> 

>[!example] DGLS003
>
> Seien $f_1, f_2: \mathbb{R}^2 \rightarrow \mathbb{R}$. Überführen Sie das Differentialgleichungssystem
> 
> $$
> x''(t)=f_1(x(t), y(t)), \quad y''(t)=f_2(x(t), y(t))
> $$
> 
> in ein Differentialgleichungssystem erster Ordnung.
> Schreiben Sie im Falle
> 
> $$
> f_1(x, y)=3 x+4 y+1, \quad f_2(x, y)=x-2 y-1
> $$
> 
> das erhaltene System in [Matrix](Algebra/Matrix.md)-[Vektor](../Algebra/Vektor.md)-Form.

> [!success]- Lösung
> 
> $$
> \begin{aligned}
> x''(t)&=f_1(x(t), y(t))=3 x+4 y+1 &&\implies F_{1}(y,x,x'')=0=x''-3 x-4 y-1 \\
> y''(t)&=f_2(x(t), y(t))=x-2 y-1 &&\implies F_{2}(x,y,y'')=0=y''-x+2 y+1
> \end{aligned}
> $$
> 
> Der Hilfsvektor wird für beide gleichungen definiert wie:
> 
> $$
> \begin{array}{ll}
> \text{Hilfsvekor}  & \text{GLS}\\
> z_1=x & z_1'=z_2 \\
> z_2=x' & z_2'= x'' \gets \boxed{ 3z_{1}+4z_{3}+1 } \\
> z_3=y & z_3'=z_4 \\
> z_4=y' & z_4'= y'' \gets \boxed{  z_{1}-2z_{3}+1  }
> \end{array}
> $$
> 
> Die Gleichung für $z_{2}'$ ergibt sich durch Einsetzen des Hilfsvektors $\mathbf{z}$ in $F_{1}(y,x,x'')$:
> 
> $$
> \begin{aligned}
> 0&=x''-3 x-4 y-1  \\
> 0&=z_{2}'-3z_{1}-4z_{3}-1 \\
> z_{2}' &=\boxed{ 3z_{1}+4z_{3}+1  }
> \end{aligned}
> $$
> 
> Die Gleichung für $z_{4}'$ ergibt sich durch Einsetzen des Hilfsvektors $\mathbf{z}$ in $F_{2}(x,y,y'')$:
> 
> $$
> \begin{align}
> 0&=y''-x+2 y+1 \\
> 0&=z_{4}'-z_{1}+2z_{3}+1 \\
> z_{4}'&=\boxed{ z_{1}-2z_{3}+1 }
> \end{align}
> $$
> 
> Es ergibt sich das lineare Gleichungssystem
> 
> $$
> \frac{d}{dt}\mathbf{z} = \begin{pmatrix}
> 0 & 1 & 0 & 0 \\
> 3 & 0 & 4 & 0 \\
> 0 & 0 & 0 & 1 \\
> 1 & 0 & -2 & 0
> \end{pmatrix}\cdot \mathbf{z} + \begin{pmatrix}
> 0 \\ 1 \\ 0 \\ -1
> \end{pmatrix}
> $$