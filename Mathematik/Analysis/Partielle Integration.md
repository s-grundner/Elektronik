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

> [!satz] **S1 - PINT)** Partielle Integration
> 
> $$\int_{a}^{b} f(x)\cdot g(x) \, dx = F(x)\cdot g(x) \Bigg|_{a}^{b} - \int_{a}^{b} F(x)\cdot g'(x) \, dx $$

(Auch für und)

- für $g$ wird jene Funktion gewählt die durch Differenzation verschwindet
- Es gibt eine einfach anzuwendende tabellarische Methode der partiellen Integration
- Partielle integration kann mehrmals hintereinander augeführt werden


> [!example] Stammfunktion von $\ln \left(\operatorname{auf} \mathbb{R}^{+}\right)$mit $f: \equiv 1$ und $g:=\ln$ :
> $$\int \ln x d x=\int 1 \cdot \ln x d x=x \ln x-\int x x^{-1} d x=x \ln x-x=x(\ln x-1)$$


## Tabellarische Methode

Bei mehrmaliger Anwendung der Partiellen Integration ist eine Tabellarische Schreibweise hilfreich:

Wenn $g$ $n$-mal Differenziert werden muss damit es verschwindet, lässt sich schreiben:

|          | I         | D    |
| -------- | --------- | ---- |
| 0        | $f$       | $g$  |
| 1        | $F$       | $g'$ |
| $\vdots$ |           |      |
| $n$      | $F_{(n)}$ | $1$  |

$F_{(n)}$ ist dabei die $n$-te Stammfunktion, bzw $f$ $n$-mal Integriert. Dann lässt sich die $n$-malige Partielle Integration explizit schreiben wie:

$$
\int_{a}^{b} f \mathrm{~d}x 
$$


## Integration von Transitiven Produkten

Sind $f$ und $g$ transitiv ($\sin \cdot, \cos \cdot, e^{ \cdot }$), dass heißt keine der beiden Funktionen verschwindet durch Ableiten, kann durch zweimalige Partielle Integration der Integralterm weggkekürzt werden, da die Funktion spätestens dann wieder die Ausgangsform hat.

> [!hint] Zur Erinnerung $\iint \sin = -\sin$ (nur Symbolisch)


> [!example] Um dieses integral zu lösen wird $e^{ \alpha t }$ zu $f$ und $\sin(\beta t)$ zu $g$.
> $$
> \int e^{ \alpha t} \sin (\beta t) d t=e^{ \alpha t }\cdot\frac{-\beta \cos (\beta t)+\alpha \sin (\beta t)}{\alpha^2+\beta^2}
> $$
