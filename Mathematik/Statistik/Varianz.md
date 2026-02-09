---
tags:
  - Statistik
aliases: []
subject:
  - mathe
created: 30th November 2022
---

# Varianz

$$
\begin{align*}
&\sigma^{2}= \frac{1}{n}\cdot\sum\limits_{i=1}^{n}(x_{i}-\overline{x})^{2}\\
\end{align*}
$$

# Varianz einer [Zufallsvariable](Zufallsvariable.md)

Nicht nur der erwartete *mittlere* Wert einer [Zufallsvariable](Zufallsvariable.md) ist interessant, sondern auch die erwartete durchschnittliche Abweichung vom [Erwartungswert](Erwartungswert.md).

- Sozusagen: wie weit streuen die Ergebnisse durchschnittlich?

Sei $X$ eine diskrete [Zufallsvariable](Zufallsvariable.md) mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x_{i})$, so heißt:

>[!summary] $$V(X)=\sum\limits_{i=1}^{n}p_{i}\cdot(x_{i}-E(X))^{2}$$
>
> - $V(X)\dots$ Varianz
> - $E(X)\dots$ [Erwartungswert](Erwartungswert.md)

Die [Standardabweichung](Standardabweichung.md) oder Streuung $\sigma$ von $X$
>[!summary] $\sigma(X)=\sqrt{V(X)}$

>[!EXAMPLE] Würfeln mit 1 Würfel  
> $X\dots$ Augensumme  
> $E(X)=3.5$  
> $V(X)=\sum\limits_{i=0}^{6} \dfrac{1}{6}\dots(x_{i}-3.5)^{2}=2.92$  
> $\sigma(X)=\sqrt{2.92}=1.17$

# Tags