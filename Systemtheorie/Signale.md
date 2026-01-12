---
tags:
  - tikz/pgfplot
aliases:
  - Diskret
  - Signale
keywords:
  - Kausalität
  - Kontinuität
  - Gerade/Ungerade
subject:
  - VL
  - Signale und Systeme
semester: WS24
created: 2. Oktober 2024
professor:
  - Andreas Stelzer
---
 

# Signale

## Testsignale

> [!important] Wichtige Grundlegende Signale sind die [Testsignale](Testsignale.md)

## Klassifizierung von Signalen

1. [Zeitkontinuität von Signalen](Zeitkontinuität%20von%20Signalen.md)
2. [Wertkontinuität von Signalen](Wertkontinuität%20von%20Signalen.md)
3. Reell / Komplexe Signale
4. Gerade / Ungerade Signale
5. Zeitliche Ausdehnung
6. [Kausalität](Kausalität.md)
7. [Stabilität und Beschränktheit](Stabilität%20und%20Beschränktheit.md)
8. [Periodische Signale](Periodische%20Signale.md)
9. Deterministische und Stochastische Signale
10. [Leistungssignal](Leistungssignal.md) / [Energiesignal](Energiesignal.md)
11. [Stabilität und Beschränktheit](Stabilität%20und%20Beschränktheit.md)

###  Reelle und Komplexe Signale

> [!info] Auteilung nach Betrag und Phase (Polardarstellung)
> $x(t)=|x(t)| \cdot e^{\mathrm{j} \angle x(t)}=\operatorname{abs}(x(t)) \cdot e^{\mathrm{j} \arg (x(t))}$

![invert_dark|600](../_assets/SignalReelKplx.png)

### Eigenschaften der Fouriertransformation

Für ein reelles Signal $s_{\text{real}}(t)\multimap S(f)$ gilt die Eigenschaft, dass

- der Realteil eine gerade Funktion ist: $\Re\{S(f)\} = \Re\{S(-f)\}$
- der Imaginärteil eine ungerade Funktion ist: $\Im\{S(f)\} = \Im\{-S(-f)\}$ 

### Gerade und Ungerade Signale

- für gerade Signale gilt

$$
x_{\mathrm{g}}(t)=x_{\mathrm{g}}(-t)
$$

- für ungerade Signale gilt

$$
x_{\mathrm{u}}(t)=-x_{\mathrm{u}}(-t)
$$

- Zerlegung eines beliebigen Signals $x(t)$ in einen geraden Anteil $x_{\mathrm{g}}(t)$ und einen ungeraden Anteil $x_{\mathrm{u}}(t)$ :

$$
\begin{aligned}
x(t)=\frac{x(t)}{2}+\frac{x(t)}{2}+\frac{x(-t)}{2} & -\frac{x(-t)}{2}=\underbrace{\frac{x(t)}{2}+\frac{x(-t)}{2}}_{x_{\mathrm{g}}(t)}+\underbrace{\frac{x(t)}{2}-\frac{x(-t)}{2}}_{x_{\mathrm{u}}(t)}
\end{aligned}
$$
> [!important] Es Folgt
> $$
\begin{align}
x_{\mathrm{g}}(t) =\frac{1}{2}(x(t)+x(-t)) \\
x_{\mathrm{u}}(t) =\frac{1}{2}(x(t)-x(-t))
\end{align}$$

#### 4.1 Konjugiert gerade und konjugiert ungerade Signale

Für komplexe Signale gelten folgenden zusätzliche Definitionen
- für konjugiert gerade Signale gilt

$$
x_{\mathrm{g}^*}(t)=x_{\mathrm{g}^*}^*(-t)
$$

- für konjugiert ungerade Signale gilt

$$
x_{\mathrm{u}^*}(t)=-x_{\mathrm{u}^*}^*(-t)
$$

- Zerlegung eines komplexen Signals $x(t)$ in einen konjugiert geraden $x_{\mathrm{g}^*}(t)$ und ungeraden Anteil $x_{\mathrm{u}^*}(t)$ mit

$$
\begin{aligned}
& x_{\mathrm{g}^*}(t)=\frac{1}{2}\left(x(t)+x^*(-t)\right) \\
& x_{\mathrm{u}^*}(t)=\frac{1}{2}\left(x(t)-x^*(-t)\right)
\end{aligned}
$$


