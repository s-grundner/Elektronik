---
tags:
aliases:
subject:
  - VL
  - Rechnerarchitektur
semester: SS26
created: 24th March 2026
professor:
release: false
title: Division und Rest
---

# Division und Rest

> [!info] Nur Verfügbar mit der `M` Erweiterung

## Ermitteln des Divisionsergebnisses

| Befehl                  | Beschreibung       | Registerzuweisungen |
| ----------------------- | ------------------ | ------------------- |
| `div rd, rs1, rs2`  | divide signed   | `rd := rs1 / rs2`   |
| `divu rd, rs1, rs2` | divide unsigned | `rd := rs1 / rs2`   |


## Ermitteln des Rests der Divsion

| Befehl                  | Beschreibung       | Registerzuweisungen |
| ----------------------- | ------------------ | ------------------- |
| `rem rd, rs1, rs2`      | remainder signed   | `rd := rs1 % rs2`   |
| `remu rd, rs1, rs2` | remainder unsigned | `rd := rs1 % rs2`   |