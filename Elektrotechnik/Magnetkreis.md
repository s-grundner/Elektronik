---
tags: 
aliases: 
keywords: 
subject:
  - Elektrische Maschinen und Antriebselektronik
  - VL
semester: SS25
created: 10. März 2025
professor:
draft: true
title: Magnetkreis
---
 
# Magnetkreis

Ein Magnetkreis ist die schematische Darstellung einer Zusammenschaltung aus magnetischen Elementen. Durch ihn wird veranschaulicht in welcher Quantität diese Elemente mit dem magnetischen Fluss durchströmt sind.   

**Elemente im Magnetkreis**

- [Magnetische Quellen](Magnetische%20Quellen.md) - Magnete
- Magnetisch Leitfähige Verbindungen - Eisenkreis
- Speicherung der Magnetischen Energie - Luftspalt

**Prinzipien**

- [Reluktanz Prinzip](Reluktanz.md#^RelPrinz)

## Wichtige Kenngrößen und Zusammenhänge

|                   |                im magnetischen Kreis                 |             im elektrischen Kreis             |                     |
| ----------------: | :--------------------------------------------------: | :-------------------------------------------: | :------------------ |
|       magn. Fluss |                        $\Phi$                        |                      $I$                      | Strom               |
| magn. Flussdichte |             $\mathbf{B}=\mu \mathbf{H}$              |        $\mathbf{J}=\sigma \mathbf{E}$         | Stromdichte         |
|     Permeabilität |                        $\mu$                         |                   $\sigma$                    | Leitwert            |
|         Reluktanz |           $\mathfrak{R}=\dfrac{l}{\mu A}$            |            $R=\dfrac{l}{\sigma A}$            | Impedanz            |
|    magn. Spannung |              $V = \mathfrak{R} \cdot I$              |                 $U=R\cdot I$                  | Spannung            |
|      Durchflutung | $\Theta = \oint \mathbf{H}\cdot\mathrm{d}\mathbf{s}$ | $u=\oint \mathbf{E}\cdot\mathrm{d}\mathbf{s}$ | induzierte Spannung |


## Entwurf

Entwurfsrichtlinien:

- Ausreichender Eisenquerschnitt
    - Kleinere Fläche -> höhere Flussdichte daher frühere Sättigung -> Nicht linearer bereich
- große Luftspaltfläche, kleine Luftspaltlänge
- Symmetrischer Aufbau

---

## Beispiel eines Magnetkreises

Modellbild einer Zweipoligen Maschine mit zwei Statorspulen:

$$\underset{ \longleftarrow }{ \Phi_{Li} } = \underset{ \longrightarrow }{ \Phi_{Re} } = \frac{1}{2} \Phi_{S}$$

![invert_dark|500](assets/KreisBsp.png)

|                                 | Feldstärke            | Fluss                            | Abstand / Länge | Permeabiltät des Materials |
| ------------------------------- | --------------------- | -------------------------------- | --------------- | -------------------------- |
| $\color{orange}\text{Stator}$   | $\mathbf{H}_{S}$      | $\Phi_{S}=\Phi_{Re} + \Phi_{Li}$ | $l_{S}$         | $\mu_{0}\mu_{r}$           |
| $\color{cyan}\text{Rotor}$ | $\mathbf{H}_{R}$      | $\Phi_{R}$                       | $l_{R}$         | $\mu_{0}\mu_{r}$           |
| $\color{green}\text{Luftspalt}$ | $\mathbf{H}_{\delta}$ | $\Phi_{R}$                       | $\delta$        | $\mu_{0}$                  |

|                                       | Windungszahl | elektrischer Strom |
| ------------------------------------- | ------------ | ------------------ |
| $\color{magenta}\text{Erregerspulen}$ | $N$          | $i$                |


> [!question] Gefragt ist, wie man diese Maschine als Magnetkreis Modelliert.

1. Ausgangspunkt ist die Definition der [Durchflutung](Durchflutung.md)

$$\Theta = \oint_{L} \mathbf{H}\cdot\mathrm{d}\mathbf{s} = \sum_{v=1}^{N}i_{v}$$

2. Das Ringintegral wird zur **Maschengleichung**:

$$2 H_{\delta}\delta + H_{R}l_{R} + H_{S} l_{S} = 2Ni$$

3. Beziehungen Anwenden
    - [Materialgleichung](Permeabilität.md) $\mathbf{B}=\mu \cdot \mathbf{H}$
    - [Magnetischer Fluss](Magnetischer%20Fluss.md): $\Phi = \int _{A}\mathbf{B}\cdot \mathrm{d}\mathbf{a} = B\cdot A$. Dazu mit den Querschnittsflächen jeder Sektion des Modells erweitern

$$
\begin{align}
2\delta \cdot \frac{B_{\delta} A_{\delta}}{\mu_{0}A_{\delta}} + l_{R}\cdot\frac{B_{R} A_{R}}{\mu_{0}\mu_{r} A_{R}} + l_{S}\cdot\frac{B_{S} A_{S}}{\mu_{0}\mu_{r} A_{S}} &= 2Ni \\
2\delta \cdot \frac{\Phi_{\delta}}{\mu_{0}A_{\delta}} + l_{R}\cdot\frac{\Phi_{R}}{\mu_{0}\mu_{r} A_{R}} + l_{S}\cdot\frac{\Phi_{S}}{\mu_{0}\mu_{r} A_{S}} &= 2Ni 
\end{align}
$$


3. Einsetzen des [magnetischen Widerstandes](Reluktanz.md) $\mathfrak{R}=\dfrac{l}{\mu A}$ leifert:

$$
\begin{align}
2\Phi_{\delta}\mathfrak{R}_{\delta}+\Phi_{R}\mathfrak{R}_{R}+\Phi_{S}\mathfrak{R}_{S} &= 2Ni \\
2V_{\delta}+ V_{R}+V_{S} &=2Ni
\end{align}
$$

Mit dieser Anschaulichen Maschengleichung der magnetischen Spannungen kann ein Schaltbild für den Magnetkreis Konstruiert werden.

![invert_dark|400](assets/MagnEquiv.png)
