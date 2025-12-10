---
tags: 
aliases: 
keywords: 
subject:
  - Physik 1 für TechnikerInnen
  - VL
semester: WS23
created: 24. Januar 2024
professor:
  - Gunther Springholz
---
 

# Mechanischer Schwingkreis

![400](../_assets/m_schwingk.png)

>[!info] Bewegungsgleichung: $F_{a} = F_{feder} + F_{reibung}$
>
> $$
> \begin{align}
> F_{a} = m \cdot \ddot{y}\\
> F_{feder} = -k\cdot y\\
> F_{reibung} = -d \cdot \dot{y}\\
> \end{align}
> $$
>
> ---
>
> $$
> \begin{align}
> 	 m \cdot \ddot{y}=-d \cdot \dot{y}-k\cdot y\\
> 	 0=\ddot{y} + \frac{d}{m} \cdot \dot{y} + \frac{k}{m}\cdot y\\
> \end{align}
> $$

## Bezeichnungen

| Ausdruck | Bezeichnung        |
| -------- | ------------------ |
| $m$      | Masse              |
| $d$      | Dämpfungskonstante |
| $k$      | Federkonstante     |

Man kommt durch umformen auf die finale lineare homogene [Differentialgleichung 2. Ordnung](lineare%20DGL%202.%20Ordnung.md):  

$$\ddot{y} + \frac{d}{m} \cdot \dot{y} + \frac{k}{m}\cdot y = 0$$

Mit dem Exponentialansatz ergibt sich die charakteristische Gleichung:

$$
\lambda^2 +\frac{d}{m}\cdot \lambda + \frac{k}{m}
$$

Die Lösung der Quadratischen Gleichung ist folglich:  

$$\lambda_{1,2}=- \frac{d}{2m}\pm\sqrt{\left(\frac{d}{2m}\right)^{2}- \frac{k}{m}}$$

## Bezeichnungen

| Ausdruck                                                | Bezeichnung                                                        |
| ------------------------------------------------------- | ------------------------------------------------------------------ |
| $2\delta = \frac{d}{m} \rightarrow \frac{d}{2m}=\delta$ | [Abklingkonstante](https://de.wikipedia.org/wiki/Abklingkonstante) |
| $\omega_{0} = \sqrt{\frac{k}{m}}$                      | Resonanzkreisfrequenz                                              |