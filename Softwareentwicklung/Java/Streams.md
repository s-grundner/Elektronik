---
tags:
  - flashcards/SWE2
aliases: 
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester: SS24
created: 21. September 2023
professor: 
cited:
---
 

# Streams

# Theoriefragen

> [!question] Wozu dient die Klasse Optional in Java?
?
> > [!success]- Lösung
> > Um mit null-Werte umzugehen 
> > Statt Null bekommt man ein Optional zurück welches den zustand`Empty` annehmen kann.
> > Vorteil: weniger Nullchecks. Daher bessere Verwendung in Functional Programming / Streams 

---

> [!question] Erklären Sie mit wenigen Worten das Prinzip der Bedarfsauswertung (lazy evaluation) bei Streams.
?
> > [!success]- Lösung
> > Ohne Anforderung des Ergebnisses werden keine Elemente verarbeitet. Auf den Stream muss eine Terminaloperation angewandt werden, dann wird die verarbeitung gestartet

---

> [!question] Bei Streams unterscheidet man
> - erzeugende Operationen
> - Zwischenoperationen
> - Terminaloperationen
> 
> Charakterisieren Sie diese drei Arten von Operationen. Geben Sie jeweils ein Beispiel.
?
> > [!success]- Lösung
> > **erzeugende Operation**: 
> > - Erzeugt einen stream aus einer Collection / Arrays
> > - `T.stream(a)`, `Stream.of(1, 2, 3...)`
> > 
> > **Zwischenoperationen**
> > - Operationen die wieder eine Stream zurückliefern
> > - meistens gefilterte Teilstreams
> > - `limit(size)` es werden die ersten `size` werte in den Stream aufgenommen
> > - `filter()` filtert die werte die durch den Stream fließen anhand eines predicates
> > 
> > **Terminaloperationen**
> > Operationen die den Stream abschließen
> > `toList` konvertiert den Stream zu einer *immutable* Liste
> > `collect`
> > `reduce`
> > `forEach`

---

> [!question] Was machen folgende Methoden von Stream< T >
> ```java
> Stream< T > limit(long maxSize)
> Stream< T > skip(long maxSize)
> Stream< T > takeWhile(Predicate< ? super T > predicate)
> Stream< T > dropWhile(Predicate< ? super T > predicate)
> Stream< T > distinct()
> ```
?
> > [!success]- Lösung
> > **limit**: lässt nur `size` elemente durch, danach nix mehr
> > **skip**: überspringt die ersten `size` elemente
> > **takeWhile**: lässt nur solange durch, bis ein prädikat erfüllt ist
> > **dropWhile**: lässt nichts durch bis ein prädikat erfüllt ist
> > **distinct**: lässt keine duplikate durch
<!--SR:!2024-06-30,4,270-->

---

> [!question] Die Methode `flatMap` von Stream< T > hat folgende Signatur:
> 
> ```java
> < R > Stream< R > flatMap(Function< ? super T, ? extends Stream< ? extends R > > mapper)
> ```
> Erläutern Sie die Methode, indem Sie den Parameter und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?
> > [!success]- Lösung

--- 

> [!question] Die Methode `reduce` von `Stream <T>` hat folgende Signatur:
> 
> ```java
> < U > U reduce(U identity, BiFunction< U, ? super T, U > accumulator, Binaryoperator< U > combiner)
> ```
> Erläutern Sie die Methode, indem Sie den Parameter accumulator und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?
> > [!success]- Lösung
> > startet bei dem wert von identity und führt eine BIFunction aus, welche eine operation mit den einkommenten werten ausführt. (z.B. Aufsummiert)
> > Am ende hat man dann einen einzigen wert, daher `reduce`


---

> [!question] Die Methode `collect` von `Stream <T>` hat folgende Signatur:
> 
> ```java
> < R > R collect(Supplier< R > supplier,
>   BiConsumer< R, ? super T > accumulator,
>   BiConsumer< R, R > combiner)
> ```
> Erläutern Sie die Methode, indem Sie den Parameter `accumulator` und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?
> > [!success]- Lösung
> > collect ist eine spezielle variante von Reduce
> > hier liefert ein Supplier den start wert.
> > Ein Consumer fügt das supplierte element und das element aus dem Stream zusammen
> > 


---

> [!question] Was ist ein Collector?
?
> > [!success]- Lösung
> > Kombiniert die Elemente Supplier-, Akkumlator- und Combiner-Funktion


---

> [!question] Die statische Methode `partitioningBy` von Collectors erzeugt einen Collector und hat folgende Signatur
> 
> ```java
> static < T > Collector< T, ?, Map<Boolean, List< T >>> partitioningBy(Predicate< ? super T > predicate)
> ```
> Erläutern Sie die Funktionsweise des erzeugten Collectors.
?
> > [!success]- Lösung
> > Teilt werte anhand eines prädikats in True oder False ein. Der Boolsche Wert ist der Key einer Map. Das Value ist die Liste, in der die Partitionierten Elemente chillen.
> > Eine Liste wird daher mit True und die andere mit False Assoziiert
> > ![](assets/Pasted%20image%2020240626194355.png)


--- 

> [!question] Die statische Methode `groupingBy` von Collectors erzeugt einen Collector und hat folgende Signatur
> ```java
> static < T, K > Collector< T, ?, Map< K, List< T > > > groupingBy(Function< ? super T, ? extends K > classifier)
> ```
> Erläutern Sie die Funktionsweise des erzeugten Collectors.
?
> > [!success]- Lösung
> > ähnlich wie partitioningBy. Statt boolesche Werte werden die elemente des Streams nach einer definierten Klasse gruppiert z.B. Stream an wörtern nach anfangsbuchstabe gruppieren.

--- 

> [!question] Die statische Methode `joining` von Collectors erzeugt einen Collector und hat folgende Signatur
> 
> ```java
> static Collector< CharSequence, ?, String > joining(
>   CharSequence delimiter,
>   CharSequence prefix,
>   CharSequence suffix)
> ```
> Erläutern Sie die Funktionsweise des erzeugten Collectors.
?
> > [!success]- Lösung
> > der collector sammelt alle Elemente und fügt sie zusammen. Hier kann das das voranstehende, das nachstehende und die Trennelemente bestimmt werde,
> 
> 