---
tags: 
aliases: 
keywords: 
subject:
  - KV
  - Übertragungstechnik
semester: WS25
created: 27th February 2025
professor:
release: false
title: Erwartungswert
---

# Erwartungswert

- Der Erwartungswert ist ein Konzept aus der Statistik, das beschreibt, wie wahrscheinlich es ist, dass ein bestimmtes [Ereignis](Ereignis.md) eintritt. Es wird auch als Erwartung, Durchschnitt oder Mittelwert bezeichnet und wird in der Regel mit $\mu$ symbolisiert.

Er ist der mit der Verteilungsdichte gewichteter Durchschnitt.

> [!def] **D)** Erwartungswert diskreter Zufallsvariablen
> 
> Ist $Z$ eine diskrete Zufallsvariable mit der Verteilungsdichte $\mathbb{f}_{Z}$ und konvergiert die Summe $\sum_{z \in \mathbb{T}} \left| z \right| \mathbb{f}_{Z}(z)$, so nennt man die Summe
> 
> $$
> \mathbb{E}(Z)=\sum _{z\in \mathbb{T}_Z} z \mathbb{P}(\{Z=z\})=\sum _{z\in \mathbb{T}_Z} z \mathbb{f}_Z(z)
> $$
> 

> [!def] **D)** Erwartungswert stetiger Zufallsvariablen
> 
> Ist $Z$ eine stetige Zufallsvariable mit der Verteilungsdichte $\mathbb{f}_{Z}$ und konvergiert das Integral $\int_{-\infty}^{\infty} \left| z \right| \mathbb{f}_{Z}(z) \mathrm{~d}z$ (man spricht in diesem Zusammenhang von einer **integrierbaren** Zufallsvariablen), so nennt man das Integral
> 
> $$
> \mathbb{E}(Z)=\int _{-\infty }^{\infty }z\mathbb{P}(\{Z\in [z,z+\mathrm{d}z]\})=\int_{-\infty }^{\infty } z \mathbb{f}_Z(z) \, \mathrm{d}z
> $$
 
 den **Erwartungswert** der Zufallsvariablen $Z$. Der Erwartungswert $\mathbb{E}(Z)$ entspricht somit dem mittleren Wert der Zufallsvariablen $Z$, also jenem Wert, um den die Zufallsvariable $Z$ schwankt. Für nicht integrierbare Zufallsvariable wird kein Erwartungswert definiert. (Man beachte, dass der Erwartungswert  einer Zufallsvariablen Z **nur** von der Verteilung $\mathbb{P}_{Z}$ und **nicht** von der konkreten Abbildungsvorschrift $Z:\Omega \to \mathbb{R}$ abhängt. Wir werden daher auch vom **Erwartungswert** einer Verteilung reden.)

## Rechenregeln

Die wichtigsten Eigenschaften zum rechnen mit Erwartungswerten ist

> [!satz] **S)** Seien $X,Y$ und $Z$ **beliebige** Zufallsvariablen, so gilt
> 1. **Linearität:** Sind $X$ und $Y$ integrierbar und sind $\alpha,\beta \in\mathbb{R}$, so ist auch $\alpha X+\beta Y$ integrierbar und es gilt
> 
> $$
> \mathbb{E}(\alpha X + \beta Y) = \alpha \mathbb{E}(X) + \beta\mathbb{E}(Y)
> $$
> 
> 2. **Monotonie:** Sind $X$ und $Y$ integrierbar und und ist $X \leq Y$, gilt
> 
> $$
> \mathbb{E}(X) \leq \mathbb{E}(Y)
> $$
> 
> 3. **Hintereinanderausführung:** Ist $g:\mathbb{R} \mapsto \mathbb{R}$ eine Abbildung und ist $g\circ Z$ integrierbar, gilt
> 
> $$
> \mathbb{E}(g \circ Z) = \sum_{z \in \mathbb{T}_{Z}} g(z)\mathbb{f}_{Z}(z)
> $$
> 

> [!satz] **S - Multiplikationssatz)** Seien $X,Y$ und $Z_{1},Z_{2},\dots,Z_{n}$ **unabhängige** und integrierbare Zufallsvariablen, so gilt
> 
> $$
> \mathbb{E}(XY) = \mathbb{E}(X)\mathbb{E}(Y) \quad \text{bzw.} \quad \mathbb{E}\left({\textstyle\prod_{i=1}^{n}} Z_{i}\right) = \prod_{i=1}^{n}\mathbb{E}(Z_{i})
> $$

Dieser Satz folgt daraus, dass für unabhängige Zufallsariablen $X,Y$ die [Kovarianz](Kovarianz.md) $\operatorname{Cov}(X,Y)=0$ ist und stets gilt, dass $\operatorname{Cov}(X,Y) = \mathbb{E}(XY) - \mathbb{E}(X)\mathbb{E}(Y)$.

## Gemeinsame Zufallsvariablen

Der Erwartungswert eine Zufallsvaraible $g(\mathbf{Z})$, die aus einer Funktion mehrerer Zufallsvariablen $\mathbf{Z} = (Z_{1},Z_{2},\ldots,Z_{r})$ besteht, lässt sich bei bekannter **gemeinsamer Verteilungsdichte** berechnen:


> [!satz] **S2)** Sind $(Z_{1},Z_{2},\ldots,Z_{r}) = \mathbf{Z} \in \mathbb{R}^{r}$ **diskrete** Zufallsvariablen mit der gemeinsamen Verteilungsdichte $\mathbb{f}_{\mathbf{Z}}$ und ist die Zufallsvariable $g(\mathbf{z})$ integrierbar, gilt
> 
> $$
> \mathbb{E}(g(\mathbf{Z})) = \sum_{\{ \mathbf{z} \} \in \mathbb{T}_{\mathbf{Z}}} g(\mathbf{z}) \mathbb{f}_{\mathbf{Z}}(\mathbf{z})
> $$
> > [!info]- Ausgeschrieben
> > 
> > $$
> > \mathbb{E}(g(Z_{1},Z_{2},\ldots,Z_{r})) = \sum_{\{ z_{1},z_{2},\ldots,z_{r} \} \in
> > \mathbb{T}_{Z_{1},Z_{2},\ldots,Z_{r}}} g(Z_{1},Z_{2},\ldots,Z_{r})
> > \mathbb{f}_{Z_{1},Z_{2},\ldots,Z_{r}}(z_{1},z_{2},\ldots,z_{r})
> > $$


> [!satz] **S2)** Sind $\mathbf{Z} \in \mathbb{R}^{r}$ **stetige** Zufallsvariablen mit der gemeinsamen Verteilungsdichte $\mathbb{f}_{\mathbf{Z}}$ und ist die Zufallsvariable $g(\mathbf{z})$ integrierbar, gilt
> 
> $$
> \mathbb{E}(g(\mathbf{z})) = \int_{-\infty}^{\infty} g(\mathbf{z}) \mathbb{f}_{\mathbf{Z}}(\mathbf{z}) ~\mathrm{d}^{r}\mathbf{z}
> $$
> 
> > [!info]- Ausgeschrieben
> > 
> > $$
> > \mathbb{E}(g(Z_{1},Z_{2},\ldots,Z_{r})) = \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \dots \int_{-\infty}^{\infty} g(Z_{1},Z_{2},\ldots,Z_{r}) \mathbb{f}_{Z_{1},Z_{2},\ldots,Z_{r}}(z_{1},z_{2},\ldots,z_{r}) ~\mathrm{d}z_{1}\mathrm{d}z_{2}\dots \mathrm{d}z_{r}
> > $$

## Gemischte Verteilung

Bei der Berechnung des Erwartungswertes $\mathbb{E}(Z)$ einer Zufallsvariable $Z$ mit gemischter Verteilung beachte man, dass sich jede Zufallsvariable $Z$ mit gemischter Verteilung in der Form

$$
Z = \alpha X + (1-\alpha)Y
$$

darstellen lässt. Dabei ist $X$ eine diskrete Zufallsvariable ist, welche den **diskreten** Anteil von $Z$ beschreibt, $Y$ eine stetige Zufallsvariable ist, welche den **stetigen** Anteil von $Z$ beschreibt und $\alpha$ die Summe der **Sprunghöhen** der Verteilungsfunktion $\mathbb{F}_{Z}$ bezeichnet.

Für den Erwartungswert $\mathbb{E}(Z)$ gilt damit

$$
\mathbb{E}(Z) = \alpha \mathbb{E}(X) + (1-\alpha)\mathbb{E}(Y)
$$

### OLD

## Erwartungswert einer [Zufallsvariable](Zufallsvariable.md)

Ist $X$ eine diskrete [Zufallsvariable](Zufallsvariable.md) mit $M_{x}=\{x_{1};\dots;x_{n}\}$ und $p_{i}=P(X=x)$ so heißt:

>[!summary] $$E(X)=\sum_{i=1}^{n}p_{i}\cdot x_{i}$$


Erwartungswert von $X$ beim Würfelbeispiel:
$$
\begin{align*}
E(X)&= \frac{1}{36}\cdot2+\frac{2}{36}\cdot3+\frac{3}{36}\cdot4+\frac{4}{36}\cdot5+\frac{5}{36}\cdot6+\frac{6}{36}\cdot7\\
&+\frac{1}{36}\cdot12+\frac{2}{36}\cdot11+\frac{3}{36}\cdot10+\frac{4}{36}\cdot9+\frac{5}{36}\cdot8\\
&= 7
\end{align*}
$$

### Rechenregeln für den Erwartungswert

$p_{1};\dots ;p_{n}\in \mathbb{R}$ und $X_{1}; \dots X_{n}\dots$ [Zufallsvariable](Zufallsvariable.md)  
$$E\left(\sum\limits^{n}_{i=1}p_{i}X_{i}\right) = \sum\limits_{i=1}^{h} p_{i}\cdot x_{i}$$  
$$E(X_{1}+X_{2})=E(X_{1})+E(X_{2})$$
> [!EXAMPLE] Bsp  
> $X_{1}\dots$ Augensumme Würfeln mit 1 Würfel  
> $X_{1}\dots$ Augensumme Würfeln mit 1 Würfel


> [!EXAMPLE] Spiel mit Gewinnen von $X=\{-10,0,15,40\}$
> $$
> \begin{align*}
> E(X) &= \sum\limits_{i=0}^{n}p_{i}\cdot x_{i}=\qquad X=\{-10,0,15,40\}\\
> &= \left(\frac{5}{6}\right)^{3}\cdot(-10)+P (X=1)\cdot(0) +\underbrace{\left(\binom{3}{2}\cdot\left(\frac{1}{6}\right)^{2}\cdot\left(\frac{5}{6}\right)\right)}_{P(X=2)}\cdot (15)+ \binom{3}{3}\cdot \frac{1}{6}^{3}\cdot(40)
> \end{align*}
> $$
> 
> Durchschnittlicher Gewinn pro spiel:  
> $E(X)=$ -4,56€
> 
> Ein Spiel ist dann Fair, wenn der erwartungswert $0$ ist.

