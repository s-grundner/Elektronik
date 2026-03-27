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
title: Register
---

# Register

Konventionen legen fest, wie Register heißen und wie sie verwendet werden sollen. Der Compiler (oder Programmierer/ Anwender) muss sich nicht unbedingt an solche Konventionen halten, derartige Konventionen sind aber notwendig, **damit getrennt übersetzte Programmteile zusammenarbeiten können**.

## Registersatz

| Name    | Nummer | Beschreibung                       |
| ------- | ------ | ---------------------------------- |
| `zero`  | x0     | Konstante 0                        |
| `ra`    | x1     | Rücksprungsaddresse                |
| `sp`    | x2     | Stackpointer                       |
| `gp`    | x3     | Zeiger auf globale Daten           |
| `tp`    | x4     | Zeiger auf threadlokale daten      |
| `t0-2`  | x5-7   | temp register[^1]                  |
| `s0/fp` | x8     | Stack-Frame-Zeiger (optional)      |
| `s1`    | x9     | Gesichertes Register [^2]          |
| `a0-1`  | x10-11 | Funktionsargumente / Rückgabewerte |
| `a2-7`  | x12-17 | Funktionsargumente                 |
| `s2-11` | x18-27 | Gesicherte Register[^2]            |
| `t3-6`  | x28-31 | Temporäre Register [^1]            |

### `zero`

Kann nicht überschrieben werden.

### `ra`

Wichtig für [Funktionsaufrufe](Funktionsaufrufe.md). Bei return wird zur Addresse welche in diesem Register gespeichert ist gesprungen.

### `sp`

Zeigt auf das aktuell oberste Datenelement auf dem [Stack](Stack.md).

### Gesicherte Register

Gesicherte Register (`s0-s11`) sind für Variablen verfügbar

### Temporäre Register

- Temporäre Register (`t0-t6`) für Zwischenergebnisse

## Sicherungskonvention

| Preserved (callee-saved)                                                                                                      | Nonpreserved (caller saved)                                            |
| ----------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| *Callee* muss die Erhaltung der Werte sicherstellen.                                                                          | *Caller* muss die Erhaltung der Werte sicherstellen                    |
| Der *Caller* erwartet, dass die Werte in diesen Registern nach einem [Funktionsaufruf](Funktionsaufrufe.md) erhalten bleiben. | Der *Callee* (die Funktion) kann die Register beliebeig überschreiben. |
|                                                                                                                               |                                                                        |
| `s0-s11`                                                                                                                      | `t0-t6`                                                                |
| `sp`                                                                                                                          | `a0-a7`                                                                |
|                                                                                                                               | `ra`                                                                   |


[^1]: Inhalt bleibt bei Aufruf eines Unterprogramms nicht zwangsweise erhalten
[^2]: Inhalt bleibt bei Aufruf eines Unterprogramms erhalten.
