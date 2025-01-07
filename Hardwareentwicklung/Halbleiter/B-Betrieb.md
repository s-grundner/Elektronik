---
tags:
  - Halbleiter/BJT
aliases: 
created: 22. September 2023
---

# B-Betrieb

Im B-Betrieb liegt der Arbeitspunkt des Transistors am unteren Ende der Kennlinie.  
Damit ist es dem Verstärker möglich die Signalamplitude (im Vergleich zum A-Betrieb) zu verdoppeln.  
Allerdings kann der [Transistor]({MOC}%20Transistor.md) dann nur eine Halbwelle verarbeiten.  
Die andere Halbwelle muss durch einen zweiten [Transistor]({MOC}%20Transistor.md) im Gegentakt-Betrieb verstärkt werden.

> [!important] Bei dieser Schaltung handelt es sich dann um eine Gegentaktendstufe

Der B-Betrieb wird bei Gegentaktendstufen durch den [AB-Betrieb](AB-Betrieb.md) ersetzt, da sonst durch die fehlende Basisvorspannung am [Transistor]({MOC}%20Transistor.md) Übernahmeverzerrungen auftreten entstehen.

Bei Positiven Halbwellen leitet der obere NPN Transistor, bei negativen der untere PNP Transistor

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large]
% Begin Schematic

\draw (0,1) node[npn](npn){};
\draw (npn.C) to[short] (0,2) node[vcc]{$U_0$};
\draw (0,-1) node[pnp](pnp){};
\draw (pnp.C) to[short] (0,-2) node[vee]{$-U_0$};

\draw (npn.B) -* (pnp.B);

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
> 
> \begin{document}
> 
> \begin{tikzpicture}
> \begin{axis}[
>     thick, axis lines=middle,
>     xmin=-5, ymin=-5, xmax=5, ymax=5,
>     xlabel=$U_e$, ylabel=$U_a$,
>     xtick={-0.7, 0.7}, ytick={}]
> \addplot[domain=0.7:4, color=red]{x-0.7};
> \addplot[domain=-4:-0.7, color=red]{x+0.7};
> \addplot[domain=-0.7:0.7, color=red]{0};
> \end{axis}
> \end{tikzpicture}
> 
> \end{document}
> ```
> 
> - Kompensation mittels Gegenkopplung (z.B. durch OPV)
> - Weitere Lösung mittels Gegentaktendstufe (AB-Betrieb)

