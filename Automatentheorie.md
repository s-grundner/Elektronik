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
  - "336.001"
semester: 1
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
> ![](xEDU/TI/28B28D4B-69A8-4FF8-A8A5-E397C9017CF1.jpg)

### Mealy-Moore Transformation

## Moore Automat