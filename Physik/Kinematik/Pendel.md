---
tags: 
aliases:
  - Fadenpendel
keywords: 
subject:
  - Physik für TechnikerInnen
  - VL
semester: WS23
created: 25. Januar 2024
professor:
  - Gunther Springholz
---
 

# Pendel

## Das Mathematische Pendel

>[!info] mathematisches Pendel  
> Das mathematische Pendel ist die Idealisierung eines Fadenpendels bei dem eine Punktmasse $m$ an einem masselosen Faden der Länge $l$ schwingt.

![InlineR|300](../../_assets/Pasted%20image%2020240125163942.png)

> [!important] Winkel $\theta$  
> Das Pendel sei um den Winkel $\theta$ ausgelenkt  
> ($\theta$ wird nach rechts positiv gezählt).

> [!important] Bogenlänge $s$  
> $s=\theta \cdot l$

> [!important] [Kinematik](Kinematik/Kinematik.md) - die zeitliche Ableitungen ([Geschwindigkeit](Kinematik/Kinematik.md) und [Beschleunigung](Kinematik/Kinematik.md)) betragen:  
> $\dot{s}=v=l\cdot\dot{\theta}=l\cdot\omega$  
> $\ddot{s}=a=l\cdot \ddot{\theta}=l\cdot\alpha$

### Bewegungsgleichung

Auf die Masse $m$ wirkt die Gewichtskraft $mg$ und die Zugkraft $T$ im Faden.  
Die Komponente $mg\cos\theta$ und $T$ heben sich auf und es bleibt die senkrechte Komponente *$F_{r}=-mg\sin\theta$* als rücktreibende [Kraft](Kinematik/{MOC}%20Kräfte.md) übrig.

> [!info] Durch Anwendung des [2. Newtonschen Gesetzes](Kinematik/{MOC}%20Kräfte.md) ($\sum F=0$) erhalten wir die Bewegungsgleichung:  
>
> $$F_{r}=m\cdot a=m\cdot l\cdot\ddot{\theta}=-m\cdot g\cdot \sin\theta$$