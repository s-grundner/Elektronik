---
tags: 
aliases: 
keywords: 
subject:
  - Mathematik 1
  - VL
semester: WS24
created: 23. Februar 2025
professor:
draft: false
title: Regel von Sarrus
---
 
# Regel von Sarrus

> [!warning] Achtung: Gilt nur für $3\times 3$ [Matrizen](Matrix.md)!

> [!satz] **S1 - SARR)** Regel von Sarrus zur ermittlung einer $3\times 3$ 
> $$
> \begin{aligned}
> \operatorname{det} A & =\left|\begin{array}{lll}
> a_{11} & a_{12} & a_{13} \\
> a_{21} & a_{22} & a_{23} \\
> a_{31} & a_{32} & a_{33}
> \end{array}\right|=a_{11} \cdot\left|\begin{array}{ll}
> a_{22} & a_{23} \\
> a_{32} & a_{33}
> \end{array}\right|-a_{21} \cdot\left|\begin{array}{ll}
> a_{12} & a_{13} \\
> a_{32} & a_{33}
> \end{array}\right|+a_{31} \cdot\left|\begin{array}{ll}
> a_{12} & a_{13} \\
> a_{22} & a_{23}
> \end{array}\right| \\
> & =a_{11} a_{22} a_{33}+a_{12} a_{23} a_{31}+a_{13} a_{21} a_{32}-a_{13} a_{22} a_{31}-a_{11} a_{23} a_{32}-a_{12} a_{21} a_{33} .
> \end{aligned}
> $$