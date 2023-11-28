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
![](xEDU/TI/44F71D63-B1DA-4000-8279-F1822C12C817.jpg)
> 
> Erweitern mit Leerzeichen:
![](xEDU/TI/9F3B1C0D-165D-48C5-9B14-A51017A7C833.jpg)

### Mealy-Moore Transformation

![](xEDU/TI/523A72F9-E5B8-4447-BAD1-68D723394E4C.jpg)

## Moore Automat