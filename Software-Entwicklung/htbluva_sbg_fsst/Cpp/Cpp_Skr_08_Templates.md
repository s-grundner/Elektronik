# 8 Templates

Als Einführung in das Thema Templates als Beispiel die Berechnung des Maximum zweier Werte für unterschiedliche Datentypen:

```c++
short Max(short x, short y){
	if (x < y) return y;
	else return x;
}
long Max(long x, long y){
	if (x < y) return y;
	else return x;
}
float Max(float x, float y){
	if (x < y) return y;
	else return x;
} 
```

Mittels Überladen der Max-Funktion kann eine Funktion durch unterschiedliche Aufrufparameter unterschieden werden. 

Mittels Templates (Vorlagen) kann das kürzer gelöst werden. Unterschieden werden Templates in Funktionen- und Klassen-Templates (siehe Unten). Verwendet werden Templates wenn Funktion oder Klassen mit Attributen für unterschiedliche Datentypen verwendet werden sollen (ohne sie für alle Datentypen neu schreiben zu müssen).

> Mit Templates können Typen von Funktionen, Klassen oder Variablen parametrisiert werden.

## Funktionen Templates

Für das obige Beispiel:

```c++
template <typename T>
T Max(T x, T y){
  if (x < y) return y;
  else return x;
}
```

In der ersten Zeile wird mit dem Schlüsselwort `template` festgelegt: die folgende Funktion ist ein Template und als T wird darin ein Typname (Datentyp) erwartet. An allen Stellen von T wird daher der gleiche Typ verwendet. Wird die Funktion also mit `Max(3, 2)` aufgerufen, dann wird innerhalb der Funktion überall wo das *T* ist, ein *int* eingesetzt. Damit ist die Funktion automatisch für sämtliche Datentypen vorhanden (aber nicht zwangsläufig sinnvoll). Für Strings (char *) wird hier die Adresse der ersten Zeichenkette mit der Adresse der zweiten Zeichenkette verglichen.

In vielen Fällen kann dieses Problem mit dem Überladen von Operatoren, für String hier etwa der "<" Operator gelöst werden.

Soll für einen speziellen Datentyp in ein Template eine eigene Logik eingebaut werden, funktioniert das mittels *Spezialisierung*:

```c++
template<> char *Max<char *>(char *str1, char *str2){
    if (strcmp(str1,str2) > 0) return str1;
    else return str2;
}
```

Diese Max-Funktion ist nur für c-String-Zeichenketten also T=char* gültig. Achtung: in `Max("abc","def")` ist "abc" ein `const char*`.

Die Verwendung von Template-Funktionen:

```c++
int m = Max<int>(3, 4);					// <int> waere hier nicht notwendig
float num = Max<float>(1.2, 7);	// <float> notwendig, dann wird 7 umgewandelt
float fl = Max(1.2, 4.5);
```

Welcher Typ verwendet werden soll, kann explizit mit `<float>` erzwungen werden. Notwendig ist das nur, wenn durch die Parameter nicht klar ist, welcher Datentyp gegeben ist, hier etwa mit `Max(1.2, 4)`.

> Funktions-Templates ermöglichen die Verwendung von Funktionen mit unterschiedliche Parameter-Datentypen.

## Klassen Templates

Analog zu Funktion-Templates können auch für Klassen Templates erstellt werden:

```c++
template <typename T> 		// absolut gleichwertig: template <class T>
class CStack{
    T *m_data;
    ....
  public:
    CStack(int size){
        m_data = new T[size];
        ....
    }
    bool Push(const T& val);
    bool Pop(T& val);
};
```

In diesem Beispiel wird eine Stack-Klasse für einen Stapelspeicher erstellt. Der Stapelspeicher soll für unterschiedliche Datentypen funktionieren. Der Typ des Wert-Speichers *m_data* kann beliebig sein. Beim Erstellen eines Stacks (Konstruktor) wird soviel Speicher reserviert, dass *size* viele Elemente gehalten werden können, unabhängig von der Größe eines Elements. Die Funktionen *Push*, *Pop* können ebenfalls immer die Typen aufnehmen für die der Stack erzeugt wird.

Verwendung dieser Klasse etwa für das Erzeugen eines *char*-Stacks:

```c++
CStack<char> charStack(50);
```

In der C++ Standardbibliothek sind eine Vielzahl solcher *Container* verfügbar. Häufig verwendet wird zum Beispiel eine verkettete Liste:

```c++
#include <list>

list<int> lst;
```

Werden Funktionen innerhalb der Klassendefinition implementiert (Header-Datei), dann wird das wie gewohnt gelöst, für eine äußere Implementierung muss das so aussehen (T muss explizit erneut bekannt gemacht werden):

```c++
template <typename T>
bool CStack<T>::Push(const T& val) {
  if (sIndex >= size) return false;
  pData[sIndex++] = val;
  return true;
}
```

Templates werden am einfachsten direkt im Header implementiert (ansonsten können unterschiedliche Varianten implementiert werden).

> Klassentemplates ermöglichen die Verwendung von Klassen mit unterschiedlichen Membervariablen-Datentypen. Eine sehr wichtige Anwendung sind Containerklassen.

Spezialisierung ist für Klassen-Templates ebenfalls möglich, allerdings nur für die komplette Klasse und nicht nur für manche Funktionen in der Klasse.

## Template-Parameter

Die Argumente die bei der Verwendung eines Templates mitzugeben sind (in den spitzen Klammern), werden als Template-Parameter bezeichnet. Es können entweder:

- Typen - *typename* oder *class* (siehe oben)

- Werte
  So wie Typen können einem Template auch Werte für die Erzeugung mitgegeben werden:
  
  ```c++
  template <typename T, int N>
  struct myStruc
  {
      T type[N];
  };
  ```
  
  Verwendung:
  
  ```c++
  myStruc<char,3> ms;
  ```
  
  Erzeugt eine Struktur mit einem 3 Elemente großen char-Array.

- Funktionen - es wird nicht näher darauf eingegangen, nur ein einfaches Beispiel:

  ```c++
  template <typename Key, typename V, bool(*cmp)(const Key&)>
  class map { ... };
  
  bool func(const string& x) { ... }		// Funktion mit Typ von cmp
  
  map<string, int, func> m;
  ```

- Templates - es wird nicht näher darauf eingegangen.

Für Template-Parameter können Standard-Parameter definiert werden, ähnlich wie für Funktions-Parameter auch.


## Fragen

- Erstellen Sie ein Template für die Funktion "und" die zur Addition von zwei Zahlen verwendet werden kann. Für Zeichenketten soll die Funktion die Zeichenketten aneinanderhängen
- Was ist der Unterschied zwischen einem Funktions-Template und einem Klassen-Template?

# Referenzen