---
tags: 
aliases:
  - Energieerhaltungssatz
  - potentielle Energie
  - kinetische Energie
keywords: 
subject:
  - Physik 1 für TechnikerInnen
  - VL
semester: WS23
created: 18. Oktober 2023
professor:
  - Gunther Springholz
---
 

# Kinetische Energie

> [!INFO] Eindimensionale Betrachtung:
> Ein Körper befindet sich zur Zeit $t_{0}=0$ am Ort $s_{0}$ und bewegt sich mit der [Geschwindigkeit](Kinematik/Kinematik.md) $v_{0}$.
> 
> Zur Zeit $t=0$ beginnt eine [Kraft](Kinematik/{MOC}%20Kräfte.md) $F$ zu wirken, wodurch es zu einer [Beschleunigung](Kinematik/Kinematik.md) der [Bewegung](Kinematik/Kinematik.md) kommt.
> 
> Zu einer späteren Zeit $t_{1}$ hat dann der Körper die [Geschwindigkeit](Kinematik/Kinematik.md) $v_{1}$ und befindet sich am Ort $s_{1}$.


Wir berechnen die [Arbeit](Kinematik/Mechanische%20Arbeit.md) $W$, die die [Kraft](Kinematik/{MOC}%20Kräfte.md) $F$ entlang des Weges von $s_0$ bis $s_1$ verrichtet:
$$
W=\int_{s_0}^{s_1} F\cdot d s=\int m \cdot a\cdot ds=\int m \cdot\frac{dv}{dt} d s=\int m \frac{dv}{ds} \frac{ds}{dt} d s=\int_{v_0}^{v_1} m\cdot v d v=\frac{1}{2} m v_1^2-\frac{1}{2} m v_0{ }^2
$$

Dabei haben wir die Kettenregel der Differentialrechnung benutzt:
$$
\frac{dv}{dt}=\frac{dv}{dt} \cdot \frac{ds}{ds}=\frac{dv}{ds} \frac{ds}{dt}=v \frac{dv}{ds}
$$

> [!important] **Definition**: Die <u>kinetische Energie</u>
> eines Körpers ist:
> $$E_{kin} = \frac{1}{2}mv^{2}$$

# Potenzielle Energie

## Weiterleitung

- potenzielle Energie im [elektrischen Feld](../../Elektrotechnik/Elektrisches%20Feld.md): [elektrische Spannung](../../Elektrotechnik/elektrische%20Spannung.md)
