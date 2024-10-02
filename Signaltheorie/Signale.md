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

\begin{document}[scale=2]
\begin{tikzpicture}

% Zeitkontinuierliches Signal (links)
\begin{scope}
    \draw[->] (-0.2,0) -- (3.5,0) node[right] {$t$};
    \draw[->] (0,-1.5) -- (0,2) node[above] {$x(t)$};
    
    % Das kontinuierliche Signal
    \draw[thick,domain=0:3,samples=100,smooth] 
        plot(\x,{0.5*sin(2*\x r) + 0.7*sin(4*\x r)});
        
    \node at (1.5,-2) {Zeitkontinuierliches Signal};
\end{scope}

% Zeitdiskretes Signal (rechts)
\begin{scope}[xshift=5cm]
    \draw[->] (-0.2,0) -- (3.5,0) node[right] {$n$};
    \draw[->] (0,-1.5) -- (0,2) node[above] {$x[n]$};
    
    % Das diskrete Signal (gepunktet)
    \foreach \n in {0,...,6} {
        \filldraw[black] (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)}) circle (2pt);
        \draw[dotted] (\n*0.5,0) -- (\n*0.5,{0.5*sin(2*\n*0.5 r) + 0.7*sin(4*\n*0.5 r)});
    }

    \node at (1.5,-2) {Zeitdiskretes Signal};
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