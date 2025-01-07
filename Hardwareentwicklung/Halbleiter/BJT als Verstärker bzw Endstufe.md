# Bipolartransistor als Verstärker / Endstufe

| Betriebsarten                                                                                                      | Kennlinie                                       |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------- |
| [A-Betrieb](A-Betrieb.md)<br>[B-Betrieb](B-Betrieb.md)<br>[AB-Betrieb](AB-Betrieb.md)<br>[C-Betrieb](C-Betrieb.md) | ![](assets/Pasted%20image%2020230922135134.png) |

# Kollektorschaltung

Eine EIgenschaft der Kollektorschaltung ist, dass sie zwar eine Spannungsverstärkung von $\approx 1$ hat, jedoch eine hohe Stromverstärkung. Daher eignet sie sich als Endstufe für große Leistungen dda sie den Strom Liefern kann ohne dass die Spannung ei


```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{tikz}
\usepackage{amsmath}
\usetikzlibrary{arrows.meta}

\begin{document}
\begin{circuitikz}[very thick, scale=2, font=\Large]
% NPN

\draw (0,0) node[npn](npn){};
\draw (npn.C) node[vcc]{$U_0$};
\draw (npn.E) to[R, l_=$R_{E}$, *-] (0,-2) node[ground]{};
\draw (npn.E) -- ++(1,0) to[R, l_=$R_L$, v^=$U_a$, o-o] (1, -2) node[ground]{};
\draw (npn.E) -- ++(-1,0) coordinate(a);
\draw (npn.B) -- (a |- -1,0);
\draw[dashed, -Triangle] (a) -- ++(-1,0) node[left]{zum Gegenkopplungsnetzwerk (hochohmig)};
\draw[dashed, Triangle-] (a |- -1,0) -- ++(-1, 0) node[left]{vom Ausgange der Vorherigen Stufe};

\end{circuitikz}
\end{document}
```


---

- [Wikipedia - Endstufe](https://de.wikipedia.org/wiki/Endstufe)