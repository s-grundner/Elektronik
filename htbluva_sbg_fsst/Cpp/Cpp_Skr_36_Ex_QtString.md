# QString

 https://doc.qt.io/qt-5/qstring.html 

## Initialisierung

Aus Literal

```c++
QString str = "Hello";
```

Aus Char-Array

```c++
static const QChar data[4] = { 0x0055, 0x006e, 0x10e3, 0x03a3 };
QString str(data, 4);
```

Zugriff auf Zeichen

-  mittels **[]**-Operator:

```c++
QString str;
str.resize(4);

str[0] = QChar('U');
str[1] = QChar('n');
str[2] = QChar(0x10e3);
str[3] = QChar(0x03a3);
```

Zugriff auf Zeichen (mit Bereichsprüfung)

- **.at(pos)**

```c++
QString str;

str[0] = 'A';
str.at(1) = 'B';
str[2] = QChar('c');
str.at(3) = ('d');
```

Vergleich mittels ==, >=, <=:

```c++
if ((str == "abc") || (str >= "def")) {
  ...
}
```

## String Verändern

Vorne Einfügen: **str.prepend(vorStr)**,

Hinten Anhängen: **str.append(nachStr)**, oder +

Ersetzen: **str.replace(von, laenge, neuerStr)**:

```c++
QString str = "and";
str.prepend("rock ");     // str == "rock and"
str.append(" roll");        // str == "rock and roll"
str.replace(5, 3, "&");   // str == "rock & roll"
```

## Suchen

In String Suchen **int pos = str.indexof(str, startpos)**:

```c++
QString str = "We must be <b>bold</b>, very <b>bold</b>";
int j = 0;

while ((j = str.indexOf("<b>", j)) != -1) {
    qDebug() << "Found <b> tag at index position" << j;
    ++j;
}
```

## String Prüfen

Prüfung ob String mit Teilstring beginnt/endet:

```c++
bool beg = str.startsWith("go");
bool end = str.endWith("aus");
bool mid = str.contains("jim");
```

Prüfen ob String nichts enthält:

```c++
bool leer = str.isEmpty();	// leer wenn str = ""
```

Prüfen ob überhaupt was da ist:

```c++
bool nix = str.isNull();		// nix wenn str =
```

## Konvertierung

```c++
str.toUpper(); // in Kleinbuchstaben
str.toLower(); // in Groszbuchstaben
```

Nummern:

```c++
str.setNum(127); 			// 127 -> "127"
str.setNum(127,16);		// 127 wird nach Basis 16 (Hex) konv. -> "7F"
```

Nach c++ String:

```c++
QString qstr = "rock and roll";
std::string str = qstr.toStdString();	// QString -> string
```

Nach c-String kann anschließend mit .c_str() konvertiert werden.

## Aufteilen

```c++
QString str = "a,,b,c";

QStringList list1 = str.split(',');
// list1: [ "a", "", "b", "c" ]

QStringList list2 = str.split(',', QString::SkipEmptyParts);
// list2: [ "a", "b", "c" ]
```

Teilstrings:

```c++
QString qstr1 = qstr.left(len);
QString qstr2 = qstr.mid(pos, len);
QString qstr3 = qstr.right(len);
```

