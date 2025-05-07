---
tags: 
aliases: 
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 10. März 2025
professor:
  - Wolfgang Gruber
draft: true
title: Durchflutung
---
 

# Durchflutung $\Theta$

Gefolgt aus der [1. Maxwellgleichung](Maxwell.md#^MW1) wird die Durchflutung als Zusammenhang mit der Windungszahl der Induktivität definiert.

> [!def] **D1 - DURF)** Die durch alle Erregerspulen induzierte Feldstärke breitet sich über den gesamten geschlossenen Magnetkreis der Länge $L$ aus und ergibt die Durchflutung $\Theta$.
> $$\Theta :=\oint_{L}\mathbf{H}\cdot \mathrm{d}\mathbf{s} = \sum_{v=1}^{N}i_{v}$$

- Bei einer einfachen Spule ([Elektromagnet](../Physik/Elektromagnet.md)): $\Theta = N\cdot i$
- Beim [Permanentmagnet](../Physik/Permanentmagnet.md): $\Theta_{C}' = H_{C}'l_{\text{pm}}$

Oft liefert das Ringintegral der Durchflutung die Maschengleichung als Summe aller magnetischen Spannungsabfälle an Verbrauchern in einem [Magnetkreis](Maschinen/Magnetkreis.md).

Man kann die Durchflutung deshalb als magnitische Spannung sehen. Daher gilt auch

$$ \Theta = \mathfrak{R}\Phi $$

Mit den magnetischen Größen
- [Reluktanz](Maschinen/Reluktanz.md) $\mathfrak{R}$
- [Magnetischer Fluss](Magnetischer%20Fluss.md) $\Phi$