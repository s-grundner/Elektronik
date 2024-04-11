---
tags:
  - Mathe
  - Folgen
  - Kurvendiskussion
aliases:
  - Konvergenz
  - konvergiert
  - limes
subject:
  - mathe
source:
  - Rudolf Frauenschuh
created: 19th August 2022
---

# Grenzwert einer Unendlichen Folge

> [!IMPORTANT] Eine Zahl $g$ heißt *Grenzwert* oder *Limes* einer unendlichen Folge ($c_{n}$), wenn sich ihre Glieder beliebig dieser Zahl nähern.  
> Das bedeutet, dass fast alle (= alle bis auf endlich viele) Folgeglieder der Zahl $g$ so nahe kommen, wie man es nur wünscht.   

> [!summary] Man sagt, dass die Folge ($c_n$) gegen $g$ konvergiert und schreibt:  
> $c_{n}\rightarrow g$ für $n\rightarrow \infty$ oder $\lim_{n\rightarrow\infty}c_{n}=g$.

Eine Folge, die einen Grenzwert besitzt, heißt *konvergent*, andernfalls heißt sie *divergent*.

Besitzt eine konvergente Folge den Grenzwert $0$, so heißt sie *Nullfolge*.  
Übersteigen fast alle Folgeglieder jede noch so große Zahl bzw. unterschreiten sie jede noch  
so kleine (negative) Zahl, so heißt die Folge ($c_{n}$) bestimmt divergent.

>[!summary] Man schreibt:  
> $\lim_{n\rightarrow\infty} c_{n}=\infty$ bzw. $\lim_{n\rightarrow\infty} c_{n}=-\infty$ 

## Topologische Begriffe von Mengen

> [!info] Def. 9.8 Sei $A\subset X$
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

> [!EXAMPLE] in $\mathbb{R}$:
> - offen und abgeschlossen 
> - kein isolierter Punkt

# Tags

- [Leibnitzkriterium](Leibnitz%20Kriterium.md)
- [Quotientenkriterium](Quotienten%20Kriterium.md)