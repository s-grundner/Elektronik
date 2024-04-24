---
tags:
  - DS
aliases:
  - Linked List
  - Verkettete Liste
subject: []
source: []
created: 17th April 2022
---

# Verkette Liste

> [!success] Vorteil gegenüber Arrays
> Das Sammeln von mehreren Objekten kann mittels Arrays erfolgen. Der große Nachteil von Arrays ist, dass ihre Größe während der gesamten Programmlaufzeit immer gleich bleibt.
> 
> Einerseits kann das Array groß genug gemacht werden. Wenn nicht sämtliche Plätze verwendet werden, bedeutet das automatisch eine Speicherplatzverschwendung. Wird die Größe eines Arrays eher knapp bemessen, kann es vorkommen, dass der Platz während der Laufzeit zu knapp wird.

Eine Lösung bieten die **verketteten Listen**. Jedes Element einer verketteten Liste beinhaltet:

- das zu speichernde Datum (wie in einem Array auch) und zusätzlich
- einen Zeiger auf ein folgendes Element.

> [!error] Nachteil gegenüber Arrays
> Listenknoten sind nicht indexiert, man muss also durch die gesamte Liste iterieren um ein Element zu finden.
> - Lösung in [Java]({MOC}%20Java.md) ist die `ArrayList<T>` (siehe [[Generics]]) welche für jedes Element einen Index mitführt.
> 
> Brauchen mehr Speicherplatz

## Listentypen

- [[Lineare Liste]]
- [[Ringliste]]
- Doppelt Verkettete Liste
- [LIFO](LIFO%20Stack.md)
- [FIFO](FIFO%20Queue.md) 

## Listenknoten

Die Elemente so einer Liste werden als **Knoten** bezeichnet. Für das Speichern von drei einfachen Nummern sieht das so aus:

![invert_dark](assets/EinfList02.png)

Der Vorteil von einer solchen Liste ist ersichtlich: sie kann beliebig erweitert werden, dazu muss ein neues Element erzeugt werden und entweder an einer beliebigen Stelle oder am Ende eingefügt werden.

Da diese Art der Liste nur in eine Richtung durchgangen werden kann, wird sie als **einfach** verkettete Liste bezeichnet. Alternativ gibt es die **doppelt** verketteten Listen. Sie haben zusätzlich in jedem Knoten einen Zeiger der auf den vorhergehenden Knoten zeigt. Hier wiederum ein einfaches Beispiel dieses Typs:

![invert_dark](assets/EinfList03.png)

Diese Liste kann in beide Richtungen durchgangen werden. Sie haben allerdings einen höheren Speicherbedarf.

### Listen-Knoten in C

Für die obige einfach verkettete Liste kann ein Knoten in C die folgende Struktur haben:

```c
struct SNODE {
    int num;             // zu Speichernde Nummer
    struct SNODE *next;  // Zeiger auf genau so ein Knoten-Element
                         // (FolgeKnoten)
};
typedef struct SNODE TNODE;
```

Für die doppelt verkettete Liste entsprechend:

```c
struct SNODE {
    struct SNODE *prev; // Zeiger auf ein Knoten-Element (VorgaengerKnoten)
    int num;            // zu Speichernde Nummer
    struct SNODE *next; // Zeiger auf ein Knoten-Element (FolgeKnoten)
};
typedef struct SNODE TNODE;
```

Der Zeiger des letzten Knotens in **Zyklischen** Listen zeigt auf das erste Element der Liste.

## Listenkopf

Anstatt sich das erste Listenelement zu merken, wird häufig ein **Listenkopf** vorangestellt. Dieser beinhaltet zumindest einen Zeiger auf das erste Listenelement. Zusätzlich wird oft noch die Anzahl der Knoten in der Liste (Anzahl der Elemente) und/oder ein Zeiger auf das letzte Element angefügt.

![invert_dark](assets/EinfList07.png)

## Vorteile Von Listen

1. Einfaches Einfügen von Knoten am Beginn/Ende in der Mitte der Liste. Hier wird das Element 25 zwischen 99 und 37 eingefügt:

![invert_dark](assets/EinfList04.png)

1. Einfaches Löschen von Knoten am Beginn/Ende in der Mitte der Liste. Der Zeiger des vorhergehenden Knotens wird angepasst, dann wird (ein Zeiger auf) das Element freigegeben (`free`):

![invert_dark](assets/EinfList05.png)

1. Einfaches Verschieben von Knoten innerhalb der Liste. Dazu müssen lediglich die Zeiger verändert werden:

![invert_dark](assets/EinfList06.png)

Werden die angeführten Operationen in Arrays gemacht, dann müssen zum Teil viele Elemente umkopiert werden. Hier werden lediglich einzelne, wenige [Pointer](C_Zeiger.md) angepasst.

## Traversieren

Mit Traversieren ist das Durchlaufen von Listen oder ähnlichen Strukturen gemeint. Wie erfolgt das:

- Begonnen wird das indem ein temporärer Zeiger `ptr` auf das erste Element gelegt wird - also dorthin wo `first` vom Listenkopf zeigt:  
![invert_dark](assets/EinfList08.png)
- Um auf das nächste Element zugreifen zu können, muss der Hilfs-Zeiger `ptr` auf das Element verschoben werden, welches durch das aktuelle Element mittels `next` erreicht werden kann:  
![invert_dark](assets/EinfList09.png)
- Dieser Vorgang kann solange wiederholt werden, bis die Anzahl der Elemente `hdr.size` durchlaufen wurde, bis `ptr` auf `NULL` verschoben wird oder bis `ptr` auf `hdr.last` verschoben wird.

In einer doppelt verketteten Liste kann entsprechend auch in die entgegengesetzte Richtung verschoben werden.

# Quellen

- [Data Structures: Linked Lists - YouTube](https://www.youtube.com/watch?v=njTh_OwMljA)