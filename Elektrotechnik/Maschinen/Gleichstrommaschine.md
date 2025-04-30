---
tags: 
aliases:
  - DC-Motor
  - DC-Maschine
  - DC-Generator
  - Gleichstrommotor
  - Gleichstromgenerator
  - Kommutator
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 3. März 2025
professor: 
draft: false
title: Gleichstrommaschine
banner: "/Elektrotechnik/Maschinen/assets/DCM.png"
banner_y: 0.756
---
 

# Gleichstrommaschine

> [!info] **Merkmale:**
> - Spulenwicklung im Rotor
> - Bürste

## Komponenten

### Stator / Erreger

Der **Stator / Erreger** wird mit einem Konstanten *Erregerfluss* durchströmt, welcher durch EM bzw PM erzeugt wird.

Arten der Erregung:
- Nebenschlusserregung
- Reihenschluss erregung
- Fremderregung

### Rotor / Anker 

Im **Rotor / Anker** befinden sich beliebg Viele wicklungen die im Kreis Angeordnet sind. Die **Kontakte** der wicklungen sind am Schaft der Maschine freigestellt und kontaktieren die Bürsten.

### Kommutator

Durch den **Kommutator / Stromwender** wird die Stromrichtung immer so *umgekehrt*, dass sich die momentan bestromten Rotorwicklungen geschickt zum Nächstgelegenen Pol *anzieht* bzw *abstößt*.  Dies wird allein durch geschickte verdrahtung der Rotorwicklungskontakte erzielt

## Funktionsweise

> [!hint] Der **Fluss durch die Rotorwicklung** (normal zur Wicklungsebene) möchte immer in die *selbe Richtung* wie der **Erregerfluss** zeigen.
> Es werden demnach Kräfte exorziert, die das Drehmoment erzeugen.

**Zustand 1)** $I_{A}: A\to B$

Die Kontakte des Kommutators (A-a, B-b) weisen eine interne Verbindung auf.

![invert_dark](../assets/DCfunk0.jpg)

**Zustand 2)** $I_{A}: b\to a$

Der Rotor hat sich um $90°$ gedreht

![invert_dark](../assets/DCfunk90.jpg)

## Berechnungsgrundlagen

Berechnungsgrundlagen **fremderregter** GSM.

### Kenngrößen

| Kenngröße           | Ausdruck          | Einheit  | Anmerkung                            |
| ------------------- | ----------------- | -------- | ------------------------------------ |
| Drehmoment          | $M$               | $N$      |                                      |
| Drehzahl            | $\omega = 2\pi n$ | $s^{-1}$ | Für $n$ Umdrehungen pro Sekunde      |
| Induzierte Spannung | $U_{q}$           | $V$      |                                      |
| Ankerpannung        | $U_{A}$           | $V$      | Mit Verlust über die Ankerimpedanzen |
| Ankerwiderstand     | $R_{A}$           | $\Omega$ |                                      |
| Ankerinduktivität   | $L_{A}$           | $H$      |                                      |
| Erregerwiderstand   | $R_{E}$           | $\Omega$ |                                      |
| Erregerinduktivität | $L_{E}$           | $H$      |                                      |
| Erregerfluss        | $\Phi_{E}$        | Vs       |                                      |
| Maschinenkonstante  | $c=2\pi\bar{c}$   | $1$      |                                      |

###  Ersatzschaltbild


![1000](assets/GSM-ESB.md)

### Gleichungen

Die Gleichstrommaschine ist ein reziprokes elektromechanisches System und kann daher als Gleichstrommotor bzw. -generator behandelt werden. Wegen dieser Eigenschaft ist die **mechanischen Leistung** (mit allen Verlusten einbezogen) gleich der inneren **elektrische Leistung**.

$$ P_{m} = \omega M=U_{q}I_{A} \implies M = \frac{U_{q}}{\omega} I_{A}$$

|       $\omega$        | $M$        |       $U_{q}$       | $I_{A}$    |
| :-------------------: | :--------: | :-----------------: | :--------: |
| Winkelgeschwindigkeit | Drehmoment | Induzierte Spannung | Ankerstrom |

Zur Beschreibung des Stationäres Betriebsverhalten der DC-Maschine gibt es Gleichungen:

> [!def] **D1 - ASPG)** Ankerspannungsgleichung:
> 
> $$
> \begin{align}
> U_\mathrm{A} &= R_\mathrm{A}I_\mathrm{A}+U_{q}(\omega) \\
> U_{q} &= \frac{\mathrm{d}\Psi_{\mathrm{A}}}{\mathrm{d}t} = c\Phi_{\mathrm{E}} n =\bar{c}\Phi_{\mathrm{E}} \omega \\
> M &= \frac{U_{\mathrm{A}}}{\omega}I_{\mathrm{A}} = \frac{c\Phi_\mathrm{E}}{2\pi} I_\mathrm{A} = \bar{c}\Phi_\mathrm{E} I_{\mathrm{A}}
> \end{align} 
> $$

## Nutrastmomente

> [!hint] **Nutrastmomente:** Sind die Einrastungen die man spürt, wenn man einen unbestromten DC-Motor Dreht.
> In DC-Motoren sind im Rotor Nuten wo die Spuleneingelassen sind. An dieser Nut gibt es einen größeren Lufspalt, wobei der Fluss auch an der Seitenfläche der Nut eintritt, welches ein Positives / Negatives Moment verursacht. Dadurch entstehen Ripple im Drehmoment. 

In Summe sind diese Momente $0$: $\int M_{c}(\varphi) \mathrm{~d}\varphi_{r}=0$

![invert_dark](assets/Nutrasten.png)