---
tags: []
aliases:
  - S-Parameter
subject:
  - ksn
created: 28th September 2022
---

# Streuparameter

**Streuparameter**, abgekürzt **S-Parameter**, dienen zur Beschreibung des Verhaltens linearer elektrischer Netzwerke im **Kleinsignalverhalten** mittels Wellengrößen.

- Beschreiben z.B. [Filter](../Hardwareentwicklung/Filter-Verstärker/Filter.md), [Antenne](Antenne.md), [Mischer](Mischer.md)
- Wellenparameter = Teilspannungen (siehe [S-Parameter mit Strom und Spannungswellen](#S-Parameter%20mit%20Strom%20und%20Spannungswellen))
- Widerstandsparameter bei Serienschaltung
- Leitwert bei Parallelschaltungen


> [!def] **D - Streuparameter)** Allgemein werden die S-Parameter für ein elektrisches Netzwerk mit $n$ Toren als eine $n\times n$-[Matrix](../Mathematik/Algebra/Matrix.md) $\mathbf{S} \in \mathbb{C}^{n\times n}$ ausgedrückt:
> 
> $$
> \mathbf{S} = \begin{pmatrix}
>     s_{11} & \dots &s_{1n} \\
>     \vdots &\ddots &\vdots \\
>     s_{n1} & \dots &s_{nn}
> \end{pmatrix} = (s_{ij})^{n,n}_{i=1,j=1}
> $$
> - Wenn $i=j$, ist $s_{ij}=\Gamma_{i}$ der Reflexionsfaktor am Tor $i$.
> - Wenn $i\neq j$ ist $s_{ij}=T_{ji}$ der Transmissionsfaktor von Tor $j$ nach Tor $i$.
> 
> Die Einheit der S-Parameter ist $1$ (Einheitenlos).


Jedes Elektrische Netzwerk kann mit einer beliebigen Anzahl an *Eintoren* oder einfach Toren dargestellt werden.

![Eintor](../_assets/Eintor.png)
> Abbildung 1: Eintor

Mit den Vektoren $\mathbf{a},\mathbf{b} \in \mathbb{C}^n$, welche eine *Leistungswellengröße* repräsentieren, lassen sich die in die Tore *eingespeiste* Leisung in $\mathbf{a}$, mit $\mathbf{S}$ auf die aus den Toren *austretenden* Leistung in $\mathbf{b}$ Abbilden.

$$
\mathbf{b} = \mathbf{S} \mathbf{a}
$$

oder in der Elementschreibweise:

$$
\begin{pmatrix}
    b_1 \\ \vdots \\ b_n
\end{pmatrix} =
\begin{pmatrix}
    s_{11} & \dots &s_{1n} \\
    \vdots &\ddots &\vdots \\
    s_{n1} & \dots &s_{nn}
\end{pmatrix}
\begin{pmatrix}
    a_1 \\ \vdots \\ a_n
\end{pmatrix}\tag{1}
$$
^1

> [!hint] Die Einheit von $a$ und $b$ ist $\sqrt{W}$. Die Größen repräsentieren *Leistungwellengrößen*

## Messvorschrift

Zur Ermittlung der S-Parameter können an jedem Tor $i$ die Leistungsgrößen $a_{i}$ und $b_{i}$ gemessen werden. Betrachtet man das lineare Gleichungssystem [(1)](#^1), ist zu erkennen, dass die S-parameter durch gezieltes 0 setzen von elementen in $\mathbf{a}$ berechnet werden können. Es gilt

$$
s_{ij} = \frac{b_{i}}{a_{j}} \quad \text{mit } a_{p} = 0, \forall p \neq j
$$

Das Nullsetzen von $a_{p}$ bedeuted, dass an diesem Tor keine leistung eingespeist wird. Das heißt auch, dass an diesem Tor keine Leistung wieder zurück ins Netzwerk **reflektiert** wird.

Um die Messvorschrift zu erfüllen, müssen bei der Ermittlung eines S-Parameters an einem Tor, alle anderen Tore mit der charakteristischen Impedanz $Z_{0}$ des Netzwerks angepasst / abgeschlossen werden, damit die gesamte Leistung umgesetzt wird.

> In der Praxis misst man die S-Parameter eines Netzwerks mit einem *Vektoriellen Netzwerkanalysator (VNA)*

## Bedeutung und Zusammenhänge der Größen

Die Leistungsgrößen lassen sich mit dem Strom und der Spannung an einem Tor $\nu$ in Bezug setzen. (Annahme $Z_{0} \in \mathbb{R}$)

![Eintor](../_assets/Eintor.png)

$$
a_\nu = \dfrac{1}{2} \left( \dfrac{U_\nu}{\sqrt{Z_0}} + I_\nu\sqrt{Z_0} \right) \qquad b_\nu = \dfrac{1}{2} \left( \dfrac{U_\nu}{\sqrt{Z_0}} - I_\nu\sqrt{Z_0} \right)
$$
  
Durch Umkehrung der Beziehungen erhält man:

$$
U_\nu = \sqrt{Z_0} \cdot (a_\nu + b_\nu) \qquad I_\nu = \dfrac{1}{\sqrt{Z_0}} \cdot (a_\nu - b_\nu)
$$

Die [elektrische Spannung](../Elektrotechnik/elektrische%20Spannung.md) $U_\nu$ und der [Strom](../Elektrotechnik/elektrischer%20Strom.md) $I_{\nu}$ am Tor $\nu$ stehen über die nach außen wirkende [Impedanz](../Elektrotechnik/Impedanz.md) $Z_\nu$ miteinander in Beziehung:  

$$
Z_\nu = \dfrac{U_\nu}{I_\nu}
$$

womit sich mit der Bezugsimpedanz $Z_{0}$ des Messsystems der [Reflexionsfaktor](Reflexionsfaktor.md) $\Gamma_{\nu}$ beschreiben lässt als:  

$$
\Gamma_\nu = \dfrac{b_\nu}{a_\nu} = \dfrac{Z_\nu - Z_0}{Z_\nu + Z_0}, \qquad b_\nu = \Gamma_\nu \cdot a_\nu
$$

Im einfachsten Fall eines **Eintors** ist der [Reflexionsfaktor](Reflexionsfaktor.md) $\Gamma_{\nu}$ gleich dem **einzigen S-Parameter $s_{11}$**.

### S-Parameter mit Strom und Spannungswellen

Bei gegebener lösung der Wellengleichung einer Spannugswelle auf einer [Transmission Line](Transmission%20Line.md)

$$
U_{\nu}(z) = U_{\nu}^+ e^{ -j\gamma z } + U_{\nu}^- e^{ j\gamma z }
$$

können anstelle der Terme $a_{\nu}$ und $b_{\nu}$ auch die Amplituden der Hin ($U_{\nu}^+$ statt $a_{\nu}$) und Rücklaufenden ($U_{\nu}^-$ statt $b_{\nu}$) Wellen geschreiben werden, da sich diese nur um den Faktor $\sqrt{ Z_{0} }$ unterscheiden und gekürzt werden kann.

$$
\begin{pmatrix}
    U_{1}^- \\ \vdots \\ U_n^-
\end{pmatrix} =
\begin{pmatrix}
    s_{11} & \dots &s_{1n} \\
    \vdots &\ddots &\vdots \\
    s_{n1} & \dots &s_{nn}
\end{pmatrix}
\begin{pmatrix}
    U_{1}^+ \\ \vdots \\ U_n^+
\end{pmatrix}
$$


## Zweitor

Die Anzahl der Streuparameter ergibt sich aus dem Quadrat der Tore: [Vierpol](../Hardwareentwicklung/Vierpol.md) -> 4 S-Parameter.

![invert_light](../_assets/MGL-Zweitor.png)

- $a_{1}$ ist die am *Tor 1* einlaufende Welle
- $a_{2}$ ist dei am *Tor 2* einlaufende Welle
- $b_{1}$ ist die vom Eingang (*Tor 1*) auslaufende Welle
- $b_{2}$ ist die vom Ausgang (*Tor 2*) auslaufende Welle
  
$$
\begin{pmatrix}
     b_1\\ b_2
\end{pmatrix}
=
\begin{pmatrix}
    s_{11} & s_{12}\\
    s_{21} & s_{22}
\end{pmatrix}
\begin{pmatrix}
     a_1\\ a_2
\end{pmatrix}
$$

### Messvorschrift



|          | Bezeichnung                   | Messvorschrift                                        | Beschreibung                                                 |
| -------- | ----------------------------- | ----------------------------------------------------- | ------------------------------------------------------------ |
| $s_{11}$ | Eingangsreflexionsfaktor      | $s_{11}=\left. \dfrac{b_{1}}{a_{1}}\right._{a_{2}=0}$ | stellt die Reflexion am Eingang ohne Anregung an Tor 2 dar   |
| $s_{22}$ | Ausgangsreflexionsfaktor      | $s_{22}=\left. \dfrac{b_{2}}{a_{2}}\right._{a_{1}=0}$ | stellt die Reflexion am Tor 2 ohne Anregung an Tor 1 dar     |
| $s_{21}$ | Vorwärts-Transmissionsfaktor  | $s_{21}=\left. \dfrac{b_{2}}{a_{1}}\right._{a_{2}=0}$ | stellt die Vorwärts-Transmission ohne Anregung an Tor 2 dar  |
| $s_{12}$ | Rückwärts-Transmissionsfaktor | $s_{12}=\left. \dfrac{b_{1}}{a_{2}}\right._{a_{1}=0}$ | stellt die Rückwärts-Transmission ohne Anregung an Tor 1 dar |

Die selben Messvorschriften gelten für Spannungs und Stromwellen

## Verlustfreie Netzwerke

In verlustfreien Netzwerken geht keine Leistung verloren:

$$
\lVert \mathbf{a} \rVert_{1} = \lVert \mathbf{b} \rVert_{1}
$$

- $\lVert \cdot \rVert_{1}$ ... [Betragssummennorm](../Mathematik/Algebra/Betragssummennorm.md)

Die Summe aller eintreffenden Leistungswellen ist gleich aller autretenden (reflektierten) Leistungswellen. Daraus folgt, dass die S-Parameter Matrix [unitär](../Mathematik/Algebra/Unitäre%20Matrix.md) ist:

$$
\mathbf{S}^H\mathbf{S} = \mathbb{1}_{n}
$$

## Verlustbehaftete Netzwerke


In verlustbehafteten Netzwerken wird nicht nur an Lasten der Tore Leistung umgesetzt sondern auch im Netzwerk selbst.

$$
\lVert \mathbf{a} \rVert_{1} \neq \lVert \mathbf{b} \rVert_{1} \implies \lVert \mathbf{a} \rVert_{1} > \lVert \mathbf{b} \rVert_{1}
$$

## Signalflussgraphen



![invert_light|300](../_assets/Zweitor.png)


## Referenzen

- [Streuparameter](https://de.wikipedia.org/wiki/Streuparameter)
- [Scattering parameters](https://en.wikipedia.org/wiki/Scattering_parameters)