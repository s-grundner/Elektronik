---
tags: []
aliases: ["Matrix", "Matrizen", "Matrixgleichung"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
reference: []
created: 28th September 2022
---

# Matrixrechnung
Matrizen sind:
- assoziativ $\rightarrow A \cdot (B \cdot C) = ( A \cdot B ) \cdot C$ 
- distributiv
	- für $C \in R^{m \times n}\rightarrow (A + B) \cdot C = A \cdot C + B \cdot C$
	- für $C \in R^{n \times l}\rightarrow C \cdot (A + B) = C \cdot A + C \cdot B$
- *Nicht* kommutativ $\rightarrow A \cdot B \neq B \cdot A$
## Transponieren von Matrizen
Werte werden um die Diagonale gespiegelt
$$
\begin{align*}
&A = \begin{pmatrix}
A_{11} & A_{12}\\
A_{21} & A_{22}
\end{pmatrix}
&&A^{(T)} = \begin{pmatrix}
A_{11} & A_{21}\\
A_{12} & A_{22}
\end{pmatrix}
\\\\
&B = \begin{pmatrix}
B_{11} & B_{12} & B_{13}\\
B_{21} & B_{22} & B_{23}
\end{pmatrix}
&&B^{(T)} = \begin{pmatrix}
B_{11} & B_{21}\\
B_{12} & B_{22}\\
B_{13} & B_{23}\\
\end{pmatrix}
\end{align*}
$$
## Multiplikation
> [!important] Größe des Produkts
> ![[Matrix_multiplication.png|525]]


> [!important] Berechnung der Werte
> ![[Pasted image 20230102212307.png|400]]


---
# Tags
https://de.wikipedia.org/wiki/Matrizenmultiplikation