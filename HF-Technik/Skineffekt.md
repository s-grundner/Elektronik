---
tags:
aliases:
  - evaneszente Welle
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 9th December 2025
professor:
release: false
title: Skineffekt
---

# Skineffekt

Beim übertragen von höherfrequenten Signalen auf einem elektrischen Leiter müssen die Signale als Wellen betrachtet werden ([RF-Signale](RF-Signal.md)). Die propagation von Wellen kann mit der [komplexen Ausbreitungskonstante](../Physik/Feldtheorie/Wellenzahl.md) $\gamma$ beschrieben werden. Ist das Medium ein elektrischer Leiter (mit endlicher Leitfähigkeit) gilt die Annäherung

$$
\gamma = a+j\beta \approx (1+j)\sqrt{ \frac{\omega\mu\sigma}{2} }
$$

Aus der Lösung der Wellengleichung auf einem Leiter in $z$-Richtung folgt, dass die Welle mit $e^{ -\alpha z }$ gedämpft wird. 

> [!def] **D)**  Die distanz $z$, bei der die Dämpfung $e^{ -1 }$ beträgt, also $z=\frac{1}{\alpha}$, beziechnet man als **Eindringtiefe** (en. *Skin Depth*) $\delta_{s}$. ^SKIN-DEPTH
> $$
> \delta_{s} := \frac{1}{\alpha} = \sqrt{ \frac{2}{\omega\mu\sigma} }
> $$


> [!hint] Perfekter Leiter
> Ist der Leiter perfekt leitfähig ($\sigma\to\infty$) geht die Eindringtiefe gegen $0$. Man spricht in diesem Fall von einer "Elektrische Wand" in dem das $\mathbf{E}$ Feld (damit auch das $\mathbf{H}$ Feld) $0$ wird. Das Feld kann medium nicht mehr durchdringen.

Für verlustlose dielektrika ist die eindringtiefe $\delta_{S}\to \infty$

## Interpretation

Dieses Phänomen tritt nur auf, wenn der Leiter zwar gut, aber nicht perfekt leitfähig ist. Nur dann kann die Welle in ein Leitfähiges Material eindringen und sich auf einem Leiter fortbewegen. Man spricht von einer *evaneszenten* Welle, da die Welle nur knapp über der Materialoberfläche existieren kann, und im Material relativ schnell abklingt.

Verwendet man ein Metall (guter Leiter) als einen Wellenleiter, ist es nicht nötig das material dicker zu machen als die Eindringtiefe, da die Welle im inneren sowieso schwächer ist.  Ein dünne beschichtung mit einem gut leitenden Material ist ausreichend für wenig verluste. Man sieht, dass schon ab wenigen Hertz ein Skineffekt festgestellt werden kann.

![invert_dark](../_assets/Pasted%20image%2020260119004236.png)


## Referenzen

[Skin Effect and Surface Currents (Image)](https://incompliancemag.com/skin-effect-and-surface-currents/)
