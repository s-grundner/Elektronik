---
aliases:
  - Folgen
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 24th March 2022
---

# Folgen

## Darstellung von Folgen

> [!INFO] *Term Darstellung* einer Folge:  
> Angabe eines Terms (einer "Formel"), wie das Glied $a_{n}$ formelmäßig aus dem *index n* berechnet werden kann.  
>
> $$c_{n} = \frac{n}{n+1}$$

> [!INFO] *rekursive Darstellung* einer Folge ([rekursiv](../Softwareentwicklung/DS-Algo/Rekursion.md) = zurücklaufend):  
> Angabe, wie das Glied $a_{n}$ aus dem *vorhergehenden* Folgegliedern berechnet werden kann.  
>
> $$x_{1} = 1\qquad x_{n+1}=x_{n}+\frac{3}{x_{n}}$$

## Konvergente Folgen

![Grenzwert](Grenzwert.md)

> [!EXAMPLE] Beispiel: $\left\langle  x_{n} = 1- \frac{1}{n}, n \in \mathbb{N}^*  \right\rangle = \langle 0;\frac{1}{2};\frac{2}{3}; \frac{3}{4}; \frac{4}{5} \dots \frac{1}{n+1}\rangle$
> - Abstand des $n$-ten Folgeglieds von $1$ ist $\frac{1}{n}$
> - Man nennt $1$ den *[Grenzwert](mathe%20(3)/Grenzwert.md)* der Folge $\langle 1-\frac{1}{n}\rangle$ und sagt, dass die Folge gegen $1$ strebt.
> - $x_{n} \to 1$ für $n\to \infty$

> [!EXAMPLE] $\langle a_{n} = \frac{1}{n}, n \in \mathbb{N}^*$  
> $g = \lim_{ n \to \infty } a_{n} = 0\qquad \varepsilon \dots$ beliebig kleine Zahl $> 0$
>
> $$
> \begin{align}
> |g-a_{n}| &< \varepsilon \\
> |a_{n} -g | &< \varepsilon \\
> \frac{1}{n} - 0 &< 0 \\
> \frac{1}{ n} < \varepsilon &\to n>\frac{1}{\varepsilon}
> \end{align}
> $$

> [!EXAMPLE] $\langle \frac{n}{2n+1}; n \in \mathbb{N}\rangle \qquad g = ?$  
> $\langle 0; \frac{1}{3}; \frac{2}{5}; \frac{3}{7}; \frac{4}{9}; \dots \frac{1000}{2001} \dots \rangle$
> 
> *Trick: jeden Summanden durch die höchste [Potenz](Potenzen.md) von $n$ dividieren*
>
> $\lim_{ n \to \infty } \dfrac{n}{2n+1} = \lim_{ n \to \infty } \dfrac{\frac{n}{n}}{\frac{2n}{n}+\underset{\to 0}{\frac{1}{n} }} = \lim_{ n \to \infty } \dfrac{1}{2+0} =\dfrac{1}{2}$

# Tags