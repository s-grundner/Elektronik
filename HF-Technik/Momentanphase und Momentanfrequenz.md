---
tags:
aliases:
  - Momentanphase
  - Momentanfrequenz
  - Instantaneous Phase
  - Instantaneous Frequency
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 15th November 2025
professor:
release: true
title: Momentanphase und Momentanfrequenz
---


# Momentanphase und Momentanfrequenz

> [!question] [Modulation](HF-Technik/Modulation.md)

Anstelle einer Amplitudenmodulation kann die Information auch direkt in das Argument des Kosinusförmigen Trägers eingeprägt werden. Es gilt im allgemeinen das Argument $\varphi(t)$ zeitlich so zu verändern, dass die information möglichst effektiv auf das gewünschte Frequenzband aufmoduliert wird.

$$
s_{\text{TX}}(t) = \cos(\varphi(t))
$$

> [!def] **D - MOMF)**  Momentanphase und Momentanfrequenz
> 
> $$
> \begin{align}
> \omega(t) &= 2\pi f(t) = \frac{\mathrm{d}\varphi}{\mathrm{d}t}(t) \\
> \varphi(t) &= \int_{0}^{t} \omega(t) \mathrm{~d}t + \varphi_{0} 
> \end{align}
> $$

Die Momentanphase eines reinen Kosinus-Ton mit konstanter Frequenz ist eine lineare Funktion:

$$\varphi(t) = 2\pi f_{0} t + \varphi_{0} = \omega_{0}t + \varphi_{0}$$

### Darstellung der Information als komplexes Zeitsignal und Rotierenden Zeigern

Bei der Amplitudenmodulation stellt sich heraus, dass durch die modulation eines reellen (Amplitude einwertig, also reell) Nutzsignals immer ein Symmetrisches Spektrum entsteht.

Zu jedem Zeitpunkt / **Moment** lässt sich feststellen welche Phase und welche Phasenänderung (=Frequenz) der Zeiger Aufweist. 

Man zerlegt den Kosinus in seine komplexen komponenten und man betrachtet den rotierenden Zeiger $e^{ j\varphi(t) }$ als das neues Nutzsignal. Da bekannt ist, dass der zweite Zieger nur konjugiert zum ersten ist, kann der zweite Zeiger entfallen und man erhält ein komplexes Signal. 


![1000](assets/Excalidraw/Modulation%202025-11-15%2002.56.31.excalidraw.svg)
%%[🖋 Edit in Excalidraw](assets/Excalidraw/Modulation%202025-11-15%2002.56.31.excalidraw.md)%%

Man kann sich vorstellen, den Zeiger einerseits durch änderung der Momentanphase zu verschieben oder andererseits mit der Momentanfrequenz den zeiger zu beschleunigen. 

> [!hint] Nun kann man mit der Selben Bandbreite die doppelte Information übertragen, da Imaginär und Realteil zur Verfügung stehen


### Beispiel

Als Beispiel: Lineare Frequenzrampe mit der Momentanfrequenz

$$
f(t) = f_{0} + k_{\text{ramp}} t
$$

Zu beachten ist, dass **immer die Momentanphase** $s(t) = \cos(\varphi(t))$ im argument des Kosinus steht und nicht die momentanfrequenz einfach in den Kosinus eingesetzt werden darf:

> [!error]- Falsche Herangehensweise
Ein solches Signal kann nicht beschrieben werden, wenn man nur die momentanfrequenz in das Argument einsetzt.
> $$
> s_{\text{ramp,wrong}}(t) = \cos(2\pi f(t)t) = \cos(2\pi(f_{0}+k_{\text{ramp}}t)t) = \cos(2\pi(f_{0}t+k_{\text{ramp}}t^{2}))
> $$
> 
> Die Momentanfrequenz wäre dann
> $$
> \frac{\mathrm{d}}{\mathrm{d}t}(2\pi(f_{0}t+k_{\text{ramp}}t^{2})) = 2\pi(f_{0}+2k_{\text{ramp}}t)
> $$
> Was offensichtlich nicht mit dem oben definierten Term für $f(t)$ übereinstimmt

> [!success] Korrekte Herangehensweise 
> 
> 1. Momentanfrequenz integrieren um die Phase zu erhalten
> $$
> \varphi(t) = 2\pi\int_{0}^{t}f_{0}+k_{\text{ramp}}t\mathrm{~d}t = 2\pi \left( f_{0}t + \frac{k_{\text{ramp}}}{2}t^{2} \right) 
> $$
> 2. Momentanphase in das Argument der trigonometrischen Funktione (hier $\cos$) einsetzen
> $$
> s_{\text{ramp}}(t) = \cos \left( 2\pi \left( f_{0}t+ \frac{k_{\text{ramp}}}{2}t^{2} \right)  \right) 
> $$