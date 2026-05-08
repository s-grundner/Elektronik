---
tags:
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
  - Theoretische Elektrotechnik
semester: SS26
created: 26th January 2026
professor:
  - Reinhard Feger
  -  
release: false
title: Tensor
---


# Tensor

Ein Tensor beschreibt eine physikalische Größe und ist demnach unabhängig von einem bestimmten Koordinatensystem (welches ja im Prinzip frei wählbar ist).

Wenn ein bestimmtes Koordinatensystem gewählt wurde, dann kann die Größe durch einen Satz von Zahlen für jeden Punkt des Raumes beschrieben werden. (Bei Vektoren spricht man von „Komponenten“ des Vektors.)

$$
\begin{array}{ccc}
\varphi = \varphi(x,y,z) & \mathbf{E} = \begin{pmatrix}
E_{x} \\ E_{y} \\ E_{z}
\end{pmatrix} & \boldsymbol{\varepsilon} = \begin{pmatrix}
\varepsilon_{xx} & \varepsilon_{xy} & \varepsilon_{xz} \\
\varepsilon_{yx} & \varepsilon_{yy} & \varepsilon_{yz} \\
\varepsilon_{zx} & \varepsilon_{zy} & \varepsilon_{zz}
\end{pmatrix}
\end{array}
$$

Diese Repräsentation des Tensors durch Zahlenwerte ist im Allgemeinen in jedem Koordinatensystem verschieden (Ausnahme: Skalar) und die Umrechnung zwischen zwei verschiedenen Koordinatensystemen ergibt sich durch Transformationen.

Die Transformation ergibt sich zwanglos wenn man z.B. im Fall eines Vektors den Vektorpfeil im Raum betrachtet, z.B. in 2D:

![invert_dark|700](../../_assets/Pasted%20image%2020260506185047.png)

$$
\begin{align}
\mathbf{F} &= f_{x}\mathbf{e}_{x} - f_{y}\mathbf{e}_{y} \\
&= f_{x}(\cos\phi \mathbf{e}'_{x} - \sin\phi \mathbf{e}'_{y}) + f_{y}(\sin\phi \mathbf{e}'_{x} - \cos\phi \mathbf{e}'_{y}) \\
&= \mathbf{e}'_{x}(f_{x}\cos\phi+ f_{y}\sin\phi) + \mathbf{e}'_{y}( -f_{x}\sin\phi + f_{y}\cos\phi)
\end{align}
$$

Kann als **lineare Abbildung** mit einer *Rotationsmatrix* $\mathbf{A}$ verstanden werden

$$
\begin{align}
\implies \begin{pmatrix}
f_{x}' \\ f_{y}'
\end{pmatrix} &= \underbrace{ \begin{pmatrix}
\cos\phi & \sin\phi \\
-\sin\phi & \cos\phi
\end{pmatrix}  }_{ \mathbf{A} }
\begin{pmatrix}
f_{x} \\ f_{y}
\end{pmatrix} \\
\end{align}
$$

Die Transformationsmatrizen für Tensoren höherer Stufe ergeben sich ebenfalls zwanglos wenn man die Verknüpfungen mit Tensoren niedrigerer Stufe betrachtet.

## Beispiel

> [!example] Tensor 2. Stufe: [Permittivität](../../Elektrotechnik/Dielektrikum.md) eines [anisotropen](../../Dictionary/Isotrop.md) Mediums $\boldsymbol{\varepsilon}$
> 
> - Transformationmatrix $\mathbf{A}$
> - $\mathbf{D} = \boldsymbol{\varepsilon} \cdot \mathbf{E}$
> - $\mathbf{D}' = \mathbf{A}\cdot \mathbf{D}$
> - $\mathbf{E}' = \mathbf{A}\cdot \mathbf{E}$
>   
> $$
> \begin{gather}
> \underbrace{ \mathbf{A}\cdot \mathbf{D} }_{ \mathbf{D}' } = \mathbf{A} \cdot \boldsymbol{\varepsilon} \cdot \mathbf{E} = \mathbf{A} \cdot \boldsymbol{\varepsilon} \cdot \underbrace{ \mathbf{A}^{-1}\cdot \mathbf{A} }_{ \mathbf{I} } \cdot\mathbf{E} = \mathbf{A} \cdot \boldsymbol{\varepsilon} \cdot \mathbf{A}^{-1}\cdot \underbrace{ \mathbf{A}\cdot\mathbf{E} }_{ \mathbf{E}' } \\
> \mathbf{D}' = \underbrace{ \mathbf{A}\cdot \boldsymbol{\varepsilon} \cdot \mathbf{A}^{-1} }_{ \boldsymbol{\varepsilon}' }\cdot \mathbf{E}'
> \end{gather}
> $$
> 


