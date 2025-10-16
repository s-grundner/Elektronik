---
tags:
  - Baugruppe/Oszillator
aliases: 
  - Phasenreglerschleife
  - PLL
keywords: 
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 27th February 2025
professor:
release: false
title: Phase Locked Loop
---

# Phase Locked Loop (PLL)

Ein PLL ist ein System, welches die Phasenlage und damit die Frequenz eines veränderbaren Oszillators so beeinflusst, dass die Phasenabweichung zu einem zu einem äußeren System möglichst konstant ist. 

```tikz
\usetikzlibrary{positioning,arrows.meta,shapes,decorations.pathreplacing}

\begin{document}
\begin{tikzpicture}[
    block/.style={rectangle, draw, minimum width=2.2cm, minimum height=1cm, align=center, rounded corners=2pt},
    smallblock/.style={rectangle, draw, minimum width=1.2cm, minimum height=0.8cm, align=center, rounded corners=2pt},
    arrow/.style={-{Stealth[length=3mm]}, thick},
    node distance=1.2cm
]

% Nodes
\node (ref) at (0,0) {Referenz\\$f_{ref}$};
\node[block,right=of ref] (pd) {Phasendetektor\\(PD)};
\node[block,right=of pd,xshift=1cm] (lf) {Loop-Filter\\(z.B. PI / LPF)};
\node[block,right=of lf,xshift=1cm] (vco) {VCO\\(spannungsgesteuert)};
\node[right=of vco,xshift=2cm] (out) {Ausgang\\$f_{out}$};

% Feedback divider
\node[smallblock,below=of vco,yshift=0.6cm] (div) {$N$-Teiler};

% Connections
\draw[arrow] (ref) -- (pd);
\draw[arrow] (pd) -- node[above]{Fehler/Phasen} (lf);
\draw[arrow] (lf) -- node[above]{Steuerspannung $V_{ctrl}$} (vco);
\draw[arrow] (vco) -- (out);

% Feedback path
\draw[arrow] (vco.south) -- ++(0,-0.8) -| (div.north);
\draw[arrow] (div.south) -- ++(0,-1.2) -| node[pos=0.95,below]{zurück} (pd.south);

% Optional: mark feedback loop
\draw[decorate, decoration={brace,mirror,raise=6pt}] 
    ($(vco.east)+(0.2,0.6)$) -- ($(vco.east)+(0.2,-1.8)$) node[midway,right=14pt] {Rückführung mit $N$-Teiler};

% Labels
\node[above=0.4cm of pd] {Phasenvergleich};
\node[below=0.6cm of lf] {Regelkreis (geschlossener Loop)};

% Add small phaselock indicator (optional)
\node[draw,circle,inner sep=1pt,minimum size=6mm,fill=white, right=of out,xshift=1.2cm] (lock) {Locked};
\draw[arrow] (out.east) -- (lock.west);

\end{tikzpicture}
\end{document}
```

![PLL](../assets/PLL.png)

> [!summary] Bestandteile
> - Phase Detector + Charge Pump
> - Loop Filter
> - [VCO](Voltage%20Controlled%20Oscillator.md)
> - Feedback-Divider ([Clock Divider](Clock%20Divider.md))

Beim VCO ist der Term $\frac{1}{s}$ vorhanden (integrator): Die Ausgangsfrequenz des VCO muss wieder in eine Phase umgewandelt werden. Integration des Ausgangs da gilt: $\dot{\varphi} = \omega\implies \int \omega \mathrm{~d}t =\varphi$

## Kennwerte

| Kennwert                        |                                                                                                |
| ------------------------------- | ---------------------------------------------------------------------------------------------- |
| **Lock Range**                  | PLL folgt der Frequenzänderung innerhalb eines Taktes                                          |
| **Pull out Range**              | spezifizierte Zeit für größere Frequenzänderungen um wieder den „locked“ Zustand zu erreichen. |
| **Lock time**                   |                                                                                                |
| **Operationsbereich**           | der von der PLL überdeckte Frequenzbereich                                                     |
| **Frequenzmultiplikator**       | ganzzahlig / fraktional                                                                        |
| **Ordnung der PLL**             | Ordnung des Loop Filters                                                                       |
| **Frequenzstabilität / Jitter** |                                                                                                |

## Regelkreis eines Linearen PLL

Modell des PLLs, welcher um den "locked State" - dem Eingeschwungen Verhalten - linear ist:



# Phasedetector (PD)

Der Phasedetector vergleicht die … sind beide Frequenzen gleich, ist die PLL im *Locked*-Zustand, ansonsten (wenn ungleich) wird ein, der Abweichung proportionales Signal, ausgegeben.

## XOR Phase Detector

Ein einfaches Modell für einen Phasendetektor ist ein XOR-Gatter.  
Je größer die Phasenabweichung, desto höher das "PWM" am Ausgang des XOR Gatters.

![625](../assets/XOR-PD.png)
 
## Phase Frequency Detector (PFD)

Eine sehr populäre Implementierung für den Phasen Detektor ist der Phase-Frequency-Detector.

![PFD](../assets/PFD.png)

siehe: [MT-086](../assets/pdf/MT-086.pdf)

## Loop Filter

Das PWM-Artige Ausgangssignal des PD wird mit einem Tiefpass gemittelt und liefert eine konstante Spannung proportional zum Arbeitszyklus, welche den VCO steuert.

> [!WARNING] Der Filter hat daher eine Tiefpass-Charakteristik.  
> Tiefpass 1. Ordnung

## [VCO](Voltage%20Controlled%20Oscillator.md)

- Der [VCO](Voltage%20Controlled%20Oscillator.md) setzt das Signal in eine Rechteckschwingung um.
- Interessant ist die sogenannte *center-frequency*, also jede Frequenz, mit der der [Oszillator](Clock%20Generierung.md) im Locked-Zustand schwingt.
- Um sie herum findet der Regelvorgang statt.
- In PLL-Schaltungen kommen für die [Oszillatoren](Clock%20Generierung.md) hauptsächlich [LC-Oszillatoren](LC%20Oszillatoren.md) (weniger häufig RC-[Oszillatoren](Clock%20Generierung.md)) sowie Ringoszillatoren zum Einsatz.

--- 

# Tags

[Clock_und_Reset_Generierung](../assets/pdf/Clock_und_Reset_Generierung.pdf)
[MT-086](../assets/pdf/MT-086.pdf)
