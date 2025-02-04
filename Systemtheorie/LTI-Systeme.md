---
tags: 
aliases:
  - LTI-System
  - LTI-Systemen
  - lineare Netzwerke
keywords: 
subject:
  - VL
  - Signale und Systeme
  - Elektrotechnik
semester:
  - SS24
  - B2
created: 4. März 2024
professor:
  - Andreas Stelzer
  - Andreas Springer
---

# LTI-Systeme

Zwei wichtige Eigenschaften, die Systeme aufweisen können sind Linearität und Zeitinvarianz. Diese beiden Eigenschaften sind unabhängig voneinander, es können alle Kombinationen auftreten. Systeme die sowohl linear, als auch zeitinvariant sind, werden als LTI-Systeme (LTI: linear, time-invariant) bezeichnet.

## Lineare Systeme

> [!important] Linearität
> 
> Ein system ist linear wenn die Linearkombination der Eingänge gleich der Linearkombination der Ausgänge ist 
> 
> 
> Ein System $\mathcal{T}\{\cdot\}$ ist linear wenn
> 
> $$
> \begin{aligned}
> & \mathcal{T}\{x\}(t)=a \mathcal{T}\left\{x_1\right\}(t)+b \mathcal{T}\left\{x_2\right\}(t) \quad \text { für alle } x_1(t), x_2(t), a, b \\
> & \operatorname{mit} x(t)=a x_1(t)+b x_2(t)
> \end{aligned}
> $$
> 
> wenn also $y(t)=a y_1(t)+b y_2(t)$
> 

![invert_dark](assets/LinSys.png)

> [!warning] **Zero In Zero-Out** Eigenschaft
> Ein System ist nur dann echt Linear, wenn 0 am Eingang 0 am Ausgang leifert
> - ZIZO ist eine Notwendige Bedingung

## Zeitinvariante Systeme

> [!important] Zeitinvarianz
> Ein System $\mathcal{T}\{\cdot\}$ ist zeitinvariant wenn
> 
> $$
> \begin{aligned}
> & \mathcal{T}\left\{x_2\right\}(t)=\mathcal{T}\left\{x_1\right\}\left(t-t_0\right) \quad \text { für alle } x_1(t), t_0 \\
> & \operatorname{mit} x_2(t)=x_1\left(t-t_0\right)
> \end{aligned}
> $$
> 
> wenn also $y_2(t)=y_1\left(t-t_0\right)$
>

![](assets/Pasted%20image%2020241120155809.png)

## Systemantwort

Ist ein lineares, zeitinvariantes System $\mathcal{T}\{\cdot\}$ mit dem Eingangssignal $x(t)$ und dem Ausgangssignal $y(t)$ gegeben, ist oft eine **allgemeine Formulierung** zur Berechnung des **Ausgangssignals** gesucht.

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=2]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=4em, node distance=2cm, line width=1pt]
\tikzstyle{branch} = [fill,shape=circle,minimum size=4pt,inner sep=0pt]

\node at (-2.5,0) (input) {$x(t)$};
\node [block] (t) {$\mathcal{T\{\cdot\}}$} node[above=2em] {LTI-System};
\node at (2.5,0) (output) {$y(t)$};

\begin{scope}[line width=1pt]
     \draw[->] (input) -- (t);
     \draw[->] (t) -- (output);
\end{scope}

\end{tikzpicture}
\end{document}
```

### Impulsantwort

Es wird dazu die Antwort eines Systems auf die Impulsfunktion ([Dirac-Distribution](../Mathematik/Algebra/Delta-Impuls.md)) $\delta(t)$ am Eingang betrachtet.

$$x(t) = \delta(t) \quad \implies \quad y(t) = \mathcal{T\{\cdot\}} = h(t)$$

Die Antwort (Ausgangssignal) auf den Impuls am Einang wird als **Impulsantwort** $h(t)$ bezeichnet.

> [!question] Berechnung des Ausgangssignals mit Hilfe der Impulsantwort
> zunächst wird das LTI-System durch die Abbildung $\mathcal{T}\{\cdot\}$ beschrieben.
> $$y(t) = \mathcal{T}\{x(t)\}$$
> Das EIngagnssignal $x(t)$ wird mittels der Dirac-Distribution dargestellt.
> $$x(t) = \int_{ -\infty}^{\infty}x(\uptau)\delta(t-\uptau)\mathrm{~d}\uptau$$
> Somit folgt für das Ausgangssignal $y(t)$ mit der Abbildung $\mathcal{T}\{\cdot\}$
> $$y(t) = \mathcal{T}\left\{ \int_{-\infty}^{\infty}x(\uptau)\delta(t-\uptau)\mathrm{~d}\uptau \right\} $$
> wobei im Intergal nur $\delta (t-\uptau)$ von $t$ abhängt, d.h. $x(\uptau)$ ist bezüglich $t$ nur ein Gewichtsfaktor, womit durch die Linearität auch geschrieben werden kann:
> $$y(t)= \int_{-\infty}^{\infty}x(\uptau)\mathcal{T}\{\delta(t-\uptau)\}\mathrm{~d}\uptau$$
>  

> [!success] Mit der Definition der Impulsantwort $h(t)= \mathcal{T}\{\delta(t)\}$ und Berücksichtigung der Zeitinvarianz folgt schließlich:
>
> $$\boxed{ y(t) = \int_{-\infty}^{\infty}x(\uptau)h(t-\uptau)\mathrm{~d}\uptau }$$

Damit lässt sich das Ausgangssignal $y(t)$ für beliebeiges Eingangssignal $x(t)$ als [**Faltung**](Faltung.md) **mit der Impulsantwort** $h(t)$ beschreiben.

$$\boxed{ y(t) = x(t) * h(t) }$$

> [!important] Diese Form der Beschreibung ist allgeimen gültig.
> **Die Impulsantwort beschreibt das Systemverhalten eines LTI-Systems vollständig!**
> Die Impulsantwort ist eine Beschreibung bzw. Charakterisierung eines Systems im **Zeitbereich**

### Sprungantwort

In technischen Systemen ist es häufig einfacher anstatt 

---

# Related

## Systeme mit Tikz zeichnen

beispiel code

```tikz
\usepackage{tikz}
\usetikzlibrary{shapes, arrows}
\begin{document}
\begin{tikzpicture}[auto,>=latex', transform shape, scale=3]

\tikzstyle{block} = [draw, shape=rectangle, minimum height=3em, minimum width=3em, node distance=2cm, line width=1pt]
\tikzstyle{sum} = [draw, shape=circle, node distance=1.5cm, line width=1pt, minimum width=1.25em]
\tikzstyle{branch} = [fill,shape=circle,minimum size=4pt,inner sep=0pt]

%Creating Blocks and Connection Nodes
\node at (-2.5,0) (input) {$x[n]$};
\node [block] (h1) {$h_1[n]$};
\node [block, right of=h1] (h2) {$h_2[n]$};
\node [sum, right of=h2] (sum) {};
\node at (sum) (plus) {{\footnotesize$+$}};
\node at (5,0) (output) {$y[n]$};
\path (h1) -- coordinate (med) (h2);
\path (input) -- coordinate(branch1) (h1);
\node [block, below of=med] (h3) {$h_3[n]$};

%Conecting Blocks
\begin{scope}[line width=1pt]
     \draw[->] (input) -- (h1);
     \draw[->] (h1) -- (h2);
     \draw[->] (h2) -- (sum);
     \draw[->] (sum) -- (output);
     \draw[->] (branch1) node[branch] {} |- (h3);
     \draw[->] (h3) -| (sum);
\end{scope}

\end{tikzpicture}
\end{document}
```