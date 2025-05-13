---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
semester: SS25
created: 9th May 2025
professor:
draft: true
title: Korr-Z
---

# z-Transformation Korrespondenzen

> [!example] [z-Transformation](../z-Transformation.md)
> $$ f[n]\circ\mkern-7px-\mkern-7px\bullet\mathcal{Z}\left\{ f[n] \right\} (z) =: F(z) \text{ bzw } f_{z}(z) $$

Schreibweise $f_{z}(z)$, da in der Regelungstechnik speziell nur Matrizen groß geschreiben werden. $f_{z}(z)$ ist dabei höchstens ein Funktionsvektor $\mathbf{f}_{z}(z)$

---

## Rechenregel Signalschriebweise

Hier explizit mit den Diskreten Folgen in Array-Schreibweise. Zusammenhang zwischen den Spalten ist daher:
 
 $$ \mathcal{Z}\left\{ \text{Zeitbereich}\right\} =\text{Bildbereich} $$

| Nr.   | Satz              | Zeitbereich                                                                                  | Bildbereich                                                                                                        |
| ----- | :---------------- | :------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------------- |
| i.    | Linearität        | $$ \alpha_1 f_{1}[k]+\alpha_2 f_{2}[k] $$                                                    | $$ \alpha_1 \mathcal{Z}\left\{ f_{1}[k] \right\} (z)+\alpha_2 \mathcal{Z}\left\{ f_{2}[k] \right\} (z) $$          |
| iii.  | Verschiebungssatz | $$ f[k+n]$$                                                                                  | $$ z^n\left(\mathcal{Z}\{f[n]\}(z)-\sum\limits_{j=0}^{n-1} f[j] z^{-j}\right)$$                                    |
|       |                   | $$ f[k-n] $$                                                                                 | $$ z^{-n}\left(\mathcal{Z}\{f[n]\}(z) +\sum\limits_{j=1}^n f[-j] z^j\right)$$                                      |
| iv.   | Dämpfungssatz     | $$ a^k f[k] $$                                                                               | $$ \mathcal{Z}\{f[n]\}\!\left(\frac{z}{a}\right) $$                                                                |
| v.    | Differenz         | $$ f[k+1]-f[k] $$                                                                            | $$ (z-1) \mathcal{Z}\{f[n]\}(z) -z f[0] $$                                                                         |
|       |                   | $$ f[k]-f[k-1] $$                                                                            | $$ \frac{z-1}{z} \mathcal{Z}\{f[n]\}(z)-f[-1] $$                                                                   |
| vi.   | Summe             | $$ \sum_{j=0}^{k-1} f[j] $$                                                                  | $$ \frac{1}{z-1} \mathcal{Z}\{f[n]\}(z) $$                                                                         |
|       |                   | $$ \sum_{j=0}^k f[j] $$                                                                      | $$ \frac{z}{z-1} \mathcal{Z}\{f[n]\}(z) $$                                                                         |
| vii.  | Multiplikation    | $$ (k T_a) f[k] $$                                                                           | $$ -T_a z \frac{\mathrm{~d}}{\mathrm{~d} z} \mathcal{Z}\{f[n]\}(z) $$                                              |
| viii. | Division          | $$ \begin{aligned}0 && k =0 \\ \frac{f[k]}{k T_a} && k>0\end{aligned} $$                     | $$ \frac{1}{T_a} \int\limits_z^{\infty} \frac{\mathcal{Z}\left\{ f[n] \right\} (\zeta)}{\zeta} \mathrm{d} \zeta $$ |
| ix.   | Faltungssatz      | $$ \begin{aligned} & \sum_{j=0}^k f[k-j] g[j] \\ & \sum_{j=0}^k f[j] g[k-j] \end{aligned} $$ | $$ \mathcal{Z}\{f[n]\}(z) \cdot \mathcal{Z}\{g[n]\}(z) $$                                                          |
^Z-T1

## Rechenregeln Folgenschreibweise

Hier mit den Folgen in Indexschreibweise, und der Korrespondierenden Funktion als $f_{z}(z)$ bzw. $g_{z}(z)$

| Nr.   | Satz              | Zeitbereich                                                                                 | Bildbereich                                                                         |
| ----- | :---------------- | :------------------------------------------------------------------------------------------ | :---------------------------------------------------------------------------------- |
| i.    | Linearität        | $$ \alpha_1 f_{1, k}+\alpha_2 f_{2, k}$$                                                    | $$\alpha_1 f_{z, 1}(z)+\alpha_2 f_{z, 2}(z) $$                                      |
| iii.  | Verschiebungssatz | $$ f_{k+n}$$                                                                                | $$z^n\left(f_z(z)-\sum\limits_{j=0}^{n-1} f_j z^{-j}\right)$$                       |
|       |                   | $$ f_{k-n} $$                                                                               | $$z^{-n}\left(f_z(z)+\sum\limits_{j=1}^n f_{-j} z^j\right)$$                        |
| iv.   | Dämpfungssatz     | $$ a^k f_k $$                                                                               | $$f_z\left(\frac{z}{a}\right) $$                                                    |
| v.    | Differenz         | $$ f_{k+1}-f_k$$                                                                            | $$(z-1) f_z(z)-z f_0 $$                                                             |
|       |                   | $$ f_k-f_{k-1}$$                                                                            | $$\frac{z-1}{z} f_z(z)-f_{-1} $$                                                    |
| vi.   | Summe             | $$ \sum_{j=0}^{k-1} f_j$$                                                                   | $$\frac{1}{z-1} f_z(z) $$                                                           |
|       |                   | $$ \sum_{j=0}^k f_j$$                                                                       | $$\frac{z}{z-1} f_z(z) $$                                                           |
| vii.  |                   | $$ (k T_a) f_k$$                                                                            | $$-T_a z \frac{\mathrm{~d}}{\mathrm{~d} z} f_z(z) $$                                |
| viii. |                   | $$ \begin{aligned}0 && k =0 \\ \frac{f_k}{k T_a} && k>0\end{aligned}$$         | $$\frac{1}{T_a} \int\limits_z^{\infty} \frac{f_z(\zeta)}{\zeta} \mathrm{d} \zeta $$ |
| ix.   | Faltungssatz      | $$ \begin{aligned} & \sum_{j=0}^k f_{k-j} g_j \\ & \sum_{j=0}^k f_j g_{k-j} \end{aligned}$$ | $$f_z(z) g_z(z) $$                                                                  |
^Z-T2

## Korrespondenztabelle


