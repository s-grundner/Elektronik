---
tags: []
aliases: ["ML"]
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 24th October 2022
---

# Machine Learning
## Lullifunktion
$y=k\cdot x+d$
```functionplot
---
title: 
xLabel: x
yLabel: y
bounds: [0,60,0,6]
disableZoom: true
grid: true
---
y= -0.1*x+5
```
$$
\begin{align*}
k &= \dfrac{\Delta y}{\Delta x} =\frac{-5}{50}\\
d &= 5
\end{align*}
$$
--- 
$\theta_{0}+\theta_{1}\cdot x_{1}+ \theta_{2}\cdot x_{2}\rightarrow x_{2}=-\dfrac{\theta_{1}}{\theta_{2}}\cdot x_{1}-\dfrac{\theta_{0}}{\theta_{2}}$
```functionplot
---
title: 
xLabel: x2
yLabel: x1
bounds: [0,60,0,6]
disableZoom: true
grid: true
---
y= -0.1*x+5
```

$$
\Theta=\begin{pmatrix}
-5 \\ +0.1 \\ 1
\end{pmatrix}
$$

## [Lineare Regression](Lineare%20Regression.md)

![Overfit](../assets/Overfit.png)
Hochgradige Kostenfunktion (nicht konvex)
man findet das Globale minimum sehr schwer

## [Logistische Regression](Logistische%20Regression.md)
```functionplot
---
title: Konvexe Kostenfunktion
xLabel: 
yLabel: 
bounds: [0,12,0,7]
disableZoom: true
grid: true
---
y=(1/10)*(x-7)^2
```

# Matlab Simulations
````ad-example
title: Häuserpreis

| $x_{0}$ | Size (feet$^{2}$)<br> $x_{1}$ | Number of Bedrooms <br> $x_{2}$ | Number of Floors <br> $x_3$ | Age of Home <br> $x_{4}$ | Price <br> $y$ |
|:-------:|:-----------------------------:|:-------------------------------:|:---------------------------:|:------------------------:|:--------------:|
|    1    |             2104              |                5                |              1              |            45            |      460       |
|    1    |             1416              |                3                |              2              |            40            |      232       |
|    1    |             1534              |                3                |              2              |            30            |      315       |
|    1    |              852              |                2                |              1              |            35            |      178       |

$$
\text{normalisieren}(x_{n}) = \dfrac{x_{n}-\text{mittelwert}(X)}{\text{standard abweichung}(X)}
$$

```matlab
x0 = ones(1,4);
x1 = [2104 1416 1534 852];
x2 = [5 3 3 2];
x3 = [1 2 2 1];
x4 = [45 40 30 36];
y = [460 232 315 178];

m = 4;

% normieren
x1_norm = (x1 - mean(x1))/std(x1);
x2_norm = (x2 - mean(x2))/std(x2);
x3_norm = (x3 - mean(x3))/std(x3);
x4_norm = (x4 - mean(x4))/std(x4);

X_norm = [x0; x1_norm;x2_norm;x3_norm;x4_norm];

% Kostenfunktion J
Theta = [1;2;3;4;5];
J = (1/(2*m)) * sum((Theta'*X_norm-y).^2);
```
### Vereinfacht
```matlab
X = [2104 1416 1534 852; % (4x4)
	5 3 3 2;
	1 2 2 1;
	45 40 30 36;
];
Theta = [1; 2; 3; 4; 5]; % (5x1)
Y = [460 232 315 178]; % (1x5)

% normieren
Z = (X - mean(X, 2)) ./ std(X, 0, 2);

% erste reihe hinzufügen (immer 1er)
Xnorm = [ones(1, 4); Z];

% Kostenfunktion J
E = (Theta' * Xnorm) - Y;
J = sum(E.^2);
```
````

# Quellen

>[!info] Teststoff
> ### [Regression](Regression)
>anhand von datenpunkten einen $y$ wert ausrechenn
>Kosten $J$ aurechnen
>Neue $\theta$ Ausrechnen
>### Klassifiziereung
>entscheidungsgrenze einzeichnen durch Thata (geradengleichung)
>Bei einem neuen punkt die [WSK](../../mathe/mathe%20(5)/Wahrscheinlichkeit.md) ausrechnen, ob der neue punkt in der Klasse y=1 ist
>Kosten $J$ Ausrechnen
>Kein Neues $\theta$
>Als mtrixmultiplikation und mit normaler Algebra ausrechnen

## MatLab Commands

```matlab
mean(X) %Mittelwert eines Arrays/Matrix
std(X) %Standardabweichung einer Matrix
X' %Matrix X Transponieren
```

## Andrew Ng Course
<iframe width="560" height="315" src="https://www.youtube.com/embed/videoseries?list=PLLssT5z_DsK-h9vYZkQkYNWcItqhlRJLN" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
