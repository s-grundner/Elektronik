# Explizite Einschrittverfahren

> [!question] [Diskretisierungsverfahren](Diskretisierungsverfahren.md)
 > Mit Expliziten Einschrittverfahren werden Anfsngswertprobleme ([AWP](GDGL.md#^AWP)) gelöst.

Das sogenannte **expliziten Einschrittverfahren** verallgemeinert die Funktion $f(t_{k-1}, x_{k-1})$ des [Euler-Verfahrens](Euler-Verfahren.md) zu einer **Verfahrensfunktion** $\phi$. Die Verfahrensfunktion schreibt vor, wie jeder Schritt gewichtet wird.


> [!def] **D1 - ESV)** Definition eines expliziten Einschrittverfahrens ^ESV
> 
> Ein ESV Erzeugt eine Gitterfunktion nach der Vorschrift:
> $$x_{k} = x_{k-1} + h\cdot \underbrace{ \phi(t_{k-1}, x_{k-1}, h) }_{ \text{Verfahrensfunktion} }\tag{ESV}$$
>
> (beim Euler-Verfahren ist $\phi(t, x, h) = f(t,x)$)
> Je Kleiner die Schrittweite $h$, desto genauer ist die Approximation. Jedoch ist der Rechenaufwand größer.


Man möchte wissen, wie gut die Approximation ist und ob *Konvergenz gegen die exakte Lösung* vorliegt, wenn die Schrittweite $h$ gegen 0 geht.

Der Fehler $x\left(t_k\right)-x_k$ setzt sich kumulativ aus den Einzelfehlern der vorherigen Schritte zusammen und ist daher einer direkten Bestimmung nicht zugänglich. Daher wird in einem ersten Schritt den Fehler an der Stelle $t_k$ nach nur einem Schritt des ESV mit dem Startwert $x\left(t_{k-1}\right)$ an der Stelle $t_{k-1}$ und zwar den zwischen der exakten Fortschreiterichtung und der durch die Verfahrensfunktion $\phi$ vorgegebenen:

## Lokaler Diskretisierungsfehler

> [!def] **D2 - LDF)** Definition des lokalen Diskretisierungsfehlers ^LDF
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
> $$\lim _{h \rightarrow 0} \max _{1 \leq k \leq N}\lVert\tau_k\rVert=0\tag{Konsistenz}$$
> 
> **(iii)** Die Konsistenzordnung ist $q \in \mathbb{N}$, wenn gilt:
> $$\max _{1 \leq k \leq N}\left\|\tau_k\right\|=O\left(h^q\right)\quad \text{ für } h\to 0\tag{Konsistenzordnung}$$
> 
> > [!info]- Erläuterung
> > 1. Der lokale Diskretisierungsfehler ist die Differenz zwischen der exakten Lösung und der Näherungslösung des ESV.
> > 2. Die Konsistenz ist gegeben wenn der größte Diskretisierungsfehler ([Maximumnorm](../Algebra/Maximumsnorm.md) des Fehlervektors) gegen 0 konvergieren, wenn die Schrittweite $h$ gegen $0$ [konvergiert](Grenzwert.md). Das heißt dass die das Verfahren gegen die Exakte Lösung konvergiert.
> > 3. Ist der Größte Fehler ist von der Ordnung $O(h^q)$ Dann heißt $q$ Konvergenzordnung.
> > Die Konsistenzordnung ist ein maß, wie schnell der Diskretisierungsfehler gegen 0 konvergiert,
> > falls das ESV konsistent ist. (Konvergenzgeschwindigkeit)
> 

---

> [!question] Was bedeutet Ordnung $O(h^{q})$? 
> $$\exists C>0\, \exists h_{0}\!>0\,\forall h\leq h_{0}: \lVert \tau \rVert_{\infty}\leq C h^q $$
> Es gibt eine Konstante $C>0$ und eine Kleine Zahl $h_{0}>0$, die hinreichend nahe bei Null ist, sodass für alle $h$ die kleiner sind als $h_{0}$, gilt, dass der Maximale Fehler $\lVert \tau \rVert_{\infty}$ auf keinen Fall schneller wächst als $C h^q$.
> 
> > [!info]- Erläuterung
> > Je höher das $q$ ist, desto schneller Konvergiert der Fehler gegen 0.
> > $$\iff \lim_{ h \to 0 }\operatorname{sup} \frac{\lVert \tau \rVert_{\infty}}{h^{q}}<\infty  $$
> > $\lVert \tau \rVert_{\infty}$ fällt nicht schwächer ab als $h^{q}$ für $h \to 0$.
> > $\lVert \cdot \rVert_{\infty}\iff \underset{ 1\leq k\leq N }{ \max }\lVert \cdot \rVert$: Ist die[Maximumsnorm](../Algebra/Maximumsnorm.md)


> [!question] Was passiert, wenn beim **LDF** $h\to 0$ geht? 
> 
> Durch die **Äquidistande Diskretisierung** lässt sich der Linke Term des LDF schreiben wie:
> 
> $\underset{ h\to 0 }{ \lim }\dfrac{x(t +h)-x(t)}{h}\overset{ (*) }{ = }x'(t)=f(t,x(t))\quad$ $(*)\dots$ Definition der [Ableitung](Differenzialrechnung.md#^DIFQ) und $f$ wie im [AWP](GDGL.md)
> 
> Für die **Verfahrensfunktion** $\phi$ gilt:
> 
> $\underset{ h \to 0 }{ \lim } \phi(t,x(t),h) = \phi(t,x(t),0)\quad$ wenn $\phi$ stetig ist.
> 
> > [!success] Daraus folgt das für stetige $f$ das **ESV** konsistent ist, genau dann wenn:
> > $$\boxed{ \phi(t,x(t),0)=f(t,x(t)) }$$ 

## Globaler Diskretisierungsfehler

Beim LDF wird nur der Fehler vom $k-1$-ten Schritt zum $k$-ten Schritt betrachtet, nicht jedoch der bereits aus vorherigen Schritten entstandener Fehler.

> [!def] **D4 - GDF)** Es gilt die Vorraussetzung zur **Eindeutigen Lösbarkeit** des AWP und $\phi$ sei wie in **ESV** ^GDF
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
> konsistent $\implies$ konvergent: [LDF (ii)](#^LDF) $\implies$ [GDF (ii)](#^GDF)
Konsistenzordnung $q$ $\to$ Konvergenzordnung $q$: [LDF (iii)](#^LDF) $\implies$ [GDF (iii)](#^GDF) 

> [!info] [Mehrstufige Einschrittverfahren](Mehrstufige%20Einschrittverfahren.md)