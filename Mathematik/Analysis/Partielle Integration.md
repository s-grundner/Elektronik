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
> $$\int f(x)\cdot g(x) \, dx = F(x)\cdot g(x) - \int F(x)\cdot g'(x) \, dx $$

- für $g$ wird jene Funktion gewählt die durch Differenzation verschwindet
- Es gibt eine einfach anzuwendende tabellarische Methode der partiellen Integration
- Partielle integration kann mehrmals hintereinander augeführt werden

## Tabellarische Methode

Bei mehrmaliger Anwendung der Partiellen Integration ist eine Tabellarische Schreibweise hilfreich



# Beispiele

Stammfunkton von $\ln \left(\operatorname{auf} \mathbb{R}^{+}\right)$mit $f: \equiv 1$ und $g:=\ln$ :

$$
\int \ln x d x=\int 1 \cdot \ln x d x=x \ln x-\int x x^{-1} d x=x \ln x-x=x(\ln x-1)
$$


$$
\int e^{ \alpha t} \sin (\beta t) d t=e^{ \alpha t }\cdot\frac{-\beta \cos (\beta t)+\alpha \sin (\beta t)}{\alpha^2+\beta^2}
$$
> [!info] Um dieses integral zu lösen wird $e^{ \alpha t }$ zu $f$ und $\sin(\beta t)$ zu $g$.
> Duch zwei maliges partielles Integrieren kann dann der Integral Term auf eine Seite der Gleichung gebracht werden.