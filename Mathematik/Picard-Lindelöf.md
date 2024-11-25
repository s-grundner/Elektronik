---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Mathematik 3
semester: WS24
created: 16. Oktober 2024
professor:
---
 

# Satz von Picard-Lindelöf

Es gelten die Vorrausseztungen des Satzes von [Peano](Peano.md).

> [!important] Satz von Picard-Lindelöf
> **(a)** Erfülle $f$ eine Lipschitzbedingung bzgl. $x$, das heißt, es gibt ein $L \geq 0$, sodass
> 
> $$
> \|f(t, x)-f(t, \bar{x})\| \leq L\|x-\bar{x}\| \quad \text { für alle } \quad(t, x),(t, \bar{x}) \in Q_{u, v}
> $$
> 
> Dann besitzt das [AWP]({MOC}%20DGL.md) im Intervall $[t_{0},t_{0}+\alpha]$ eine eindeutige stetig differenzierbare Lösung $x$ mit $\alpha$ aus [Peano](Peano.md).
> 
> **(b)** Weiters gilt, dass die [Funktionenfolge](Analysis/Funktionenfolge.md):
> $$
> \varphi_{n+1}(t):=x_0+\int_{t_0}^t f\left(\tau, \varphi_n(\tau)\right) d \tau, \quad \varphi_0(t):=x_0,
> $$
> 
> gleichmäßig auf $\left[t_0, t_0+\alpha\right]$ für $n \rightarrow \infty$ gegen die Lösung $x$ [konvergiert](Analysis/Grenzwert.md). Zusätzlich gilt auf diesem Intervall für alle $n \in \mathbb{N}_0$ die Abschätzung
> 
> $$
> \left\|\varphi_n(t)-x(t)\right\| \leq M L^n \frac{\left|t-t_0\right|^{n+1}}{(n+1)!} \leq M L^n \frac{\alpha^{n+1}}{(n+1)!} .
> $$
> 
> 
> ist $f:[c,d] \times \mathbb{R}^m \to \mathbb{R}^m$ (definiert über dem ganzen streifen) stetig und Lipschitzstetig $\lvert \lvert f(t) \rvert \rvert$ für alle $(t,x),(t,\overline{x})\in Q_{u,v}$
