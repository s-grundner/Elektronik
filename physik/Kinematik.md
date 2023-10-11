---
tags:
  - Physik
aliases:
  - Geschwindigkeit
  - Beschleunigung
keywords:
  - x-t Diagramm
  - v-t Diagramm
  - a-t Diagramm
subject:
  - Physik für TechnikerInnen
  - "322.005"
semester: 1
created: 11. Oktober 2023
professor:
  - Gunther Springholz
---
 

# Kinematik

> [!INFO] Die *Kinematik* beschäftigt sich mit der Beschreibung der Bewegung von Körpern
> Sie beschreibt *wie* sich Körper bewegen, ohne zu fragen *warum*

> [!INFO] Definition der Geschwindigkeit
> Wie stark ändert sich der Weg über die Zeit.
> Durchschnitts Geschwindigkeit: $\langle v \rangle=\frac{x_{2}-x_{1}}{t_{2}-t_{1}} = \frac{\Delta x}{\Delta t}$
> Momentangeschwindigkeit: $\lim_{ \Delta t \to 0 } \frac{\Delta x}{\Delta t}=\frac{dx}{dt}=\dot{x}(t)$
Einheit: $[v] = \frac{m}{s}$


> [!INFO] Definition der Beschleunigung
> Wie stark ändert sich die Geschwindigkeit über die Zeit
> Durchschnitts-Beschleunigung: $\langle a \rangle = \frac{v_{2}-v_{1}}{t_{2}-t_{1}}=\frac{\Delta v}{\Delta t}$
> Momentane Beschleunigung: $a(t)=\lim_{ t \to 0 } \frac{\Delta v}{\Delta t}=\frac{dv}{dt}= \dot{v}$
> $a(t)=\frac{dv}{dt} = \frac{d}{dt}\left( \frac{dx}{dt} \right)=\frac{d^{2}x}{dt^{2}}=\ddot{x}(t)$
> Einheit: $\frac{m}{s^{2}}$


>[!EXAMPLE] $x(t) = t_{0}+A t^{2}-C t^{3}+\sin(\omega t)$
>$v(t)=\frac{dx}{dt}=0+2At-3Ct^{2}+\omega\cos(\omega t)$
> $a(t)=\frac{dv}{dt}=\frac{d^{2}x}{dt^{2}}=0+2A-6Ct-\omega^{2} \sin(\omega t)$


$$
\begin{align}
&s(t) \\
\frac{d}{dt}\downarrow &\quad \uparrow \int  \, dt  \\
v(t) &= \dot{s}(t) \\
\frac{d}{dt}\downarrow &\quad\uparrow \int  \, dt  \\
a(t) &= \dot{s}(t)
\end{align}
$$

> [!WARNING] Bei Integrieren sind die Anfangswerte zu beachten ($+C$... Integrationskonstante)