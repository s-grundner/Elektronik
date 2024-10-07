---
tags: 
aliases:
  - Energiesignal
  - Leistungssignal
keywords: 
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
    - komplexe Signale
5. Zeitliche Ausdehnung
6. Kausalität
7. Beschränktheit
8. Periodizität
9. Deterministische und Stochastische Signale
10. Leistungs- / Energiesignal

### 1. Zeitkontinuität

```tikz
\usepackage{amsmath}
\begin{document}
\begin{tikzpicture}[scale=2.5]

% Zeitkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x(t)$};
    
    % Das kontinuierliche Signal
    \draw[very thick, color=red,domain=0:3,samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {\huge \text{Zeitkontinuierliches\, Signal}};
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

    \node at (1.5,-2) {\huge \text{Zeitdiskretes\, Signal}};
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
\begin{tikzpicture}[scale=2.5]

% Wertkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {\Large $t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {\Large $x(t)$};
    
    % Das kontinuierliche Signal
    \draw[red, very thick, domain=0:3, samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {\text{\huge Wertkontinuierliches\, Signal}};
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

    \node at (1.5,-2) {\huge\text{Wertdiskretes\, Signal}};
\end{scope}

\end{tikzpicture}
\end{document}

```

Ein wertkontinuierliches Signal kann beliebige Funktionswerte annehmen, wohingegen ein wertdiskretes Signal nur diskrete Signalstufen besitzt. Die Diskretisierung (Quantisierung) der Amplitudenwerte geschieht i.d.R. in linearen Stufen, mit $N$-Bits ergeben sich $2^N$ mögliche Funktionswerte.

### 3. Reelle und Komplexe Signale

```tikz
\usepackage{tikz}
\usepackage{amsmath}
\usepackage{pgfplots}

\begin{document}

\begin{tikzpicture}[scale=2, thick]

    % Draw the unit circle
    \draw[thick] (0,0) circle(2);
    
    % Draw the axes
    \draw[->] (-2.5, 0) -- (2.5, 0) node[anchor=west] {$\text{Re}\{x(t)\}$};
    \draw[->] (0, -2.5) -- (0, 2.5) node[anchor=south] {$\text{Im}\{x(t)\}$};
    
    % Mark 1 on both axes
    \draw (2.2, 0.1) node[anchor=south] {1};
    \draw (0.1, 2.2) node[anchor=west] {1};
    
    % Draw the vector for x(t) = e^(j phi(t))
    \draw[thick, ->] (0, 0) -- (1.414, 1.414) node[midway, anchor=south east] {};
    
    % Label x(t)
    \node at (2, 1.5) {$x(t) = e^{j \varphi(t)}$};
    
    % Draw the angle arc
    \draw[thick] (1, 0) arc(0:45:1);
    
    % Label the angle
    \node at (0.7, 0.3) {$\varphi(t)$};
    
    % Mark projection onto real axis
    \draw[dashed] (1.5, 1.5) -- (1.5, 0);
    \draw[dashed] (1.5, 1.5) -- (0, 1.5);
    
    % Label real and imaginary components
    \node at (0.75, -0.2) {Re};
    \node at (-0.25, 1.75) {Im};

\end{tikzpicture}

\end{document}

```

### Energiesignal

**Kontinuierlich:**
$$
\int_{-\infty}^\infty \mid x(t)\mid^{2} dt = \int _{-\infty}^\infty x(t)\cdot x^{*}(t) \, dx  
$$
$x^*$: Konjugation von $x$ (quadrat unabh. von der Phase)

**Diskret**

$$
E=\sum_{n=-\infty}^{\infty}|x[n]|^2=\sum_{n=-\infty}^{\infty} x[n] x^*[n]
$$

Ein periodisches Signal kann kein Energiesignal sein, da:
- Integrationsbereich ist $-\infty$ bis $\infty$

### Leistungssignal

Die Leistung $P$ eines Signals berechnet sich zu:

**Kontinuierlich**

$$
P=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T|x(t)|^2 \mathrm{~d} t=\lim _{T \rightarrow \infty} \frac{1}{2 T} \int_{-T}^T x(t) x^*(t) \mathrm{d} t
$$

**Diskret**

$$
P=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N|x[n]|^2=\lim _{N \rightarrow \infty} \frac{1}{2 N+1} \sum_{n=-N}^N x[n] x^*[n]
$$


Ein Leistungssignal liegt vor, wenn gilt:

$$
0 \leq P<\infty
$$
---

- [Korrelation](Signaltheorie/Korrelation.md)