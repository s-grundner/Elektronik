---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Regelungstechnik
  - Signalverarbeitung
semester: SS25
created: 7th May 2025
professor: 
title: LAPT-Korr
release: true
---
	

# Korrespondenzen und Rechensätze

> [!question] [Laplacetransformation](../Laplacetransformation.md)

## Sätze: Einfache Schreibweise mit $F(s)$

Für eine schnelle Referenz ist hier der Zeit Vs Bildbereich gelistet.

Es gilt der zusammenhang $F(s) = \mathcal{L}\left\{ f(t) \right\}(s)$

| Nr     | Satz                           | Zeitbereich                                | Bildbereich                                                                                      |
| ------ | ------------------------------ | ------------------------------------------ | ------------------------------------------------------------------------------------------------ |
| (i)    | **Linearität**                 | $$ c_{1}f_{1}(t) + c_{2}f_{2}(t) $$        | $$ c_{1}F_{1}(s) + c_{2}F_{2}(s) $$                                                              |
| (ii)   | **Ähnlichkeit**                | $$f(at)$$                                  | $$\frac{1}{a} F\left( \frac{s}{a} \right)$$                                                      |
| (iii)  | **Zeitverschiebung**           | $$f(t-t_{0})$$                             | $$e^{ -st_{0} }\left( F(s)  + \int _{-t_{0}}^0 f(t)e^{ -st } \mathrm{~d}t \right) $$             |
| (iv)   | **Dämpfung**                   | $$f(t)e^{ at }$$                           | $$F(s-a)$$                                                                                       |
| (v)    | **Differenzation**             | $$\frac{\mathrm{d}^n}{\mathrm{d}t^n}f(t)$$ | $$\begin{gather}s^nF(s) -s^{n-1}f(0^+)\\-s^{n-2}f^{(1)}(0^+) -\dots-f^{(n-1)}(0^+)\end{gather}$$ |
|        | speziell die 1. Ableitung      | $$\frac{\mathrm{d}}{\mathrm{d}t}f(t)$$     | $$sF(s)-f(0^+)$$                                                                                 |
| (vi)   | **Multiplikation** mit Polynom | $$(-t)^n f(t)$$                            | $$\frac{\mathrm{d}^n}{\mathrm{d}s^n}F(s)$$                                                       |
| (vii)  | **Integration**                | $$\int_{0}^{t}f(\tau) \mathrm{~d}\tau $$   | $$\frac{F(s)}{s}$$                                                                               |
| (viii) | [Faltung](../Faltung.md)       | $$(f_{1}*f_{2})(t)$$                       | $$F_{1}(s)F_{2}(s)$$                                                                             |
^LAPT-T1

## Sätze: Explizite Schreibweise mit $\mathcal{L}$

Der Vorteil der komplexeren schreibweise ist, dass man die operationen auf das argument $s$ und $t$ besser verfolgen kann.

| Nr     | Satz                           | Zeitbereich zu $s$-Domäne: $f(t) \circ\mkern-7px-\mkern-7px\bullet \mathcal{L}\left\{ f(t) \right\}(s)$                                                                            | Anmerkungen                                                                                                                                                         |
| ------ | ------------------------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| (i)    | **Linearität**                 | $$\begin{align}&\mathcal{L}\left\{c_1 f_1(t) + c_2 f_2(t)\right\}(s) \\= &c_1 \mathcal{L}\left\{ f_{1}(t) \right\}(s) + c_2 \mathcal{L} \left\{ f_{2}(t) \right\}(s) \end{align}$$ | $c_1, c_2 \in \mathbb{R}$                                                                                                                                           |
| (ii)   | **Ähnlichkeit**                | $$\mathcal{L}\{f(at)\}(s) = \frac{1}{a} \mathcal{L} \left\{ f(t) \right\} \!\left(\frac{s}{a}\right)$$                                                                             | $a > 0$<br>$s > a$<br>Auch Streckung genannt                                                                                                                        |
| (iii)  | **Zeitverschiebung**           | $$\mathcal{L}\{f(t-a)\}(s) = e^{-a s} \mathcal{L} \left\{ f(t) \right\} (s)$$                                                                                                      | $a > 0$<br>$f$ wird für $t < 0$ durch $0$ fortgesetzt.<br>Formal mit dem [Einheitssprung](Einheitssprungfunktion.md) $\sigma(t)$.                                   |
| (iv)   | **Dämpfung**                   | $$\mathcal{L}\left\{e^{-a t} f(t)\right\}(s) = \mathcal{L} \left\{ f(t) \right\} (s+a)$$                                                                                           | $a \in \mathbb{R}$<br>$s > \alpha - a$                                                                                                                              |
| (v)    | **Differentiation**            | $$\mathcal{L}\left\{f^{(n)}\right\}(s) = s^n \mathcal{L} \left\{ f(t) \right\} (s) - \sum_{k=0}^{n-1} s^{n-1-k} f^{(k)}(0)$$                                                       | Gilt für $f(t) \in C^n, t \in[0, \infty)$. <br>Dies ist eine wesentliche Grundlage für<br>die Anwendbarkeit zur Lösung von [AWP](../../Mathematik/Analysis/GDGL.md) |
| (vi)   | **Multiplikation** mit Polynom | $$\mathcal{L}\left\{t^n f(t)\right\}(s) = (-1)^n (\mathcal{L} \left\{ f(t) \right\} )^{(n)}(s)$$                                                                                   | Multiplikation mit einem Polynom<br>ist der Gegensatz zu (iv)                                                                                                       |
| (vii)  | **Integration**                | $$\mathcal{L}\left\{\int_0^t f(\tau) d\tau\right\}(s) = \frac{1}{s} \mathcal{L}\left\{ f(t) \right\} (s)$$                                                                         |                                                                                                                                                                     |
| (viii) | **[Faltung](Faltung.md)**      | $$\mathcal{L}\left\{(f_1 * f_2)(t)\right\}(s) = \mathcal{L} \left\{ f_{1}(t) \right\}(s) \cdot \mathcal{L}\left\{ f_{2}(t) \right\}(s)$$                                           | Die Faltung ist definiert durch <br>$\left(f_1 * f_2\right)(t) := \int_0^t f_1(t-\tau) f_2(\tau) d\tau$                                                             |
| (ix)   | **Division**                   | $$\mathcal{L}\left\{\frac{f(t)}{t}\right\}(s) = \int_s^{\infty} \mathcal{L} \left\{ f(t)\right\}  (\zeta) ~d\zeta$$                                                                | $\zeta$ hat hier nur eine Bedeutung<br>als andere Integrationsvariable                                                                                              |
^LAPT-T2

## Korrespondenztabelle

Jede der zu transformierenden Funktionen ist [Kausal](Kausalität.md) (multiplizert mit dem Einheitsprung $\sigma(t)$)

|        |                  Zeitbereich                   |                                   Bildbereich                                    |
| ------ | :--------------------------------------------: | :------------------------------------------------------------------------------: |
| (i)    |           $\delta(t) \cdot\sigma(t)$           |                                       $1$                                        |
| (ii)   |               $1 \cdot\sigma(t)$               |                                  $\dfrac{1}{s}$                                  |
| (iii)  |               $t \cdot\sigma(t)$               |                                $\dfrac{1}{s^{2}}$                                |
| (iii)  |             $t^{n}\cdot \sigma(t)$             |                              $\dfrac{n!}{s^{n+1}}$                               |
| (iv)   |           $e^{ at } \cdot\sigma(t)$            |                                 $\dfrac{1}{s-a}$                                 |
| (v)    |         $t^n e^{ at } \cdot\sigma(t)$          |                            $\dfrac{n!}{(s-a)^{n+1}}$                             |
| (vi)   |        $\sin (\omega t)\cdot\sigma(t)$         |                          $\dfrac{\omega}{s^2+\omega^2}$                          |
| (vii)  |        $\cos (\omega t)\cdot\sigma(t)$         |                            $\dfrac{s}{s^2+\omega^2}$                             |
| (viii) |    $e^{ at }\sin (\omega t)\cdot\sigma(t)$     |                        $\dfrac{\omega}{(s-a)^2+\omega^2}$                        |
| (ix)   |    $e^{ at }\cos (\omega t)\cdot\sigma(t)$     |                         $\dfrac{s-a}{(s-a)^2+\omega^2}$                          |
| (x)    | $\sin(\omega_{0} t+\varphi_{0})\cdot\sigma(t)$ | $\dfrac{s \sin \varphi_{0} + \omega_{0} \cos \varphi_{0}}{s^{2}+\omega_{0}^{2}}$ |
| (xi)   | $\cos(\omega_{0}t+\varphi_{0})\cdot \sigma(t)$ | $\dfrac{s \cos \varphi_{0} + \omega_{0} \sin \varphi_{0}}{s^{2}+\omega_{0}^{2}}$ |
| (xii)  |           $t\cdot \sin(\omega_{0}t)$           |                $\dfrac{2\omega_{0}s}{(s^{2}+\omega_{0}^{2})^{2}}$                |
| (xiii) |           $t\cdot \cos(\omega_{0}t)$           |                $\dfrac{(s^{2}-\omega_{0}^{2})}{(s^{2}+\omega_{0}^{2})^{2}}$                |


## Beweise zur den Korrespondenzen

### (vi)

Mittels [Partielle Integration](../../Mathematik/Analysis/Partielle%20Integration.md)
$$
\begin{aligned}
\int_0^{\infty} \sin (\omega t) e^{-s t} d t & =-\left.\frac{\cos (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}-\frac{s}{\omega} \int_0^{\infty} \cos (\omega t) e^{-s t} d t \\
& =\frac{1}{\omega}-\frac{s}{\omega}\left(\left.\frac{\sin (\omega t)}{\omega} e^{-s t}\right|_0 ^{\infty}+\frac{s}{\omega} \int_0^{\infty} \sin (\omega t) e^{-s t} d t\right) \\
& =\frac{1}{\omega}-\frac{s^2}{\omega^2} \int_0^{\infty} \sin (\omega t) e^{-s t} d t
\end{aligned}
$$

Also: $\displaystyle\int\limits_0^{\infty} \sin (\omega t) e^{-s t} d t=\dfrac{\omega}{s^2+\omega^2}$