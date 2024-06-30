---
tags:
  - Numerik
aliases:
  - dividierte Differenz
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 27. Juni 2024
professor: 
cited:
---
 

# Newton Polynom

> [!info] Man verwendet dann besser die Darstellung des Interpolationspolynoms durch das sogenannte Newton-Polynom:
> $$ P(x):=a_0+a_1\left(x-x_0\right)+a_2\left(x-x_0\right)\left(x-x_1\right)+\ldots+a_n\left(x-x_0\right) \cdots\left(x-x_{n-1}\right) $$

Mit Hilfe der Interpolationsbedingung $P\left(x_i\right)=f_i, i=0, \ldots, n$, erhält man die Koeffizienten $a_0, \ldots, a_n$ aus folgendem gestaffelten linearen System:
$$
\begin{array}{lll}
a_0 & = & f_0 \\
a_0+a_1\left(x_1-x_0\right) & = & f_1 \\
\quad \vdots & & \vdots \\
a_0+a_1\left(x_n-x_0\right)+\ldots+a_n\left(x_n-x_0\right) \cdots\left(x_n-x_{n-1}\right) & = & f_n
\end{array}
$$

> [!important] Die Koeffizienten des Newton-Polynoms können effizient berechnet werden wie folgt:
> 
> Satz 16.9. Sei $P_{i, \ldots, i+k}$ das Polynom höchstens $k$-ten Grades mit $P_{i, \ldots, i+k}\left(x_j\right)=f_j$ für $j=i, \ldots, i+k$. Dann gilt:
> $$ P_{i, \ldots, i+k}(x)=f\left[x_i\right]+f\left[x_i, x_{i+1}\right]\left(x-x_i\right)+\ldots+f\left[x_i, \ldots, x_{i+k}\right]\left(x-x_i\right) \cdots\left(x-x_{i+k-1}\right) $$
> 
> Die $f[\ldots]$ heißen *dividierte* *Differenzen* und sind wie folgt definiert:
$$ f\left[x_i\right]:=f_i \quad \wedge \quad f\left[x_i, \ldots, x_{i+k}\right]:=\frac{f\left[x_{i+1}, \ldots, x_{i+k}\right]-f\left[x_i, \ldots x_{i+k-1}\right]}{x_{i+k}-x_i} $$
> 
> > Dabei gilt: $i \in\{0, \ldots n\}$ und $k \in\{0, \ldots, n-i\}$.
## Beispiele

Beispiel 16.10. Gesucht ist das Interpolationspolynom $P$ höchstens zweiten Grades zu den Werten $(0,0),\left(\frac{\pi}{2}, 1\right)$ und $(\pi, 0)$. Für die dividierten Differenzen ergeben sich folgende Werte:

![](assets/Pasted%20image%2020240627120709.png)

Damit erhalten wir in Newtonschreibweise für das Interpolationspolynom:
$$
P(x)=0+\frac{2}{\pi}\left(x-x_0\right)-\frac{4}{\pi^2}\left(x-x_0\right)\left(x-x_1\right)=\frac{2}{\pi} x-\frac{4}{\pi^2} x\left(x-\frac{\pi}{2}\right)
$$

--- 

Ermitteln Sie für die Stützpunkte $(0,1),(1,1),(2,3),(3,2),(4,1),(5,0)$ das Newtonsche Interpolationspolynom und stellen Sie die Datenpunkte sowie das Polynom graphisch dar.

![](assets/Pasted%20image%2020240627121122.png)