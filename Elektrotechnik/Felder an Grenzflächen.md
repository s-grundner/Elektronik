---
tags:
  - Elektrodynamik
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: WS25
created: 19th January 2026
professor:
release: false
title: Felder an Grenzflächen
---

# Felder an Grenzflächen

Es wird untersucht, welches Verhalten Elektromagentische Wellen aufweisen, wenn sie von ein Medium in ein anderes Medium mit anderen [Materialparameter](Materialgesetze.md) übergehen.

> [!hint] Zusammenfassung des Feldverhaltens an Grenzflächen
> 
> |                 Verlustbehaftet <br> $\tan\delta \neq 0$                  |            Verlustlos<br>$\tan\delta=0$            | Gut / Perfekter Leiter <br>$\tan\delta \gg 0$ / $\tan\delta \to \infty$ |
> | :-----------------------------------------------------------------------: | :------------------------------------------------: | :---------------------------------------------------------------------: |
> |             $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$  | $\hat{n}\cdot \mathbf{D} = \rho_{\mathrm{s}}$              |
> |             $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$  | $\hat{n}\cdot \mathbf{B} = 0$                      |
> | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = -\mathbf{M}_{\mathrm{s}}$ | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = 0$ |    $\hat{n}\times\mathbf{E}=0$                       |
> | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = \mathbf{J}_{\mathrm{s}}$  | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = 0$ |    $\hat{n}\times\mathbf{H}=\mathbf{J}_{\mathrm{s}}$            |


![verlustwinkel](verlustwinkel.md#^loss-tan)

## reflexionsfaktor

geht eine welle von material einer [intrinsischen impedanz](../physik/konstanten%20und%20einheiten/wellenwiderstand.md) $\eta_{1}$ in ein material mit $\eta_{2}$ über, so wird ein anteil der welle reflektiert. 

> [!def] **d)** reflexionsfaktor $\gamma$ an einer grenzfläche
> $$
> \gamma := \frac{\eta_{2}-\eta_{1}}{\eta_{2}+\eta_{1}}
> $$

## felder an verlustfreien dielektrischen grenzflächen

> [!info] es gilt: $\tan\delta = 0 \impliedby \epsilon  \in \mathbb{r}$ bzw. $\sigma =0$

### felder bei normalem einfall

an der grenzfläche zwischen zwei verlustlosen [dielektrischen](dielektrikum.md) materialien existieren *keine ladungen oder oberflächenströme*. daraus folgen die zusammenhänge der feldgrößen:

![invert_dark|500](../_assets/excalidraw/materialgesetze%202026-01-17%2001.30.39.excalidraw.svg)
%%[🖋 edit in excalidraw](../_assets/excalidraw/materialgesetze%202026-01-17%2001.30.39.excalidraw.md)%%

$$
\begin{align}
\hat{n} \cdot \mathbf{d}_{1} &= \hat{n} \cdot \mathbf{d}_{2} & \hat{n} \cdot (\mathbf{d}_{2}-\mathbf{d}_{1}) &= 0 \\
\hat{n} \cdot \mathbf{b}_{1} &= \hat{n} \cdot \mathbf{b}_{2} & \hat{n} \cdot (\mathbf{b}_{2}-\mathbf{b}_{1}) &=0\\
\hat{n} \times \mathbf{e}_{1} &= \hat{n} \times \mathbf{e}_{2} & \hat{n} \times (\mathbf{e}_{2} - \mathbf{e}_{1}) &= 0 \\
\hat{n} \times \mathbf{h}_{1} &= \hat{n} \times \mathbf{h}_{2} & \hat{n} \times (\mathbf{h}_{2}-\mathbf{h}_{1}) &= 0 \\
\end{align}
$$

$\hat{n}$ ist der [flächennormalvektor](../mathematik/analysis/vektoranalysis/flächenvektor.md) der grenzfläche.

> [!info] interpretation
> - die feldkomponenten von $\mathbf{d}$ und $\mathbf{b}$ **normal** zur grenzfläche (in richtung von $\hat{n}$) sind gleich, also kontinuierlich am übergang.
> - die feldkomponenten von $\mathbf{e}$ und $\mathbf{b}$ **tangential** zur grenzfläche (normal zu $\hat{n}$) sind gleich, also kontinuierlich am übergang.

ein sprung könnte nur dann entstehen wenn an den grenzflächen ein strom fließt. ein [dielektrisches material](dielektrikum.md) besitzt jedoch keinen leitwert, weshalb der strom immer 0 ist.


### schräger einfall

- [snelliussches brechungsgesetz](../physik/feldtheorie/snelliussches%20brechungsgesetz.md)

## felder an verlustbehafteten grenzflächen

> [!info] es gilt: $\tan\delta \neq 0 \impliedby \epsilon  \in \mathbb{c}$ bzw. $\sigma \neq0$

$$
\begin{align}
\hat{n} \cdot (\mathbf{d}_{2}-\mathbf{d}_{1}) &= 0 \\
\hat{n} \cdot (\mathbf{b}_{2}-\mathbf{b}_{1}) &=0 \\
\hat{n} \times (\mathbf{e}_{2} - \mathbf{e}_{1}) &= -\mathbf{m}_s \\
\hat{n} \times (\mathbf{h}_{2}-\mathbf{h}_{1}) &= \mathbf{j}_s \\
\end{align}
$$

## felder an gut leitenden grenzflächen

> [!info] es gilt: $\tan\delta \gg 0 \impliedby \sigma \gg\omega\epsilon$ bzw. $\epsilon''\gg \epsilon'$

[skineffekt](../hf-technik/skineffekt.md)

## felder an perfekt leitenden grenzflächen

> [!info] es gilt: $\tan\delta \to\infty \impliedby \sigma \to \infty$

### qualitative untersuchung

im falle eines übergangs zu einem perfekt leitfähigen materials ($\sigma \to \infty$) müssen alle feldkomoponenten  innerhalb der leitenden region null sein. 

$$
\begin{align}
\hat{n} \cdot \mathbf{d} &= \rho_{s} \\
\hat{n} \cdot \mathbf{b} &= 0 \\
\hat{n} \times \mathbf{e} &= 0 \\
\hat{n} \times \mathbf{h} &= \mathbf{j}_{s}
\end{align}
$$

$\hat{n}$ ist der [flächennormalvektor](../mathematik/analysis/vektoranalysis/flächenvektor.md) der grenzfläche.

> [!info] die perfekt leitfähige grenzfläche agiert als eine "elektrische wand"
> 
> die grenzfläche liegt überall auf dem gleichen [elektrischen potenzial](elektrische%20spannung.md). die **tangential** komponenten des $\mathbf{e}$-feldes sind daher "kurzgeschlossen".

normal zur fläche kann sehr wohl ein elektrisches feld existieren. als vergleich der plattenkondensator.
