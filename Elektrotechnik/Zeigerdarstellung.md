---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Einf. ET
semester:
  - WS23
  - B1
created: 7. April 2024
professor: 
cited:
---
 

# Zeigerdarstellung

> [!info] *rotierende* komplexe Zeiger dienen zur Darstellung von Wechselspannungen und -strömen.
> Voraussetzungen:
> - [Netzwerk](Schaltungsanalyse.md) ist linear
> - keine Einschalt-/Umschaltvorgänge
> - Kreisfrequenz ist konstant

$$
\underline{u}(t) = \hat{u}\cdot e^{ j(\omega t+\varphi_{u}) }
$$
… Zurückzuführen auf die [Eulersche Formel](../Mathematik/mathe%20(3)/Eulersche%20Formel.md)


> [!warning] Physikalisch vorhanden und Messbar ist nur der Realteil
> $$
> u(t) = \mathrm{Re}(\underline{u}(t)) = \hat{u}\cos(\omega t+\varphi_{u})
> $$

## Notation

$$
\begin{align}
\underline{u}(t) &= \underline{u}\cdot e^{ j(\omega t) } \\
&= \hat{u} 
\end{align}
$$

### Alternative mit Effektivwertzeiger