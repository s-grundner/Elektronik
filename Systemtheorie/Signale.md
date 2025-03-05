---
tags:
  - tikz/pgfplot
aliases: 
keywords:
  - Kausalität
  - Kontinuität
  - Gerade/Ungerade
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
  - Andreas Stelzer
---
 

# Signale



## Klassifizierung von Signalen

1. Zeitkontinuität
2. Wertkontinuität
3. Reell / Komplexe Signale
4. Gerade / Ungerade Signale
5. Zeitliche Ausdehnung
6. [Kausalität](Kausalität.md)
7. Stabilität/Beschränktheit
8. Periodizität
9. Deterministische und Stochastische Signale
10. [Leistungssignal](Leistungssignal.md) / [Energiesignal](Energiesignal.md)

### 1. Zeitkontinuität

```tikz
\usepackage{amsmath}
\begin{document}
\begin{tikzpicture}[scale=1.5]

% Zeitkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x(t)$};
    
    % Das kontinuierliche Signal
    \draw[very thick, color=red,domain=0:3,samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {\Large \text{Zeitkontinuierliches\, Signal}};
\end{scope}

% Zeitdiskretes Signal (rechts)
\begin{scope}[xshift=5cm]
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $n$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x[n]$};
    
    % Das diskrete Signal (gepunktet)
    \foreach \n in {0,...,6} {
        \filldraw[red, very thick] (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)}) circle (1pt);
        \draw[dotted, very thick] (\n*0.5,0) -- (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)});
    }

    \node at (1.5,-2) {\Large \text{Zeitdiskretes\, Signal}};
\end{scope}

\end{tikzpicture}
\end{document}

```

Ein zeitkontinuierliches Signal ist für alle Zeitpunkte definiert, ein zeitdiskretes Signal nur zu gewissen Zeitpunkten.

Voraussetzungen zur Äquivalenz beider Darstellungen werden im Abtasttheorem erarbeitet.

### 2. Wertkontinuität

```tikz
\usepackage{amsmath}

\begin{document}
\begin{tikzpicture}[scale=1.5]

% Wertkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x(t)$};
    
    % Das kontinuierliche Signal
    \draw[red, very thick, domain=0:3, samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {\text{\Large Wertkontinuierliches\, Signal}};
\end{scope}

% Wertdiskretes Signal (rechts)
\begin{scope}[xshift=5cm]
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x(t)$};
    
    % Die horizontalen Linien für das Quantisierungsgitter
    \foreach \y in {-1,-0.5,0,0.5,1,1.5} {
        \draw[dotted] (-0.2,\y) -- (3.5,\y);
    }
    
    % Das diskrete Treppensignal (wertdiskret)
    \draw[very thick, red] (0, 0) -- (0.5, 0) -- (0.5, -0.5) -- (1, -0.5) -- (1, -1)
                 -- (1.5, -1) -- (1.5, -0.5) -- (2, -0.5) -- (2, 0.5) 
                 -- (2.5, 0.5) -- (2.5, 0) -- (3, 0);

    \node at (1.5,-2) {\Large\text{Wertdiskretes\, Signal}};
\end{scope}

\end{tikzpicture}
\end{document}

```

Ein wertkontinuierliches Signal kann beliebige Funktionswerte annehmen, wohingegen ein wertdiskretes Signal nur diskrete Signalstufen besitzt. Die Diskretisierung (Quantisierung) der Amplitudenwerte geschieht i.d.R. in linearen Stufen, mit $N$-Bits ergeben sich $2^N$ mögliche Funktionswerte.

### 3. Reelle und Komplexe Signale

> [!info] Auteilung nach Betrag und Phase (Polardarstellung)
> $x(t)=|x(t)| \cdot e^{\mathrm{j} \angle x(t)}=\operatorname{abs}(x(t)) \cdot e^{\mathrm{j} \arg (x(t))}$

```tikz
\usepackage{tikz}
\usepackage{amsmath}
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}[scale=4, very thick]

    % Draw the unit circle
    \draw[thick] (0,0) circle(1);
    
    % Draw the axes
    \draw[->] (-1.3, 0) -- (1.3, 0) node[anchor=west] {\Large$\text{Re}\{x(t)\}$};
    \draw[->] (0, -1.3) -- (0, 1.3) node[anchor=south] {\Large$\text{Im}\{x(t)\}$};
    
    % Mark 1 on both axes
    \draw (1.1, 0) node[anchor=south] {\Large 1};
    \draw (0, 1.1) node[anchor=west] {\Large 1};
    
    % Draw the vector for x(t) = e^(j phi(t))
    \draw[thick, red, ->] (0, 0) -- (0.707, 0.707) node[midway, anchor=south east] {};
    
    % Label x(t)
    \node at (1.2, 0.8) {\Large$x(t) = e^{j \varphi(t)}$};
    
    % Draw the angle arc
    \draw[->, thick] (0.3, 0) arc(0:45:0.3);
    
    % Label the angle
    \node at (0.5, 0.2) {\Large$\varphi(t)$};
    
    % Mark projection onto real axis
    \draw[dashed] (0.707, 0.707) -- (0.707, 0);
    \draw[dashed] (0.707, 0.707) -- (0, 0.707);

    \draw[->, cyan] (0, 0) -- (0.707, 0) node[anchor=north] {\Large$\text{Re}\{x(t)\}$};
    \draw[->, cyan] (0, 0) -- (0, 0.707) node[anchor=east] {\Large$\text{Im}\{x(t)\}$};

    \draw (2.5, 0) node[anchor=center] {\Huge\boxed{ e^{j \pi}+1=0 }};

\end{tikzpicture}

\end{document}

```

### 4. Gerade und Ungerade Signale

- für gerade Signale gilt

$$
x_{\mathrm{g}}(t)=x_{\mathrm{g}}(-t)
$$

- für ungerade Signale gilt

$$
x_{\mathrm{u}}(t)=-x_{\mathrm{u}}(-t)
$$

- Zerlegung eines beliebigen Signals $x(t)$ in einen geraden Anteil $x_{\mathrm{g}}(t)$ und einen ungeraden Anteil $x_{\mathrm{u}}(t)$ :

$$
\begin{aligned}
x(t)=\frac{x(t)}{2}+\frac{x(t)}{2}+\frac{x(-t)}{2} & -\frac{x(-t)}{2}=\underbrace{\frac{x(t)}{2}+\frac{x(-t)}{2}}_{x_{\mathrm{g}}(t)}+\underbrace{\frac{x(t)}{2}-\frac{x(-t)}{2}}_{x_{\mathrm{u}}(t)}
\end{aligned}
$$
> [!important] Es Folgt
> $$
\begin{align}
x_{\mathrm{g}}(t) =\frac{1}{2}(x(t)+x(-t)) \\
x_{\mathrm{u}}(t) =\frac{1}{2}(x(t)-x(-t))
\end{align}$$

#### 4.1 Konjugiert gerade und konjugiert ungerade Signale

Für komplexe Signale gelten folgenden zusätzliche Definitionen
- für konjugiert gerade Signale gilt

$$
x_{\mathrm{g}^*}(t)=x_{\mathrm{g}^*}^*(-t)
$$

- für konjugiert ungerade Signale gilt

$$
x_{\mathrm{u}^*}(t)=-x_{\mathrm{u}^*}^*(-t)
$$

- Zerlegung eines komplexen Signals $x(t)$ in einen konjugiert geraden $x_{\mathrm{g}^*}(t)$ und ungeraden Anteil $x_{\mathrm{u}^*}(t)$ mit

$$
\begin{aligned}
& x_{\mathrm{g}^*}(t)=\frac{1}{2}\left(x(t)+x^*(-t)\right) \\
& x_{\mathrm{u}^*}(t)=\frac{1}{2}\left(x(t)-x^*(-t)\right)
\end{aligned}
$$



## 7. Stabilität und Beschränktheit

Ein System heißt BIBO Stabil wenn jedes Beschränkte Eingangssignal zu einem beschränkten Ausgangssignal führt.

BIBO: Bounded Input / Bounded Output