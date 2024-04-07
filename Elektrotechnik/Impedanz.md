---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Elektrotechnik
semester:
  - WS23
  - B1
created: 18. April 2023
professor: 
cited:
---
 

# Impedanz

$$
\begin{align}
Z = R+jX\\
Y = G+jB
\end{align}
$$

| $Z$ | *Impedanz* <br> Scheinwiderstand | $\uparrow^{-1}$ | $Y$ | *Admittanz* <br> Scheinleitwert |
| --- | -------------------------------- | --------------- | --- | ------------------------------- |
| $R$ | *[Resistanz](Ohmsches%20Gesetz.md)* <br> Wirkwiderstand  | $\uparrow^{-1}$ | $G$ | *Konduktanz* <br> Wirkleitwert  |
| $X$ | *Reaktanz*  <br> Blindwiderstand | $\uparrow^{-1}$ | $B$ | *Suszeptanz* <br> Blindleitwert |

Für Berechnungen gilt: $Z=\frac{Z_{Z}}{Z_{N}}$ -> $\mid Z\mid=\frac{\mid Z_{Z}\mid}{\mid Z_{N}\mid}$

## Bauelemente

|    Bauelement    |                   Impedanz                    |                   Admittanz                   |
| :--------------: | :-------------------------------------------: | :-------------------------------------------: |
| Widerstand $R$  |               $\underline{Z}=R$               |             $\underline{Y}=1 / R$             |
| Kapazität $C$   | $\underline{Z}=\frac{1}{\mathrm{j} \omega C}$ |      $\underline{Y}=\mathrm{j} \omega C$      |
| Induktivität $L$ |      $\underline{Z}=\mathrm{j} \omega L$      | $\underline{Y}=\frac{1}{\mathrm{j} \omega L}$ |

# Tags

- [Impedanz Anpassung](Impedanz%20Anpassung.md)
- [Kettenmatrix](../Hardwareentwicklung/Kettenmatrix.md)
- [Induktivitäten](Induktivitäten.md)
- [Kapazität](Kapazität.md)

![How to Achieve Proper Grounding - Rick Hartley](https://www.youtube.com/watch?v=ySuUZEjARPY)