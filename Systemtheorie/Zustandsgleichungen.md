---
tags: 
aliases:
  - Zustandsbeschreibung
  - Zustandsvariablen
  - Zustandsraum
keywords: 
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 18. Dezember 2024
professor:
  - Andreas Stelzer
---
 

# Zustandsbeschreibung eines Systems

- Der Zustand des Systems beschreibt die internen Größen des Systems
- Zustand:
    Für jeden Zeitpunkt $t_0$ reicht die Kenntnis des Zustandes zu diesem Zeitpunkt $t_0$ zusammen mit der Kenntnis der Erregung für alle Zeiten $t \geq t_0$ aus, um die Antwort des Systems für alle Zeiten $t \geq t_0$ zu bestimmen
- Es spielt dabei keine Rolle, wie der Zustand in der Vergangenheit (zu Zeiten $t<t_0$ ) entstanden ist
- In der Regel wird der Zustand eines Systems durch mehrere Größen beschrieben
- Häufig werden Systeme mit mehreren Eingängen und mehreren Ausgängen betrachtet

Zustandsgrößen sind Variablen die auskunft über die vom System beinhaltete Energie geben. 

- Im Feder-Masse-Dämpfer-System: Geschwindigkeit $v$ und Auslenkung $x$
- Im RC: Spannung am C $u_{c}(t)$
- Im RLC: Spannung am C $u_{c}(t)$ und Strom in L $i_{l}(t)$



Der Zustandsraum ist die Vorbeireitung um Systeme auf eine beliebige anzahl von ein und Ausgängen zu erweitern (MIMO)

>[!example] Zustandsbeschreibung eines Parallelschwingkreis
> Relevant ist, wo hier die Energie gespeichert wird. 

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1, font=\Large]
% Begin Schematic

\draw (0,0) to[I, l=$i_0$, i=$i_0$] (0,4) to[short] (2,4) to[L, i_=$i_L(t)$, *-*] (2,0) to[short] (0,0);
\draw (2,4) to[short] (4,4) to[R, i_=$i_R(t)$, *-*] (4,0) to[short] (2,0);
    \draw (4,4) to[short] (6,4) to[C, i_=$i_C(t)$, v^=$u_C(t)$] (6,0) to[short] (4,0);

\end{circuitikz}
\end{document}
```

Zustansgrößen:

- $u_C(t)$
- $i_L(t)$

Beide Größen sind Funktionen der Zeit und mit den beiden unabhängigen Energiespeichern im System direkt verknüpft $\rightarrow$ Zustandsvariablen Die Kapazität speichert die gesamte Vergangenheit in Form der eingebrachten Ladung als Spannung $u_C\left(t_0\right)$ und die Induktivität in Form des Stromes $i_L\left(t_0\right)$

Gleichungen zur Zustandsbeschreibung:

$$
\begin{aligned}
u_C(t) & =\frac{1}{C} \int_{-\infty}^t i_C(\tau) \mathrm{d} \tau=\frac{1}{C} \int_{-\infty}^{t_0} i_C(\tau) \mathrm{d} \tau+\frac{1}{C} \int_{t_0}^t i_C(\tau) \mathrm{d} \tau \\
& =\boxed{ u_C\left(t_0\right)+\frac{1}{C} \int_{t_0}^t i_C(\tau) \mathrm{d} \tau } \\
i_L(t) & =\frac{1}{L} \int_{-\infty}^t u_L(\tau) \mathrm{d} \tau=\frac{1}{L} \int_{-\infty}^{t_0} u_L(\tau) \mathrm{d} \tau+\frac{1}{L} \int_{t_0}^t u_L(\tau) \mathrm{d} \tau \\
& =\boxed{ i_L\left(t_0\right)+\frac{1}{L} \int_{t_0}^t u_L(\tau) \mathrm{d} \tau }
\end{aligned}
$$


Mit jedem zusätzlichen energie speicher steigt die Ordnung der DGL die das system beschreibt um 1.

## Zustandsgleichungen

- Beschreibung von LTI-Systemen mit Hilfe gewöhnlicher linearer Differentialgleichungen beliebiger Ordnung
- Im allgemeinen Fall: ein System von Differentialgleichungen
- Jede Differentialgleichung höherer Ordnung lässt sich in ein System von Differentialgleichungen 1. Ordnung zerlegen

> [!hint] [Lineare DGL n-ter Ordnung](Mathematik/Analysis/Lineare%20DGL%20n-ter%20Ordnung.md) $\to$ [DGL-System](Mathematik/Analysis/DGL-System.md) 1. Ordnung
> Differentialgleichung $n$-ter Ordnung:
> 
> $$x^{(n)}+\alpha_n x^{(n-1)}+\ldots+\alpha_3 \ddot{x}+\alpha_2 \dot{x}+\alpha_1 x=u$$
> 
> Wird Zu
> 
> $$
> \begin{aligned}
> \begin{pmatrix}
> \dot{x}_1 \\ \dot{x}_2 \\ \vdots \\ \dot{x}_{n-1} \\ \dot{x}_n
> \end{pmatrix} = \begin{pmatrix}
> 0 & 1 & 0 & \ldots & 0 \\
> 0 & 0 & 1 & \ddots & 0 \\
> \vdots & \vdots & \ddots & \ddots & \vdots \\
> \alpha_{1} & \alpha_{2} & \alpha_{3} & \ldots & \alpha_{n-1}
> \end{pmatrix}\cdot \begin{pmatrix}
> x_1 \\ x_2 \\ \vdots \\ x_{n-1} \\ x_n
> \end{pmatrix}+ \begin{pmatrix}
> 0 \\ 0 \\ \vdots \\ 0 \\ b(t)
> \end{pmatrix} \\
> \end{aligned}
> $$
> 
 
- Die Größen $x_1, x_2, \ldots, x_n$ sind ein Satz von Zustandsvariablen
- Annahme: $p$ Eingangsgrößen $u_1, u_2, \ldots, u_p$
- Im allgemeinen Fall können alle Ableitungen $\dot{x}_1, \dot{x}_2, \ldots, \dot{x}_n$ von allen $p$ Eingangsgrößen und allen Zustandsgrößen $x_1, x_2, \ldots, x_n$ abhängen
- Damit lässt sich ein LTI-System durch ein System von Differentialgleichungen 1. Ordnung beschreiben, wobei jede Zustandsvariable die unabhängige Variable einer Differentialgleichung ist $\rightarrow$ Zustandsgleichungen


Durchgangsmatrix geht nicht an die Speichernden Elementen im System sondern direkt auf den Ausgnag über