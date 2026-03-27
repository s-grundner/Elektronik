## Ruhelagen

Betrachtet man

$$
\mathbf{x}_{k+1}=\mathbf{A} \mathbf{x}_k+\mathbf{B} \mathbf{u}_k
$$

und wählt für $\left(\mathbf{u}_k\right)=\left(\mathbf{u}_s, \mathbf{u}_s, \ldots\right)$ eine konstante Stellfolge, dann lautet die Bestimmungsgleichung für die Ruhelagen

$$
\mathbf{x}_s=\mathbf{A} \mathbf{x}_s+\mathbf{B} \mathbf{u}_s .
$$

> [!hint] Im Unterschied zu Zeitkontinuierlichen Ruhelagen gilt 
> - Zeitkontinuierlich: $\dot{\mathbf{x}}(t) = 0$
> - Zietdiskret: $\mathbf{x}_{k+1} = \mathbf{x}_{k}$

Diese Gleichung ist nun genau dann lösbar, wenn

$$
\mathbf{B} \mathbf{u}_s \in \operatorname{im}(\mathbf{A}-\mathbf{E}) \quad \text { oder } \quad \operatorname{rank}(\mathbf{A}-\mathbf{E})=\operatorname{rank}\left(\left[\mathbf{A}-\mathbf{E}, \mathbf{B} \mathbf{u}_s\right]\right)
$$

gilt. Im Falle $\mathbf{u}_s=\mathbf{0}$ hat das System also mindestens eine Ruhelage. Man beachte in diesem Zusammenhang auch die Tabelle 3.1 und ersetze $\mathbf{A}$ durch $\mathbf{A - E}$.
3.2.5 Allgemeines Lösungsverhalten

Die Lösungen eines linearen autonomen Systems zu einem Eigenwert $\lambda_i=\alpha_i+\mathrm{j} \beta_i$ können als Linearkombination der Größen

$$
k^l r^k \cos (k \phi), \quad k^l r^k \sin (k \phi) \text { mit } 0 \leq l<n
$$

und $r=\sqrt{\alpha_i^2+\beta_i^2}, \phi=\arg \left(\alpha_i+\mathrm{j} \beta_i\right)$ dargestellt werden. Daraus folgt unmittelbar der folgende Satz.

> [!satz] **S - Asymptotische Stabilität)** Eine Ruhelage $\mathbf{z}_s=\mathbf{0}$ des Systems ist genau dann global asymptotisch stabil, wenn alle Eigenwerte der Matrix A betraglich kleiner als 1 sind.
> D.h., ist $\lambda_i=\alpha_i+\mathrm{j} \beta_i$ ein Eigenwert von $\mathbf{A}$, dann muss gelten
> 
> $$
> r=\sqrt{\alpha_i^2+\beta_i^2}<1 .
> $$
> 
> 
> Für jeden Anfangszustand $\mathbf{z}_0$ läuft die Folge $\mathbf{z}_k$ für $k \rightarrow \infty$ in den Punkt $\mathbf{0}$ ein. D.h. für alle $\mathbf{z}_0 \in \mathbb{R}^n$ gilt, aus $\mathbf{z}(0)=\mathbf{z}_0$ folgt
> 
> $$
> \lim _{k \rightarrow \infty}\left\|\mathbf{z}_k\right\|=0 .
> $$
> $\mathbf{A}$ ist dann eine [Einheitskreismatrix](../../Mathematik/Algebra/Einheitskreismatrix.md)
