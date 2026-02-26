---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Technische Informatik
semester: WS23
created: 18th May 2025
professor:
title: KV-Diagramm
---

# Karnaugh-Veitch Diagramm

> [!quote] [ˈkɑːɹnɔː viːtʃ]

## LaTeX

```latex
\documentclass{standalone}
\usepackage{kvmap}

\begin{document}
    \begin{kvmap}
    \begin{kvmatrix}{x_0,x_2,x_1,x_3}
        1 & 0 & 0 & 1\\
        0 & 1 & 1 & 0\\
        0 & 1 & 1 & 0\\
        1 & 0 & 0 & 1
    \end{kvmatrix}
    \bundle[color=red]{1}{1}{2}{2}
    \draw[kvbundle,red] (00.south west) -| (00.north east);
    \draw[kvbundle,red] (33.south west) |- (33.north east);
    \draw[kvbundle,red] (30.south east) -| (30.north west);
    \draw[kvbundle,red] (03.south east) |- (03.north west);
    \end{kvmap}
\end{document}
```