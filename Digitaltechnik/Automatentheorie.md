---
tags: 
aliases:
  - Mealy
  - Moore
  - FSM
  - Finite State Machine
keywords:
  - Mealy
  - Moore
subject:
  - Technische Informatik
  - KV
semester: WS23
created: 28. November 2023
professor:
  - Timm Ostermann
---
 

# Automatentheorie

## Mealy Automat

> [!INFO] Der Wert steht am Pfeil

$$
\begin{align}
o(t)&= \lambda (s(t)) \\
s(t+1) &= \delta(i(t),s(t))
\end{align}
$$

### Entwicklung von Mealy-Automaten

>[!EXAMPLE] Erkennung von Folge: abba $\to$ Lampe geht an  
> Input: ababbbaabbabbaaababbaabbb  
![|500](assets/exMealy.jpg)
> 
> Erweitern mit Leerzeichen:  
![|500](assets/exMealyErw.jpg)

### Mealy-Moore Transformation

![|500](assets/exMoore.jpg)

## Moore Automat