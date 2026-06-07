# Frequenzbereichsmethoden

Oft ist es wichtig, die [Übertragungsfunktion](Übertragungsfunktion.md) eines Systems zu kennen. Grundlegend zur Transformation in den Frequenzbereich ist im Allgeimenen die [Integraltransformation](Integraltransformation.md)

Zusammenhänge zwischen verschieden Signal-Transformationen 

### Übersicht und Zusammenhänge

![invert_dark](../../_assets/Excalidraw/Drawing%202025-06-23%2015.38.42.excalidraw.svg)
%%[🖋 Edit in Excalidraw](../../_assets/Excalidraw/Drawing%202025-06-23%2015.38.42.excalidraw.md) %%

|                  |                          $G(s)$                          |                          $G(z)$                          |                            $G^\#(q)$                            |
| ---------------- | :------------------------------------------------------: | :------------------------------------------------------: | :-------------------------------------------------------------: |
| Realisierbarkeit | $\lim\limits_{ s \to \infty }\lvert G(s) \rvert <\infty$ | $\lim\limits_{ z \to \infty }\lvert G(z) \rvert <\infty$ | $\lim\limits_{ q \to \Omega_{0} }\lvert G^\#(q) \rvert <\infty$ |
| Sprungfähigkeit  |        $\lim\limits_{ s \to \infty } G(s) \neq 0$        |        $\lim\limits_{ z \to \infty } G(z) \neq 0$        |       $\lim\limits_{ q \to  \Omega_{0} } G^\#(q) \neq 0$        |
| BIBO-Stabilität  |           alle Pole $s_{i}$ mit $\Re s_{i}<0$            |      alle Pole $z_{i}$ mit $\lvert z_{i} \rvert<1$       |               alle Pole $q_{i}$ mit $\Re q_{i}<0$               |
