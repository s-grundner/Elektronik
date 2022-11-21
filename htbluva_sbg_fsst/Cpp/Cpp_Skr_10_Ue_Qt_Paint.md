# QT Zeichenprogramm

## Icon (055)

Für Symbole auf z.B. Buttons werden Grafiken am besten als Resource eingebunden. Dazu wird dem Projekt eine Resource hinzugefügt Qt->Qt Ressourcen-Datei. Dort eine existierende Datei hinzufügen. Ab hier ist die Grafik als Ressource verfügbar.

## MausMovement auf Widget

In vielen Fällen muss eine Mausbewegung nur über einem expliziten Widget erkannt werden. Dabei kann häufig die Movement-Erkennung über dem Fenster komplett deaktiviert werden und durch weitere Events über einem Widget ausgewertet werden:

```c++
MainWindow-Konstruktor:
this->setMouseTracking(false);  // unbedingt vor dem GUI-Setup
```



## 

## MausMovement (055)

Mit der `MouseMovement`-Methode werden Widgets die sich überlagern (mit dem Mousemovement-Event) keine Events (Button-Click oder ähnliches) mehr auslösen.

Daher funktioniert es einfacher mit einem Eventfilter:

```c++
bool MainWindow::eventFilter(QObject *obj, QEvent *event) {
  if (event->type() == QEvent::MouseMove) {
    if (state > 0) {
      QMouseEvent *mouseEvent = static_cast<QMouseEvent*>(event);
      statusBar()->showMessage(QString("Mouse move (%1,%2)").arg(mouseEvent->pos().x()).arg(mouseEvent->pos().y()));
    }
  }
  return false;
}
```

Der Event-Filter wird dann z.B. im Konstruktor installiert:

```c++
...
qApp->installEventFilter(this);
...
```

## Maus-Click (055)

Das Klick-Event auf einem Widget funktioniert einfacher als das Movement:

```c++
void MainWindow::mousePressEvent(QMouseEvent *event) {
	qDebug() << event->pos();
}
```

## Toolbar/Menüleiste (055)

Um in eine Toolbar Elemente einzufügen werden diese Elemente zuerst im **Aktionseditor** definiert. Anschließend wird das erzeugte Action-Element auf die Toolbar (oder auch Menüleiste) gezogen. Um einen Event-Handler zu verknüpfen wird im Aktionseditor mittels Context-Menü *Slot anzeigen* ausgewählt und das entsprechende Event ausgewählt. Ein und die selbe Action kann in eine Toolbar und eine Menüleiste plaziert werden.