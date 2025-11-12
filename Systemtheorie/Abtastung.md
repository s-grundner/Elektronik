---
tags: 
aliases:
  - Abtastsysteme
  - ADC
keywords: 
subject:
  - VL
  - Signalverarbeitung
  - Regelungstechnik
semester: SS25
created: 19th March 2025
professor:
  - Markus Schöberl
  - Mario Huemer
release: false
title: Abtastung
---

# Abtastung

- [Duale Poissonsche Summenformel](Poissonsche%20Summenformel.md#Duale%20Poissonsche%20Summenformel)

> [!def] **D)** Ideale Abtastung 
> 
> $$ x[k] := x(kT_{s}) $$

Ist eine Zeitkontinuierliches System gegeben, muss zuerst die Fundamentallösung ermittelt werden, damit $kT_{s}$ in die Lösung eingesetzt werden kann.

## Abtastsystem

Zusammenhang der Eigenwerte: Sind $s_{i}$ die Eigenwerte des kontinuierlichen System und die $z_{i}$ die Eigenwerte des zugehörigen Abgtastsystem mit der Abtastzeit $T_{a}$, gilt der zusammenhang

$$ z_{i} = e^{ s_{i} T_{a} } $$

### Abtastung nicht linearer Systeme

### Abtastung LTI-Systeme

## Matlab

Abtasten in Matlab:

- discrete to continuous: `d2c`
- continuous to discrete: `c2d`

Dient zum hin und her wechseln zwischen $G(s) \leftrightarrow G(z)$

## Methoden zum Abtasten

- [Sukzessive Approximation](../Digitaltechnik/SAR-ADC.md)
- [Sigma-Delta](../Digitaltechnik/Sigma-Delta-ADC.md)

---

# Referenzen

- [q-Transformation](q-Transformation.md)