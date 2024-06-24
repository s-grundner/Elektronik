---
tags: 
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

Wozu dient die Klasse Optional in Java?
?

---

Erklären Sie mit wenigen Worten das Prinzip der Bedarfsauswertung (lazy evaluation) bei Streams.
?

---

Bei Streams unterscheidet man
- erzeugende Operationen
- Zwischenoperationen
- Terminaloperationen
?

---

Charakterisieren Sie diese drei Arten von Operationen. Geben Sie jeweils ein Beispiel.
Was machen folgende Methoden von Stream<T>
```java
Stream<T> limit(long maxSize)
Stream<T> skip(long maxSize)
Stream<T> takeWhile(Predicate<? super T > predicate)
Stream<T> dropWhile(Predicate<? super T > predicate)
Stream<T> distinct()
```
?

---


Die Methode `flatMap` von Stream<T> hat folgende Signatur:
```java
<R> Stream<R> flatMap(Function<? super T, ? extends Stream<? extends R>> mapper)
```
Erläutern Sie die Methode, indem Sie den Parameter und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?

--- 

Die Methode `reduce` von `Stream <T>` hat folgende Signatur:
```java
<U> U reduce(U identity, BiFunction<U, ? super T, U> accumulator, Binaryoperator<U> combiner)
```
Erläutern Sie die Methode, indem Sie den Parameter accumulator und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?

---

Die Methode `collect` von `Stream <T>` hat folgende Signatur:
```java
<R> R collect(Supplier<R> supplier,
  BiConsumer<R, ? super T> accumulator,
  BiConsumer<R, R> combiner)
```
Erläutern Sie die Methode, indem Sie den Parameter `accumulator` und den Rückgabewert erklären und die Arbeitsweise charakterisieren.
?

---

Was ist ein Collector?
?

---

Die statische Methode partitioningBy von Collectors erzeugt einen Collector und hat folgende Signatur
```java
static <T> Collector<T, ?, Map<Boolean, List<T>>> partitioningBy(Predicate<? super T> predicate)
```
Erläutern Sie die Funktionsweise des erzeugten Collectors.
?

--- 

Die statische Methode groupingBy von Collectors erzeugt einen Collector und hat folgende Signatur
```java
static <T, K> Collector<T, ?, Map<K, List<T>>> groupingBy(Function<? super T, ? extends K> classifier)
```
Erläutern Sie die Funktionsweise des erzeugten Collectors.
?

--- 

Die statische Methode joining von Collectors erzeugt einen Collector und hat folgende Signatur
```java
static Collector<CharSequence, ?, String> joining(
  CharSequence delimiter,
  CharSequence prefix,
  CharSequence suffix)
```
Erläutern Sie die Funktionsweise des erzeugten Collectors.
?
