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
^Z-T1

