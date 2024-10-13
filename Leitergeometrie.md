---
tags: 
aliases: 
keywords:
  - Herleitung Leitermodell
  - MWG
  - Herleitung Beläge
subject:
  - KV
  - HF-Systemtechnik 1
semester: WS24
created: 10. Oktober 2024
professor:
  - Reinhard Feger
---
 

# Leitergeometrien von HF-Leitungen

> [!success] Die charakteristische Impedanz $Z_{0}$ beschreibt unter anderem die Geometrie einer Leitung
> Man muss daher nicht immer die Maxwellgleichungen für eine Leitungsgeometrie lösen, sondern kann mit der charateristischen Impedanz 

## TEM-Moden

siehe: [Transversale EM-Welle](Transversale%20Elektromagnetische%20Welle.md)

> [!success] Nicht frequenzabhängig. Funktionieren für Alle frequenzen (auch DC) gleich


![invert_dark](assets/TEM-Moden.png)

### Herleitung zu HF-Leitermodelle

> [!warning] Herleitung der Parallelplattenleitung mittels der Maxwellgleichungen
> Jedoch ist das verfahren gleich für andere geometrien
> 1. Annahmen zum Feldverlauf
> 2. Kontur Wählen
> 
> 

![invert_dark](HF-Technik/assets/TEM-Plattenleitung.png)

#### Annahmen zum Feldverlauf

Vorraussetzung für TEM-Moden:

> [!info] E-Feld
> - E-Feld hat keine komponente die in $z$-Richtung zeigt
> - wir nehmen an dass die E-Feld Komponente in $x$-Richtung 0 ist
> 
> $$\mathbf{E} = \begin{bmatrix} 0 \\ E_{y}(x,y,z,t) \\ 0 \end{bmatrix} = E_{y}(x,y,z,t)\cdot \mathbf{e}_{y}\quad \text{für} \quad 0 < y < d$$
> 


 > [!info] H-Feld
 > - H-Feld hat auch keine komponente in $z$-Richtung
 > - wir nehmen an dass das H-Feld nur in $x$-Richtung zeigt (gegensatz zum E-Feld)
 >
 > $$\mathbf{H}=\begin{bmatrix} H_{x}(x,y,z,t) \\ 0 \\ 0\end{bmatrix} = H_{x}(x,y,z,t)\cdot e_{x} \quad \text{für} \quad 0<y<d$$
 
Vereinfachte Lösung mit annahme einer idealen TEM mode (es gibt genauere Lösungen)

#### Kontur des Leitermodell-Querschnitts

Konturintegral über dem Modellquerschnitt

Mit dem [Satz von Stokes](Satz%20von%20Stokes.md) folgt:
$$
\nabla \times \mathbf{E}=-\frac{\partial}{\partial t} \mathbf{B} \implies \oint_C \mathbf{E} \cdot \mathrm{~d} \mathbf{l}=-\frac{\partial}{\partial t} \iint_S \mu \mathbf{H} \cdot \mathrm{~d} \mathbf{s}
$$

![invert_dark](assets/ContourINt.png)


> [!warning] Projektion der Feld-Komponenten: Nur Feldkomponenten die auf die..
> 
> - ... Kontur Projiziert werden, tragen zum Konturintegral $\oint_{C}$ bei.
> - ... [Flächennormale](Elektrotechnik/Flächenvektor.md) Projiziert werden, Tragen zum [Flächenintegral](Elektrotechnik/Flächenintegral.md) $\iint_{S}$ bei 

Kontur im Modell:

![invert_dark](assets/KonturInPlatengeometrie.png)

Mit dem [inneren Produkt](Mathematik/Algebra/Skalarprodukt.md) fallen nur die $x$-$y$-Komponenten ins Gewicht:

$$
\begin{aligned}
\oint_{C_0} \mathbf{E} \cdot \mathrm{~d} \mathbf{l}=\int_0^d E_y\left(x_0, y, z_0, t\right) \mathrm{d} y & +\int_{x_0}^{x_1} E_x\left(x, d, z_0, t\right) \mathrm{d} x -\int_0^d E_y\left(x_1, y, z_0, t\right) \mathrm{d} y-\int_{x_0}^{x_1} E_x\left(x, 0, z_0, t\right) \mathrm{d} x
\end{aligned}
$$

Unter den Annahmen des Feldverlaufts ist $\mathbf{E}_{x}=\mathbf{0}$. Tangentiale Feldanteile bei $y=0$ und $y=d$ fallen aber sowieso weg.

$$
\oint_{C_0} \mathbf{E} \cdot \mathrm{~d} \mathbf{l}=\int_0^d E_y\left(x_0, y, z_0, t\right) \mathrm{d} y-\int_0^d E_y\left(x_1, y, z_0, t\right) \mathrm{d} y
$$

> [!important] Da das Flächenintegral über $S_{0}$ (Fläche der Kontur $C_{0}$) verschwindet (da kein H-Feld in $z$-Richtung vorhanden ist) erhält man:
>

$$
\begin{align}
\oint_{C_0} \mathbf{E} \cdot \mathrm{~d} \mathbf{l} &= \int_0^d E_y\left(x_0, y, z_0, t\right) \mathrm{d} y-\int_0^d E_y\left(x_1, y, z_0, t\right) \mathrm{d} y \\
&=-\frac{\partial }{\partial t} \int _{0}^{d}\int _{x_{0}}^{x_{1}} \mu \mathbf{H}_{z}(x,y,z,t) \, dxdy=0 

\end{align}
$$

## Andere Moden

HF-Leitungen höherer ordnung

> [!warning] Funktionieren nicht für alle Frequenzen gleich

![invert_dark](assets/nonTEM.png)

- Rectangular Waveguide (Rechteck Hohlleiter)
- [LWL](Lichtwellenleiter.md) - Dielektrischer Wellenleiter Licht Als EM-Welle durch nicht leitendes Dielektrikum
- Coplanarer Microstrip


