---
tags: 
aliases: 
keywords:
  - Stammfunktion ln
subject:
  - VL
  - Mathematik 2
semester: SS24
created: 30. September 2024
professor:
  - Andreas Neubauer
---
 

# Partielle Integration

> [!satz] **S1 - PINT)** Partielle [Integration](Integralrechnung.md)
> 
> $$\int_{a}^{b} f(x)\cdot g(x) \, \mathrm{d}x = F(x)\cdot g(x) \Bigg|_{a}^{b} - \int_{a}^{b} F(x)\cdot g'(x) \, \mathrm{d}x $$

(Auch für unbestimmte Integrale)

- für $g$ wird jene Funktion gewählt die durch Differenzation verschwindet
- Es gibt eine einfach anzuwendende tabellarische Methode der partiellen Integration
- Partielle integration kann mehrmals hintereinander augeführt werden


> [!example] Stammfunktion von $\ln \left(\operatorname{auf} \mathbb{R}^{+}\right)$mit $f: \equiv 1$ und $g:=\ln$ :
> $$\int \ln x \mathrm{~d} x=\int 1 \cdot \ln x \mathrm{~d} x=x \ln x-\int x x^{-1} \mathrm{~d} x=x \ln x-x=x(\ln x-1)$$

## Tabellarische Methode

Bei mehrmaliger Anwendung der Partiellen Integration ist eine Tabellarische Schreibweise hilfreich:

Wenn $g$ $n$-mal Differenziert werden muss um zu verschwinden, lässt sich schreiben:

| **Schritt**  | **I**           | **D**                       |
| :------: | :---------: | :---------------------: |
| $0$      | $f$         | $g$                     |
| $1$      | $F$         | $g'$                    |
| $\vdots$ | $\vdots$    | $\vdots$                |
| $n-1$    | $F_{(n-1)}$ | $\gamma \in \mathbb{R}$ |
| $n$      | $F_{(n)}$   | $0$                     |

$F_{(n)}$ ist dabei die $n$-te Stammfunktion, bzw $f$ $n$-mal Integriert. $\gamma$ ist der Konstante Faktor von $g$

Es lässt sich die $n$-malige Partielle Integration explizit schreiben wie:

$$
\int f g \mathrm{~d}x = Fg - F_{(2)}g'+F_{(3)}g'' -\dots(-1)^{n-2}\cdot F_{(n-1)}g^{(n-2)} +(-1)^{n-1}\cdot F_{(n)}\cdot \gamma +C
$$

- Ist das Integral Bestimmt, müssen die grenzen für jeden Term berücksichtigt werden. 
- Ist das Integral Unbestimmt $+ C$ nicht vergessen

---

> [!success]- Geziegt für $n=6$
> 
> $$
> \begin{align}
> \int fg \mathrm{~d}x &= Fg- \int Fg' \mathrm{~d}x \\
> &= Fg-\left[ F_{(2)}g'- \int F_{(2)}g'' \mathrm{~d}x \right] \quad\qquad\qquad\text{Part. Int. Weiterführen}  \\
> &= Fg- F_{(2)}g' + F_{(3)}g''-\int F_{(3)}g''' \mathrm{~d}x \qquad\text{beim Ausklammern Vorzeichen Beachten} \\
> &= Fg- F_{(2)}g' + F_{(3)}g''-F_{(4)}g'''+\int F_{(4)} g^{(4)} \mathrm{~d}x \\
> &= Fg- F_{(2)}g' + F_{(3)}g''-F_{(4)}g'''+ \left[ F_{(5)}g^{(4)}- \int F_{(5)}\underbrace{ g^{(5)} }_{ =1 } \mathrm{~d}x  \right]  \\
> &= Fg- F_{(2)}g' + F_{(3)}g''-F_{(4)}g'''+ F_{(5)}g^{(4)}- F_{(6)}
> \end{align}
> $$

## Integration von Transitiven Produkten

Sind $f$ und $g$ transitiv ($\sin \cdot, \cos \cdot, e^{ \cdot }$), dass heißt keine der beiden Funktionen verschwindet durch Ableiten, kann durch zweimalige Partielle Integration der Integralterm weggkekürzt werden, da die Funktion spätestens dann wieder die Ausgangsform hat.

> [!hint] Zur Erinnerung: z.B. $\iint \sin = -\sin$ (nur Symbolisch)


> [!example] Um dieses integral zu lösen wird $e^{ \alpha t }$ zu $f$ und $\sin(\beta t)$ zu $g$.
> $$
> \int e^{ \alpha t} \sin (\beta t) d t=e^{ \alpha t }\cdot\frac{-\beta \cos (\beta t)+\alpha \sin (\beta t)}{\alpha^2+\beta^2}
> $$
