---
tags:
  - tikz/pgfplot
aliases:
  - harmonische Schwingung
  - harmonischen Schwingungen
  - harmonischer Oszillator
keywords: 
subject:
  - Physik für TechnikerInnen
  - VL
semester: WS23
created: 24. Januar 2024
professor:
  - Gunther Springholz
---
 

# Harmonische Schwingungen

> [!INFO] die *harmonische Schwingung* ist ein wichtiger Spezialfall der periodischen [Bewegung](Kinematik/Kinematik.md).  
> Sie entsteht immer dann, wenn bei der Auslenkung aus der Ruhelage eine rücktreibende [Kraft](Kinematik/{MOC}%20Kräfte.md) entsteht, welche direkt linear proportional zur Auslenkung ist.
>
> - Ein System das diese Bedingung erfüllt wird als *harmonischer Oszillator* bezeichnet.
> - Die resultierende [Bewegung](Kinematik/Kinematik.md) folgt einem Sinusbzw. Cosinus förmigen Zeitverlauf.

> [!important] Besonderheiten
> - einfache mathematische Beschreibung mit [DGL](../../Mathematik/Analysis/GDGL.md) aus der Bewegungsgleichung
> - Harmonische Schwingungen sind physikalisch oft mit [Randwertproblemen](../../Mathematik/Analysis/Randwertprobleme.md) verbunden
>   - Zum Beispiel ist eine Schwingenden Saite an dessen beiden enden Fixiert und kann dann mit diesen Randwerten durch die [Wellengleichung](../Feldtheorie/Wellengleichung.md) beschrieben werden. 

> [!info] Modell vieler physikalischer Systeme:
>- Mechanische [Schwingkreise](Schwingkreise.md)
>	- [Pendel](Pendel.md)
>	- [Federschwinger](Kinematik/Feder-Schwinger.md)
> - Elektrische [Schwingkreise](Schwingkreise.md) ([Oszillatoren](../../Hardwareentwicklung/Oszillatoren/Clock-Generierung.md))

```tikz
\usepackage{pgfplots}
\pgfplotsset{compat=1.16}

\begin{document}

\begin{tikzpicture}
\begin{axis}[
    colormap/viridis,
    height=7cm,
    width=20cm,
    domain=0:25.13,
    xmin=0,
    xmax=25.13,
    xlabel=Standing Wave,
    yticklabels={$\lambda=2L$,$\lambda_4=\frac{1}{2}L$,$\lambda_3=\frac{2}{3}L$,$\lambda_2=\:\:\:L$,$\lambda_1=2L$},
    xtick={},
    xticklabels={},
    ymax=0.9,
    ymin=-1.4,
    ylabel={},
    grid=both,
    major grid style={line width=.2pt},
    samples=400,
    ylabel=,
    every axis/.append style={axis line style={line width=0.75pt}}
]
\addplot[smooth, very thick, surf] {0.5+(0.2*sin(deg(0.125*((x)))};
\addplot[smooth, very thick, surf] {0.5+(0.2*sin(deg(0.125*(x-3.14*8)))};

\addplot[smooth, very thick, surf] {0+(0.2*sin(deg(0.25*((x)))};
\addplot[smooth, very thick, surf] {0+(0.2*sin(deg(0.25*(x-3.14*4)))};

\addplot[smooth, very thick, surf] {-0.5+(0.2*sin(deg((0.375*x)-9.42477))))};
\addplot[smooth, very thick, surf] {-0.5+(0.2*sin(deg((0.375*x)))))};

\addplot[smooth, very thick, surf] {-1+(0.2*sin(deg((0.5*x)-3.14))))};
\addplot[smooth, very thick, surf] {-1+(0.2*sin(deg((0.5*x)))))};

\end{axis}
\end{tikzpicture}

\end{document}
```

# Tags

[5 Methoden zum Lösen einer DGL](https://www.youtube.com/watch?v=0kY3Wpvutfs)