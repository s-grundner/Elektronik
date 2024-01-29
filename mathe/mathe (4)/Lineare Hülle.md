---
tags: 
aliases:
  - linearen Hüllen
  - linear kombination
  - linear abhängig
  - linear unabhängig
  - erzeugendensystem
keywords: 
subject:
  - Mathematik1
  - "357.100"
semester:
  - WS23
created: 27. Dezember 2023
professor:
---
 

# Lineare Hülle

![](assets/Pasted%20image%2020240129180934.png)  
![](assets/Pasted%20image%2020240129180921.png)

Um die [Vektoren](../mathe%20(3)/Vektor.md) $v_{1},v_{2},\dots,v_{n}\in V$

 auf lineare Abhängigkeit bzw. lineare Unabhängigkeit zu Prüfen, ist die Gleichung (bzw. das daraus resultierende [LGS](../mathe%20(3)/Lineare%20Gleichungssysteme.md))

$$
\lambda_{1}\cdot v_{1}+\lambda_{2}\cdot v_{2}\dots+\lambda_{n}\cdot v_{n}= \vec{o}
$$

Mit noch unbekannten Koeffizienten $\lambda_{1},\lambda_{2},\dots\lambda_{n}\in K$

 zu lösen.

Das LGS kann man auch als Matrix anschrieben:

$$
\begin{pmatrix}
\vec{v}_{1} & \vec{v}_{2} & \cdots  & \vec{v}_{n}
\end{pmatrix}\cdot \begin{pmatrix}
\lambda_{1} \\ \lambda_{2} \\ \vdots \\ \lambda_{n}
\end{pmatrix} = \begin{pmatrix}
0 \\ 0 \\ \vdots \\ 0
\end{pmatrix}
$$

> [!example] Beispiel.  
>
> Überprüfen Sie, ob die drei Zeilenvektoren $(1,2,1),(3,1,5),(3,-4,7)$, welche Elemente des $\mathbb{R}$ -Vektorraumes $\left(\mathbb{R}_n,+, \cdot\right)$ sind, linear unabhängig sind.
> 
> *Lösung: Wir setzen an*
> $$
\begin{aligned}
\vec{0} & =\lambda_1 \cdot \vec{z_1}+\lambda_2 \cdot \vec{z_2}+\lambda_3 \cdot \vec{z_3} \\
\Rightarrow \quad(0,0,0) & =\lambda_1 \cdot(1,2,1)+\lambda_2 \cdot(3,1,5)+\lambda_3 \cdot(3,-4,7) \\
\Rightarrow \quad(0,0,0) & =\left(\lambda_1+3 \lambda_2+3 \lambda_3, 2 \lambda_1+\lambda_2-4 \lambda_3, \lambda_1+5 \lambda_2+7 \lambda_3\right)
\end{aligned}
> $$

> [!success] Lösung
$$
\begin{align}

\left(\begin{array}{ccc|c}
1 & 3 & 3 & 0 \\
2 & 1 & -4 & 0 \\
1 & 5 & 7 & 0
\end{array}\right)
\begin{aligned}
\cdot 2 \\ \\ \cdot 2 \\
\end{aligned}&\to
\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
2 & 1 & -4 & 0 \\
2 & 10 & 14 & 0
\end{array}\right)
\\

\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
0 & 5 & 10 & 0 \\
0 & 4 & 8 & 0
\end{array}\right)
\begin{aligned}
\\ \cdot 4 \\ \cdot 5
\end{aligned}&\to
\left(\begin{array}{ccc|c}
2 & 6 & 6 & 0 \\
0 & 20 & 40 & 0 \\
0 & 20 & 40 & 0
\end{array}\right)
\end{align}
$$