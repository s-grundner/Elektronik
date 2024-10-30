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

> [!info] Jede DGL $n$-ter Ordnung lässt sich in ein DGL-System überführen
> $$
> F(t,x,x',\dots,x^{(n)})=0\quad \iff \begin{cases}
> z_{1}=z' \\
> z_{2}=z_{1}' \\
> \quad\vdots  \\
> z_{n} = z_{n-1}' \\
> \end{cases}
> $$
> 

> [!success] Hierfür wird ein Hilfsvektor $\mathbf{z}$ mit den **Hilfsfunktionen** $z_{k}$ eingeführt.
> Man erhält durch die Setzung 
$$ z_{k}:=x^{(k-1)}, \quad k= 1,\dots,n$$
folgendes Differenzialgleichungs-System **erster** Ordnung:
> 
> $$ 
> \begin{gather}
> z_{k}'=z_{k+1}, \quad  k=1, \dots,n-1 \\
> F(t,z_{1},\dots,z_{n},z_{n}')  =0
> \end{gather}
> $$
> 

## Lineare DGL-Systeme 1. Ordnung

vorher: $x' f(t,\bar{x})$

jetzt: $\underbrace{ x' \overset{(*)}{=} A(t)x+b(t) }_{ \text{lin. DGL-System} }, \quad t \in I\quad I\dots\text{(Intervall)}$

> [!important] Falls $b=0$, dann heißt $(*)$ ein **homogenes DGL-System**, ansonsten **inhomogen**

$$
A(t)=(a_{ij}(t))^m_{i,j=1}, \quad b(t)= (b_{i}(t))_{i=1}^{m}
$$

Man kann den Satz von Picad von Picard Lindelöf auf das DGL-System erster ordnung anwenden

- $f(t,x)$ ist definiert auf $I\times \mathbb{R}^m$
- $K \subseteq I$ ... $K$ ist ein abgeschlossenes Teilintervall


$$
\lVert f(t,x)-\bar{f}(t,y) \rVert = \lVert  \rVert 
$$

$$
\begin{align}
A(t)\cdot z &= \left( \sum_{j=1}^{m} a_{ij}(t)\cdot z_{j} \right)^m _{i=1} \\
\lVert A(t)\cdot z \rVert =\max
\end{align}
$$

> [!quote] Nach der globalen Version des Satz von Picard Lindelöf hat also ein Lineares DGL-System für $\forall t\in I$ eine Eindeutige Lösung

### Homogene Gleichung

Seien $x_{1},x_{2}\quad I\to \mathbb{R}^{m}$ zwei Lösungen von $x'A(t)\cdot x$, mit Zahlen $\lambda_{1}, \lambda_{2}$, dann gilt:
$$
\begin{align}
(\lambda_{1}x_{1}+\lambda_{2} x_{2})'= \lambda_{1}\cdot x_{1}'+\lambda_{2}\cdot x_{2}' \\
=
\end{align}
$$

### Inhomogene Gleichung

Seien $x_{1},x_{2}$ Lösungen der inhomogenen Gleichung $(*)$

$$
\begin{align}
(x_{1}-x_{2})' = x_{1}'-x_{2}'= A(t)x_{1} +b(t)-(A(t)x_{2}+b(t))
\end{align}
$$

Die diferenz zweier Lösungen der inhomogenen Gleichugn  $x'= A(t)x+b(t)$ ist die Lösung der homogenen Gleichung $x'=A(t)x$.

Das heißt, jede Lösung der inhomogenen Gleichung kann man schreiben als Summe **einer** fixen partikulären Lösung $x_{p}$ von $x'=A(t)x+b(t)$ und einer Lösung $x_{h}$ der homogenen Gleichung.

$$
x_{2}= \underbrace{ x_{1} }_{ x_{p} }+(\underbrace{ x_{2}-x_{1} }_{ x_{h} })
$$

Daraus folgt,  wenn die Anfangswerte $x_{0,1},\dots x_{0,k}\in\mathbb{R}^{m}$ liner unabhängig sind, dann sind auch die dazugehörigen eindeutigen Lösungen $x_{1},\dots x_{k}$ linear unabhängig


> [!important] Satz 6.1 Die Lösung von $x'= A(t)x$ bilden einen $m$-dimensionalen Vektorraum
> 


> [!question] Wie kommt man von der [[Fundamentalmatrix]] $X(t)$ auf eine partikuläre Lösung $x_{p}$ vom $\dot{x}=A(t)x+b(t)$
> mit [Variation der Konstanten](Algebra/Variation%20der%20Konstanten.md)
> - Die konstante $c$ wird zu $c(t)$

[Transformation in DGL-Systeme 1. Ordnung](https://studyflix.de/mathematik/transformation-in-system-1-ordnung-943)

--- 

# Beispiele

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
> das erhaltene System in [Matrix](Algebra/Matrix.md)-[Vektor](Analysis/Vektor.md)-Form.

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