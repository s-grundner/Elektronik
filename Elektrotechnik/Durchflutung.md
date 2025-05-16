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
release: false
title: Durchflutung
---
 

# Durchflutung $\Theta$

> [!question] Themengebiet: [Magnetfeld](Magnetisches%20Feld.md)

---

Gefolgt aus der [1. Maxwellgleichung](Maxwell.md#^MW1) wird die Durchflutung als Zusammenhang mit der Windungszahl der Induktivität definiert.

Die durch alle Erreger ([PM](../Physik/Permanentmagnet.md) oder [EM](../Physik/Elektromagnet.md)) induzierte Feldstärke breitet sich über den gesamten geschlossenen Magnetkreis der Länge $L$ aus und ergibt die Durchflutung $\Theta$.

> [!def] **D1 - DURF)** Durchflutung
> $$\Theta :=\oint_{L}\mathbf{H}\cdot \mathrm{d}\mathbf{s} = \sum_{v=1}^{N}i_{v}$$

- Das Feld heißt **Wirbelfrei**, wenn $\Theta =0$
- Bei einer einfachen Spule ([Elektromagnet](../Physik/Elektromagnet.md)): $\Theta = N\cdot i$
- Beim [Permanentmagnet](../Physik/Permanentmagnet.md): $\Theta_{C}' = H_{C}'l_{\text{pm}}$

Oft liefert das Ringintegral der Durchflutung die Maschengleichung als Summe aller magnetischen Spannungsabfälle an Verbrauchern in einem [Magnetkreis](Maschinen/Magnetkreis.md).

Man kann die Durchflutung deshalb als magnitische Spannung sehen. Daher gilt auch

$$ \Theta = \mathfrak{R}\Phi $$

Mit den magnetischen Größen
- [Reluktanz](Maschinen/Reluktanz.md) $\mathfrak{R}$
- [Magnetischer Fluss](Magnetischer%20Fluss.md) $\Phi$
