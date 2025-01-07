---
tags:
  - Halbleiter/BJT
aliases: 
created: 22. September 2023
---

# B-Betrieb

Im B-Betrieb liegt der Arbeitspunkt des Transistors am unteren Ende der Kennlinie.  
Damit ist es dem Verstärker möglich die Signalamplitude (im Vergleich zum [A-Betrieb](A-Betrieb.md)) zu verdoppeln.  
Allerdings kann der [Transistor]({MOC}%20Transistor.md) dann nur eine Halbwelle verarbeiten.  
Die andere Halbwelle muss durch einen zweiten Transistor im Gegentakt-Betrieb verstärkt werden.

Der B-Betrieb wird bei Gegentaktendstufen durch den [AB-Betrieb](AB-Betrieb.md) ersetzt, da sonst durch die fehlende Basisvorspannung am Transistor Übernahmeverzerrungen auftreten entstehen.

Bei Positiven Halbwellen leitet der obere NPN Transistor, bei negativen der untere PNP Transistor

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}
\ctikzset{bipoles/length=0.8cm}
\ctikzset{diodes/scale=0.8}
\ctikzset{transistors/scale=2}
\begin{document}
\begin{circuitikz}[thick, scale=2, transform shape]
% Begin Schematic

\draw (0,1) node[npn](npn){};
\draw (0,-1) node[pnp](pnp){};
\draw (npn.C) node[vcc]{$U_0$};
\draw (pnp.C) node[vee]{$-U_0$};

\draw (npn.B) -- (pnp.B);
\draw (npn.E) -- (pnp.E);
\draw (0,0) to[short] ++(1,0) to[R, l_=$R_L$, v^=$U_a$, o-o] ++(0,-2) node[rground]{};

\draw(npn.B) to[short, *-] ++(-1,0) coordinate(a);
\draw(0,0) to[short, *-] (a |- -1,0) coordinate(b);
\draw[dashed, Triangle-] (a) -- ++(-1,0) node[font=\small, text width=3cm, align=center, above]{vom Ausgang der vorherigen Stufe};
\draw[dashed, -Triangle] (b) -- ++(-1,0) node[font=\small, text width=3cm, align=center, below]{zum Gegenkopplungsnetzwerk (hochohmig)};


\end{circuitikz}
\end{document}
```

> [!warning] Übernahme Verzerrung:
>
> Ein Plateau um $\pm 0.7V$ indem die Eingangsspannung nicht durchdringt. 
>
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> \begin{document}
> \begin{tikzpicture}[scale=1.5, font=\large]
> \begin{axis}[
>     thick, axis lines=middle,
>     xmin=-4, ymin=-4, xmax=4, ymax=4,
>     xlabel=$U_e / V$, ylabel=$U_a / V$,
>     xtick={-0.7, 0.7}, ytick={\empty}, axis equal]
> \addplot[domain=0.7:3.5, color=red]{x-0.7};
> \addplot[domain=-3.5:-0.7, color=red]{x+0.7};
> \addplot[domain=-0.7:0.7, color=red]{0};
> \draw[dashed] (axis cs:-0.7,0) -- (axis cs:-0.7,3) node[left]{Plateau};
> \draw[dashed] (axis cs:0.7,0) -- (axis cs:0.7,3);
> \end{axis}
> \end{tikzpicture}
> \end{document}
> ```
> 
> - Kompensation mittels Gegenkopplung (z.B. durch [OPV](../Operations-Verstärker.md))
> - Weitere Lösung mittels Gegentaktendstufe ([AB-Betrieb](AB-Betrieb.md))

