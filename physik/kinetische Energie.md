---
tags: 
aliases: 
keywords: []
subject:
  - Physik für TechnikerInnen
  - "322.005"
semester: 1
created: 18. Oktober 2023
professor:
---
 

# kinetische Energie

> [!INFO] Eindimensionale Betrachtung:
> Ein Körper befindet sich zur Zeit $t_{0}=0$ am Ort $s_{0}$ und bewegt sich mit der [Geschwindigkeit](Kinematik.md) $v_{0}$. Zur Zeit $t=0$ beginnt eine [Kraft](Newtonsche%20Axiome.md) $F$ zu wirken, wodurch es zu einer [Beschleunigung](Kinematik.md) der Bewegung kommt. Zu einer späteren Zeit $t_{1}$ hat dann der Körper die [Geschwindigkeit](Kinematik.md) $v_{1}$ und befindet sich am Ort $s_{1}$.


Wir berechnen die [Arbeit](../Mechanische%20Arbeit.md) $W$, die die [Kraft](Newtonsche%20Axiome.md) $F$ entlang des Weges von $s_0$ bis $s_1$ verrichtet:
$$
W=\int_{s_0}^{s_1} F d s=\int m a d s=\int m \frac{d v}{d t} d s=\int m \frac{d v}{d s} \frac{d s}{d t} d s=\int_{v_0}^{v_1} m v d v=\frac{1}{2} m v_1^2-\frac{1}{2} m v_0{ }^2
$$

Dabei haben wir die Kettenregel der Differentialrechnung benutzt:
$$
\frac{d v}{d t}=\frac{d v}{d t} \cdot \frac{d s}{d s}=\frac{d v}{d s} \frac{d s}{d t}=v \frac{d v}{d s}
$$