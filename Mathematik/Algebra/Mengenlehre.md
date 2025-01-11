---
tags:
  - Algebra
aliases:
  - Menge
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 4. März 2024
professor:
---
 

# Mengenlehre

Eine Menge ist eine Zusammenfassung von Objekten zu einer Gesamtheit.
Mengen können entweder

- durch einfache Aufzählung, wie z.B.

$$
M=\{1, \sqrt{3}, \pi, 11\}
$$

- oder durch die Festlegung von Eigenschaften, wie z.B.

$$
M:=\{x \mid x \text { hat die Eigenschaft } E\}
$$

definiert werden.

## Häufig verwendete Mengen

- $\emptyset$ : Leere Menge $\emptyset=\{ \}$
- $\mathbb{N}$ : Menge der natürlichen Zahlen, also $\mathbb{N}=\{1,2,3, \ldots\}$
- $\mathbb{Z}$ : Menge der ganzen Zahlen, also $\mathbb{Z}=\{\ldots,-2,-1,0,1,2, \ldots\}$
- $\mathbb{Q}$ : Menge der rationalen Zahlen, also derjenigen, die sich als Bruch $\frac{p}{q}$ mit $p, q \in \mathbb{Z}$ darstellen lassen
- $\mathbb{R}$ : Menge der reellen Zahlen, also der rationalen und irrationalen Zahlen. Irrationale Zahlen wie beispielsweise $\sqrt{2}$ oder $\pi$ lassen sich nicht als Bruch darstellen.
- $\mathbb{C}$ : Menge der komplexen Zahlen, also Zahlen der Gestalt $x+\mathrm{j} y$ mit $\mathrm{j}=\sqrt{-1}$ und $x, y \in \mathbb{R}$
- $\mathbb{K}$ : Häufig wird $\mathbb{K}$ anstelle von $\mathbb{R}$ oder $\mathbb{C}$ verwendet, wobei sich der Buchstabe $\mathbb{K}$ vom "Körper" ableitet.

Anmerkung: In der DIN wird beispielsweise $\mathbb{N}$ inklusive 0 definiert.


> [!info] Topologische Begriffe über Megen: Sei $A\subset X$
>
> 1. Für $x \in X$ und $\varepsilon>0$ heißt $U_{\varepsilon}(x):=\{y \in X:\|y-x\|<\varepsilon\}$ $\varepsilon$-*Umgebung* von $x$.
> 	- In $X=\mathbb{R}$ definieren wir auch $U_{\varepsilon}(+\infty):=\left(\frac{1}{\varepsilon},+\infty\right)$ und $U_{\varepsilon}(-\infty):=\left(-\infty,-\frac{1}{\varepsilon}\right)$.
>
> 1. $x \in A$ heißt innerer Punkt von $A: \Longleftrightarrow \exists \varepsilon>0: U_{\varepsilon}(x) \subset A$
> 	- $A^{\circ}:=\{x \in A: x$ innerer Punkt von $A\}$ heißt *Inneres* von $A$.
>
> 1. $x \in X$ heißt Häufungspunkt von $A: \Longleftrightarrow \forall \varepsilon>0:\left(U_{\varepsilon}(x) \backslash\{x\}\right) \cap A \neq \emptyset$
> 	 - Für $A \subset \mathbb{R}: \pm \infty$ ist Häufungspunkt von $A: \Longleftrightarrow \forall \varepsilon>0: U_{\varepsilon}( \pm \infty) \cap A \neq \emptyset$
> 	- $x \in A$ heißt *isolierter* Punkt von $A: \Longleftrightarrow x$ ist *nicht Häufungspunkt* von $A$.
> 	- $\bar{A}:=A \cup\{x \in X: x$ Häufungspunkt von $A\}$ heißt *Abschluss* von $A$.
> 	- $\partial A:=\bar{A} \backslash A^{\circ}$ heißt Rand von $A$.
> 
> 1. $A \subset X$ heißt offen: $\Longleftrightarrow A=A^{\circ}$  
> $A \subset X$ heißt abgeschlossen: $\Longleftrightarrow A=\bar{A}$
