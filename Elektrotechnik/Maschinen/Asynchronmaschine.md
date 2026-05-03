---
tags:
aliases:
keywords:
subject:
  - VL
  - Elektrische Maschinen und Antriebselektronik
semester: SS25
created: 16th June 2025
professor:
release: false
title: Asynchronmaschine
---

# Asynchron Maschine

Kann als Generator und Motor Betrieben werden:

- Generatorbetrieb: $n > n_{0}$. Rotorfelddrehzahl ist größer als Statorfelddrehzahl
- Motorbetrieb: $n > n_{0}$. Statorfelddrehzahl ist größer als Rotorfelddrehzahl

3-Strängige Ausführung

- höhere Leistung (bis 30MW)
- oft Frequenzumrichter-betrieben ([VFD](VFD.md)) um Drehzahl zu steuern

1-Strängige Ausführung

- kleinere Leistungen (0.1 - 1kW)
- Betrieb am starren Netz möglich
- mit Hilfsphase mit Kondensator

> [!question] Warum Asynchron?
> Das Drehfeld des Rotors muss ungleich (also nicht synchron) mit dem Stator laufen um ein Drehmoment zu erzeugen.
> 
> Die Differenz der Feld-Drehzahl heißt **Schlupf**

## Aufbau

Stator / Ständer mit $n$ Strängen ($n = 1$ oder $n = 3$)

- Besteht aus $n$ Spulen oder einem Vielfachen davon
- Diese werden mit Drehstrom beaufschlagt
- Ruft Drehfeld mit konstanter Drehzahl hervor

Rotor / Läufer: Ausführung mit Kurzschlussläufer (häufig, auch Käfigläufer) 

Rotor / Läufer: Ausführung mit Schleifringläufer (selten)

## Funktionsbild und Kenngrößen

![invert_dark](../../_assets/Excalidraw/Asynchronmaschine%202025-06-28%2014.26.55.excalidraw.svg)

| Kenngröße                   | Symbol, Einheit                          | Beschreibung                                                                                            |
| --------------------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| Schlupf                     | $s$ in %                                 | Der Schlupf ist ein Maß für die Verminderung der Rotorfeld-Drehzahl welche abhängig vom **Lastmoment**. |
| Drehzahl                    | $n$ in $\frac{1}{\mathrm{s}}$            | Drehzahl des Rotors                                                                                     |
| Statorspannung              | $\underline{U}_{S}$ in $\mathrm{V}$      | Spannung am Stator aus dem Stromnetz                                                                    |
| ind. Statorspannung         | $\underline{U}_{hS}$ in $\mathrm{V}$     | in Statorwicklung induzierte Spannung                                                                   |
| Läuferspannung              | $\underline{U}_{L}$ in $\mathrm{V}$      | Spannung an den Läuferwicklungen                                                                        |
| ind. Läuferspannungen       | $\underline{U}_{hL}$ in $\mathrm{V}$     | in den Läuferwicklungen induzierte Spannung                                                             |
| Luftspaltflussdichte        | $\underline{B}_{\delta}$ in $\mathrm{T}$ | Luftspaltflussdichte des Drehfelds                                                                      |
|                             | $\underline{\Psi}_{hS}$ in $\mathrm{Wb}$ | durch Ständerwicklung erzeugter Fluss                                                                   |
|                             | $\Psi_{hL}$ in $\mathrm{Wb}$             | durch Läuferwicklung erzeuger Fluss                                                                     |
| Ständerdurchflutung         | $\underline{\Theta}_{S}$ in $\mathrm{A}$ |                                                                                                         |
| Läuferdurchflutung          | $\underline{\Theta}_{L}$ in $\mathrm{A}$ |                                                                                                         |
| Magnetisierungsdurchflutung | $\underline{\Theta}_{m}$ in $\mathrm{A}$ | Magnetisierungsdurchflutung des Luftspalts                                                              |
| Statorstrom                 | $\underline{I}_{S}$ in $\mathrm{A}$      |                                                                                                         |
| Läuferstrom                 | $\underline{I}_{L}$ in $\mathrm{A}$      |                                                                                                         |
| Motormoment                 | $M$ in $\mathrm{Nm}$                     |                                                                                                         |
| Lastmoment                  | $M_{W}$ in $\mathrm{Nm}$                 | Dem Motor entgegenwirkendes Moment                                                                      |
| Trägheitsmoment             | $J$ in $\mathrm{kg \cdot m ^2}$          | Trägheitsmoment der Welle / angehängter Last                                                            |

## Betriebsverhalten

### Ersatzbild

![invert_dark|500](../../_assets/Excalidraw/Asynchronmaschine%202025-06-28%2016.31.00.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Asynchronmaschine%202025-06-28%2016.31.00.excalidraw.md)%%

### Drehzahl-Drehmoment Kennlinie

### Ortskurve des Ständerstromes (Ossannakreis)

[Heyland-Kreis einer Asynchronmaschine – GeoGebra](https://www.geogebra.org/m/jafmj5fx)

## Drehzahlsteuerung

1. Schleifringe
2. Klemmspannung
3. Statorfrequenzumrichtung (am häufigsten)
4. Polumschaltung
5. Feldschwächung

### Über Schleifringe

Mit Schleifringe: Man entimmt via Widerstände an den Schleifringen energie wodurch sich der Schlupf anpasst.

Skalierung der Kurve in der Schlupfachse

### Über die Klemmspannung

z.B. mit Trafo. Skalierung der Kurve in der Momentachse

### Über Statorfrequenz

> [!important] Gängigste Ansteuerung mittels [Frequenzumrichter](VFD.md)

[NOTES](../../_assets/emae-notes.pdf)

### Über Polumschaltung

## Anlassen von ASM

> [!question] ASM benötigt sehr hohen Anlaufstrom und benötigt daher ein Anlaufverfahren
> 
> Zum Hochfahren der ASM wird diese zuerst in eine Sternschaltung geschaltet: Leistung und Drehmoment wird (um ca $\frac{1}{3}$) reduziert und der Motor kann langsam anfahren. Bei ausreichender Drehzahl wird er zurück in den Betrieb in der Dreieckschaltung geschaltet

## Definitonen der Kenngrößen