# Sequentielles Suchen (2050)

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