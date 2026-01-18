---
tags:
aliases:
  - Ausbreitungskonstante
  - Phasenkonstante
  - Fortpflanzungskonstante
  - Ausbreitungskoeffizient
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 18th January 2026
professor:
  - Reinhard Feger
release: true
title: Wellenzahl
---

# Wellenzahl

> [!def] **D) Wellenzahl**  $k$ (auch Phasenkonstante)
> 
> $$
> k = \omega \sqrt{ \mu\epsilon } \quad [k] = \frac{1}{m}
> $$
>
> In einem verlustlosen Medium gilt $\mu,\epsilon \in \mathbb{R} \implies k \in \mathbb{R}$.

Für [Verlustbehaftete dielektrische Materialien](../Elektrotechnik/Verlustwinkel.md) welche zusätzlich einen intrinsischen Leitwert aufweisen, wird die Wellenausbreitung durch die komplexwertige Fortpflanzungskonstante beschreiben.

> [!def] **D) Komplexe Fortpflanzungskonstante** $\gamma$
> 
> $$
> \gamma = \alpha + j \beta = j\omega\sqrt{ \mu\epsilon } \sqrt{ 1-j \frac{\sigma}{\omega\epsilon} }
> $$

Dabei ist:

- $\alpha$ die *Dämpfungskonstante* und
-  $\beta$ die *Phasenkonstante*

Man kann erkennen, dass wenn das Material verlustlos ist, also $\sigma = 0$ der Term $\beta=k$ ist. Verluste können statt einer intrinsischen Leitfähigkeit $\sigma$ auch mit der komplexwertigen betrachtung der Permittivität $\epsilon=\epsilon'-j\epsilon''$ modelliert werden. Dieses Modell kann dann mit dem [Verlustwinkel](../Elektrotechnik/Verlustwinkel.md) in zusammenhang gebracht werden.

> [!satz] **S)** Zusammenhang zwischen Verlustwinkel $\tan\delta$ und komplexer Fortpflanzungskonstante $\gamma$
> $$
> \gamma = j\omega\sqrt{ \mu\epsilon } =j\omega\sqrt{ \mu\epsilon'(1-j\tan\delta) }
> $$
