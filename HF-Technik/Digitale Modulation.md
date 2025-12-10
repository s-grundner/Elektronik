---
tags:
aliases:
keywords:
subject:
  - KV
  - Elektronische Systeme 1
semester: WS25
created: 5th November 2025
professor:
  - Werner Haselmayer
release: false
title: Digitale Modulation
---

# Digitale Modulation

> [!question] [Modulation](HF-Technik/Modulation.md)

Digitale Modulation ist ein wichtiger Bestandteil einer digitalen [Übertragungsstrecke](HF-Technik/Übertragungsstrecke.md).

![invert_light](../assets/Excalidraw/digiModChannel.svg)
%%[🖋 Edit in Excalidraw](../assets/Excalidraw/digiModChannel.md)%%

|       Signal        | Signalbeschreibung   |                                     Beschreibung                                     | Anmerkung                                                                                          |
| :-----------------: | -------------------- | :----------------------------------------------------------------------------------: | -------------------------------------------------------------------------------------------------- |
|       $s(t)$        | Transmitted Baseband |                    $$ s(t)=\sum_{k} A[k] g_{\mathrm{T}}(t-kT) $$                     |                                                                                                    |
| $s_{\mathrm{p}}(t)$ | Transmitted Passband | $$ s_{\mathrm{p}}(t) = \Re\left\{s(t) e^{ \jmath 2\pi f_{\mathrm{c}} t }\right\} $$  | $s_{\mathrm{p}}(t)=s(t)\cos(2\pi f_{\mathrm{c}}t)$<br>wenn $A[k]$ reellwertig<br>sind (z.B. bei [ASK](HF-Technik/Amplitude-Shift-Keying.md)) |
|       $n(t)$        | Rauschen             | Zufallssignal mit Gauss-Verteilter Amplitude<br>und konstanter Rauschleistungsdichte | [AWGN-Kanalmodell](HF-Technik/AWGN-Kanalmodell.md)                                                       |
| $r_{\mathrm{p}}(t)$ | Recieved Passband    |                  $$ r_{\mathrm{p}}(t) = s_{\mathrm{p}}(t) + n(t) $$                  |                                                                                                    |
|       $r(t)$        | Recieved Baseband    |                $$ r(t) = \sum_{k} A[k] g_{\mathrm{T}}(t-kT) + n(t) $$                |                                                                                                    |



## Symbol Mapping

Für Digitale Modulationsarten können mehrere Bits gruppiert werden, die dann als Ein einziges Symbol Übertragen werden.

## Arten der Modulation

- Lineare Modulationsarten: [ASK](Amplitude-Shift-Keying.md)
- Nicht-Lineare Modulationsarten: [FSK](Frequency-Shift-Keying.md)
