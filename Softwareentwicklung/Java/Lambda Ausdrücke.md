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
> >  default Comparator< T > reversed() {
> >    return Collections.reverseOrder(this);
> >  }
> >  
> >  default Comparator thenComparing(Comparator< ? super T > other) { ... }
> >   ...
> > }
> > ```
> > 
> >


> [!question] Man unterscheidet folgende 4 Arten von funktionalen Interfaces in Java.
> - `Function<T, R>`
> - `Predicate<T>`
> - `Consumer<T>`
> - `Supplier<T>`
> 
> Erläutern Sie den Einsatzbereich dieser 4 Arten von funktionalen Interfaces.
?
> > [!success]- Lösung
> > 1. :TiMapShare:`Function<T, R>`: Funktion mit einem Argument von generischem Typ `T` und Resultat von Typ `R`
> >     - Typischer Anwendungsfall: Abbilden von Elementen (mapping)
> > 
> > 1. :LiFilter:`Predicate<T>`: Funktion mit Argument von Typ `T` und Boolesches Resultat
> >     - Typischer Anwendungsfall: Filtern von Elementen
> > 
> > 1. :FasGears:`Consumer<T>`: Funktion mit Argument von Typ `T` und **kein Rückgabewert** 
> >     - Typischer Anwendungsfall: Iteration mit Seiteneffekt
> >
> > 1. 🏭`Supplier<T>`: Funktion mit **keinem Argument** und Rückgabewert von Typ `T` 
> >     - Typischer Anwendungsfall: Objekterzeugung (Factory)


> [!question] Ein Lambda-Ausdruck erzeugt ein Objekt eines funktionalen Interfaces.
> Dieses durch den Lambda-Ausdruck erzeugte Objekt kann: (kreuzen Sie an)
> 1. in einer Liste gespeichert werden
> 2. als Parameter einer Methode übergeben werden
> 3. Rückgabewert einer Methode sein
> 
?
> > [!success]- Lösung
> > **1, 2 und 3** 🤯


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
> > **Target Typing**:  Der Typ ist durch den Kontext bestimmt 
> >
> > Ein Lambda Ausdruck hat keinen eindeutigen Typ, daher:
> > - Aus dem Kontext wird bestimmt, welches funktionale Interface implementiert wird 
> > - Aus dem Kontext werden die Typen für die generischen Typparameter bestimmt

> [!question] Was ist ein SAM-Typ?
?
> > [!success]- Lösung
> > Interfaces mit mit nur einer abstrakten Methode werden als *Single Abstract Method (SAM) Typen* bezeichnet.
> > SAM-Typen können für die Erzeugung von *Funktionsobjekten* aus Lambda-Ausdrücken verwendet werden.
> > - Runnable::run
> > - Comparator::compare

> [!question] Warum gibt es neben den generischen funktionalen Interfaces auch Interfaces für die Basisdatentypen, wie z.B. `IntToDoubleFunktion`?
?
> > [!success]- Lösung
> > Basisdatentypen (int, char, double, ...) können ohne Wrapperklassen (Integer, Character, Double) nicht als generische Typen verwendet werden.


> [!question] Was versteht man unter Funktionskomposition?
?
> > [!success]- Lösung
> > Default-Methoden in Funktionalen Interfaces dienen zur Hinternanderausführung von Funktionen

> [!question] Erläutern Sie die Funktionsweise der Methode `andThen` beim funktionalen Interface Function:
> 
> ``` java
> public interface Function< T, R > {
>   ...
>   default < V > Function < T, V > andThen(Function< ? super R, ? extends V > after) { 
>     return (T t) -> after.apply(this.apply(t));
>   }
> }
> ```
> 
?
> > [!success]- Lösung
> >
> >``` java
> > Function< T, R > fn = s -> s + 1; // T and R are Integers
> > Function< R, V > fn2 = w -> w * 10.5; // V is a Double
> > 
> > Function< T, V > res = fn.andThen(fn2); // this is equal to the line below
> > Function< T, V > res = (t) -> fn2.apply(fn.apply(t))
> > 
> > double cool = res.apply(49); // (49 + 1) * 10.5 = 525.0
> >```


> [!question] Was ist eine Methodenreferenz?
>
?
> > [!success]- Lösung
> > Methodenreferenzen snid Kurzformen für Lambda Ausdrücke


> [!question] Geben Sie für folgende Methodenreferenzen die äquivalenten Lambda-Ausdrücke an:
>
> - `String::length`
> - `"Ann"::equals`
> - `LinkedList< String >::new`
>
?
> > [!success]- Lösung 
> > `(a) -> String.length(a)`
> > `(a) -> "Ann".equals(a)`
> > `() -> new LinkedList< String >(a)` 

> [!question] Lokale Variablen, die in Lambda-Ausdrücken verwendet werden, müssen welche Eigenschaft haben?
>
?
> > [!success]- Lösung
> > Müssen final deklariert sein oder wie final verwendet werden (effectively final -> werden nur einmal eingesetzt)