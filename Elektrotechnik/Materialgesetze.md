---
tags:
aliases:
  - Materialeigenschaften
  - Materialparameter
  - Isotrop
  - Dispersiv
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

## Materialparameter

- [Permeabilität](../Physik/Konstanten/Permeablität.md) $\mu$
- [Permittivität](Dielektrikum.md) $\varepsilon$
- [Konduktivität](../Chemie/elektrischer%20Leiter.md) $\sigma$

## Material Eigenschaften

### Linearität

Ein Material ist linear, wenn die Materialparameter $\varepsilon_{\mathrm{r}}, \mu_{\mathrm{r}}$ und $\sigma$ unabhängig von den elektromagnetischen Feldgrößen sind, die im Material auftreten.

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
