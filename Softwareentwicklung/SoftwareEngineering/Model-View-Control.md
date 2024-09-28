---
tags:
  - Software-Engineering/DesignPattern
aliases:
  - Model View Control
  - MVC
keywords: 
subject:
  - VL
  - Softwareentwicklung 2
semester:
  - SS24
  - B2
created: 23. März 2024
professor:
---

# Model-View-Control MVC

Das MVC-Pattern ist kein [Design Patterns](Entwurfsmuster.md) der GoF, allerdings hat es sich für GUI-Anwendungen sehr bewährt.
Dabei geht es darum graphische Kontrollelemente von der [Logik](../../Mathematik/Logik/Aussagenlogik.md) zu trennen:

 ![invert_dark](Pattern_MVC.png) 

Beispielhaft soll mittels einer Datenbankanwendung Listen in einer Applikation dargestellt werden. In einer ersten Implementierung würde das ein ständiges Wechselspiel von GUI-Events und Datenbankzugriffen zur Folge haben. Ein Problem entsteht, wenn die Anwendung auf einem anderem System (Linux, Windows, Mobil, Desktop …) laufen soll, dann muss die komplette Anwendung neu erstellt werden. Aber genauso wenn die Daten eine andere Struktur aufweisen.

Aus diesem Grund wird der angezeigte Teil (**View**) komplett vom Datensatz (**Modell**) getrennt. Damit die Daten in der View und im Modell gleich sind wird ein **Controller** benötigt, der kümmert sich um das Kopieren der Daten View<->Modell. Das kann als Ursache eine Veränderung der Datenquelle für das Modell haben (Datenbankzugriff …) oder ein Verändern der Daten auf der GUI-Seite (View) etwa durch eine Eingabe o.ä.

Vorteile:

- Änderungen in der Programmlogik haben keine Auswirkung auf die graphische Darstellung und können unabhängig erfolgen.
- Die Darstellung ist unabhängig von der (eventuell komplexen) [Logik](../../Mathematik/Logik/Aussagenlogik.md) und kann unabhängig von den anderen Teilen verändert werden.

Dieses Konzept ist nach außen in Abwandlungen realisiert, so zum Beispiel in Qt-C++, Java-Swing oder C#-WPF (MVVM). Dort ist jeweils nur ein Modell für die GUI-Klasse (View) verfügbar, der Controller ist im View integriert.

## [Qt](../../Cpp/Qt.md)-ListView

Allgemein hat es ja nicht viel Sinn dieses Konzept für ein einfaches Textfeld zu verwenden. Der Vorteil ist erst dann gegeben wenn es sich um größere Datenmengen handelt, für [Qt](../../Cpp/Qt.md) gibt es so etwa ein List-View (*QListView*) für die Darstellung einer Liste von Daten:

- Zuerst wird auf einem UI ein *View* *QListView* mit Namen *lstNamen* erstellt

- Als Modell wird eine Modell-Variable angelegt (zum Beispiel in *mainwindow.h*):

```cpp
QStringListModel *model;           // Modell
```

- Das *lstNamen-QListView* wird mit dem *model*-Modell verknüpft (z.B. im Konstruktor):

```cpp
model = new QStringListModel(this);
ui->lstNamen->setModel(model);     // ListView--Element vom GUI
```

- Damit können im Modell Elemente verändert werden:

```cpp
model->insertRows(0,3);						// 3 Elemente an Pos 0 einfügen
model->setData(model->index(0), "Hans");	// erstes Element
model->setData(model->index(1), "Fritz");
model->setData(model->index(2), "Klaus");
```

  Diese Veränderungen werden automatisch im GUI in der verknüpften Liste angezeigt.

In [Qt](../../Cpp/Qt.md) gibt es einige Elemente bei denen das möglich ist wie etwa auch in einer ComboBox. Nicht alle Elemente lassen es zu dass ein Modell verknüpft wird (sind dann private).

Vorteil: im Programm muss man sich nur um das Modell kümmern, dargestellt werden die Daten automatisch.

## Java Swing

```java title='Java Swing Application'
JFrame window = new JFrame();

window.setDefaultCloseOperation(WindowConstants.);

```

# Theorie Fragen

Was versteht man unter einem objekt-orientiertem Framework?
?

---

Erläutern Sie den Unterschied zwischen einer Klassenbibliothek und einem objekt-orientiertem Framework.
?

---

Charakerisieren Sie die Aufgaben der drei Teile der MVC-Architektur:
- Model
- View
- Controller
?

---

Was will man mit dem Entwurfsmuster Beobachter (Observer Pattern) erreichen?
?

---

Beschreiben Sie das allgemeine Schema des Entwurfsmusters Beobachter (Observer Pattern) umgesetzt. Erläutern Sie kurz diese drei Teile des MVC-Musters
?

---

In Java werden Ereignisse durch drei Elemente implementiert:
- Listener
- Event-Objekt
- Ereignisquelle.
Beschreiben Sie kurz, wie diese drei Elemente in Java implementiert werden müssen.
?

---

Das MVC-Muster wird bei Swing-Applikationen
- durch eine Implementierung eines Modells
- durch ein Listener-Interface und
- durch eine EventObject-Klasse
?