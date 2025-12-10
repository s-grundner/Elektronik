---
tags:
aliases:
keywords:
subject:
  - VL
  - Elektrotechnik
semester: WS23
created: 18. April 2023
professor:
---
 

# Impedanz

$$
\begin{align}
\underline{ Z } = R+jX\\
\underline{ Y } = G+jB
\end{align}
$$

|                   |                                                         |    Dualität     |                                 |                   |
| :---------------- | :------------------------------------------------------ | :-------------: | ------------------------------: | ----------------: |
| $\underline{ Z }$ | *Impedanz* <br> Scheinwiderstand                        | $\uparrow^{-1}$ | *Admittanz* <br> Scheinleitwert | $\underline{ Y }$ |
| $R$               | *[Resistanz](Ohmsches%20Gesetz.md)* <br> Wirkwiderstand | $\uparrow^{-1}$ |  *Konduktanz* <br> Wirkleitwert |               $G$ |
| $X$               | *Reaktanz*  <br> Blindwiderstand                        | $\uparrow^{-1}$ | *Suszeptanz* <br> Blindleitwert |               $B$ |

$\underline{ Z }$ und $\underline{Y}$ sind Komplexe größen, $X,G$ **nicht**. Darauf achten, dass das $\jmath$ nicht vergessen wird

> [!hint] Für Berechnungen gilt:
> $\underline{ Z }=\dfrac{\underline{ Z }_{Z}}{\underline{ Z }_{N}} \to\lvert \underline{ Z } \rvert = \dfrac{\lvert \underline{ Z }_{Z} \rvert}{\lvert \underline{ Z }_{N} \rvert}$

## Bauelemente

|    Bauelement    |                   Impedanz                    |                   Admittanz                   |
| :--------------: | :-------------------------------------------: | :-------------------------------------------: |
| Widerstand $R$  |               $\underline{Z}=R$               |             $\underline{Y}=1 / R$             |
| Kapazität $C$   | $\underline{Z}=\frac{1}{\mathrm{j} \omega C}$ |      $\underline{Y}=\mathrm{j} \omega C$      |
| Induktivität $L$ |      $\underline{Z}=\mathrm{j} \omega L$      | $\underline{Y}=\frac{1}{\mathrm{j} \omega L}$ |

# Tags

> [!info] Warum werden $50\Omega$ oft benutzt
> - Impedanz mit der besten Empfangsleistung: $77\Omega$
> - Impedanz mit der besten Sendeleistung: $33\Omega$
> 
> MIttelwert ist $50\Omega$

- [Impedanz Anpassung](../HF-Technik/Impedanz%20Anpassung.md)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)