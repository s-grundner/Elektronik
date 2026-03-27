---
tags:
aliases:
  - Bodediagramm
  - Bode Diagramm
keywords:
subject:
  - VL
  - Regelungstechnik
  - Signale und Systeme
semester: SS25
created: 16th May 2025
professor:
  - Markus Schöberl
title: Bode Plot
release: true
---

# Bode Plot

Im Bodediagramm wird der [Frequenzgang](Übertragungsfunktion.md) Logarithmisch auf ein Betrags und Phasenspektrum aufgeteilt

$$
G(s)=\frac{V}{s^{r}} \frac{p(s)}{q(s)} \quad \text { mit } \quad p(0)=q(0)=1, \quad r \in \mathbb{Z} 
$$

Dabei ist $V$ ein Verstärkungsfaktor der herausgehoben wird, sodass der einzige von $s$ unabhängige Term in $p(s)$ und $q(s)$ gleich $1$ ist, z.B. $\dfrac{10}{s+3} = \dfrac{10}{3\left( \frac{s}{3}+1 \right)} \to V= \dfrac{10}{3}$

Man bringt die Polynome $p(s)$ und $q(s)$ in die faktorisierte Form

$$
G(s)=\frac{V}{s^{r}} \frac{\prod_{i=1}^{k}\left(1+\tilde{T}_{i} s\right)}{\prod_{i=1}^{l}\left(1+T_{i} s\right)} \frac{\prod_{i=1+k}^{m}\left(1+2 \tilde{\zeta}_{i} \tilde{T}_{i} s+\left(\tilde{T}_{i} s\right)^{2}\right)}{\prod_{i=1+l}^{n}\left(1+2 \zeta_{i} T_{i} s+\left(T_{i} s\right)^{2}\right)}
$$

Diese Form erhält man durch finden der Nullstellen

> [!hint] Matlab Command
>
> ```matlab
> bode()
> ```

## Betrag

$$
\begin{align}
|G(\mathrm{j} \omega)|_{\mathrm{dB}} & =|V|_{\mathrm{dB}}+\sum_{i=1}^{k}\left|1+\tilde{T}_{i} \mathrm{j} \omega\right|_{\mathrm{dB}}+\sum_{i=k+1}^{m}\left|1+2 \tilde{\zeta}_{i} \tilde{T}_{i} \mathrm{j} \omega+\left(\tilde{T}_{i} \mathrm{j} \omega\right)^{2}\right|_{\mathrm{dB}} \\ 
& -r|\omega|_{\mathrm{dB}}-\sum_{i=1}^{l}\left|1+T_{i} \mathrm{j} \omega\right|_{\mathrm{dB}}-\sum_{i=l+1}^{n}\left|1+2 \zeta_{i} T_{i} \mathrm{j} \omega+\left(T_{i} \mathrm{j} \omega\right)^{2}\right|_{\mathrm{dB}}
\end{align}
$$

## Phase

$$
\begin{align}
\arg (G(\mathrm{j} \omega)) & =\arg (V)+\sum_{i=1}^{k} \arg \left(1+\tilde{T}_{i} \mathrm{j} \omega\right)+\sum_{i=k+1}^{m} \arg \left(1+2 \tilde{\zeta}_{i} \tilde{T}_{i} \mathrm{j} \omega+\left(\tilde{T}_{i} \mathrm{j} \omega\right)^{2}\right) \\
& -r \arg (\mathrm{j} \omega)-\sum_{i=1}^{l} \arg \left(1+T_{i} \mathrm{j} \omega\right)-\sum_{i=l+1}^{n} \arg \left(1+2 \zeta_{i} T_{i} \mathrm{j} \omega+\left(T_{i} \mathrm{j} \omega\right)^{2}\right) 
\end{align}
$$

## Beispiele

---

$G_{1}(\mathrm{j} \omega)=V$ :

$$
\begin{aligned}
\left|G_{1}\right|_{\mathrm{dB}} & =20 \log (|V|) \\ \\
\arg \left(G_{1}\right) & =\left\{\begin{array}{lll}
0^{\circ} & \text { für } & V>0 \\
180^{\circ} & \text { für } & V<0
\end{array}\right.
\end{aligned}
$$

---

$G_{2}(\mathrm{j} \omega)=(\mathrm{j} \omega)^{r}$ :

$$
\begin{aligned}
\left|G_{2}\right|_{\mathrm{dB}} & =20 r \log (\omega) \\
\arg \left(G_{2}\right) & =90^{\circ} r
\end{aligned}
$$

---

$G_{3}(\mathrm{j} \omega)=1+\mathrm{j} \omega T$ :

$$
\begin{align}
\left|G_{3}\right|_{\mathrm{dB}} &= 20 \log \left(\sqrt{1+(\omega T)^{2}}\right) &&=\begin{cases}
0 & \text { für } |\omega T| \ll 1 \\
20(\log (\omega) \left.-\log \left(\left|\frac{1}{T}\right|\right)\right) & \text { für } \\
\end{cases} \\ \\
\arg \left(G_{3}\right) &= \arg (1+\mathrm{j} \omega T) &&= \begin{cases}
0^{\circ} & \text { für }  |\omega T| \ll 1 \\
45^{\circ} \operatorname{sgn}(T) & \text { für } |\omega T|=1 \\
90^{\circ} \operatorname{sgn}(T) & \text { für } |\omega T| \gg 1
\end{cases}
\end{align}
$$

---

$G_{4}(\mathrm{j} \omega)=1+2 \zeta \mathrm{j} \omega T+(\mathrm{j} \omega T)^{2}, T>0$ :

$$
\begin{align}
\left|G_{4}\right|_{\mathrm{dB}} & = 20 \log \left(\sqrt{\left(1-(\omega T)^{2}\right)^{2}+(2 \zeta \omega T)^{2}}\right) \\
&=\begin{cases}
0 & \text { für } \omega T \ll 1 \\
40\left(\log (\omega)-\log \left(\frac{1}{T}\right)\right) & \text { für } \omega T \gg 1
\end{cases}
\\ \\
\arg \left(G_{4}\right) &= \arg \left(1-(\omega T)^{2}+2 \zeta \omega T \mathrm{j}\right)\\&= \begin{cases}
0^{\circ} & \text { für } \omega T \ll 1 \\
90^{\circ} \operatorname{sgn}(\zeta) & \text { für } \omega T=1 \\
180^{\circ} \operatorname{sgn}(\zeta) & \text { für } \omega T \gg 1
\end{cases}
\end{align}
$$
