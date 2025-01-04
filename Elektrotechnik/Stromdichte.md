---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einführung Elektrotechnik
semester: WS23
created: 3. März 2024
professor:
  - Bernhard Jakoby
---
 

# Stromdichte

```tikz
\usepackage{pgfplots}
\usepackage{tikz}
\usepackage{amsmath}
\pgfplotsset{compat=1.16}
\usetikzlibrary{arrows.meta}

\pgfdeclarelayer{bg}    % declare background layer
\pgfsetlayers{bg,main}  % set the order of the layers (main is the standard layer)

\begin{document}
\begin{tikzpicture}[
    vector/.style={-Stealth, very thick},
    area/.style={draw, line width=1mm},
    font=\LARGE
]

\definecolor{currentDensity}{RGB}{0,255,255}
\definecolor{areaColor1}{RGB}{120,120,255}
\definecolor{areaColor2}{RGB}{255,120,120}

\begin{pgfonlayer}{bg}    % select the background layer
    \foreach \v in {1,2,3,4,5} {
        \draw[vector, currentDensity] (\v,-0.5*\v) -- +(3,6);
    };
    \node[areaColor2, fill=white, anchor=north west, below=10pt, fill opacity=1, text opacity=1] at (5.9,3.8) {$\Delta \mathbf{A}_2$};
    \end{pgfonlayer}
% Stromdichte-Vektoren

\node[currentDensity, anchor=south west] at (6,4.5) {$\mathbf{J}$};

% Flächenelemente
\draw[area, areaColor2] (4.5,5) -- (5.5,2);
\draw[vector, areaColor2] (5,3.5) -- (5.9,3.8);

\draw[area, areaColor1] (2,0) -- (4,-1);
\draw[vector, areaColor1] (3,-0.5) -- (0.75,-1.5) node[below] {$\Delta \mathbf{A}_1$};

% Projektion
\draw[dashed, red] (-1,1) -- (-0.5,-1);
\draw[dashed, red] (1,1) -- (2,-1);

% Beschriftungen
\node at (3,-3) {$\mathbf{J} \cdot \Delta \mathbf{A}_1 = \mathbf{J} \cdot \Delta \mathbf{A}_2$};

\end{tikzpicture}
\end{document}
```

> [!info] Die Stromdichte $J$ gibt die [Stromanteil](elektrischer%20Strom.md) $\Delta I$ pro Fläche $\Delta A$ an.
> ![InlineR|242](assets/BspVekFlaecheStromdichte.png) Dabei ist die Orientierung (Ausrichtung) der Fläche in Bezug auf die lokale Stromrichtung natürlich wesentlich.

> [!question] Vektorielles Flächenelements $\Delta \vec{A}$ 
> Zeigt in Richtung der Flächennormale und der [Betrag](../Mathematik/Algebra/Betrag.md) entspricht der Fläche.

> [!question] Die Stromdichte ist ebenfalls eine [vektorielle](Vektor.md) Größe
> und zeigt in Richtung der lokalen Stromrichtung
> - (Richtung der mittleren [Geschwindigkeit](../Physik/Kinematik.md) bei positiven Ladungsträgern bzw. entgegengesetzt bei negativen).

$\Delta I$ durch eine Fläche $\Delta \vec{}{A}$ daher: $\Delta I=\vec{J} \cdot \Delta \vec{A}$

Da die Stromdichte lokal variieren kann, ist die exakte Definition eine differenzielle bzw. muss für einen endlichen Bereich integriert werden:
$$
d I=\vec{J} \cdot d \vec{A} \quad \Rightarrow \quad I=\int_A \vec{J} \cdot d \vec{A}
$$

> [!success] Hier kommt das [Flächenintegral](Flächenintegral.md) ($\int _{A}$) zum Einsatz.

---

> [!warning] Begriff Dichte
> Dicht kann alle mögliche bedeuten:
> - x pro Volumen
> - x pro Fläche (wie hier)