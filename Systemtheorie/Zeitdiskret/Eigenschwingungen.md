---
title: Eigenschwingungen
---
## Eigenschwingungen

Die Behandlung der Eigenschwingungen von zeitdiskreten LTI-Systemen erfolgt analog zu jener von zeitkontinuierlichen Systemen. Es werden auch hier spezielle Lösungen des autonomen Systems

$$
\mathbf{x}_{k+1}=\mathbf{A} \mathbf{x}_k
$$

mit Hilfe von Eigenvektoren gesucht. Mit dem Ansatz

$$
\mathbf{x}_k=\mathbf{v} w_k
$$

aus Gl. (3.19) folgt die Beziehung

$$
\begin{aligned}
\mathbf{v} w_{k+1} & =\mathbf{A} \mathbf{v} w_k=\lambda_i \mathbf{v} w_k \\
\mathbf{0} & =\mathbf{v}\left(w_{k+1}-\lambda_i w_k\right)
\end{aligned}
$$

und damit die spezielle Lösung

$$
\mathbf{x}_k=\lambda_i^k \mathbf{v} w_0 .
$$


Diese Lösung wird wieder Eigenschwingung genannt. Sie verbleibt für alle $k$ im linearen Unterraum span ($\{v\}$).