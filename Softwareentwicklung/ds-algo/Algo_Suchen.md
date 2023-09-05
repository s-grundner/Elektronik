---
tags: ["Algorithmus"]
aliases: []
created: 29th November 2022
---

# Suchen in Feldern/Arrays

Bei der Suche nach einem Element wird in einem Feld nach einem Wert gesucht . Dieser Wert wird als **Schlüssel** bezeichnet.

[Sequential Search](Sequential%20Search.md)

[Binary Search](Binary%20Search.md)

## C-Standard-Bibliotheksfunktion Bsearch

Die Binäre Suche ist auch als Funktion in der c-Standard-Bibliothek verfügbar:

```c
void *bsearch(const void *key, const void *base, size_t nitems, size_t size, int (*compare)(const void *, const void *))
```

Die Funktion bietet eine binäre Suche für beliebige Feldtypen, daher sind die Felder (sind ja Zeiger) vom Typ `void *`. Die Parameter der Funktion:

- key: ein Zeiger auf den Schlüssel nach dem gesucht wird.
- base: Zeiger auf das erste Element im Feld in dem gesucht wird.
- nitems: Anzahl der Elemente im Feld.
- size: Größe eines einzelnen Feldelements in Bytes. Für Strukturen im Feld die Größe der Struktur.
- compare: Name der Funktion die zwei Elemente vergleicht (siehe unten).
- Rückgabewert: Zeiger auf das Element im Feld auf welches der Schlüssel zutrifft oder NULL, wenn die Suche keinen Erfolg hatte.

Die Vergleichsfunktion (Parameter compare) muss zwei Aufrufparameter haben, die beiden Werte die verglichen werden sollen und als Rückgabewert einen Integer. Der Integer muss einen Wert kleiner Null, wenn der erste Parameter größer als der zweite Parameter ist, er muss einen Wert größer Null, wenn der erste Parameter kleiner als der zweite Parameter ist und er muss Null annehmen, wenn die Werte der beiden Parameter gleich sind.

Beispiel für numerische Integer-Felder:

```c
int compare(const void * a, const void * b) {
   return ( *(int*)a - *(int*)b );
}
```

Hier wird a als void*-Zeiger übergeben, das ist die Anforderung an die Funktion von bsearch. Um damit arbeiten zu können wird innerhalb der Funktion gecastet: `(int *)a` . Damit wird geklärt: a ist ein Zeiger auf einen Integer. Mit ` * (int * )a` wird auf den Wert auf welchen der Int-Zeiger zeigt zurückgegeben.

Im Funktionsaufruf:

```c
... bsearch(......., compare);
```

## Pointer Auf Funktionen

In C können nicht nur Variable durch Pointer angesprochen werden, sondern auf Funktionen. 

```c
#include<stdio.h>

long pow2(int n) {		// Funktion 1
    return n * n;
}

long pow3(int n) {		// Funktion 2
    return n * n * n;
}

int main() {
    long (*pow) (int);		// Allgemein: Funktion mit long und int

    int num = 3;
	
    pow = pow2;
    printf("%d hoch 2: %d\n", num, pow(num));

    rechne = pow3;
    printf("%d hoch 3: %d\n", num, pow(num));

    return 0;
}
```

Hier werden zwei Funktionen definiert, die den gleichen Rückgabewert-Typen und den gleichen Aufrufparameter-Typen haben. Damit können sie mittels eines Zeigers angesprochen werden.

- Dieser Zeiger bekommt einen Namen *rechne* (beliebig)
- Dieser Zeiger hat einen Aufrufparameter *int* und einen Rückgabewert *long* 

- Bevor eine der Funktionen mittels Pointer aufgerufen werden kann muss festgelegt werden welche der Funktionen verwendet werden soll: `pow = pow2;` .
- Der Aufruf erfolgt wie bei anderen Funktionen: `pow(3)` hier mit einem int-Parameter und liefert einen long-Wert zurück.

Für das Beispiel in bsearch: 

```c
void *bsearch(const void *key, const void *base, size_t nitems, size_t size, int (*compare)(const void *, const void *))
```

der Zeiger auf die Funktion heißt *compare*. Dieser Name ist nur wichtig für den Progammierer der die bsearch-Funktion programmiert. Die Aufrufparameter der Funktionen die durch compare aufgerufen werden sind zweimal *const void \**. Der Rückgabewert ist ein *int*.

# Referenzen

- [Sequentielle Suche](https://de.wikibooks.org/wiki/Algorithmen_und_Datenstrukturen_in_C/_Lineare_Suche)
- [Binäre Suche](https://de.wikibooks.org/wiki/Algorithmen_und_Datenstrukturen_in_C/_Bin%C3%A4re_Suche)
- C-Bibliotheksfunktion [bsearch](https://www.tutorialspoint.com/c_standard_library/c_function_bsearch.htm)
