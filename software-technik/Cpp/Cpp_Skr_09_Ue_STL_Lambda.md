# 11 Lambda

In C/C++ können Pointer auf Funktionen definiert und verwendet werden. Damit können Funktionen an Funktionen übergeben werden, von uns verwendet werden etwa die Library-Quicksort-Funktion für die eine Funktion übergeben wird.

Für  solche Fälle werden Funktionen definiert die oft nur an einer Position im Programm verwendet werden. Häufig sind diese Funktionen auch noch sehr einfach und kurz. Durch die Definition der Funktion kann der Code dadurch schlechter lesbar werden. Mit dem Funktions-Header und dadurch dass die Funktion an einem anderem Ort definiert wird, sinkt die Verständlichkeit des Codes. Für diese Fälle gibt's die **Lambda**-Ausdrücke.

Mit Lambda-Ausdrücken wird die Definition und Implementierung einer Funktion in einen kurzen Ausdruck gepackt. Da die Funktion (meistens) nur an einer Stelle aufgerufen wird, kann sie auch ohne Funktions-Namen auskommen.

Beispiel: die einfache Funktion *printHello* gibt einen einfachen Text aus:

```c++
otherFunc(void(*func)()) {...}
...
void printHello() {
  std::cout << "Hello World!" << std::endl;
}
...
otherFunc(printHello);		// die Funktion printHello wird mitgegeben
```

und wird der Funktion *otherFunc* als Parameter mitgegeben. Schon in dieser Darstellung ist ersichtlich, dass sich der Code über mehrere Bereiche verteilt. Mittels Lambda:

```c++
otherFunc(void(*func)()) {...}
...
otherFunc([](){std::cout << "Hello World!" << std::endl;});
```

Klar ersichtlich: wesentlich Kürzer und vor allem: der kurze Code wird direkt dort eingebaut wo er aufgerufen wird -> es ist sofort (vor Ort) ersichtlich was passiert.

## Aufbau

```
[capture](parameter)->ret{body}
```

- [] - capture: in dieser Klammer können Variable für die *Funktion* verfügbar gemacht werden:
  - [a, &b] Variable als Kopie (a) /Referenz (b)
  - [&] sämtliche verfügbare Symbole sind als Referenz verfügbar
  - [=] sämtliche verfügbare Symbole sind als Kopie verfügbar
  - [] es wird nichts mitgegeben
- () - Parameter: Parameter ganz genau wie in Funktionen 
- {} - Funktionskörper: Definition der Funktion
- -> Rückgabetyp: hier kann der Typ des Rückgabewerts angegeben werden. Wenn nichts zurückgegeben wird (*void*-Funktion) dann kann dieser Ausdruck entfallen. Wenn er nicht angeführt wird und die Funktion trotzdem etwas zurückgibt, dann wird der Typ automatisch vom *Return*-Wert abgeleitet.

Wiederverwenden eines Lambda-Ausdrucks:

```c++
#include <functional>
...
function<void(int)> lbd = [](int num){cout << num;};
lbd(3);
```

oder kurz:

```c++
auto lbd = [](int num){cout << num;};
```

