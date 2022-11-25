---
tags: []
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
reference: []
created: 24th October 2022
---

# Machine Learning
## Cost function
### Linear Regression
$$
\begin{align*}
X &= 
\begin{pmatrix}
1 & 1\\
5 & 8
\end{pmatrix}\\
h_{\theta}(x) &= \theta_{0}+\theta_{1}\cdot x_{1}+\theta_{2}\cdot x_{2}+\theta_{3}\cdot x_{3}+\theta_{4}\cdot x_{4}\\
&= \Theta' \cdot X_{(n)}\\
J &= \frac{1}{2m}\cdot \sum\limits_{n=1}^{m}(\Theta'\cdot X_{(n)}-Y_{(n)})\\\\
Cost (h_{\theta}(x), y) &=
\begin{cases}
-\log(h_{\theta}(x^{(n)}))\cdot y^{(i)}\\
-\log(1-h_{\theta}(x^{(n)}))
\end{cases}
\end{align*}
$$



```functionplot
---
title: non-convex function
xLabel: 
yLabel: 
bounds: [0,12,0,7]
disableZoom: true
grid: true
---
y=0.2*sin(10x)-(log(x))+4
```


```functionplot
---
title: convex function
xLabel: 
yLabel: 
bounds: [0,12,0,7]
disableZoom: true
grid: true
---
y=-(log(x))+4
```

$$
\begin{align*}
X\dots 100\times3\\
\Theta\dots 3\times1\\
\begin{array}{cll}\\\\
& \begin{pmatrix}
1 & 2 & 3 
\end{pmatrix}\\
\left.\begin{pmatrix}
1 & 94 & 72\\
1 & 93 & 87\\
1 & 91 & 43\\
1 & 100 & 12
\end{pmatrix}\right\downarrow_{m} &
\begin{pmatrix}
\end{pmatrix}
\end{array}\\
\end{align*}
$$


# Matlab Simulations
````ad-example
title: Häuse

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
> ### Regression
>anhand von datenpunkten einen $y$ wert ausrechenn
>Kosten $J$ aurechnen
>Neue $\theta$ Ausrechnen
>### Klassifiziereung
>entscheidungsgrenze einzeichnen durch Thata (geradengleichung)
>Bei einem neuen punkt die WSK ausrechnen, ob der neue punkt in der Klasse y=1 ist
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
