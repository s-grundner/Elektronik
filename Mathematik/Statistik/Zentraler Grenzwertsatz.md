# Zentraler Grenzwertsatz

Der Zentrale grenzwertsatz besagt, dass wenn mehrere Rauschquellen mit unterschiedlichen Verteilungsfunktionen d.h. unterschiedlichen statistischen Eigenschaften, kann man das in Summe durch eine Gauss-Verteilung Annähern

> [!def] Verteilungsdichtefunktion einer Gaussverteilung
> 
> $$
> p(x) := \frac{1}{\sqrt{ 2\pi\sigma^{2} }} \exp \left( -\frac{(x-\mu)^{2}}{2\sigma^{2}} \right) 
> $$

Möchte man angeben, dass eine Zufallsvaraible $X$ Normalverteilt ist, Schreibt man

$$
X \sim \mathcal{N}(\mu,\sigma)
$$

## Q-Funktion

Eine Funktion, die den Rand der Verteilungsdichtefunktion einer Gaussverteilung auswertet.

Möchte man wissen, mit welcher Wahrscheinlichkeit eine Zufallsvariable $X$ größer als ein Wert $x_{0}$, definiert man.

$$
\mathbb{P}(X\geq x_{0}) = \int_{x_{0}}^{\infty}p(x)\mathrm{~d}x =: Q\left( \frac{x_{0}-\mu}{\sigma} \right)
$$

Für dieses Integral gibt es keine Stammfunktion