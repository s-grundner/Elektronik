---
tags:
  - Algorithmus/Sortieren
  - Algorithmus
aliases:
  - Qsort
  - Quick-Sort
created: 19th August 2023
complexity: $\mathcal{O}(n\cdot\log(n))$
---

# Quick Sort

> [!info] Complexity: `$=dv.current().complexity`

Ein sehr häufig verwendeter Sortieralgorithmus ist der Quick-Sort (1960 C.A.R. Hoare). Der zusätzliche Speicherbedarf und der Aufwand für das Mischen beim Merge-Sort wird beim Quick-Sort vermieden. Hier wird das Feld ebenfalls in zwei Teile zerlegt und für beide Teile der Algorithmus angewandt - am Einfachsten lässt sich Quick-Sort daher [rekursiv](Rekursion.md) implementieren:

```c
int partition(int* array, int l, int r);

void quick_sort(int* array, int left, int right) {
    int p;

    if(left < right) {
        p = partition(array, left, right);
        quick_sort(array, left, p-1);
        quick_sort(array, p+1, right);
    }
}
```

durch `quick_sort(arr, 0, n-1);` wird das n-Elemente große Feld arr sortiert. Die Funktion `partition(int* array, int l, int r)` liefert einen Teilungspunkt im Feld und ordnet das Feld array dabei so um, sodass gilt:

- array[left] .. array[p-1] sind kleiner als array[p]
- array[p+1] .. array[right] sind größer als array[p]

 Wie gut der Algorithmus funktioniert hängt sehr stark von der partition-Funktion ab. Eine mögliche (einfache) Implementierung wird im Folgenden dargestellt:

1. Wahl eines *Pivot*-Elements (Vergleichselement, key) `k = array[left]`
2. Setzen eines Linken und Rechten Zeigers `l = array[left+1]` , `r = array[right]`
3. Verschieben des linken Zeigers nach Rechts bis gilt l > k und des rechten Zeigers nach Links bis gilt r < k.
4. Weitermachen nur wenn linker Zeiger noch Links vom rechten Zeiger.
5. Vertauschen der Elemente l und r
6. Wiederholen von 2 beginnend
7. Nun Vertauschen von k und l

> [!EXAMPLE] Beispiel
>
>```txt
> 10   7  16   4   9  18  -3   8  12
>  k   l                           r      key = 10, --> l nach rechts und r nach links
> 
> 10   7  16   4   9  18  -3   8  12
>  k       l                   r          l > key und r < key --> Elemente bei l und r vertauschen
> 
> 10   7   8   4   9  18  -3  16  12
>  k       l                   r          8 und 16 vertauscht --> l nach rechts und r nach links
> 
> 10   7   8   4   9  18  -3  16  12
>  k                   l   r              l > key und r < key --> Elemente bei l und r vertauschen
> 
> 10   7   8   4   9  -3  18  16  12
>  k                   l   r              -3 und 18 vertauscht --> l nach rechts und r nach links
> 
> 10   7   8   4   9  -3  18  16  12
>  k                      lr              l == r --> key mit (l-1) tauschen, ist die fin. Pos.
> __________________________________                                               
> -3   7   8   4   9  10  18  16  12
>  k   l           r                      --> Neubeg. mit Seite links von einsortierten Elem. (10)
> 
> -3   7   8   4   9  10  18  16  12
>  k  lr                                  l == r --> key auf (l-1) setzen, das ist die fin. Pos.
> __________________________________
> -3   7   8   4   9  10  18  16  12
>      k   l       r                      --> Neubeg. mit Seite rechts von einsort. Elem. (-3)
> 
> -3   7   8   4   9  10  18  16  12
>      k   l   r                          l > key und r < key --> Elemente bei l und r vertauschen
> 
> -3   7   4   8   9  10  18  16  12
>      k   l   r                          4 und 8 vertauscht --> l nach rechts und r nach links
> 
> -3   7   4   8   9  10  18  16  12
>      k      lr                          l == r --> key auf (l-1) setzen, das ist die fin. Pos.
> 
> -3   4   7   8   9  10  18  16  12
>      k      lr                                 
> 
> ...
> ```

## Implementierung eines Suchschritts in C:

```c
int partition(int* array, int l, int r) {
    int i, j, t, key;

    /* Schluessel - 1.Element */
    key = array[l];
    i=l+1;
    j=r;

    /* Schleife fuer Elemente von links und rechts */
    for(;;) {
        /* Elemente bis zum ersten der rechten Haelfte durchlaufen */
        while( array[i] <= key && i < r )
            i++;

        /* Elemente bis zum ersten der linken Seite durchlaufen */
        while( array[j] >= key && j > l )
            j--;

        /* Abbruch:  */
        if (i >= j) break;

        /* beide vertauschen */
        t = array[i];
        array[i] = array[j];
        array[j] = t;
    }

    /* letztes Element der rechten Haelfte mit dem ersten Element vertauschen */
    t = array[j];
    array[j] = array[l];
    array[l] = t;

    return j;
}
```

Kennzeichen:

- Zu sortierendes Feld wird durch den Algorithmus in kleinere Bereiche geteilt. Daher ist Quick-Sort für große Datenmengen geeignet.
- Prinzip Teile und Herrsche (Divide and Conquer)
- Mischen (Merge) wird hier vermieden. Die Zerlegung erfolgt anhand von Pivot-Elementen (Key)
- Laufzeit im Mittel $O(n\cdot log(n))$ (wenn die Partitionierung zwei annähernd gleich große Teile erzeugt) und im schlechtesten Fall $O(n^2)$. Die Laufzeit hängt sehr stark von der Wahl des Pivot-Element (key) ab. Beispiel: wenn als Pivot-Element das erste Teilelement gewählt wird und das Feld bereits sortiert ist, dann muss die Partitionierung n mal durchlaufen werden.
- Instabiles Sortierverfahren

## C-Standard-Bibliotheksfunktion qsort

In der C-Standard-Bibliothek wird die Funktion qsort (Quick Sort) angeboten. Da diese beliebige Felder sortieren können soll wird mittels void-Zeiger gearbeitet. Um zwei abstrakte Elemente miteinander vergleichen zu können ist der Funktion eine Vergleichsfunktion zu übergeben:

```c
void qsort( void * array, size_t elementCount, size_t size, int (*compare)(const void *, const void *) );
```

- array: Zeiger auf das erste Element des zu sortierenden Arrays
- elementCount: Anzahl der Elemente im Array 
- size: Größe eines einzelnen Elementes (in Bytes)
- compare: Vergleichsfunktion, um zwei Elemente miteinander zu vergleichen. 

Die Vergleichsfunktion (Parameter compare) muss zwei Aufrufparameter haben, die beiden Werte die verglichen werden sollen und als Rückgabewert einen Integer. Der Integer muss einen Wert kleiner Null, wenn der erste Parameter größer als der zweite Parameter ist, er muss einen Wert größer Null, wenn der erste Parameter kleiner als der zweite Parameter ist und er muss Null annehmen, wenn die Werte der beiden Parameter gleich sind.

Beispiel:

```c
int compare(const void * a, const void * b) {
    return ( *(int*)a - *(int*)b );
}
```

für numerische Integer-Felder. Im Funktionsaufruf:

```c
... qsort(......., compare);
```

# Referenzen

- C-Bibliotheksfunktion qsort:
	- <https://www.tutorialspoint.com/c_standard_library/c_function_qsort.htm>
