---
tags:
  - tikz/circuitikz
  - Systeme/Kon
aliases:
  - Zustandsbeschreibung
  - Zustandsvariablen
  - Zustandsbegriff
  - Zustandsgleichung
keywords: 
subject:
  - VL
  - Signale und Systeme
  - Regelungstechnik
semester: WS24
created: 18. Dezember 2024
professor:
  - Andreas Stelzer
  - Markus Schöberl
---

# Zustandsbeschreibung eines dynamischen Systems

> [!question] Zentraler Begriff der [Systemtheorie]({MOC}%20Systemtheorie.md)

Der Zustand des Systems beschreibt die internen Größen des dynamischen Systems

> [!quote] Zustandsgrößen sind Variablen, die Auskunft über die vom System beinhaltete **Energie** geben. 
> 
> - Im Feder-Masse-Dämpfer-System: Geschwindigkeit $v$ und Auslenkung $x$
> - Im RC: Spannung am C $u_{c}(t)$
> - Im RLC: Spannung am C $u_{c}(t)$ und Strom in L $i_{l}(t)$ ([Beispiel: Parallelschwingkreis](#Parallelschwingkreis))

---

> [!question] Wie lässt sich der Zustand ermitteln?
> Für jeden Zeitpunkt $t_0$ reicht
> - die Kenntnis des Zustandes **zu diesem Zeitpunkt** $t_0$
> - zusammen mit der Kenntnis **der Erregung** (des Eingangs) für *alle Zeiten* $t \geq t_0$ aus,
> 
> um die Antwort des Systems für alle Zeiten $t \geq t_0$ zu bestimmen. Alle anderen Kenngrößen sind bekannt bzw festgelegt.
> 

- Es spielt dabei **keine Rolle**, wie der Zustand in der **Vergangenheit** (zu Zeiten $t<t_0$ ) entstanden ist
- In der Regel wird der Zustand eines Systems durch mehrere Größen beschrieben
- Häufig werden Systeme mit mehreren Eingängen und mehreren Ausgängen betrachtet (MIMO - multiple inputs, multiple outputs))

Der Zustandsraum ist die Vorbereitung, um Systeme auf eine beliebige Anzahl von ein und Ausgängen zu erweitern (MIMO)


## Zustandsgrößen

- Beschreibung von LTI-Systemen mit Hilfe gewöhnlicher linearer Differentialgleichungen beliebiger Ordnung
- Im allgemeinen Fall: ein System von Differentialgleichungen
- Jede Differentialgleichung höherer Ordnung lässt sich in ein System von Differentialgleichungen 1. Ordnung zerlegen

> [!hint]- **Erinnerung:** [Lineare DGL n-ter Ordnung](Mathematik/Analysis/Lineare%20DGL%20n-ter%20Ordnung.md) $\to$ [DGL-System](Mathematik/Analysis/DGL-System.md) 1. Ordnung
> Differentialgleichung $n$-ter Ordnung:
> 
> $$x^{(n)}+\alpha_n x^{(n-1)}+\ldots+\alpha_3 \ddot{x}+\alpha_2 \dot{x}+\alpha_1 x=u$$
> 
> Wird Zu *($\alpha$ sind negativ da die größen auf die Andere Seite des LGS gebracht wurden)*
> 
> $$
> \begin{aligned}
> \begin{pmatrix}
> \dot{x}_1 \\ \dot{x}_2 \\ \vdots \\ \dot{x}_{n-1} \\ \dot{x}_n
> \end{pmatrix} = \begin{pmatrix}
> 0 & 1 & 0 & \ldots & 0 \\
> 0 & 0 & 1 & \ddots & 0 \\
> \vdots & \vdots & \ddots & \ddots & \vdots \\
> -\alpha_{1} & -\alpha_{2} & -\alpha_{3} & \ldots & -\alpha_{n-1}
> \end{pmatrix}\cdot \begin{pmatrix}
> x_1 \\ x_2 \\ \vdots \\ x_{n-1} \\ x_n
> \end{pmatrix}+ \begin{pmatrix}
> 0 \\ 0 \\ \vdots \\ 0 \\ u
> \end{pmatrix} \\
> \end{aligned}
> $$
> 

- Die Größen $x_1, x_2, \ldots, x_n$ sind ein Satz von **Zustandsvariablen**

> [!info] Annahme: Es gibt $p$ **Eingangsgrößen** $u_1, u_2, \ldots, u_p$
> Im allgemeinen Fall können alle Ableitungen $\dot{x}_1, \dot{x}_2, \ldots, \dot{x}_n$ von allen $p$ **Eingangsgrößen** und allen **Zustandsgrößen** $x_1, x_2, \ldots, x_n$ abhängen
> 
> - $\rightarrow$ **Zustandsgleichung:** $\mathbf{\dot{x}}=\mathbf{f}(t,\mathbf{x},\mathbf{u})$

Damit lässt sich ein LTI-System durch ein System von Differentialgleichungen 1. Ordnung beschreiben, wobei jede Zustandsvariable die unabhängige Variable einer Differentialgleichung ist.

Regelungstechnik: Eingangsgrößen heißen auch Stellgrößen.

> [!info] Annahme: Es gibt $q$ **Ausgangsgrößen** $y_1, y_2, \ldots, y_q$
> Ausgangsgrößen lassen sich als Funktion der **Zustandsgrößen** und der **Eingangsgrößen** darstellen.
> - $\to$ **Ausgangsgeichung:** $\mathbf{y}=\mathbf{g}(t,\mathbf{x}, \mathbf{u})$ 

Aus den obigen Annahmen werden die Zustandsgrößen wiefolgt angeschreiben:

> [!def] **D1 - ZSGR)** Zustandsgrößen ^ZSGR
> $$
> \begin{align}
> \mathbf{u}(t)&=\left[ u_{1}, u_{2}, \cdots, u_{p} \right] ^{T}\tag{Eingangsvektor} \\
> \mathbf{x}(t)&=\left[ x_{1}, x_{2}, \cdots, x_{n} \right] ^{T}\tag{Zustandsvektor} \\
> \mathbf{y}(t)&=\left[ y_{1}, y_{2}, \cdots, y_{q} \right] ^{T}\tag{Ausgangsvektor}
> \end{align}
> $$
> 

Der Zustandsvektor $\mathbf{x(t)}$ ist ein Element eines linearen Vektorraumes, des **Zustandsraumes**

Diese Definitionen gelten sowohl für:

| [Kontinuierliche Lineare Systeme](Lineare%20Systeme.md) | als auch für | [Zeitdiskrete Lineare Systeme](Zeitdiskrete%20Lineare%20Systeme.md) |
| ------------------------------------------------------- | ------------ | ------------------------------------------------------------------- |

# Beispiel

## Parallelschwingkreis

>[!example] Zustandsbeschreibung eines Parallelschwingkreis
> Relevant ist, wo hier die Energie gespeichert wird. 

```tikz
\usepackage[european, straightvoltages]{circuitikz}
\usepackage{amsmath}

\begin{document}
\begin{circuitikz}[thick, scale=1, font=\Large]
% Begin Schematic

\draw (0,0) to[I, l=$i_0$, i=$i_0$]
      (0,4) to[short] (2,4) to[L, i>_=$i_L(t)$, *-*] (2,0) to[short] (0,0);
\draw (2,4) to[short] (4,4) to[R, i>_=$i_R(t)$, *-*] (4,0) to[short] (2,0);
\draw (4,4) to[short] (6,4) to[C, i>_=$i_C(t)$, v^=$u_C(t)$] (6,0) to[short] (4,0);

\end{circuitikz}
\end{document}
```

> [!important] Zustansgrößen: $u_C(t)$, $i_L(t)$
> 
> Beide Größen sind Funktionen der Zeit und mit den beiden unabhängigen Energiespeichern im System direkt verknüpft $\rightarrow$ Zustandsvariablen Die Kapazität speichert die gesamte Vergangenheit in Form der eingebrachten Ladung als Spannung $u_C\left(t_0\right)$ und die Induktivität in Form des Stromes $i_L\left(t_0\right)$


Gleichungen zur Zustandsbeschreibung:

$$
\begin{aligned}
u_C(t) & =\frac{1}{C} \int_{-\infty}^t i_C(\tau) \mathrm{d} \tau=\frac{1}{C} \int_{-\infty}^{t_0} i_C(\tau) \mathrm{d} \tau+\frac{1}{C} \int_{t_0}^t i_C(\tau) \mathrm{d} \tau \\
& =\boxed{ u_C\left(t_0\right)+\frac{1}{C} \int_{t_0}^t i_C(\tau) \mathrm{d} \tau } \\
i_L(t) & =\frac{1}{L} \int_{-\infty}^t u_L(\tau) \mathrm{d} \tau=\frac{1}{L} \int_{-\infty}^{t_0} u_L(\tau) \mathrm{d} \tau+\frac{1}{L} \int_{t_0}^t u_L(\tau) \mathrm{d} \tau \\
& =\boxed{ i_L\left(t_0\right)+\frac{1}{L} \int_{t_0}^t u_L(\tau) \mathrm{d} \tau }
\end{aligned}
$$


Mit jedem **zusätzlichen Energie-Speicher** steigt die Ordnung der DGL die das System beschreibt um **1**.

---

Unecpected Zustandsraum: [3b1b: 9:00 "State Space"](https://youtu.be/6dTyOl1fmDo?si=l6_opNoznnERKKUX)