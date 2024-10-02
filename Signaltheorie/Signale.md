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

```tikz
\usepackage{amsmath}
\begin{document}
\begin{tikzpicture}[scale=2.5]

% Zeitkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {$t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {$x(t)$};
    
    % Das kontinuierliche Signal
    \draw[very thick, color=red,domain=0:3,samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {Zeitkontinuierliches Signal};
\end{scope}

% Zeitdiskretes Signal (rechts)
\begin{scope}[xshift=5cm]
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {$n$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {$x[n]$};
    
    % Das diskrete Signal (gepunktet)
    \foreach \n in {0,...,6} {
        \filldraw[red, very thick] (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)}) circle (1pt);
        \draw[dotted, very thick] (\n*0.5,0) -- (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)});
    }

    \node at (1.5,-2) {Zeitdiskretes Signal};
\end{scope}

\end{tikzpicture}
\end{document}

```

```tikz
\usepackage{amsmath}

\begin{document}
\begin{tikzpicture}[scale=2.5]

% Wertkontinuierliches Signal (links)
\begin{scope}
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {$t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {$x(t)$};
    
    % Das kontinuierliche Signal
    \draw[red, very thick, domain=0:3, samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {Wertkontinuierliches Signal};
\end{scope}

% Wertdiskretes Signal (rechts)
\begin{scope}[xshift=5cm]
    \draw[->, very thick] (-0.2,0) -- (3.5,0) node[right] {$t$};
    \draw[->, very thick] (0,-1.5) -- (0,2) node[above] {$x(t)$};
    
    % Die horizontalen Linien für das Quantisierungsgitter
    \foreach \y in {-1,-0.5,0,0.5,1,1.5} {
        \draw[dotted] (-0.2,\y) -- (3.5,\y);
    }
    
    % Das diskrete Treppensignal (wertdiskret)
    \draw[very thick, red] (0, 0) -- (0.5, 0) -- (0.5, -0.5) -- (1, -0.5) -- (1, -1)
                 -- (1.5, -1) -- (1.5, -0.5) -- (2, -0.5) -- (2, 0.5) 
                 -- (2.5, 0.5) -- (2.5, 0) -- (3, 0);

    \node at (1.5,-2) {Wertdiskretes Signal};
\end{scope}

\end{tikzpicture}
\end{document}

```

## Klassifizierung von Signalen

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