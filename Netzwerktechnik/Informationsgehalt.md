---
tags:
  - Informationstheorie
aliases:
  - Entropie
keywords: $I_x$, $H$
subject:
  - KV
  - Übertragungstechnik
semester: WS25
created: 27th February 2025
professor:
  - Andreas Springer
release: true
title: Informationsgehalt
---

# Informationsgehalt & Entropie 

> [!question] [Informationstheorie](Informationstheorie.md)

---


1. Je Unwahrscheinlicher, desto mehr Informationsgehalt
2. Wenn Wahrscheinlichkeit = 0 -> Informationsgehalt = 1
3. Informationsgehalte von unabhängigen Nachrichten sollten sich addieren
$$
\begin{align*}
I_{x} = ld(\frac{1}{p_{x}})
\end{align*}
$$
$p_{x} \dots$ Wahrscheinlichkeit des Symbols $x$  
Sucht man den mittleren Informationsgehalt aller $n$ möglicher Nachrichtenelemente, sa muss man den arithmetischen Mittelwert bilden.  
-> mittlerer Informationsgehalt -> **Entropie $H$**
$$
\begin{align*}
H &= \sum p_{x}\cdot ld(\frac{1}{p_{x}})\\
&= -\sum p_{x} \cdot ld(p_{x}) 
\end{align*}
$$