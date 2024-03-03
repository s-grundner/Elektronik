---
tags: 
aliases:
  - Drude-Theorie
keywords: 
subject:
  - VL
  - Einf. ET
semester:
  - B1
  - WS23
created: 2. März 2024
professor:
  - Bernhard Jakoby
---
 

# Drude-Modell - Modell für den elektrischen [Strom](../Elektrotechnik/elektrischer%20Strom.md)

> [!info] Das [Drude-Modell](Drude-Modell.md) beschäftigt sich mit dem Ladungstransport in einem Leiter ([elektrischer Strom](elektrischer%20Strom.md)) der durch ein elektrisches Feld hervorgerufen wird.

Die Mittlere Driftgeschwindigkeit $\langle v\rangle$ der Elektronen im [Metall](../Chemie/Metallbindung.md) ist ohne einem [elektrischen Feld](Elektrisches%20Feld.md) im Mittel Null.
Obwohl sich die Elektronen individuell betrachtet durch die [thermische](../Physik/Temperatur%20und%20Teilchenmodell.md) Wimmelbewegung **sehr** schnell bewegen. Die Streuung der Elektronen ist *isotrop*.

![](../Elektrotechnik/assets/V_Therm.png)


Da in einem konstanten [Elektrischen Feld](../Elektrotechnik/Elektrisches%20Feld.md) auf ein Elektron die [elektrische Kraft](../Elektrotechnik/Elektrische%20Kraft.md) $-e\cdot \vec{E}$ wirkt und *massebehaftete* Körper (also auch Elektronen) unter Einfluss einer [Kraft](../Physik/Newtonsche%20Axiome.md) beschleunigen, müssten alle Elektronen unter Einfluss dieses E-Feldes in negative Richtung beschleunigen.

![V_ThermEFeld](../Elektrotechnik/assets/V_ThermEFeld.png)


> [!warning] Unter Annahme eines konstanten Feldes 𝐄 würde ein Elektron mit der [Kraft](../Physik/Newtonsche%20Axiome.md) −𝑒𝐄 beschleunigt.
> Tatsächlich stellt sich aber eine mittlere Driftgeschwindigkeit 𝐯 ein, die in erster Näherung proportional zu 𝐄 ist.
> Der Grund liegt in der Wechselwirkung (Stößen) mit dem Gitter.

## 1 Beweglichkeit - Zusammenhang mit mittlerer Flugzeit

- Thermische Bewegung eines Elektrons in x-Richtung (ohne elektrisches Feld). Mit jedem Stoß Streuung in zufällige Richtung, Mittelwert der Geschwindigkeit $\langle v_{e,x} \rangle = 0$

Die Gesamtheit der Stöße der Elektronen wird als *Streuung* bezeichnet

![](assets/DrudeStosszeiten.png)

Die thermische Wimmelbewegung wird mit der Beschleunigung durch das E-Feld überlagert 
Da die thermische Wimmelbewegung der Elektronen *sehr viel größer* ist als die Geschwindigkeitszunahme durch das elektrische Feld, kann man die Thermische Bewegung immer noch als *isotrop* Betrachten.

$$
\left\langle\mathbf{v}_e\right\rangle=-\frac{e \tau}{m_e} \mathbf{E}=-\mu_e \mathbf{E}
$$

![](assets/MittlGeschwE.png)

> [!info] Isotrop
> Liefert keinen Betrag zum Mittelwert und ist im Mittel $0$.