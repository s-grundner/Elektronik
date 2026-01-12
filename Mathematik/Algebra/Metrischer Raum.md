---
tags:
  - Algebra
  - Axiome/Metrik
aliases:
  - Metrik
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 22. Oktober 2024
professor: 
axiome:
  - M1
  - M2
  - M3
  - M4
  - M5
---
 

# Metrischer Raum

Einer Menge $M$ deren Elemente auch Punkte genannt werden, wird mit der Metrik $d$ eine reelle Zahl zugeordnet, die man als Abstand zwischen diesen Punkten interpretieren kann.

> [!important]  Eine Abbildung $d$
> $$ d: M \times M \rightarrow \mathbb{R}_0^{+}, \quad(\mathbf{x}, \mathbf{y}) \mapsto d(\mathbf{x}, \mathbf{y})$$
> heißt Metrik, wenn folgende Eigenschaften mit $\mathbf{x}, \mathbf{y}, \mathbf{z} \in M$ erfüllt sind:
>
> **(M1)** Pos. [Definitheit](Definitheit.md)
> 
> $$
> \begin{aligned}
> & d(\mathbf{x}, \mathbf{y}) \geq 0 \\
> & d(\mathbf{x}, \mathbf{y})=0 \quad \Rightarrow \quad \mathbf{x}=\mathbf{y}
> \end{aligned}
> $$
> 
> **(M2)** Symmetrie
> 
> $$
> d(\mathbf{x}, \mathbf{y})=d(\mathbf{y}, \mathbf{x})
> $$
> 
> **(M3)** [Dreiecksungleichung](Betrag.md)
> 
> $$
> d(\mathbf{x}, \mathbf{y}) \leq d(\mathbf{x}, \mathbf{z})+d(\mathbf{z}, \mathbf{y})
> $$
> 

Eine Menge von Elementen $M$ zusammen mit der Metrik $d$, geschrieben als $(M, d)$, heißt metrischer Raum (Achtung: nicht notwendigerweise auch ein linearer Raum).

>[!question] Was bedeuted Abstand?
> - Muss nicht unbedingt die länge sein.
> - z.B. Wenn die Menge $M$ alle Studenten im Hörsaal sind dann kann der Abstand der Elemente:
>     - Farbe des T-Shirts, Geschlecht

## Induzierte Metrik

Ein normierter Vektorraum $V$ ist ebenfalls ein metrischer Raum, mit der durch die Norm des Differenzenvektors induzierten Metrik, wobei $\mathbf{x}, \mathbf{y} \in V$.

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|
$$


> [!important] Die durch die Norm induzierte Metrik besitzt zusätzlich die Eigenschaften:
> 
> - (M4) Bei gleicher verschiebung bleibt der Abstand gleich
> 
> $$d(\mathbf{x}+\mathbf{z}, \mathbf{y}+\mathbf{z}) =d(\mathbf{x}, \mathbf{y}) $$
> 
> - (M5) Bei gleicher skalierung bleibt der Abstand gleich
> 
> $$d(\alpha \mathbf{x}, \alpha \mathbf{y}) =|\alpha| d(\mathbf{x}, \mathbf{y})$$
> 

Die Entfernung zweier Punkte $\mathbf{x}$ und $\mathbf{y}$ im Euklidschen Raum $\mathbb{R}^n$ beträgt

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|=\sqrt{\sum_{i=1}^n\left|x_i-y_i\right|^2}
$$

und in $\mathbb{R}^1$, d.h. der Gesamtheit der reellen Zahlen, gilt

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|=|x-y|
$$

## Minkowski Abstand

Der Minkowski-Abstand $p$-ter Ordnung oder -Metrik ( $p \geq 1$ ) zwischen zwei Punkten x und y im $\mathbb{R}^n$ ist definiert als

$$
d(\mathbf{x}, \mathbf{y})=\left(\sum_{i=1}^n\left|x_i-y_i\right|^p\right)^{\frac{1}{p}}
$$


Für $p=1$ folgt daraus die '**Manhatten**'- oder '**Taxicab**'-Metrik

$$
d(\mathbf{x}, \mathbf{y})=\left|x_1-y_1\right|+\left|x_2-y_2\right|+\ldots+\left|x_n-y_n\right|
$$

![invert_dark|500](../../_assets/Pasted%20image%2020241022103316.png)


Für $p=2$ folgt wieder der Euklidsche Abstand

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|=\sqrt{\sum_{i=1}^n\left|x_i-y_i\right|^2}
$$


Für $p \rightarrow \pm \infty$ folgt im Grenzübergang der Tschebyscheff-Abstand

$$
\lim _{p \rightarrow \infty}\left(\sum_{i=1}^n\left|x_i-y_i\right|^p\right)^{\frac{1}{p}}=\max _{1 \leq i \leq n}\left|x_i-y_i\right| \quad \text { bzw. } \quad \lim _{p \rightarrow-\infty}\left(\sum_{i=1}^n\left|x_i-y_i\right|^p\right)^{\frac{1}{p}}=\min _{1 \leq i \leq n}\left|x_i-y_i\right|
$$


Für $p<1$ ist der Minkowski-Abstand keine Metrik