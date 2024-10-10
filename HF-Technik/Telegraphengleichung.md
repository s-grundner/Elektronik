---
tags:
  - RF
aliases:
  - Ausbreitungskoeffizient
  - Fortpflanzungskonstante
subject:
  - HF-Systemtechnik 1
  - KV
semester: WS24
professor:
  - Reinhard Feger
created: 1st March 2023
---

# Telegraphengleichung

Die Telegraphengleichung ist eine gewöhnliche [DGL 2. Ordnung](../Mathematik/Algebra/lineare%20DGL%202.%20Ordnung.md) und beschreibt die Propagation einer Spannungswelle auf einer [HF-Übertragungsleitung](Transmission%20Line.md) mit Berücksichtigung der durch den materialgegebenen Signalausbreitungs-Geschwindigkeiten. 

> [!summary] Telegraphengleichung
>
> $$ \boxed{ \frac{d^{2}u}{dz^{2}}=u(z)\cdot\gamma^{2} }$$

> [!summary] Lösung der Telegraphengleichung
>
> $$ u(z)= U_{h}\cdot e^{-\gamma\cdot z}+ U_{r}\cdot e^{\gamma\cdot z} $$
> 
> Als Lösung der Telegraphengleichung ergibt sich die Überlagerung gegenläufiger, exponentiell gedämpfter Spannungswellen
> 
> - $U_{h}$ = Amplitude der hinlaufenden Welle
> - $U_{r}$ = Amplitude der rücklaufenden Welle

> [!summary] komplexer Ausbreitungskoeffizient $\gamma$
> Die Ausbreitungskonstante $\gamma$ beschreibt dabei die komplexe [Dämpfung](../Hardwareentwicklung/Dämpfung.md) und Wellenlänge und ist eine wichtige Leitungskenngröße.
> 
> $$ \gamma = \sqrt{(R'+j\omega L')(G'+j\omega C')} = \alpha + j\beta  $$
> 
> $(\,\cdot\,)'\,$: **Leitungsbeläge** nach der [Leitungstheorie](Leitungstheorie.md)
> $\alpha\,$: **Dämpfungsbelag** (Dämpfung der Signalamplitude)
> $\beta\,$: **Phasenbelag** (Verzögerung der Ausbreitungsgeschwindigkeit)

## Herleitung

> [!summary] [Kirchhoff](../Elektrotechnik/Kirchhoffsche%20Regeln.md)'sche Gesetze in der [Leitungstheorie](Leitungstheorie.md)
> 1. [Knotenregel](../Elektrotechnik/Kirchhoffsche%20Regeln.md)
> 2. [Maschenregel](../Elektrotechnik/Kirchhoffsche%20Regeln.md)



# Tags