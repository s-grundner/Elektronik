---
tags:
  - Algorithmus
  - Algorithmus/Suchen
aliases:
  - Binäre Suche
subject: 
source: 
created: 18th April 2022
complexity: $\mathcal{O}(\log(n))$
---

# Binary Search

> [!info] Complexity: `$=dv.current().complexity`

Effizienter kann in einem bereits sortierten Feld mittels **Binärer Suche** gesucht werden:

- Vergleich des Schlüssels mit dem Element in der Mitte der Liste. Wenn Gleichheit: Ende der Suche - Element gefunden
- Falls der Schlüssel größer als der Wert des Elements in der Mitte ist: Wiederholen des [Algorithmus]({MOC}%20Algorithmus.md) mit der linken Feld-Hälfte
- Falls der Schlüssel kleiner als der Wert des Elements in der Mitte ist: Wiederholen des [Algorithmus]({MOC}%20Algorithmus.md) mit der rechten Feld-Hälfte
- Wenn das zu durchsuchende Feld kein Element mehr beinhaltet: Ende der Suche - Element nicht vorhanden.

Dieser [Algorithmus]({MOC}%20Algorithmus.md) lässt sich sehr einfach [rekursiv](Rekursion.md) lösen. Im Ungünstigsten Fall benötigt die Binäre Suche `O(log(n))` Vergleiche.

```c
/*
 * binsearch(int a[], int left, int right, int key) - durchsucht das
 *	Array a[] in den Grenzen left bis right nach dem Wert key.
 *	Die Position ist der Rueckgabewert, oder -1
 *	wenn key nicht gefunden wurde.
 */
int binsearch(int a[], int left, int right, int key) {
    int m;
    if(left > right) return -1;
    m = (left + right) / 2;
    if(key == a[m]) return m;
    if(key < a[m]) return binsearch(a, left, m - 1, key);
    return binsearch(a, m + 1, right, key);
}
```

Dieser [Algorithmus]({MOC}%20Algorithmus.md) kann noch verbessert werden: wenn wir im Telefonbuch suchen, dann beginnen wir wenn wir nach einem Namen suchen der mit Z beginnt wesentlich weiter hinten, als wenn wir nach einem Namen suchen der mit einem B beginnt. Man kann die Position eines Suchworts mittels Interpolation abschätzen und dort zu suchen beginnen. Diese Art der Suche wird dann als **Interpolationssuche** bezeichnet.

## [Python](../Python.md)

~~~ python
def binary_search(list, target):
	first = 0
	last = len(list) - 1
	
	while first <= last:
		midpoint = (first + last) / 2

		if list[midpoint] == target:
			return midpoint
			
		elif list[midpoint] < target:
			first = midpoint + 1
			
		else:
			last = midpoint - 1

	return None
~~~

## [Python](../Python.md) ([rekursiv](Rekursion.md))

~~~ python
def recursive_binary_search(list, target):
	if len(list) == 0:
		return False
	else:
		midpoint = len(list) // 2
		
		if list[midpoint] == target:
			return True
		else:
			if list[midpoint] < target:
				return recursive_binary_search(list[midpoint+1:], target)
			else:
				return recursive_binary_search(list[:midpoint], target)
~~~

