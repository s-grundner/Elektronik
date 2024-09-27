---
tags: 
aliases: []
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 27. September 2024
professor:
---
 

# Satz 11.6

> [!important] Satz 11.6. Sei $A \subset \mathbb{R}^n$ offen, $x_0 \in A$ und $f: A \rightarrow \mathbb{R}^m$ differenzierbar in $x_0$.
> Dann ist $f$ stetig in $x_0$.

## Beweis

Da $f$ differenzierbar ist, gilt nach Definition 11.4 für alle $h \in \mathbb{R}^n$ mit $x_0+h \in A$ : 

$f\left(x_0+h\right)=f\left(x_0\right)+L h+r(h)$ und $\lim _{h \rightarrow 0} \frac{r(h)}{\|h\|}=0$, insbesondere: $\lim _{h \rightarrow 0} r(h)=0$.

Da die lineare Abbildung $L$ stetig ist, folgt: $\lim _{h \rightarrow 0} f\left(x_0+h\right)=f\left(x_0\right)$, also ist $f$ stetig in $x_0$.

Umgekehrt impliziert Stetigkeit natürlich nicht Differenzierbarkeit, so ist die Betragsfunktion in $x=0$ stetig, aber nicht differenzierbar.

Aus dem Beweis von Satz 11.6 geht hervor, dass für $n=1$ die Aussage auch gilt, falls $I$ ein Intervall und $x_0 \in I$ ein Randpunkt ist.

Es gibt auch eine andere Möglichkeit, den Ableitungsbegriff auf Funktionen zwischen mehrdimensionalen Räumen zu übertragen, den Begriff der **partiellen Ableitung**, dabei lässt man nun alle Variablen bis auf eine fest und betrachtet die Funktion als Funktion der einen restlichen Variablen.