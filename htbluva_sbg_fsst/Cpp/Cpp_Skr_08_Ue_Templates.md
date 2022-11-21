# 8 Templates - Übungen

## Funktionen-Template Max

Erstellen Sie ein Funktionen-Template **Max** zum Ermitteln des größeren von zwei Werten. Dabei sollen auch C-Strings funktionieren. Der größere Wert ist dabei der im Alphabet spätere.

```c++
Maximum(2, 3) = 3
Maximum(1.200000, 4.300000) = 4.300000
Maximum(1.200000, 7) = 7.000000
Maximum("Ziel", "Anfang") = "Ziel"
```

## Swap (067)

Erstellen Sie eine Funktion für den Tausch von Werten zweier Variable:

```c++
int a = 3, b = 4;

cout << "a = " << a << " b = " << b << endl;
swp(a, b);
cout << "a = " << a << " b = " << b << endl;

char *c = "Number1";
char *d = "Number2";

cout << "c = " << c << " d = " << d << endl;
swp(c, d);
cout << "c = " << c << " d = " << d << endl;
```

Die Ausgabe:

```
a = 3 b = 4
a = 4 b = 3
c = Number1 d = Number2
c = Number2 d = Number1
```

Bemerkenswert: c und d sind (char *), deren Werte damit nicht veränderbar. Bei diesem Datentyp wird der Pointer ausgetauscht.

## Klassen-Template CMyArr (065)

Bei den Arrays hat uns immer furchtbar gestört, dass der Index mit 0 beginnt, daher benötigen wir einen neuen Typen:

```c++
int main() {
    CMyArr<int,3> myArr;	// Array Groesse 3 Elemente

    cout << "davor:  [";
    for (int i = 1; i <= myArr.len; i++) {
        cout << myArr[i] << " ";
    }
    myArr[2] = 4;			// Schreiben ins 2te Element (Erstes ist 1)
    cout << "]\ndanach: [";
    for (int i = 1; i <= myArr.len; i++) {
        cout << myArr[i] << " ";
    }
    cout << "]\n";

    return 0;
}
```

Erstellen Sie die CMyArr-Klasse.

## Klassen-Template CStack (066)

Erstellen Sie ein für einen Stack-Speicher ein Klassen-Template **CStack** um den Stack für unterschiedliche Datentypen verfügbar zu machen.

**main**:

```c++
int main() {
    CStack<int> s1;

    for (int i = 0; i < 10; i++) {
        cout << i << " --> auf den Stack\n";
        s1+=i;          // s1.Push(i)
    }

    int a;
    while (s1.Pop(a))
        cout << "\nrunter vom Stack -->" << a;
    return 0;
}
```

Tipp: zusätzlicher Speicher mit (void *)realloc(void *, int) ; Destruktor nicht vergessen.

Das Programm liefert:

```c++
0 --> auf den Stack
1 --> auf den Stack
2 --> auf den Stack

runter vom Stack -->2
runter vom Stack -->1
runter vom Stack -->0
```

