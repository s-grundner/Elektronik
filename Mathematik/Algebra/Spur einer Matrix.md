---
tags:
aliases:
  - Spur
  - Trace
keywords:
subject:
  - VL
  - Mathematik 1
semester: WS23
created: 29th January 2026
professor:
release: false
title: Spur einer Matrix
---

# Spur einer Matrix

Die Spur einer Matrix ist die Summe ihrer Hauptdiagonal elemente

> [!def] **D - SPUR)** Sei $\mathbf{A} = (a_{ij}) \in\mathbb{K}^{n\times n}$, ist die Spur (engl. *trace*) definiert als
> 
> $$
> \mathrm{Tr}(\mathbf{A}) = \sum_{i=1}^{n} a_{ii}
> $$


> [!satz] **S)** Seien $\mathbf{A},\mathbf{B} \in\mathbb{K}^{n\times n}$ Matrizen und $k \in \mathbb{K}$ ein Skalar in, gelten folgende Eigenschaften
> 

**Zyklizität**

$$
\mathrm{Tr}(\mathbf{AB}) = \mathrm{Tr}(\mathbf{BA})
$$


[**Linearität**](Lineare%20Abbildungen.md)

$$
\begin{align}
\mathrm{Tr}(\mathbf{A} + \mathbf{B}) &= \mathrm{Tr}(\mathbf{A}) + \mathrm{Tr}(\mathbf{B}) \\
\qquad\mathrm{Tr}(k \mathbf{A}) &= k~\mathrm{Tr}(\mathbf{A})
\end{align}
$$

[**Transposition**](Transponieren.md)

$$
\mathrm{Tr}(\mathbf{A}) = \mathrm{Tr}(\mathbf{A}^{T})
$$