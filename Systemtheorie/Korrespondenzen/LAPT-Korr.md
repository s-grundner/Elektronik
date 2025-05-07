	
# Korrespondenzen und Rechensätze

## Sätze: Einfache Schreibweise mit $F(s)$

Für eine schnelle Referenz ist hier der Zeit Vs Bildbereich gelistet.

Es gilt der zusammenhang $F(s) = \mathcal{L}\left\{ f(t) \right\}(s)$

| Zeitbereich                         | Bildbereich                                                                          |
| ----------------------------------- | ------------------------------------------------------------------------------------ |
| $$ c_{1}f_{1}(t) + c_{2}f_{2}(t) $$ | $$ c_{1}F_{1}(s) + c_{2}F_{2}(s) $$                                                  |
| $$f(at)$$                           | $$\frac{1}{a} F\left( \frac{s}{a} \right)$$                                          |
| $$f(t-t_{0})$$                      | $$e^{ -st_{0} }\left( F(s)  + \int _{-t_{0}}^0 f(t)e^{ -st } \mathrm{~d}t \right) $$ |
|                                     |                                                                                      |

## Sätze: Explizite Schreibweise mit $\mathcal{L}$

Der Vorteil der komplexeren schreibweise ist, dass man die operationen auf das argument $s$ und $t$ besser verfolgen kann.

| Nr     | Satz                        | Zeitbereich zu $s$-Domäne: $f(t) \circ\mkern-7px-\mkern-7px\bullet \mathcal{L}\left\{ f(t) \right\}(s)$                                                                            | Anmerkungen                                                                                                                                                            |
| ------ | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| (i)    | **Linearität**              | $$\begin{align}&\mathcal{L}\left\{c_1 f_1(t) + c_2 f_2(t)\right\}(s) \\= &c_1 \mathcal{L}\left\{ f_{1}(t) \right\}(s) + c_2 \mathcal{L} \left\{ f_{2}(t) \right\}(s) \end{align}$$ | $c_1, c_2 \in \mathbb{R}$                                                                                                                                              |
| (ii)   | **[Faltung](Faltung.md)**   | $$\mathcal{L}\left\{(f_1 * f_2)(t)\right\}(s) = \mathcal{L} \left\{ f_{1}(t) \right\}(s) \cdot \mathcal{L}\left\{ f_{2}(t) \right\}(s)$$                                           | Die Faltung ist definiert durch <br>$\left(f_1 * f_2\right)(t) := \int_0^t f_1(t-\tau) f_2(\tau) d\tau$                                                                |
| (iii)  | **Integration**             | $$\mathcal{L}\left\{\int_0^t f(\tau) d\tau\right\}(s) = \frac{1}{s} \mathcal{L}\left\{ f(t) \right\} (s)$$                                                                         |                                                                                                                                                                        |
| (iv)   | **Differentiation**         | $$\mathcal{L}\left\{f^{(n)}\right\}(s) = s^n \mathcal{L} \left\{ f(t) \right\} (s) - \sum_{k=0}^{n-1} s^{n-1-k} f^{(k)}(0)$$                                                       | Gilt für $f(t) \in C^n, t \in[0, \infty)$. <br>Dies ist eine wesentliche Grundlage für<br>die Anwendbarkeit zur Lösung von [AWP](../../Mathematik/Analysis/GDGL.md)    |
| (v)    | **Verschiebung**            | $$\mathcal{L}\{f(t-a)\}(s) = e^{-a s} \mathcal{L} \left\{ f(t) \right\} (s)$$                                                                                                      | $a > 0$<br>$f$ wird für $t < 0$ durch $0$ fortgesetzt.<br>Formal mit dem [Einheitssprung](Einheitssprungfunktion.md) $\sigma(t)$.                                      |
| (vi)   | **Ähnlichkeit**             | $$\mathcal{L}\{f(at)\}(s) = \frac{1}{a} \mathcal{L} \left\{ f(t) \right\} \!\left(\frac{s}{a}\right)$$                                                                             | $a > 0$<br>$s > a$<br>Auch Streckung genannt                                                                                                                           |
| (vii)  | **Dämpfung**                | $$\mathcal{L}\left\{e^{-a t} f(t)\right\}(s) = \mathcal{L} \left\{ f(t) \right\} (s+a)$$                                                                                           | $a \in \mathbb{R}$<br>$s > \alpha - a$                                                                                                                                 |
| (viii) | **Multiplikation**          | $$\mathcal{L}\left\{t^n f(t)\right\}(s) = (-1)^n (\mathcal{L} \left\{ f(t) \right\} )^{(n)}(s)$$                                                                                   | Multiplikation mit einem Polynom<br>ist der Gegensatz zu (iv)                                                                                                          |
| (ix)   | **Division**                | $$\mathcal{L}\left\{\frac{f(t)}{t}\right\}(s) = \int_s^{\infty} \mathcal{L} \left\{ f(t)\right\}  (\zeta) ~d\zeta$$                                                                | $\zeta$ hat hier nur eine Bedeutung<br>als andere Integrationsvariable                                                                                                 |
| (x-i)  | **erster Anfangswertsatz**  | $$\lim_{ t \to 0^+ } f(t) = \lim_{ s \to \infty } s~\mathcal{L}\left\{ f(t) \right\} (s)$$                                                                                         | Es sei vorrausgesetzt, dass der Grenzwert im Zeitbereich existiert                                                                                                     |
| (x-ii) | **zweiter Anfangswertsatz** | $$\lim_{ t \to 0^+ } \dot{f}(t) = \lim_{ s \to \infty } (s^{2}\mathcal{L}\left\{ f(t) \right\} (s)-sf(0^+))$$                                                                      | wie in (x-i)                                                                                                                                                           |
| (xi)   | **Endwertsatz**             | $$\lim_{ t \to \infty } f(t) = \lim_{ s \to 0 } s~\mathcal{L}\left\{ f(t) \right\} (s)$$                                                                                           | Endwert satz gilt nur dann, wenn alle Pole Links stehen, außer der Pol bei 0.<br>Bevor der Endwertsatz angewandt wird muss die Funktion auf stabilität geprüft werden. |
^LAPT-T1