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

> [!tldr] Zusammenfassung des Feldverhaltens an Grenzflächen
> 
> |                 Verlustbehaftet <br> $\tan\delta \neq 0$                  |            Verlustlos<br>$\tan\delta=0$            | Gut / Perfekter Leiter <br>$\tan\delta \gg 0$ / $\tan\delta \to \infty$ |
> | :-----------------------------------------------------------------------: | :------------------------------------------------: | :---------------------------------------------------------------------: |
> |             $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{D}_{2}-\mathbf{D}_{1}) = 0$  |              $\hat{n}\cdot \mathbf{D} = \rho_{\mathrm{s}}$              |
> |             $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$             | $\hat{n}\cdot(\mathbf{B}_{2}-\mathbf{B}_{1}) = 0$  |                      $\hat{n}\cdot \mathbf{B} = 0$                      |
> | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = -\mathbf{M}_{\mathrm{s}}$ | $\hat{n}\times(\mathbf{E}_{2}-\mathbf{E}_{1}) = 0$ |                       $\hat{n}\times\mathbf{E}=0$                       |
> | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = \mathbf{J}_{\mathrm{s}}$  | $\hat{n}\times(\mathbf{H}_{2}-\mathbf{H}_{1}) = 0$ |            $\hat{n}\times\mathbf{H}=\mathrm{J}_{\mathrm{s}}$            |


![Verlustwinkel](Verlustwinkel.md#^LOSS-TAN)

## Reflexionsfaktor

Geht eine Welle von material einer [intrinsischen Impedanz](../Physik/Konstanten%20und%20Einheiten/Wellenwiderstand.md) $\eta_{1}$ in ein Material mit $\eta_{2}$ über, so wird ein anteil der Welle reflektiert. 

> [!def] **D)** Reflexionsfaktor $\Gamma$ an einer Grenzfläche
> $$
> \Gamma := \frac{\eta_{2}-\eta_{1}}{\eta_{2}+\eta_{1}}
> $$

## Felder an verlustfreien dielektrischen Grenzflächen

> [!info] Es gilt: $\tan\delta = 0 \impliedby \epsilon  \in \mathbb{R}$ bzw. $\sigma =0$

### Felder bei normalem Einfall

An der Grenzfläche zwischen zwei verlustlosen [dielektrischen](Dielektrikum.md) Materialien existieren *keine Ladungen oder Oberflächenströme*. Daraus folgen die zusammenhänge der Feldgrößen:

![invert_dark|500](../_assets/Excalidraw/Materialgesetze%202026-01-17%2001.30.39.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Materialgesetze%202026-01-17%2001.30.39.excalidraw.md)%%

$$
\begin{align}
\hat{n} \cdot \mathbf{D}_{1} &= \hat{n} \cdot \mathbf{D}_{2} & \hat{n} \cdot (\mathbf{D}_{2}-\mathbf{D}_{1}) &= 0 \\
\hat{n} \cdot \mathbf{B}_{1} &= \hat{n} \cdot \mathbf{B}_{2} & \hat{n} \cdot (\mathbf{B}_{2}-\mathbf{B}_{1}) &=0\\
\hat{n} \times \mathbf{E}_{1} &= \hat{n} \times \mathbf{E}_{2} & \hat{n} \times (\mathbf{E}_{2} - \mathbf{E}_{1}) &= 0 \\
\hat{n} \times \mathbf{H}_{1} &= \hat{n} \times \mathbf{H}_{2} & \hat{n} \times (\mathbf{H}_{2}-\mathbf{H}_{1}) &= 0 \\
\end{align}
$$

$\hat{n}$ ist der [Flächennormalvektor](../Mathematik/Analysis/Vektoranalysis/Flächenintegral.md) der Grenzfläche.

> [!info] Interpretation
> - Die Feldkomponenten von $\mathbf{D}$ und $\mathbf{B}$ **normal** zur Grenzfläche (in Richtung von $\hat{n}$) sind gleich, also kontinuierlich am übergang.
> - Die Feldkomponenten von $\mathbf{E}$ und $\mathbf{B}$ **tangential** zur Grenzfläche (Normal zu $\hat{n}$) sind gleich, also kontinuierlich am übergang.

Ein sprung könnte nur dann entstehen wenn an den Grenzflächen ein Strom fließt. Ein [dielektrisches Material](Dielektrikum.md) besitzt jedoch keinen Leitwert, weshalb der Strom immer 0 ist.


### Schräger Einfall

- [Snelliussches Brechungsgesetz](../Physik/Feldtheorie/Snelliussches%20Brechungsgesetz.md)

## Felder an verlustbehafteten Grenzflächen

> [!info] Es gilt: $\tan\delta \neq 0 \impliedby \epsilon  \in \mathbb{C}$ bzw. $\sigma \neq0$

$$
\begin{align}
\hat{n} \cdot (\mathbf{D}_{2}-\mathbf{D}_{1}) &= 0 \\
\hat{n} \cdot (\mathbf{B}_{2}-\mathbf{B}_{1}) &=0 \\
\hat{n} \times (\mathbf{E}_{2} - \mathbf{E}_{1}) &= -\mathbf{M}_s \\
\hat{n} \times (\mathbf{H}_{2}-\mathbf{H}_{1}) &= \mathbf{J}_s \\
\end{align}
$$

## Felder an gut leitenden Grenzflächen

> [!info] Es gilt: $\tan\delta \gg 0 \impliedby \sigma \gg\omega\epsilon$ bzw. $\epsilon''\gg \epsilon'$

[Skineffekt](../HF-Technik/Skineffekt.md)

## Felder an perfekt leitenden Grenzflächen

> [!info] Es gilt: $\tan\delta \to\infty \impliedby \sigma \to \infty$

### Qualitative Untersuchung

Im Falle eines Übergangs zu einem perfekt leitfähigen Materials ($\sigma \to \infty$) müssen alle Feldkomoponenten  innerhalb der leitenden Region null sein. 

$$
\begin{align}
\hat{n} \cdot \mathbf{D} &= \rho_{s} \\
\hat{n} \cdot \mathbf{B} &= 0 \\
\hat{n} \times \mathbf{E} &= 0 \\
\hat{n} \times \mathbf{H} &= \mathbf{J}_{s}
\end{align}
$$

$\hat{n}$ ist der [Flächennormalvektor](../Mathematik/Analysis/Vektoranalysis/Flächenintegral.md) der Grenzfläche.

> [!info] Die perfekt leitfähige Grenzfläche agiert als eine "elektrische Wand"
> 
> Die Grenzfläche liegt überall auf dem gleichen [elektrischen Potenzial](Elektrostatik/elektrische%20Spannung.md). Die **tangential** komponenten des $\mathbf{E}$-Feldes sind daher "Kurzgeschlossen".

Normal zur fläche kann sehr wohl ein Elektrisches Feld existieren. Als vergleich der Plattenkondensator.
