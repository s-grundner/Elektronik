---
tags: 
aliases:
  - Satz von Stokes
keywords: 
subject:
  - VL
  - Mathematik 3
semester: SS24
created: 10. Oktober 2024
professor:
  - Andreas Neubauer
satz:
  - STOI
---
 

# Stokesscher Integralsatz

Der Stokessche Integralsatz ist ein Satz aus der Vektoranalysis, der die Beziehung zwischen einem Linienintegral über den Rand einer Fläche und einem Oberflächenintegral über die Fläche selbst beschreibt.

> [!satz] **S1 - STOI)** Stokesscher Integralsatz
> Sei $\boldsymbol{F}$ ein Vektorfeld und $A$ eine Fläche, die von einer geschlossenen Kurve $L$ umgeben ist. Dann gilt:
> $$\int_{A}(\nabla \times \boldsymbol{F}) \cdot \mathrm{d} \boldsymbol{a}=\oint_L \boldsymbol{F} \cdot \mathrm{d} \boldsymbol{l}$$
> 

## Erläuterung

### Rechte Seite

> [!question] Rechte Seite: $\oint_{L} \boldsymbol{F}\cdot \mathrm{d}\boldsymbol{l}$
> 
> - $\mathrm{d} \boldsymbol{l}$ ist ein Inifitesimales Stück der Kurve $L$, über das integriert wird.
> - Das Ringintegral setzt vorraus das die Kurve $L$ geschlossen ist, das bedeutet, dass der Startpunkt gleich dem Endpunkt ist.
> 
> Durch eine Verknüpfung der Vektoren $\boldsymbol{F}$ und $\mathrm{d} \boldsymbol{l}$ mit dem Skalarprodukt geht nur der Anteil $\boldsymbol{F}_{\|}$, der parallel zur Kurve $L$ verläuft, in das Integral ein.
> 
> ![invert_dark|1200](../assets/StokesRechteSeite.svg)
> 

#### In der Elektrotechnik:

> [!hint] Ist $\boldsymbol{F}$ ein [elektrisches Feld](../Elektrotechnik/Elektrisches%20Feld.md) $\boldsymbol{E}$:
> so entspricht das Linienintegral dem elektrischen Potenzial $\varphi$ entlang der Kurve $L$.
>
> Die Potenzialdifferenz 
> Da die Potenzialdifferenz zwischen Start und Endpunkt gleich $0$ begründet dieser Satz die [Maschenregel](../Elektrotechnik/Kirchhoffsche%20Regeln.md).
> Diese Form des Linienintegrals ist in der Integralform der 3. [Maxwell](../Elektrotechnik/Maxwell.md)-Gleichung - dem Faradayschen Induktionsgesetz - enthalten.
> 
> 

> [!hint] Ist $\boldsymbol{F}$ ein [magnetisches Feld](../Elektrotechnik/magnetisches%20Feld.md) $\boldsymbol{B}$:


