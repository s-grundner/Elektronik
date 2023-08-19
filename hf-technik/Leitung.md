# Leitung

> [!note] elektrisch kurze Leitung
> Eine Leitung ist *elektrisch kurz*, falls die Leitungslänge $l$ deutlich kleiner als die Wellenlänge $\lambda$ bei der Betriebsfrequenz ist bzw. falls die Laufzeit $\uptau$ eines Sinusförmigen Signals längs der Leitung deutlich kleiner ist als die Periodendauer $T$ ist.
> $$\lambda = \frac{c_{0}}{f}\gg l \qquad \text{oder} \qquad \uptau = \frac{\text{Strecke}}{\text{Geschwindigkeit}} = \frac{l}{c_{0}} \ll T = \frac{1}{f}$$
 
> [!note] nicht elektrisch kurz ($l>\frac{\lambda}{10}$) 
> Ist die Leitung ==nicht== als elektrisch ==kurz== anzusehen, so zeigt die Spannung längs der Leitung
keinen konstanten Verlauf mehr:
> - In dem sinusförmigen Verlauf ist die Wellennatur der elektromagnetischen Erscheinungen zu erkennen.
> - In der Praxis geht man davon aus, dass ab einer Leitungslänge von einem Zehntel der Wellenlänge ==($l > \frac{\lambda}{10}$)== der Effekt bedeutsam ist.

> [!note] Kenngrößen
> Zur vollständigen Beschreibung der Leitungseinflüsse muss die Leitung neben ihrer Länge $l$ durch zwei zusätzliche Kenngrößen charakterisiert werden:
> - den Leitungswellenwiderstand $Z_{L}$
> - und die [Ausbreitungskonstante](Telegraphengleichung.md) $\gamma$.
> 
> Im Schaltungsentwurf sind diese mit zu berücksichtigen!

| Kennwert | Formelzeichen | Beschreibung |
| -------- | ------------- | ------------ |
| [Dämpfung](../../hwe/Dämpfung.md) |               |              |
|          |               |              |

## Leitermodell

| Bezeichnung        | Formel           | Einheit                  |
| ------------------ | ---------------- | ------------------------ |
| Widerstandsbelag   | $R'=\frac{R}{l}$ | $[R']=\frac{1\Omega}{m}$ |
| Leitwertsbelag     | $G'=\frac{G}{l}$ | $[G']=\frac{1S}{m}$      |
| Induktivitätsbelag | $L'=\frac{L}{l}$ | $[L']=\frac{1H}{m}$      |
| Kapazitätsbelag    | $C'=\frac{C}{l}$ | $[C']=\frac{1C}{m}$      | 

> [!summary] [Telegraphengleichung](Telegraphengleichung.md)
> $$
> \frac{d^{2}u}{dz^{2}}=u(z)\cdot\gamma^{2}\\
> $$

> [!summary] komplexer Ausbreitungskoeffizient
> $$
> \gamma = \sqrt{(R'+j\omega L')(G'+j\omega C')}
> $$

> [!summary] Lösung der [Telegraphengleichung](Telegraphengleichung.md)
> $$
> u(z)= U_{h}\cdot e^{-\gamma\cdot z}+ U_{r}\cdot e^{\gamma\cdot z}
> $$

## Allgemein
$$\gamma = \alpha+ j\beta$$

$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ \frac{Z_{L}}{Z_{A}}\cdot\tanh(\gamma\cdot l)}{1+ \frac{Z_{A}}{Z_{L}}\cdot\tanh(\gamma\cdot l)}
$$


## Verlustlos
$$
Z_{E}= \frac{U(z)}{I(z)} = Z_{A}\cdot \dfrac{1+ j\frac{Z_{L}}{Z_{A}}\cdot\tan(\gamma\cdot l)}{1+ j\frac{Z_{A}}{Z_{L}}\cdot\tan(\gamma\cdot l)}
$$