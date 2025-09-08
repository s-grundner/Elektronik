---
tags: 
aliases:
  - Hurwitzmatrix
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 26th May 2025
professor: 
release: false
title: Hurwitz-Matrix
---

# Hurwitz-Matrix

> [!def] **D - HURM)** Hurwitz-Matrix ^HURM
> Eine Matrix $\mathbf{A}$ von der **alle** [Eigenwerte](../Algebra/Eigenvektor.md) einen **negativen Realteil** besitzen.
> $$ \forall \lambda = \alpha+i\omega: \quad \alpha < 0 $$

> [!satz] **S - BIBO)** Hinreichende Bedingung für [BIBO](../../Systemtheorie/Stabilität%20und%20Beschränktheit.md)-Stabilität eines Systems:
> 
> Wenn die Koeffizientenmatrix eines zeitkontinuierlichen Autonomen System eine Hurwitzmatrix ist, dann ist das System stabil.
>
> Warum? Der Realteil ist für den Dämpfungsfaktor in der Lösung der DGL verantwortlich. Ist dieser negativ, konvergiert $e^{ \alpha t } \to 0$.


Das zeitdiskrete äquivalent einer Hurwitzmatrix ist die [Einheitskreismatrix](../../Systemtheorie/Einheitskreismatrix.md).

# Referenzen

- [Autonomes DGL-System](Autonomes%20DGL-System.md)
- [Kontinuierlicher LTI-Zustandsraum](../../Systemtheorie/Kontinuierlicher%20LTI-Zustandsraum.md)
- [Ljapunov](Ljapunov.md)