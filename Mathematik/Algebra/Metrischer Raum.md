---
tags:
  - Algebra
aliases: 
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

Einer Menge $M$ deren Elemente auch Punkte genannt werden, wird mit der Metrik $d$ eine reelle Zahl zugeordnet, die man als Abstand zwischen diesen Punkten interpretieren kann. Eine Abbildung

$$
d: M \times M \rightarrow \mathbb{R}_0^{+}, \quad(\mathbf{x}, \mathbf{y}) \mapsto d(\mathbf{x}, \mathbf{y})
$$

heißt Metrik, wenn folgende Eigenschaften mit $\mathbf{x}, \mathbf{y}, \mathbf{z} \in M$ erfüllt sind:
(M1) Pos. [Definitheit](Definitheit.md)

$$
\begin{aligned}
& d(\mathbf{x}, \mathbf{y}) \geq 0 \\
& d(\mathbf{x}, \mathbf{y})=0 \quad \Rightarrow \quad \mathbf{x}=\mathbf{y}
\end{aligned}
$$

(M2) Symmetrie

$$
d(\mathbf{x}, \mathbf{y})=d(\mathbf{y}, \mathbf{x})
$$

(M3) [Dreiecksungleichung](Betrag.md)

$$
d(\mathbf{x}, \mathbf{y}) \leq d(\mathbf{x}, \mathbf{z})+d(\mathbf{z}, \mathbf{y})
$$


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


Die durch die Norm induzierte Metrik besitzt zusätzlich die Eigenschaften:
$$
\begin{aligned}
&\text{M4}&&d(\mathbf{x}+\mathbf{z}, \mathbf{y}+\mathbf{z}) =d(\mathbf{x}, \mathbf{y}) \\
&\text{M5}&&d(\alpha \mathbf{x}, \alpha \mathbf{y}) =|\alpha| d(\mathbf{x}, \mathbf{y})
\end{aligned}
$$

Die Entfernung zweier Punkte $\mathbf{x}$ und $\mathbf{y}$ im Euklidschen Raum $\mathbb{R}^n$ beträgt

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|=\sqrt{\sum_{i=1}^n\left|x_i-y_i\right|^2}
$$

und in $\mathbb{R}^1$, d.h. der Gesamtheit der reellen Zahlen, gilt

$$
d(\mathbf{x}, \mathbf{y})=\|\mathbf{x}-\mathbf{y}\|=|x-y|
$$


