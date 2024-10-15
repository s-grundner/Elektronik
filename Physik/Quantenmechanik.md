---
tags: 
aliases: 
keywords:
  - Zusammenhang Frequenz und Energie
  - De Broglie
  - k-Impuls
subject:
  - VL
  - Einführung Elektronik
semester: WS24
created: 8. Oktober 2024
professor:
  - Bernhard Jakoby
---
 

# Quantenmechanik

Elektronen-Fermigas aus Metall entfernen

- Wärme
- Reibung
- Elektrisches Feld -> [Elektronenemission – Wikipedia](https://de.wikipedia.org/wiki/Elektronenemission)

![invert_dark](assets/AtmoEmision.png)

- Die Elektronen sind bewegte Ladungen, also ein Elektrischer Strom/Magnetfeld
    - Vorallem EM-Wellen
- Elektronen im instabilen Abständen fallen zum Nukleus
    - Es gibt Abstände/Bereiche wos das Nicht Passiert -> Schalen/Orbitale
- Beim sinken in eine Schale wird energie in Form einer EM-Welle frei
    - Emission von Licht (Teilchen: Photon)

## Photoelektrischer Effekt

Nobelpreis Einstein: Existenz von Photonen

> [!important] De Broglie: Gleichung für Photonen
> 
> $$
> \begin{rcases}
> E=hf=h\cdot \frac{c}{\lambda} \\
> E=mc^{2} \\
> p=mc
> \end{rcases} \implies\lambda=\frac{h}{p}
> $$
> 
> $h$ ... [Plancksches Wirkungsquantum](../../../Physik/Konstanten/Plancksches%20Wirkungsquantum.md)

> [!important] Zusammenhang Frequenz und Energie:
> $\omega=2\pi f= 2\pi \cdot \frac{E}{h}$

> [!important] Zusammenhang Wellenzahl $k$-Impuls:
> $k=\frac{2\pi}{\lambda}\implies p=\hbar \cdot k$ mit $\hbar = \frac{h}{2\pi}$



Wie kann ein Photon Lichtgeschw. annehmen, wenn gilt: $m=\frac{m_{0}}{\sqrt{ 1- \frac{v^{2}}{c^{2}} }}$ ? $\implies m_{0 \text{ photon }}=0$ 

> [!success] Raum-, Zeitabhängigkeit für (Ebene) Materiewelle $\psi$ in komplexer notation
> $$\psi\propto e^{-j\omega t}\cdot e^{jkx}= e^{ -j \dfrac{E}{\hbar}\cdot t }\cdot e^{ j\dfrac{p}{\hbar}\cdot x }$$

## Schrödunger gleichung

### Freies Teilchen

- Energie eines Freiem Teilchen: $E_{ges}$ = kinetische Energie (klassisch):
$$
E=E_{ges}=\frac{p^{2}}{2m}
$$
Materiewelle $\psi$ erfüllt folgende DGL: 

> [!important] Schrödingergleichung für freies Teilchen
> 
> 
> $$
> - \frac{\hbar}{2m} \frac{\partial^{2}\psi(x,t) }{\partial x^{2}} = j\frac{\partial \psi(x,t)}{\partial t}
> $$
> 

### Teilchen in Potenzial $V(x)$

- Teilchen in potential $V(x)$ (ortsabh. Energie)

$$
E = E_{kin} + V(x)=\frac{p^{2}}{2m}\cdot E_{\text{kin}}
$$

> [!important] Schrödingergleichung für Teilchen im Potenzial $V(x)$
> $$
> -\frac{\hbar}{2m} \frac{\partial^{2}\psi(x,t)}{\partial x^{2} }+V(x) \cdot \psi(x,t)= j\hbar \frac{\partial \psi(x,t) }{\partial x}
> $$

## Erwartungswerte

```tikz
\usepackage{amsmath}

\begin{document}
\begin{tikzpicture}[scale=2]

\newcommand\OFS{0};

\begin{axis}[colormap/viridis]
\addplot3[
surf,
samples=16,
domain=-3:3
]
{exp(-(x-\O))};
\end{axis}
    
% Weitere Punkte auf der Kurve (optional)
\foreach \x in {-1, 1} {
    \draw[dashed] (\x, 0) -- (\x, {exp(-\x*\x)});
    \fill (\x, {exp(-\x*\x)}) circle (1pt);
}
\end{tikzpicture}
\end{document}
`