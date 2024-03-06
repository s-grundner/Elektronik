---
tags: 
aliases: 
keywords: 
subject:
  - VL
semester:
  - B1
  - WS23
created: 6. März 2024
professor:
  - Bernhard Jakoby
---
 

# Leistungsanpassung

Bei der Leistungsanpassung eines [elektrischen Netzwerks](Schaltungsanalyse.md), werden die Bauteile so gewählt, dass die [Leistung](elektrische%20Leistung.md) an der Last maximal ist.

Beim Zweipol:

![](assets/Pasted%20image%2020240306190447.png)

$$
\begin{gathered}
U_a=U_L \frac{R_a}{R_a+R_i} \\
P_a=\frac{U_a^2}{R_a}=U_L^2 \frac{R_a}{\left(R_a+R_i\right)^2}
\end{gathered}
$$

Extremszenarien:
$R_{a} = 0$: Kurzschluss $\to$ es fällt keine Spannung ab, $P=U_{a}\cdot I$: $U_{a} = 0\implies P=0$
$R_{a} = \infty$: Leerlauf $\to$ es fließt kein Strom, $P = U_{a}\cdot I$: $I = 0 \implies P=0$

> [!question] Ermittlung des Maximums wischen dieser beiden extremfälle