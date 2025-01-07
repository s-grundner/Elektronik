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

\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large]
% Begin Schematic

\draw (0,1) node[npn](npn){};
\draw (0,-1) node[pnp](pnp){};
\draw (npn.C) -- (0,2) node[vcc]{$U_0$};
\draw (pnp.C) -- (0,-2) node[vee]{$-U_0$};

\draw (npn.B) -- (pnp.B);
\draw (npn.E) -- (pnp.E);
\draw (0,0) to[short, -o] ++(1,0);

\draw(npn.B) to[short, *-] ++(-1,0) coordinate(a);
\draw(0,0) to[short, *-] ++(-1,0) coordinate(b);
\draw[dashed, ->] (a) -- ++(-1,0);
\draw[dashed, ->] (b) -- ++(-1,0);


\end{circuitikz}
\end{document}
```

> [!warning] Übernahme Verzerrung:
>
> Ein Plateau um $\pm 0.7V$ Am ausgang des Verstärkers aufgrund der Basis Emiter spannungen.
>
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> \begin{document}
> \begin{tikzpicture}[scale=2, font=\large]
> \begin{axis}[
>     thick, axis lines=middle,
>     xmin=-5, ymin=-5, xmax=5, ymax=5,
>     xlabel=$U_e / V$, ylabel=$U_a / V$,
>     xtick={-0.7, 0.7}, ytick={\empty}]
> \addplot[domain=0.7:4, color=red]{x-0.7};
> \addplot[domain=-4:-0.7, color=red]{x+0.7};
> \addplot[domain=-0.7:0.7, color=red]{0};
> \end{axis}
> \end{tikzpicture}
> \end{document}
> ```
> 
> - Kompensation mittels Gegenkopplung (z.B. durch [OPV](../Operations-Verstärker.md))
> - Weitere Lösung mittels Gegentaktendstufe (AB-Betrieb)

