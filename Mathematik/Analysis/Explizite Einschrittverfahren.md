# Explizite Einschrittverfahren

> [!info] siehe: [Numerische Lösungsverfahren von DGL](Numerische%20Lösungsverfahren%20von%20DGL.md)

Das sogenannte **expliziten Einschrittverfahren** verallgemeinert die Funktion $f(t_{k-1}, x_{k-1})$ des [Euler-Verfahrens](Euler-Verfahren.md) zu einer **Verfahrensfunktion** $\phi$.

> [!def] **D1 - ESV)**  Definition des expliziten Einschrittverfahrens
> 
> Ein ESV Erzeugt eine Gitterfunktion nach der Vorschrift:
> $$x_{k} = x_{k-1} + h\cdot \underbrace{ \phi(t_{k-1}, x_{k-1}, h) }_{ \text{Verfahrensfunktion} }\tag{ESV}$$
>
> (beim Euler-Verfahren ist $\phi(t, x, h) = f(t,x)$)
> Je Kleiner die Schrittweite $h$, desto genauer ist die Approximation. Jedoch ist der Rechenaufwand größer.


Man möchte wissen, wie gut die Approximation ist und ob Konvergenz gegen die exakte Lösung vorliegt, wenn die Schrittweite $h$ gegen 0 geht.

Der Fehler $x\left(t_k\right)-x_k$ setzt sich kumulativ aus den Einzelfehlern der vorherigen Schritte zusammen und ist daher einer direkten Bestimmung nicht zugänglich.

Daher wird in einem ersten Schritt den Fehler an der Stelle $t_k$ nach nur einem Schritt des ESV mit dem Startwert $x\left(t_{k-1}\right)$ an der Stelle $t_{k-1}$ und zwar den zwischen der exakten Fortschreiterichtung und der durch die Verfahrensfunktion $\phi$ vorgegebenen:

## Lokaler Diskretisierungsfehler

> [!def] **D2 - LDF)** Definition des lokalen Diskretisierungsfehlers
> 
>
>
> Es gilt die **Eindeutige Lösbarkeit** des AWP und $\phi$ sei wie beim **ESV**
> 
**(i)** Der lokale Diskretisierungsfehler des ESV an der Stelle $t_k$ lautet
> 
> $$\tau_k:=\frac{x\left(t_k\right)-x\left(t_{k-1}\right)}{h}-\phi\left(t_{k-1}, x\left(t_{k-1}\right), h\right), \quad k=1, \ldots, N\tag{LDF}$$
> 
> **(ii)** Das ESV heißt konsistent mit dem AWP, wenn
> 
> $$\lim _{h \rightarrow 0} \max _{1 \leq k \leq N}\lVert\tau_k\rVert=0$$
> 
> **(iii)** Die Konsistenzordnung ist $q \in \mathbb{N}$, wenn gilt:
> $$\max _{1 \leq k \leq N}\left\|\tau_k\right\|=O\left(h^q\right)\quad \text{ für } h\to 0$$
> 
> > [!info]- Erläuterung
> > 1. Der lokale Diskretisierungsfehler ist die Differenz zwischen der exakten Lösung und der Näherungslösung des ESV.
> > 2. Die Konsistenz ist gegeben wenn alle Diskretisierungsfehler ([Maximumnorm](../Maximumsnorm.md) des Fehlervektors) gegen 0 konvergieren,
> > wenn die Schrittweite $h$ gegen $0$ [konvergiert](Grenzwert.md).
> > 3. Ist der Größte Fehler ist von der Ordnung $O(h^q)$ Dann heißt $q$ Konvergenzordnung.
> > Die Konsistenzordnung ist ein maß, wie schnell der Diskretisierungsfehler gegen 0 konvergiert,
> > falls das ESV konsistent ist. (Konvergenzgeschwindigkeit)
> 


> [!def] **D3 - ORD)** Definition der Ordnung $O(h^{q})$: 
> $$\exists C>0\, \exists h_{0}\!>0\,\forall h\leq h_{0}: \lVert \tau \rVert_{\infty}\leq C h^q $$
> Es gibt eine Konstante $C>0$ und eine Kleine Zahl $h_{0}>0$, die hinreichend nahe bei Null ist, sodass für alle $h$ die kleiner sind als $h_{0}$, gilt, dass der Maximale Fehler $\lVert \tau \rVert_{\infty}$ auf keinen Fall schneller wächst als $C h^q$.
> 
> > [!info]- Erläuterung
> > Je höher das $q$ ist, desto schneller Konvergiert der Fehler gegen 0.
> > $$\iff \lim_{ h \to 0 }\operatorname{sup} \frac{\lVert \tau \rVert_{\infty}}{h^{q}}<\infty  $$
> > $\lVert \tau \rVert_{\infty}$ fällt nicht schwächer ab als $h^{q}$ für $h \to 0$.
> > $\lVert \cdot \rVert_{\infty}\iff \underset{ 1\leq k\leq N }{ \max }\lVert \cdot \rVert$: Ist die[ Maximumsnorm](../Maximumsnorm.md)


> [!question] Was passiert, wenn beim **LDF** $h\to 0$ geht? 
> 
> Durch die **Äquidistande Diskretisierung** lässt sich der Linke Term des LDF schreiben wie:
> 
> $\underset{ h\to 0 }{ \lim }\dfrac{x(t +h)-x(t)}{h}\overset{ (*) }{ = }x'(t)=f(t,x(t))\quad$ $(*)\dots$ Definition der [Ableitung](Differenzialrechnung.md) und $f$ wie im [AWP](../{MOC}%20DGL.md)
> 
> Für die **Verfahrensfunktion** $\phi$ gilt:
> 
> $\underset{ h \to 0 }{ \lim } \phi(t,x(t),h) = \phi(t,x(t),0)\quad$ wenn $\phi$ stetig ist.
> 
> > [!success] Daraus folgt das für stetige $f$ das **ESV** konsistent ist, genau dann wenn:
> > $$\boxed{ \phi(t,x(t),0)=f(t,x(t)) }$$ 

### Beispiel am Euler-Verfahren

>[!example]
> - [Mittelwertsatz](../Mittelwertsatz.md)

## Globaler Diskretisierungsfehler

Beim LDF wird nur der Fehler vom $k-1$-ten Schritt zum $k$-ten Schritt betrachtet, nicht jedoch der bereits aus vorherigen Schritten entstandener Fehler.

> [!def] **D4 - GDF)** Es gilt die Vorraussetzung zur **Eindeutigen Lösbarkeit** des AWP und $\phi$ sei wie in **ESV**
> 
> **(i)** Der globale Diskretisierungsfehler des ESV an der Stelle $t_k$ lautet
> 
> $$e_k:=x\left(t_k\right)-x_k, \quad k=1, \ldots, N$$
> 
> **(ii)** Das ESV heißt konvergent, wenn
> 
> $$\lim_{h \rightarrow 0} \max _{1 \leq k \leq N}\lVert e_{k} \rVert =0$$
> 
> **(iii)** Die Konvergenzordnung ist $q \in \mathbb{N}$, wenn gilt:
> 
> $$\max _{1 \leq k \leq N}\lVert e_k \rVert =O\left(h^q\right)$$

> [!satz] **S3)** Satz zur **Konsistenz und Konvergenz:** 
> Ist $\phi(t,x,h)$ [Lipschitz-Stetig](Lipschitz-Stetigkeit.md) in $x$:
> $$\exists L>0: \lVert \phi(t,x,h)-\phi(t,y,h)\rVert\leq L\lVert x-y\rVert, \quad x,y\in\mathbb{R}^m, \quad t\in I$$
> 
> konsistent $\implies$ konvergent: **LDF (ii)**$\implies$ **GDF (ii)**
Konsistenzordnung $q$ $\to$ Konvergenzordnung $q$: **LDF (iii)** $\implies$ **GDF (iii)**

## Mehrstufige Einschrittverfahren

Man möchte Verfahren höherer Konvergenzordnung entwickeln. Dazu eignen sich mehrstufige Einschrittverfahren.

> [!question] Unterschied zwischen **Stufe** und **Schritt**
> 
> ```tikz
> \usepackage{pgfplots}
> \usepackage{tikz}
> \usepackage{amsmath}
> \pgfplotsset{compat=1.16}
> 
> \begin{document}
> \begin{tikzpicture}[very thick, font=\Large, scale=2]
>     \draw (0,0) -- (10,0);
>     \draw (0,0) node[below] {$t_{k-1}$} -- (0,0.2);
>     \draw (10,0) node[below] {$t_k$} -- (10,0.2);
>     
>     \foreach \x in {2,4,6,8} { \draw (\x,-0.1) -- (\x,0.1); }
>     \node[below] at (6,-0.1) {$\xi \in[t_{k-1}, t_{k}]$};
>     \draw[decorate,decoration={brace,amplitude=10pt,raise=15pt}] (0,0) -- (10,0)
>         node [midway,above=25pt] {Schritt von $k-1$ nach $k$};
>     \draw[decorate, decoration={brace,amplitude=5pt,raise=10pt, mirror}] (2,0) -- (4,0)
>         node [midway,below=15pt] {Stufe};
> \end{tikzpicture}
> \end{document}
> ```
>

> [!stickies] left
> Selbe idee wie bei der Numerischen Integration:
> $$\int_{t_{k-1}}^{t_{k}}g(t)\mathrm{~d}t=\sum_{i} w_{i}g(\xi_{i})$$
> mit $\xi_{i}\in[t_{k-1},t_{k}]$


$$
\begin{align}
x_{k} &= x_{k-1} + h\cdot \sum_{i=1}^{s} b_{i}k_{i} \\
k_{i} &= f\left(t_{k-1}+hc_{i}, x_{k-1}+h\sum_{j=1}^{i-1}a_{ij}k_{j}\right) \quad \text{ mit } i=1, \ldots, s, \quad  \text{ und } c_{1}=0
\end{align}
$$

>[!example] Das Eulerverfahren ist in diesem Schema enthalten
>mit $s = 1, b_{1}=1, c_{1}=0$

Man Möchte $a_{ij}, b_{i}, c_{1}$ so wählen, dass das Verfahren eine möglichst hohe Konvergenzordnung hat.

Diese Parameter ordnet man in einer Tabelle an, dem sogenannten **Butcher-Tableau**.

### Butcher Tableau

$$
\begin{array}{c|ccccc}
0 & & & & & \\
c_2 & a_{21} & & & & \\
c_3 & a_{31} & a_{32} & & & \\
\vdots & \vdots & \vdots & \ddots & & \\
c_s & a_{s 1} & a_{s 2} & \ldots & a_{s, s-1} & \\
\hline & b_1 & b_2 & \ldots & b_{s-1} & b_s
\end{array}
$$