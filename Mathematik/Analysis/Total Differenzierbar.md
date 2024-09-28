---
tags: 
aliases:
  - Totales Differenzial
  - Vollständiges Differenzial
  - Totale Ableitung
keywords: 
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 28. September 2024
professor:
---
 

# Totales Differenzial

> [!info] gegensatz zum schwächeren [partiellen Differenzial](Partielle%20Ableitung.md)

Das totale Differential einer Funktion $f$ in $n$ Variablen erhält man folgendermaßen:
$$
\mathrm{d} f=\frac{\partial f}{\partial x_1} \mathrm{~d} x_1+\ldots+\frac{\partial f}{\partial x_n} \mathrm{~d} x_n=\sum_{i=1}^n \frac{\partial f}{\partial x_i} \mathrm{~d} x_i .
$$

Die totale [Ableitung](Differenzialrechnung.md) einer Funktion nach einer Variable $x_i$ erhält man somit als
$$
\frac{\mathrm{d} f}{\mathrm{~d} x_i}=\frac{\partial f}{\partial x_1} \frac{\mathrm{d} x_1}{\mathrm{~d} x_i}+\ldots+\frac{\partial f}{\partial x_i}+\ldots+\frac{\partial f}{\partial x_n} \frac{\mathrm{d} x_n}{\mathrm{~d} x_i}
$$