---
tags: ["Transformation"]
aliases: ["s-Domäne"]
subject: ["mathe"]
source: ["Rudolf Frauenschuh"]
created: 26th April 2022
---

# Laplace Transformation - Multiplizieren Statt [Differenzieren](../Analysis/Differenzialrechnung.md)

- Bei Einschaltvorgängen interessiert uns nur, was nach dem [Einschalten](Schaltvorgänge.md) $(t=0)$ passiert.
- Um mehr Funktionen transformieren zu können, wird eine [Dämpfung](../../Hardwareentwicklung/Dämpfung.md) $e^{-\delta t}$ eingeführt. $(\delta\in\mathbb{R}^{+})$

Ist eine Funktion auf $t\in\mathbb{R}$ definiert mit $f(t):[0,\infty)$ für $t<0$, so heißt:

$$\boxed{ F(s) = \int_{0}^{\infty}f(t)\cdot e^{-st}dt \qquad s\in\mathbb{C} }$$

> [!summary] Frequenzparameter: $s = \delta+j\omega$

[Fourier Transformation](Fourier%20Transformation.md) vs. Laplace Transformation  

$$F(s) = \mathcal{L}\{ f(t)\} \qquad F(\omega) = \mathcal{F} \{f(t)\}$$

für $s=j\omega$ ist dann $F(s)=F(\omega)$

>[!EXAMPLE] Bsp.: Deltaimpuls
>
> $$
> \begin{align*}
> f(t) &= 1\\
> f(t) &= \delta(t) = \begin{cases}
> 1 && t \geq 0\\
> 0 && t < 0
> \end{cases}\\
> \mathcal{L}\{1\} &= \int_{0}^{\infty}1\cdot e^{-st}dt = -\frac{1}{s}\cdot e^{-st} \Bigg{|}_{0}^{\infty} = 0-\left(\frac{1}{s}\cdot e^{0}\right) = \frac{1}{s}
> \end{align*}
> $$

## Herleitung

Woher: $f(t)\cdot e^{-\delta t}$ wird [fourier-transformiert](Fourier%20Transformation.md) $(f(t)=0 \forall t<0)$

$$
\begin{align*}
F(\omega) &= \int_{-\infty}^{\infty}f(t)\cdot\underbrace{e^{-\delta t}\cdot e^{-j\omega t}}_{e^{-(\delta+j\omega)t}}dt\\
F(s) &= \int_{0}^{\infty}f(t)\cdot e^{-st}dt\\
\mathcal{L}\{f(t)\} &= \mathcal{F}\{f(t)\cdot e^{-\delta t}\} \qquad f(t) = 0 \forall t<0
\end{align*}
$$

## Regeln Der Laplace Transformation

| Nr     | Satz                        |                                                                                                                         | Anmerkungen                                                                                                          |
| ------ | --------------------------- | ----------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| (i)    | **Linearität**              | $$\mathcal{L}\left\{c_1 f_1 + c_2 f_2\right\} = c_1 \mathcal{L} f_1 + c_2 \mathcal{L} f_2, \, c_1, c_2 \in \mathbb{R}$$ |                                                                                                                      |
| (ii)   | **[Faltung](Faltung.md)**   | $$\mathcal{L}\left\{f_1 * f_2\right\} = \mathcal{L} f_1 \cdot \mathcal{L} f_2$$                                         | Die Faltung ist definiert durch <br>$\left(f_1 * f_2\right)(t) := \int_0^t f_1(t-\tau) f_2(\tau) d\tau$              |
| (iii)  | **Integration**             | $$\mathcal{L}\left\{\int_0^t f(\tau) d\tau\right\}(s) = \frac{1}{s} \mathcal{L} f(s)$$                                  |                                                                                                                      |
| (iv)   | **Differentiation**         | $$\mathcal{L}\left\{f^{(n)}\right\}(s) = s^n \mathcal{L} f(s) - \sum_{k=0}^{n-1} s^{n-1-k} f^{(k)}(0)$$                 | Gilt für $f \in C^n[0, \infty)$. <br>Dies ist eine wesentliche Grundlage für<br>die Anwendbarkeit zur Lösung von AWP |
| (v)    | **Verschiebung**            | $$\mathcal{L}\{f(t-a)\}(s) = e^{-a s} \mathcal{L} f(s), \, a > 0$$                                                      | $f$ wird für $t < 0$ durch 0 fortgesetzt.                                                                            |
| (vi)   | **Ähnlichkeit** (Streckung) | $$\mathcal{L}\{f(at)\}(s) = \frac{1}{a} \mathcal{L} f\left(\frac{s}{a}\right), \, a > 0, \, s > a\alpha$$               |                                                                                                                      |
| (vii)  | **Dämpfung**                | $$\mathcal{L}\left\{e^{-a t} f(t)\right\}(s) = \mathcal{L} f(s+a), \, a \in \mathbb{R}, \, s > \alpha - a$$             |                                                                                                                      |
| (viii) | **Multiplikation**          | $$\mathcal{L}\left\{t^n f(t)\right\}(s) = (-1)^n (\mathcal{L} f)^{(n)}(s)$$                                             | Multiplikation mit einem Polynom<br>ist der Gegensatz zu (iv)                                                        |
| (ix)   | **Division**                | $$\mathcal{L}\left\{\frac{f(t)}{t}\right\}(s) = \int_s^{\infty} (\mathcal{L} f)(\sigma) d\sigma$$                       |                                                                                                                      |



## Nützliche Laplace Transformationen


$$
\mathcal{L}\{\sin (\omega t)\}(s)=\frac{\omega}{s^2+\omega^2} \quad \text { und } \quad \mathcal{L}\{\cos (\omega t)\}(s)=\frac{s}{s^2+\omega^2}, \quad s>0,
$$


> [!success]- Wir zeigen nur die linke, der Beweis der rechten geht analog:
> Mittels [Partieller Integration](../Analysis/Partielle%20Integration.md)
> $$
> \begin{aligned}
> \int_0^{\infty} \sin (\omega t) e^{-s t} d t & =-\left.\frac{\cos (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}-\frac{s}{\omega} \int_0^{\infty} \cos (\omega t) e^{-s t} d t \\
> & =\frac{1}{\omega}-\frac{s}{\omega}\left(\left.\frac{\sin (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}+\frac{s}{\omega} \int_0^{\infty} \sin (\omega t) e^{-s t} d t\right) \\
> & =\frac{1}{\omega}-\frac{s^2}{\omega^2} \int_0^{\infty} \sin (\omega t) e^{-s t} d t
> \end{aligned}
> $$
> 
> 
> Also: $\int_0^{\infty} \sin (\omega t) e^{-s t} d t=\frac{\omega}{s^2+\omega^2}$

# Tags

[Laplace-Bildbereich](Laplace-Bildbereich.md)

[Delta-Impuls](Delta-Impuls.md)
 