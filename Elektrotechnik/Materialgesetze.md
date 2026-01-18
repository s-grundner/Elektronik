---
tags:
aliases:
keywords:
subject:
  - VL
  - Grundlagen der Hochfrequenztechnik
semester: SS25
created: 9th May 2025
professor:
  - Reinhard Feger
release: true
title: Materialgesetz
---

# Materialgesetz

> [!satz] **S1 - MATG)** Materialgesetze der Elektrostatik ^MATG
> 
> $$
> \begin{align}
> \mathbf{B} & =\mu \mathbf{H} \tag{M1}\\
> \mathbf{D} & =\varepsilon \mathbf{E} \tag{M2} \\
> \mathbf{J} & =\sigma \mathbf{E} \tag{M3}
> \end{align}
> $$

Elektrische Verluste des Materials charakterisert man mit dem [Verlustwinkel](Verlustwinkel.md).

## Feldwirkungsgrößen

- [Permeabilität](../Physik/Konstanten/Permeablität.md) $\mu$
- [Permittivität](Dielektrikum.md) $\varepsilon$
- [Konduktivität](../Chemie/elektrischer%20Leiter.md) $\sigma$

## Material Eigenschaften

### Linearität

Ein Material ist linear, wenn die Materialeigenschaften $\varepsilon_{\mathrm{r}}, \mu_{\mathrm{r}}$ und $\sigma$ unabhängig von den elektromagnetischen Feldgrößen sind, die im Material auftreten.

| Eigenschaft      | Magnetisches Material    | Dielektrisches Material       | Leitfähiges Material        |
| ---------------- | :------------------------: | :-----------------------------: | :---------------------------: |
| **Linear**       | $\mu \neq f(\mathbf{H})$ | $\epsilon \neq f(\mathbf{E})$ | $\sigma \neq f(\mathbf{E})$ |
| **Nicht Linear** | $\mu = f(\mathbf{H})$    | $\epsilon = f(\mathbf{E})$    | $\sigma = f(\mathbf{E})$    |

> [!exmple] Beispiel: Die relative Permittivität $\varepsilon_{r}$ ändert sich nicht, wenn die das Material durchsetzende elektrische Feldstärke kleiner oder größer wird.

### Isotropie

Ein Material ist isotrop, wenn die Materialeigenschaften **richtungsunabhängig** sind.

| Eigenschaft      | Magnetisches Material    | Dielektrisches Material       | Leitfähiges Material        |
| ---------------- | :------------------------: | :-----------------------------: | :---------------------------: |
| **Isotrop**       | $\mu$ ist ein Skalar | $\epsilon$ ist ein Skalar | $\sigma$ ist ein Skalar |
| **Anisotrop**       | $\mu$ ist ein Tensor | $\epsilon$ ist ein Tensor | $\sigma$ ist ein Tensor |

### Dispersion

Ein Material ist dispersiv, wenn die Materialeigenschaften abhängig von der Frequenz sind.

| Eigenschaft         | Magnetisches Material | Dielektrisches Material | Leitfähiges Material |
| ------------------- | :-------------------: | :---------------------: | :------------------: |
| **Nicht Dispersiv** |    $\mu \neq f(f)$    |  $\epsilon \neq f(f)$   |  $\sigma \neq f(f)$  |
| **Dispersiv**       |     $\mu = f(f)$      |    $\epsilon = f(f)$    |   $\sigma = f(f)$    |

### Homogenität

Ein Material ist homogen, wenn sich die Materialeigenschaften räumlich nicht ändern.

| Eigenschaft         | Magnetisches Material    | Dielektrisches Material       | Leitfähiges Material        |
| ------------------- | :------------------------: | :-----------------------------: | :---------------------------: |
| **Homogen** | $\mu \neq f(\mathbf{x})$ | $\epsilon \neq f(\mathbf{x})$ | $\sigma \neq f(\mathbf{x})$ |
| **Inhomogen**       | $\mu = f(\mathbf{x})$    | $\epsilon = f(\mathbf{x})$    | $\sigma = f(\mathbf{x})$    |

$\mathbf{x}$ sind dabei die Räumlichen koordinaten.

- Kartesische Koordinaten: $\mathbf{x} = (x,y,z)$
- Zylinderkoordinaten: $\mathbf{x} = (r,h,\phi)$
- Polarkoordinaten: $\mathbf{x} = (r,\phi,\theta)$

### Verluste

| Eigenschaft         | Magnetisches Material | Dielektrisches Material | Leitfähiges Material |
| ------------------- | :---------------------: | :-----------------------: | :--------------------: |
| **Verlustlos** | $\mu \in \mathbb{R}$       | $\epsilon \in \mathbb{R}$    | $\sigma \in \mathbb{R}$   |
| **Verlustbehaftet**       | $\mu \in \mathbb{C}$          | $\epsilon \in \mathbb{C}$       | $\sigma \in \mathbb{C}$      |

Wenn dass Material auch anisotrop ist, dann gilt auch die Tensorweritgkeit mit komplexen und reellen komponenten.

### Zeitinvarianz

Ein Material ist zeitinvariant, wenn die Materialeigenschaften zeitlich konstant sind.

| Eigenschaft         | Magnetisches Material | Dielektrisches Material | Leitfähiges Material |
| ------------------- | :---------------------: | :-----------------------: | :--------------------: |
| **Zeitinvariant** | $\mu \neq f(t)$       | $\epsilon \neq f(t)$    | $\sigma \neq f(t)$   |
| **Zeitvariant**       | $\mu = f(t)$          | $\epsilon = f(t)$       | $\sigma = f(t)$      |


## Felder an verlustfreien dielektrischen Grenzflächen

An der Grenzfläche zwischen zwei verlustlosen [dielektrischen](Dielektrikum.md) Materialien existieren keine Ladungen oder Oberflächenströme. Daraus folgen die zusammenhänge der Feldgrößen:

![invert_dark|500](../_assets/Excalidraw/Materialgesetze%202026-01-17%2001.30.39.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../_assets/Excalidraw/Materialgesetze%202026-01-17%2001.30.39.excalidraw.md)%%

$$
\begin{align}
\hat{n} \cdot \mathbf{D}_{1} &= \hat{n} \cdot \mathbf{D}_{2} \\
\hat{n} \cdot \mathbf{B}_{1} &= \hat{n} \cdot \mathbf{B}_{2} \\
\hat{n} \times \mathbf{E}_{1} &= \hat{n} \times \mathbf{E}_{2} \\
\hat{n} \times \mathbf{H}_{1} &= \hat{n} \times \mathbf{H}_{2} \\
\end{align}
$$

$\hat{n}$ ist der [Flächennormalvektor](../Mathematik/Analysis/Vektoranalysis/Flächenvektor.md) der Grenzfläche.

> [!info] Interpretation
> - Die Feldkomponenten von $\mathbf{D}$ und $\mathbf{B}$ **normal** zur Grenzfläche (in Richtung von $\hat{n}$) sind gleich, also kontinuierlich am übergang.
> - Die Feldkomponenten von $\mathbf{E}$ und $\mathbf{B}$ **tangential** zur Grenzfläche (Normal zu $\hat{n}$) sind gleich, also kontinuierlich am übergang.

Ein sprung könnte nur dann entstehen wenn an den Grenzflächen ein Strom fließt. Ein [dielektrisches Material](Dielektrikum.md) besitzt jedoch keinen Leitwert, weshalb der Strom immer 0 ist.

## Felder an perfekt leitenden Grenzflächen

Im Falle eines Übergangs zu einem perfekt leitfähigen Materials ($\sigma \to \infty$) müssen alle Feldkomoponenten  innerhalb der leitenden Region null sein. 

$$
\begin{align}
\hat{n} \cdot \mathbf{D} &= \rho_{s} \\
\hat{n} \cdot \mathbf{B} &= 0 \\
\hat{n} \times \mathbf{E}_{1} &= 0 \\
\hat{n} \times \mathbf{H}_{1} &= \mathbf{J}_{s}
\end{align}
$$

$\hat{n}$ ist der [Flächennormalvektor](../Mathematik/Analysis/Vektoranalysis/Flächenvektor.md) der Grenzfläche.

> [!info] Die perfekt leitfähige Grenzfläche agiert als eine "elektrische Wand"
> 
> Die Grenzfläche liegt überall auf dem gleichen [elektrischen Potenzial](elektrische%20Spannung.md). Die **tangential** komponenten des $\mathbf{E}$-Feldes sind daher "Kurzgeschlossen".

Normal zur fläche kann sehr wohl ein Elektrisches Feld existieren. Als vergleich der Plattenkondensator.
