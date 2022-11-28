# 2 Suchen in Feldern

Bei der Suche nach einem Element wird in einem Feld nach einem Wert gesucht . Dieser Wert wird als **Schlüssel** bezeichnet.

## Sequentielles Suchen (2050)

In einem Feld kann ein Schlüssel gesucht werden, indem im Feld aufsteigend, vom ersten Element beginnend, mit dem Suchwert verglichen wird. Dieses **sequentielle Suchen** benötigt für N Elemente im Feld:

- N Vergleiche wenn das gesuchte Element nicht enthalten ist
- Im Durchschnitt N/2 Vergleiche für eine erfolgreiche Suche

```c
/*
 * seq_search(int a[], int n, int k) - durchsucht das Feld a[]
 *	(mit n Elementen) nach dem Schluessel k. Der
 *	Rueckgabewert ist die Position im Feld oder -1, wenn nicht
 *	vorhanden.
 */
int seq_search(int a[], int n, int k){
    int i;
    for( i=0; i<n; i++ ) {
        if( a[i] == k ) return i;    // Found
    }
    return -1;                       // Not Found
}
```

## Binäre Suche

Effizienter kann in einem bereits sortierten Feld mittels **Binärer Suche** gesucht werden:

- Vergleich des Schlüssels mit dem Element in der Mitte der Liste. Wenn Gleichheit: Ende der Suche - Element gefunden
- Falls der Schlüssel größer als der Wert des Elements in der Mitte ist: Wiederholen des Algorithmus mit der linken Feld-Hälfte
- Falls der Schlüssel kleiner als der Wert des Elements in der Mitte ist: Wiederholen des Algorithmus mit der rechten Feld-Hälfte
- Wenn das zu durchsuchende Feld kein Element mehr beinhaltet: Ende der Suche - Element nicht vorhanden.

Dieser Algorithmus lässt sich sehr einfach rekursiv lösen. Im Ungünstigsten Fall benötigt die Binäre Suche lg(N) Vergleiche.

```c
/*
 * binsearch(int a[], int left, int right, int key) - durchsucht das
 *	Array a[] in den Grenzen left bis right nach dem Wert key.
 *	Die Position ist der Rueckgabewert, oder -1
 *	wenn key nicht gefunden wurde.
 */
int binsearch(int a[], int left, int right, int key) {
    int m;
    if( left <= right ) {
        m = (left+right)/2;
        if( key == a[m] ) return m;
        else if( key < a[m] ) return binsearch(a, left, m-1, key);
        else return binsearch(a, m+1, right, key);
    }
    return -1;
}
```

Dieser Algorithmus kann noch verbessert werden: wenn wir im Telefonbuch suchen, dann beginnen wir wenn wir nach einem Namen suchen der mit Z beginnt wesentlich weiter hinten, als wenn wir nach einem Namen suchen der mit einem B beginnt. Man kann die Position eines Suchworts mittels Interpolation abschätzen und dort zu suchen beginnen. Diese Art der Suche wird dann als **Interpolationssuche** bezeichnet.

## C-Standard-Bibliotheksfunktion bsearch

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

Hier wird a als void*-Zeiger übergeben, das ist die Anforderung an die Funktion von bsearch. Um damit arbeiten zu können wird innerhalb der Funktion gecastet: `(int *)a` . Damit wird geklärt: a ist ein Zeiger auf einen Integer. Mit ` * (int * )a`  wird auf den Wert auf welchen der Int-Zeiger zeigt zurückgegeben.

Im Funktionsaufruf:

```c
... bsearch(......., compare);
```

## Pointer auf Funktionen

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

## Referenzen

- Sequentielle Suche:

  https://de.wikibooks.org/wiki/Algorithmen_und_Datenstrukturen_in_C/_Lineare_Suche

- Binäre Suche:

  https://de.wikibooks.org/wiki/Algorithmen_und_Datenstrukturen_in_C/_Bin%C3%A4re_Suche

- C-Bibliotheksfunktion bsearch:

  https://www.tutorialspoint.com/c_standard_library/c_function_bsearch.htm

## Fragen

- Welche beiden grundsätzlichen Ansätze der Suche in Feldern kennen Sie?
- Welche Bedingung muss erfüllt sein, damit die binäres Suche angewandt werden kann?
- Wie groß ist die durchschnittliche und die maximale Suchdauer bei der sequentiellen Suche?

