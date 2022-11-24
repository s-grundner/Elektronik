---
tags: []
aliases: ["isotroper Kugelstrahler", "isotropen Kugelstahlers"]
subject: ["ksn"]
source: ["Martin Aichriedler"]
reference: ["Gustrau HF Technik"]
created: 24th November 2022
---

# Isotroper Kugelstrahler
Der Isotrope Kugelstrahler ist eine theoretische [[Antenne]], die die ihr zugeführte [[Elektrische Leistung|Leistung]] gleichmäßiges in alle Richtungen abstrahlt.

Die *Strahlungsdichte* $\vec{S_{i}}$ des isotropen Kugelstrahlers im *Abstand* $r$ kann aus der zugeführten *[[Elektrische Leistung|Leistung]]* $P$ und der *Kugeloberfläche* $O = 4\pi r^{2}$, auf die sich die [[Elektrische Leistung|Leistung]] verteilt, berechnet werden.

Die Strahlungsleistungsdichte ist unabhängig von den Winkeln $\varphi$ und $\vartheta$.

$$
\vec{S_{i}}= \frac{P}{4\pi r^{2}}\cdot\vec{e_{r}} = \frac{\vec{E_{i}^{2}}}{Z_{F0}}\cdot \vec{e_{r}}= H_{i}^{2}\cdot Z_{F0}\cdot \vec{e_{i}}
$$

```ad-note
Bei einer allgemeinen [[Antenne]] stellt sich immer eine gewisse Richtwirkung ein, sodass hier die Strahlungsleistungsdichte im Fernfeld auch von den Winkeln $\varphi$ und $\vartheta$ abhängt.

Es gilt: $\vec{S} = S(r,\vartheta,\varphi)\vec{e_{r}}$
```

![[Pasted image 20221124172444.png]]


```ad-info
Der isotrope Kugelstrahler ist technisch nicht realisierbar (Zuführung der Antennenleitung), dient aber bei den Antennenkenngrößen als wichtigste Bezugsgröße.
```

# Quellen
![[Gustrau.pdf]]