---
tags:
  - Software-Engineering/DesignPattern
aliases:
  - Monade
created: 10. November 2024
cited:
---

# Monad

## Vektoren und lin. Abbildungen

```tikz
\usepackage{tikz-cd}

\begin{document}

\begin{tikzcd}[cells={nodes={scale=1.5}}]
T(T(T(X))) \arrow[r, "T(\mu_X)"] \arrow[d, "\mu_{T(X)}"'] & T(T(X)) \arrow[d, "\mu_X"] \\
T(T(X)) \arrow[r, "\mu_X"'] & T(X)
\end{tikzcd}

\end{document}
```

Der Typkonstruktor bildet hier einen Typ $T$ auf einen [Vektorraum](../Mathematik/Algebra/Vektorraum.md) $V(T)$ ab, bei dem $T$ als (Namensgeber für eine) Basis dient, und dessen Elemente beispielsweise als Funktionen $T \rightarrow \mathbb{R}$ modelliert werden.

Die Bindeoperation (`>>=`) hat den Typ $V(T) \rightarrow(T \rightarrow V(U)) \rightarrow V(U)$.

Durch Vertauschen der Argumente erhält man den Typ $(T \rightarrow V(U)) \rightarrow(V(T) \rightarrow V(U))$, an dem man die Semantik erkennen kann: die gegebene Funktion, die auf den Basiselementen definiert ist, wird zu einer vollen [linearen Abbildung](../Mathematik/Algebra/Lineare%20Abbildungen.md) erweitert.

Die Einheitsfunktion bildet das Basiselement (welches in dieser Modellierung noch kein „richtiger" [Vektor](../Mathematik/Algebra/Vektor.md) ist) auf den entsprechenden Basisvektor ab.

---

[Intro zu Monaden](https://www.youtube.com/watch?v=C2w45qRc3aU&t=365s)

[What is a monad? (Design Pattern) - YouTube](https://www.youtube.com/watch?v=VgA4wCaxp-Q)