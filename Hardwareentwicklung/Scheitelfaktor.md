---
tags: 
aliases:
  - Crest
  - Crestfactor
  - Crestfaktor
keywords: 
subject:
  - Einf. ET
  - PR
semester: 1
created: 18. Januar 2024
professor:
---
 

# [Scheitelfaktor](https://de.wikipedia.org/wiki/Scheitelfaktor)

|Schwingungsart|Schwingungsform|[Gleichrichtwert](https://de.wikipedia.org/wiki/Gleichrichtwert "Gleichrichtwert") durch Scheitelwert|[Formfaktor](https://de.wikipedia.org/wiki/Formfaktor_(Elektrotechnik) "Formfaktor (Elektrotechnik)") = [Effektivwert](https://de.wikipedia.org/wiki/Effektivwert) |Scheitelfaktor = Scheitelwert durch Effektivwert|$PAPR_{dB}$|
|---|---|---|---|---|---|
|[Sinusschwingung](https://de.wikipedia.org/wiki/Sinus "Sinus")|[![\|100](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Simple_sine_wave.svg/100px-Simple_sine_wave.svg.png)](https://de.wikipedia.org/wiki/Datei:Simple_sine_wave.svg)|$\frac {2}{\pi} \approx 0{,}637$ |$\frac {\pi }{2{\sqrt {2}}}\approx 1{,}11$ |$\sqrt {2}\approx 1{,}414$ |$3{,}01\,\mathrm {dB}$ |
|Volle Schwingung gleichgerichteter Sinus|[![](https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Simple_full-wave_rectified_sine.svg/100px-Simple_full-wave_rectified_sine.svg.png)](https://de.wikipedia.org/wiki/Datei:Simple_full-wave_rectified_sine.svg)|$\frac {2}{\pi }\approx 0{,}637$ |$\frac {\pi }{2{\sqrt {2}}}\approx 1{,}11$ |$\sqrt {2}\approx 1{,}414$ |$3{,}01\,\mathrm {dB}$ |
|Halbschwingung gleichgerichteter Sinus|[![](https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Simple_half-wave_rectified_sine.svg/100px-Simple_half-wave_rectified_sine.svg.png)](https://de.wikipedia.org/wiki/Datei:Simple_half-wave_rectified_sine.svg)|$\frac {1}{\pi }\approx 0{,}318$ |$\frac {\pi }{2}\approx 1{,}571$ |$2$ |$6{,}02\,\mathrm {dB}$ |
|[Dreieckschwingung](https://de.wikipedia.org/wiki/Dreiecksfunktion#Dreieckschwingung "Dreiecksfunktion")|[![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Triangle_wave.svg/100px-Triangle_wave.svg.png)](https://de.wikipedia.org/wiki/Datei:Triangle_wave.svg)|$\frac {1}{2}=0{,}5$ |$\frac {2}{\sqrt {3}}\approx 1{,}155$ |$\sqrt {3}\approx 1{,}732$ |$4{,}77\,\mathrm {dB}$ |
|Symmetrische [Rechteckschwingung](https://de.wikipedia.org/wiki/Rechteckschwingung "Rechteckschwingung")|[![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Square_wave.svg/100px-Square_wave.svg.png)](https://de.wikipedia.org/wiki/Datei:Square_wave.svg)|$1$ |$1$ |$1$ |$0\,\mathrm {dB}$ |
|Unsymmetrische Rechteckschwingung ([PDM](https://de.wikipedia.org/wiki/Pulsdauermodulation "Pulsdauermodulation")-Signal)|[![](https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Pulse_wide_wave.svg/100px-Pulse_wide_wave.svg.png)](https://de.wikipedia.org/wiki/Datei:Pulse_wide_wave.svg)|$\frac {t_{1}}{T}$ |$\sqrt {\frac {T}{t_{1}}}$ |$\sqrt {\frac {T}{t_{1}}}$ |$10\cdot \lg {\frac {T}{t_{1}}}\,\mathrm {dB}$ |
|[Frequenz-](https://de.wikipedia.org/wiki/Frequenzmodulation "Frequenzmodulation") oder [Phasenmodulation](https://de.wikipedia.org/wiki/Phasenmodulation "Phasenmodulation"),  <br>z. B. [GMSK](https://de.wikipedia.org/wiki/Frequenzumtastung#Erweiterungen_der_Frequenzumtastung "Frequenzumtastung") bzw. [QPSK](https://de.wikipedia.org/wiki/QPSK "QPSK")||||$1$ |$0\,\mathrm {dB}$ |
|4-Bit-Quadratur-Amplitudenmodulation ([16-QAM](https://de.wikipedia.org/wiki/QAM#Quantisierte_QAM "QAM"))||||$\sqrt {\frac {9}{5}}$ |$2{,}6\,\mathrm {dB}$ |
|6-Bit-Quadratur-Amplitudenmodulation ([64-QAM](https://de.wikipedia.org/wiki/QAM#Quantisierte_QAM "QAM"))||||$\sqrt {\frac {7}{3}}$ |$3{,}7\,\mathrm {dB}$ |
