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

## Funktionale Interfaces

Von der Bibliothek bereitgestellte funktionale Interfaces:

| Interface      | Abstrakte Methode   | Anwendung                                            | 
|:-------------- |:------------------- |:---------------------------------------------------- |
| Function<T, R> | `R apply(T t)`      | Abbildung von Argument(en) auf Wert                  |
| Predicate<T\>  | `boolean test(T t)` | Test von Argument(en) (mit Ergebnis true oder false) |
| Consumer<T\>   | `void accept(T t)`  | Aktion auf Argument(e) ohne Rückgabewert             |
| Supplier<T\>   | `T get()`           | Kein Argument; für Erzeugen von Objekten (Factory)   |

# Theorie Fragen

> [!question] Was zeichnet Funktionale Interfaces aus? Kreuzen Sie an:
> 1. Haben nur eine Methode
> 2. Haben nur Default-Methoden
> 3. Haben nur statische Methoden
> 4. Haben nur eine abstrakte Methode
>
?
> > [!success]- Lösung
> > **4** - Beispiel für ein funktionales Interface
> > (**2** - und beliebig viele weitere Default Methoden)
> >```java
> > @FunctionalInterface
> > public interface Comparator {
> >  int compare(T o1, T o2);
> >  
> >  default Comparator<T> reversed() {
> >    return Collections.reverseOrder(this);
> >  }
> >  
> >  default Comparator thenComparing(Comparator<? super T> other) { ... }
> >   ...
> > }
> > ```


> [!question] Man unterscheidet folgende 4 Arten von funktionalen Interfaces in Java.
> - `Function<T, R>`
> - `Predicate<T>`
> - `Consumer<T>`
> - `Supplier<T>`
> 
> Erläutern Sie den Einsatzbereich dieser 4 Arten von funktionalen Interfaces.
?
> > [!success]- Lösung
> > 1. `Function<T, R>`: Funktion mit einem Argument von generischem Typ `T` und Resultat von Typ `R`
> >     - Typischer Anwendungsfall: Abbilden von Elementen (mapping)
> > 
> > 1. `Predicate<T>`: Funktion mit Argument von Typ `T` und Boolesches Resultat
> >     - Typischer Anwendungsfall: Filtern von Elementen
> > 
> > 1. `Consumer<T>`: Funktion mit Argument von Typ `T` und **kein Rückgabewert** 
> >     - Typischer Anwendungsfall: Iteration mit Seiteneffekt
> >
> > 1. `Supplier<T>`: Funktion mit **keinem Argument** und Rückgabewert von Typ `T`
> >     - Typischer Anwendungsfall: Objekterzeugung (Factory)


> [!question] Ein Lambda-Ausdruck erzeugt ein Objekt eines funktionalen Interfaces.
> Dieses durch den Lambda-Ausdruck erzeugte Objekt kann: (kreuzen Sie an)
> 1. in einer Liste gespeichert werden
> 2. als Parameter einer Methode übergeben werden
> 3. Rückgabewert einer Methode sein
> 
?
> > [!success]- Lösung
> > **1, 2 und 3**


> [!question] Beim Rumpf von Lambda-Ausdrücken unterscheidet man Statement-Rumpf und Expression-Rumpf.
> Was ist der Unterschied? Wie wird bei diesen der Rückgabewert bestimmt?
?
> > [!success]- Lösung
> > 1. Statement Rumpf
> >     - Rumpf ist ein Block (mit `{...}`)
> >     - `return` gefordert (außer bei `void`) 
> > 1. Expression-Rumpf
> >     - Rumpf ist ein einziger Ausdruck
> >     - Resultat durch Ausdruck bestimmt (kein `return`)

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