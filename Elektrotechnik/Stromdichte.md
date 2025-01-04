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
\usetikzlibrary{arrows.meta}

\begin{document}
\begin{tikzpicture}[
    vector/.style={-Stealth, thick},
    area/.style={draw, thick},
]

% Stromdichte-Vektoren
\foreach \v in {1,2,3,4,5}{
    \draw[vector, cyan] (\v,-0.5*\v) -- +(4,7);
}

% Flächenelemente
\draw[area, red] (-1,1) -- (1,1);
\draw[vector, red] (0,1) -- (0,1.5) node[above] {$\Delta \mathbf{A}_1$};

\draw[area, green] (-0.5,-1) -- (2,-1);
\draw[vector, green] (0.75,-1) -- (0.75,-1.5) node[below] {$\Delta \mathbf{A}_2$};

% Projektion
\draw[dashed, red] (-1,1) -- (-0.5,-1);
\draw[dashed, red] (1,1) -- (2,-1);

% Beschriftungen
\node[color={RGB:red,255;green,255;blue,255}] at (3,1) {$\mathbf{J}$};
\node at (3,-1) {$\mathbf{J} \cdot \Delta \mathbf{A}_1 = \mathbf{J} \cdot \Delta \mathbf{A}_2$};

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