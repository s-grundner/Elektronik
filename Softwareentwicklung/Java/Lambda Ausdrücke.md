---
tags: 
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester: SS24
created: 24. Juni 2024
professor:
cited:
---

# Lambdas

> [!important] Lambda Ausdrücke ...
> - ... sind **Literale für die Erzeugung von Funktionsobjekten**
> - ... Ausdrücke **instantiieren funktionale Interfaces** mit nur **einer abstrakten Methode**
> - ... können als **Parameter** und **Rückgabewerte** vom Methoden verwendet werden
>     - Funktionen Höherer Ordnung
> - ... werden von der VM effizient ausgeführt

Der **Typ** des durch den Lambda-Ausdruck erzeugten Objekts wird durch den **Kontext** bestimmt (*Target Typing*)

> [!info] Von der Bibliothek bereitgestellte funktionale Interfaces:
> - **Function**: Abbildung von Wert auf Resultat
> - **Predicate**: Testen von Werten
> - **Consumer**: Verarbeiten von Werten
> - **Supplier**: Erzeugen von Werten



# Theorie Fragen

Was zeichnet Funktionale Interfaces aus? Kreuzen Sie an:
Haben nur eine Methode
Haben nur Default-Methoden
Haben nur statische Methoden
Haben nur eine abstrakte Methode

Man unterscheidet folgende 4 Arten von funktionalen Interfaces in Java.
Function <T, R>
Predicate <T>
Consumer<T>
Supplier <T>
Erläutern Sie den Einsatzbereich dieser 4 Arten von funktionalen Interfaces.
Ein Lambda-Ausdruck erzeugt ein Objekt eines funktionalen Interfaces. Dieses durch den
Lambda-Ausdruck erzeugte Objekt kann (kreuzen Sie an):
in einer Liste gespeichert werden
als Parameter einer Methode übergeben werden
Rückgabewert einer Methode sein