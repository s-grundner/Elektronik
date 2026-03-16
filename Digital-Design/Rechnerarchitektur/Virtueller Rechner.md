---
tags:
aliases:
  - Virtual Machine
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 14th March 2026
professor:
release: false
title: Virtueller Rechner
---

# Virtueller Rechner

> [!question] [Rechnerarchitektur](index.md)

- Jede Ebene (mit Ausnahme der untersten) ist ein *virtueller Rechner* $M_{i}$ zu der eine *Sprache* $L_{i}$ gehört.
- Programme der Sprache $L_{i}$ werden
	- in Programme der Sprache $L_{j}(j<i)$ *übersetzt* oder
	- in die Sprache $L_{i}(j<i)$ *interpretiert*.

![invert_dark|700](../../_assets/Pasted%20image%2020260314162316.png)


## Compiler (Übersetzer) vs Interpreter

> [!info] Compiler
> - Ein *Compiler* ist eine Software, die ein in der Sprache $L_{i}$ geschriebenes Programm einliest und ein äquivalentes
> Programm der Sprache $L_{j}(j<i)$ ausgibt.
> - Ist $L_{j}$ die Maschinensprache, so spricht man von einem $L_{i}$-*Vollcompiler*
> 
> Ausführung eines $L_{i}$-Programms: 
> 
> - Transformation in ein äquivalentes $L_{j}$ Programm ($j<i$)
> - Ausführung des $L_{j}$-Programms


> [!info] Interpretation der L
> 
> ```
> cmd := erste Instruktion des Li-Programms;
> repeat
> 	transformiere cmd in eine Befehlssequenz cmd2 der Sprache Lj;
> 	führe cmd2 auf Ebene j aus;
> 	cmd := nächste auszuführende Instruktion des Li-Programms;
> until Li-Programm abgearbeitet;
> ```


- Interpreter sind einfacher zu implementieren als Compiler
	- geeignet für Prototyp-Implementierungen von neuen Sprachen
- Compilation ist nicht immer möglich
	- Ausführung von Programmen in Maschinensprache nur durch Interpretation möglich
- Übersetzte Programme sind schneller als interpretierte Programme
	- Codeoptimierung bei Übersetzung möglich
- (vollständige) Compilation nicht immer erwünscht
	- Systemunabhängigkeit (Portabilität)