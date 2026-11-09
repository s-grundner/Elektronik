---
tags:
aliases:
subject:
  - KV
  - Efficient Signal Processing Algorithms
semester: WS26
created: 13th October 2026
professor:
release: false
title: Kaczmarz-Typ Algorithmen
---

# Kaczmarz-Typ Algorithmen

> [!info] Effiziente Lösungsannäherung von [LLS-Problemen](../../Mathematik/Lineare%20Methode%20der%20kleinsten%20Quadrate.md)

Ausgangspunkt ist ein mit $\boldsymbol{\nu}$ verrauschtes Messsignal $\mathbf{y}$, welches mit einem linearen Modell $\mathbf{H}\boldsymbol{\theta}$ dargestellt werden soll.

$$
\mathbf{y} = \mathbf{H}\boldsymbol{\theta} + \boldsymbol{\nu} \qquad \dim(\mathbf{H}) = m \times p
$$

- Annahme: $\mathbf{H}$ hat vollen [Rang](../../Mathematik/Algebra/Rang%20einer%20Matrix.md).
- Die statistischen eigenschaften ([PDF](../../Mathematik/Statistik/PDF.md) oder [Statistische Momente](../../Mathematik/Statistik/Statistische%20Momente.md)) müssen nicht bekannt sein.

> [!info] Basiert auf der Gradienten Methode
> Jedoch wird nicht strikt in die richting des steilsten abstiegs iteriert, sondern nur allgemein in diese richtung
> 
> - Biased Random Walk

Das Modell wird via [Linear Least Squares](../../Mathematik/Lineare%20Methode%20der%20kleinsten%20Quadrate.md) geschätzt:

- Lösung LLS: $\hat{\mathbf{w}} = (\mathbf{H}^T\mathbf{H})^{-1}\mathbf{H}^T\mathbf{y}$

