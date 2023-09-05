# Friends

Auf *private* Daten einer Klasse kann nur von innerhalb der Klasse selber zugegriffen werden. Ähnlich kann auf *protected* Daten nur aus der Klasse selber oder einer davon abgeleiteten Klasse zugegriffen werden.

In C++ gibt es davon eine dem widersprechende Ausnahme:

> Wenn eine fremde Funktion/Klasse als **friend** definiert ist kann sie von außerhalb direkt auf die inneren Daten zugreifen unabhängig von der obigen Aussage.
>
> Als Friend darf eine Funktion nur innerhalb der Daten-preisgebenden Klasse definiert sein.

>[!EXAMPLE] 

```cpp
class Cls1 {
    friend class Cls2;
    public: Cls1() {num = 10;};
    private: int num;
};
// ----
class Cls2 {
    public: void ausgabe(Cls1 c1) {std::cout << "Private: " << c1.num << std::endl;};
};
// ----
void main() {
    Cls1 c1;
    Cls2 c2;
    c2.ausgabe(c1);
}
```

Ein Friend muss zur Kompilierungszeit nicht bekannt sein, so kann eine noch nicht definierte Klasse/Funktion als Friend angeführt werden, der Compiler prüft nicht auf Korrektheit. Eine Friend Funktion wird wie im Prototyp angeführt: `friend int main();`.