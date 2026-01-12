---
tags:
  - C
  - C/struct
aliases: []
keywords:
  - C-Programmiersprache
subject:
  - VL
  - Networked Embedded Systems
semester: WS25
created: 29th November 2022
professor:
release: false
title: c-structs
---

# Structs

A struct is a compound data object that allows you to group variables of different data types under a single name/variable. The data types can be the same, but can also be different. It can be tought as a private or user defined data type. We can also declare the internal structure of the struct via a template. A tag to be associated with it in the first line can also be assigned. The reserved keyword "struct" is used. With "." you can select between the members of a struct as: "now.time". The members of a struct can also be union.



> Strukturen fassen Daten zu einer Einheit zusammen.

## Definition

Die Struktur fasst die Daten Tag, Monat, Jahr und Monatsname in einen Datenverband Datum zusammen:

```c
struct datum {
    int tag;
    int monat;
    int jahr;
    char mon_name[4];
};
```

Mit dieser Struktur können Variable erstellt werden:

```c
struct datum heute;
```

Mit *struct datum* wird wie mit einem Datentyp gearbeitet. Von diesem Typ können Felder angelegt werden, Funktionsparameter übergeben und zurückgegeben werden oder Zeiger definiert werden.

 - Man bezeichnet hier **datum** als den Strukturtyp.
 - Die Elemente der Struktur (**tag**…) werden die **Komponenten der Struktur** genannt.
 - Die Variable **heute** wird als eine **Strukturvariable** bezeichnet.

Variable können auch direkt nach der Struktur-Definition definiert werden:

```c
struct datum {
  ...
} heute, morgen;
```

Wird keine Variable direkt definiert, muss aus diesem Grund ein Semikolon der geschwungene Klammer folgen (sonst kann der folgende Ausdruck als Variablenname interpretiert werden).

Da der Typ **struct datum** "sperrig wirkt" ist es üblich einen neuen Typ zu definieren:

```c
typedef struct datum TDATUM;
```

Der Ausdruck **struct datum** kann dadurch im folgenden immer durch TDATUM ersetzt werden (gesperrt groß schreiben mit T für Type beginnen).

Bsp.:

```c
TDATUM heute;			// Struktur-Variable
TDATUM kalender[365];	// Feld mit Strukturvariable
TDATUM *ptr;			// Zeiger auf Strukturvariable
```

## Zugriff auf die Komponenten

Um auf die Strukturkomponenten einer Strukturvariable zugreifen zu können gibt es den Punktoperator:

```c
heute.tag = 1;
int m = heute.monat;
```

## Zeiger auf Strukturen

```c
TDATUM heute, *ptr;
ptr = &heute;
```

Das Arbeiten mit Zeigern funktioniert analog zu einfachen Datentypen. Ein Zugriff auf die Komponenten funktioniert daher auch über den *-Operator:

```c
int j = (*ptr).jahr;
```

Für diesen Zugriff gibt es einen gleichwertigen Operator, den Pfeiloperator:

```c
inf j = ptr->jahr;
```

## Strukturen in Strukturen

Strukturen dürfen Komponenten von Strukturen sein:

```c
struct person {
    char name[40];
    TDATUM gebDatum;
};
```

## Fragen

- Erkläre anhand eines Beispiels die Begriffe Strukturvariable, -Komponente und -Typ.
- Wie kann auf eine Komponente einer Strukturvariable zugegriffen werden?
- Wie kann auf eine Komponente eines Zeigers auf eine Strukturvariable zugegriffen werden (2 Möglichkeiten)?
