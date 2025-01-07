# Bipolartransistor als Verstärker / Endstufe

| Betriebsarten                                                                                                      | Kennlinie                                       |
| ------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------- |
| [A-Betrieb](A-Betrieb.md)<br>[B-Betrieb](B-Betrieb.md)<br>[AB-Betrieb](AB-Betrieb.md)<br>[C-Betrieb](C-Betrieb.md) | ![](assets/Pasted%20image%2020230922135134.png) |

# Kollektorschaltung

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1.5, font=\Large]
% NPN

\draw (0,0) node[npn](npn){};
\draw (npn.C) to[short] (0,2) node[vcc]{$U_0$};
\draw (npn.E) to[R, l=$R_{E}$, u=$U$, *-] (0,-2) node[ground]{};
\draw (npn.E) -- ++(1,0) to[R=$R_L$] (1, -2) node[ground]{};
\draw (npn.E) -- ++(-1,0) coordinate(a);
\draw[dashed, <-] (npn.B) -- ++(-1,0) node[left]{vom Ausgange der Vorherigen Stufe};
\draw[dashed, ->] (a) -- ++(-1,0) node[left]{zum Gegenkopplungsnetzwerk (hochohmig)};



\end{circuitikz}
\end{document}
```


---

- [Wikipedia - Endstufe](https://de.wikipedia.org/wiki/Endstufe)