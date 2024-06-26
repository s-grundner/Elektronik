---
tags:
  - flashcards/SWE2
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

> [!question] Was zeichnet Funktionale Interfaces aus? Kreuzen Sie an:
> 1. Haben nur eine Methode
> 2. Haben nur Default-Methoden
> 3. Haben nur statische Methoden
> 4. Haben nur eine abstrakte Methode
>
?
> > [!success]- Lösung
> 4
> Beispiel für ein funktionales 


> [!question] Man unterscheidet folgende 4 Arten von funktionalen Interfaces in Java.
> - `Function<T, R>`
> - `Predicate<T>`
> - `Consumer<T>`
> - `Supplier<T>`
> 
> Erläutern Sie den Einsatzbereich dieser 4 Arten von funktionalen Interfaces.
?
> > [!success]- Lösung


> [!question] Ein Lambda-Ausdruck erzeugt ein Objekt eines funktionalen Interfaces. Dieses durch den Lambda-Ausdruck erzeugte Objekt kann.
> kreuzen Sie an:
> - in einer Liste gespeichert werden
> - als Parameter einer Methode übergeben werden
> - Rückgabewert einer Methode sein
> 
?
> > [!success]- Lösung

> [!question] Beim Rumpf von Lambda-Ausdrücken unterscheidet man Statement-Rumpf und Expression-Rumpf.
> Was ist der Unterschied? Wie wird bei diesen der Rückgabewert bestimmt?
?
> > [!success]- Lösung

> [!question] Was versteht man unter „Target Typing"?
?
> > [!success]- Lösung

> [!question] Was ist ein SAM-Typ?
?
> > [!success]- Lösung

> [!question] Warum gibt es neben den generischen funktionalen Interfaces auch Interfaces für die Basisdatentypen, wie z.B. `IntToDoubleFunktion`?
>
?
> > [!success]- Lösung

> [!question] Was versteht man unter Funktionskomposition?
?
> > [!success]- Lösung

> [!question] Erläutern Sie die Funktionsweise der Methode `andThen` beim funktionalen Interface Function:
> 
> ``` java
> public interface Function<T, R> {
>   ...
>   default Function andThen(Function<? super R, ? extends V> after) { 
>     return (T t) -> after.apply(this.apply(t));
>   }
> }
> ```
?
> > [!success]- Lösung

> [!question] Was ist eine Methodenreferenz?
>
?
> > [!success]- Lösung

> [!question] Geben Sie für folgende Methodenreferenzen die äquivalenten Lambda-Ausdrücke an:
> - String::length
> - "Ann"::equals
> - LinkedList<String>::new
>
?
> > [!success]- Lösung 

> [!question] Lokale Variablen, die in Lambda-Ausdrücken verwendet werden, müssen welche Eigenschaft haben?
>
?
> > [!success]- Lösung