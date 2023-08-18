---
tags: []
aliases: ["OPV"]
subject: ["hwe"]
source: ["Siegbert Schrempf"]
reference: []
created: 2nd January 2023
---

# Operations-Verstärker

## Grundschaltungen
- Nicht-Invertierender Verstärker
- Invertierender Verstärker
- Umkehrsummierer / Addierer
- Subtrahierer
- Integrator (aktiver Tiefpass)
- Differenzierer (aktiver Hochpass)
- Instrumentenverstärker
- Schmitttrigger

### Umkehrsummierer
### Subtrahierer
#### Helmholzsches Überlagerungsprinzip

1) $U_{e1},U_{e2}=0, U_{a}1$
2) $U_{e1}=0, U_{e2}, U_{a}2$
$$
\begin{align*}
U_{e}'&=U_{e1}\cdot \frac{R_{3}}{R_{3}+R_{4}}\\
U_{a2}&= - \frac{R_{1}}{R_{2}}\cdot U_{e2}\\
U_{a1}&= (1+ \frac{R_{1}}{R_{2}})\cdot U_{e1}'= (1+ \frac{R_{1}}{R_{2}})\cdot(\frac{1}{1+ \frac{R_{4}}{R_{3}}})\cdot U_{e}\\
U_{a}&= U_{a1}+U_{a2}=(1+\frac{R_{1}}{R_{2}})
\end{align*}
$$

## Praxistipps
Slew-Rate: $SR>\dfrac{du}{dt}\rightarrow u(t)\dots$ Beschaltungssignal 

# Quellen
![OPV](OPV.pdf)
![OPV Grundschaltungen](OPV%20Grundschaltungen.pdf)