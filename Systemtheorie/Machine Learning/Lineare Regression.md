---
tags: ["ML"]
aliases: []
subject: ["dic"]
source: ["Robert Vogl"]
created: 2nd December 2022
---

# Lineare Regression

> [!info] Als Anwendung der Bestimmung von Extremstellen wollen wir die Regressionsgerade bestimmen:
> Wir nehmen also an, dass von einem gegebenen naturwissenschaftlichen Prozess bekannt sei, dass er affin linear modelliert werden kann wie folgt:
> $$ y=f(x)=c x+d $$

Unbekannt sind jedoch die Steigung $c$ und der $y$ - Achsenabschnitt $d$. Üblicherweise reichen zur Bestimmung einer Geraden zwei Punkte. Wir nehmen allerdings an, dass die Messungen fehlerbehaftet sind. Dafür haben wir aber viele Punkte:

Wir nehmen also an, dass wir Daten $\left(x_k, y_k\right), k=1, \ldots, n$, zur Verfügung haben. Die paarweise verschiedenen Punkte $x_k$ heißen Messstellen und die $y_k$ heißen Messwerte. Wir suchen nun $c$ und $d$ so, dass der mittlere quadratische Fehler minimiert wird, also:
$$
\min _{c, d \in \mathbb{R}} f(c, d) \quad \text { mit } \quad f(c, d):=\frac{1}{n} \sum_{k=1}^n\left(c x_k+d-y_k\right)^2
$$

Wir müssen nun offensichtlich den [[../../Mathematik/Analysis/Gradient|Gradienten]] $0$ setzen, um die kritischen Punkte zu finden, also:
$$
\frac{\partial f}{\partial c}=\frac{2}{n} \sum_{k=1}^n\left(c x_k+d-y_k\right) x_k=0=\frac{2}{n} \sum_{k=1}^n\left(c x_k+d-y_k\right)=\frac{\partial f}{\partial d}
$$

Diese beiden Gleichungen haben die eindeutige Lösung
$$
c=\frac{n f-e b}{n a-b^2} \quad \text { und } \quad d=\frac{a e-f b}{n a-b^2},
$$
wobei
$$
a:=\sum_{k=1}^n x_k^2, \quad b:=\sum_{k=1}^n x_k, \quad e:=\sum_{k=1}^n y_k \quad \text { und } \quad f:=\sum_{k=1}^n x_k y_k .
$$

Man beachte, dass wegen der Cauchy-Schwarzschen Ungleichungung (siehe Satz 6.15 (a)) gilt,
dass $n a-b^2 \geq 0$. Eine einfache Überlegung zeigt, dass sogar $n a-b^2>0$ gilt, weil alle $x_k$ verschieden sind. Wir zeigen nun noch, dass in diesem Punkt $(c, d)$ tatsächlich das globale [[Extremwert|Minimum]] angenommen wird. Dazu berechnen wir die Hessematrix:
$$
H_f(c, d)=\frac{2}{n}\left(\begin{array}{ll}
a & b \\
b & n
\end{array}\right)
$$

Diese [[Matrix]] ist wegen Satz 10.25 (a) positiv definit. Damit ist die Funktion $f$ nach Satz 11.55 strikt konvex und daher der Punkt $(c, d)$ aus (11.3) nach Satz 11.56 die eindeutige Stelle des globalen Minimums.


$X\dots 100\times3$

$\Theta\dots 3\times1$

$$
\begin{align*}
h_{\theta}(x) &= \Theta' \cdot X_{(n)}\\
&= \theta_{0}+\theta_{1}\cdot x_{1}+\theta_{2}\cdot x_{2}+\theta_{3}\cdot x_{3}+\theta_{4}\cdot x_{4}\\
J &= \frac{1}{2m}\cdot \sum\limits_{n=1}^{m}(\Theta'\cdot X_{(n)}-Y_{(n)})\\
J &= \frac{1}{2m}\sum^{m}_{n=1}(h_{\theta}(x^{(n)})-y^{n})
\end{align*}
$$

Zum Normalisieren wird quadriert

$$J = \frac{1}{2m}\sum^{m}_{n=1}(h_{\theta}(x^{(n)})-y^{n})^{2}$$

 $\Theta' \cdot X_{(n)} =$ $$\begin{pmatrix}1 & 2 & 3\end{pmatrix}$$ 


$$\left.\begin{pmatrix}1 & 94 & 72\\1 & 93 & 87\\1 & 91 & 43\\1 & 100 & 12\end{pmatrix}\right\downarrow_{m}$$ | $$\begin{pmatrix}1\cdot1 &+ 94\cdot2 &+ 72\cdot3 \\1\cdot1 &+ 93\cdot2 &+ 87\cdot3 \\1\cdot1 &+ 91\cdot2 &+ 43\cdot3 \\1\cdot1 &+ 100\cdot2 &+ 12\cdot3 \\\end{pmatrix}$$
