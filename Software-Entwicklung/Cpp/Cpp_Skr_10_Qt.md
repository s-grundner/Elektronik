# QT <Cute>

QT ist ein Framework für die Entwicklung von C++ Programmen. Es bietet eine Vielzahl an hilfreichen Bibliotheken und einen GUI-Builder QT-Creator der für viele Betriebssysteme optimiert ist.

## Signals/Sots (056)

Für die Kommunikation zwischen Programm-Komponenten wird in Qt das Signal-Slot-Konzept umgesetzt (https://de.wikipedia.org/wiki/Signal-Slot-Konzept). Dabei können Signale den Aufruf von Funktionen (Slots) auslösen -> ereignisgesteuerter Programmfluss.

Um Signale/Slots verwenden zu können muss die entsprechende Klasse von *QObject* ableiten und als erstes das Makro *Q_OBJECT* aufrufen:

```c++
#include <QObject>

class myClass : public QObject {
  Q_OBJECT
  ...
```

Eine Klasse die ein Signal auslöst muss in der Klassendefinition im Header eine *signals*-Sektion haben:

```c++
signals:
  void getPos();
```

dieses Signal kann dann mittels *emit* ausgelöst werden:

```c++
emit getPos();
```

Damit ein Signal den Aufruf einer Funktion auslöst muss die aufzurufende Funktion entsprechend als *Slot* definiert werden:

```c++
private slots:
    void setPos();
```

und implementiert sein:

```c++
void otherClass::setPos() {
    qDebug() << "Slot aufgerufen";
} 
```

Um zu definieren welcher Slot durch welches Signal ausgelöst wird, müssen die Slots und Signals verbunden werden:

```c++
connect(myClass, SIGNAL(getPos()), otherClass, SLOT(setPos()));
```

Gerade in der GUI-Implementierung wird dieses Konzept intensiv eingesetzt - wenn etwa eine Schaltfläche mit einer Funktion verbunden wird, dann wird diese Funktion in einen slot-Bereich definiert. Der Name für diese Slot-Funktionen ist vorgegeben. Für einen Push-Button etwa:
on_myButton_clicked() -> *on* und *clicked* Sagen: wenn der Button geklickt wird. *myButton* muss genau so lauten wie der Name der Schaltfläche.

### Sender

Wenn ein Slot von unterschiedlichen Objekten ausgelöst werden kann, dann kann mittels Sender() auf dieses Objekt zugegriffen werden:

```c++
void otherClass::setPos() {
    cls *c = (cls*)Sender();
    qDebug() << "Slot aufgerufen";
} 
```

Wenn der Auslöser von der Klasse *cls* ist, dann wird mit Sender ein *Object*-Pointer auf dieses Objekt zurückgegeben.

## Unterdrücken von Kompiler-Warnungen

Wird beim Kompilieren eine Warnung erzeugt: **warning: unused parameter 'obj' -Wunused-parameter** dann kann diese Meldung unterdrückt werden indem in der Projekt-Konfiguration an beliebiger Stelle eingefügt wird:

```
QMAKE_CXXFLAGS_WARN_ON += -Wno-unused-parameter
```

Mit no wird die Meldung unterdrückt, alternativ dürfte OFF statt ON klappen (ohne no) oder -=.

Allgemein: Warnungen/Fehler sollen nach Möglichkeit nie unterdrückt werden. Eine Warnung/Fehler sind ein Hinweis, dass in der Software *etwas besser gemacht werden kann/soll*.

## Debug-Ausgabe (055)

Zum Ausgeben in der Konsole wird ein Stream angeboten:

```c++
#include <QDebug>
...
qDebug() << "Hallo Welt";
```

## Messagebox

Ausgabe mit Nachrichtenfenster:

```c++
#include <QMessageBox>
...
int num =  QMessageBox::warning(this, "Gruß", "Antwort?", QMessageBox::Ok | QMessageBox::Yes)

if (num == QMessageBox::Yes) {...}
...
```

Es gibt eine Vielzahl von diesen Fenstern: warning, information, question, critical, about, question.

## Qt Widget Application

Struktur einer Widget Application (GUI-Anwendung):

- In der Projekt-Konfiguration des QtCreators wird gui hinzugefügt:

  ```
  QT += core gui
  ```

- main: Erstellt ein MainWindow-Fenster (siehe Unten) und zeigt es an:

  ```c++
  MainWindow w;
  w.show();
  ```

- MainWindow-Klasse - von QMainWindow abgeleitet

  ```c++
  class MainWindow : public QMainWindow {...
  ```

  Makro *Q_Object*

- mainwindow.ui - XML-Datei mit der Konfiguration der GUI

## Fenster Schließen

Soll vor dem Schließen des Fensters etwas ausgeführt oder das Schließen abgebrochen werden, dann muss die Methode closeEvent überschrieben werden:

```c++
MainWindow::closeEvent(QCloseEvent* e) {
    e->ignore();	// Fenster nicht schließen
    e->accept();	// Fenster tatsächlich schließen
}
```

## Statusbar

Zum Anzeigen von Information auf der Statusbar (Anzeigedauer 1000ms):

```c++
ui->statusbar->showMessage("Daten werden gelesen", 1000);
```

## Schaltfläche/Button

- Um einen Butten mit einem Ereignis zu verknüpfen, wird im QTCreator im UI-Designer im Kontext-Menü der Schaltfläche die Option *Slot anzeigen* ausgewählt. Im Fenster das sich dadurch öffnet kann das entsprechende Signal ausgewählt werden, im einfachsten Fall **clicked()** (für ein Ereignis durch ein einfaches Anklicken).
- Im zugehörenden h- und cpp-Code wird damit eine Funktion angelegt mit dem Namen `on_pushButton_clicked()` angelegt. Der mittlere Teil *pushButton* entspricht dem Namen des Schaltflächenobjekts. Es empfiehlt sich daher sämtlichen Objekten direkt nach der Erzeugung einen bezeichnenden Namen zu geben. Soll der Name der Schaltfläche (und der Funktion) verändert werden, dann muss das in der cpp-, h, und ui-Datei erfolgen.

## Radio Button

Zusammengehörende Radiobutton können in eine Gruppe zusammengefasst werden: dazu werden sie gemeinsam ausgewählt und im Kontextmenü Gruppiert.

## Dialog Button Box

Häufig Button-Kombinationen sind in Dialog-Button-Box zusammengefasst. In den Eigenschaften können die gewünschten Schaltflächen ausgewählt werden. Der Text auf diesen Schaltflächen wird in der aktuellen Sprache dargestellt. Die erzeugten Signale werden entsprechend der Auswahl angeboten.

## Combo Box

- Hinzufügen von Elementen mittels Kontextmenü-Eintrag *Einträge ändern*

- Im Code können ebenfalls einzelne Elemente eingefügt werden:

   ```c++
ui->myComboBox->addItem("Mr. Smith");
   ```

- Alternativ kann eine komplette Liste eingefügt werden:

  ```c++
  QList<qint32> intList = QSerialPortInfo::standardBaudRates();	// Int-Liste Lesen
  
  QList<QString> myList;					// QString-Liste
  foreach (auto elem, intList) {	// foreach-Schleife
    myList.push_back(QString::number(elem));	// Int->QString Liste
  }
  
  ui->myComboBox->addItems(myList);	// Liste komplett an ComboBox
  ```
  
- Ausgabe des aktuell ausgewählten Elements

  ```c++
  qDebug() << ui->myComboBox->currentText();	// Text der aktuellen Auswahl
  qDebug() << ui->myComboBox->currentIndex();	// Pos. der aktuellen Auswahl
  ```

## ComboBox mit ModelView

Moderneres Konzept: ModelView - der Code verändert/liest nur an einem Model. Die Kommunikation zwischen dem Modell und dem View erfolgt separat.

h:

```c++
#include <QtCore>
#include <QtGui>
...
private:
  QStringListModel *model;
...
```

cpp:

```c++
model = new QStringListModel(this);
ui->myComboBox->setModel(model);    // ComboBox-Element vom GUI

model->insertRows(0,3);						// 3 Elemente an Pos 0 einfügen
model->setData(model->index(0), "Hallo");	// erstes Element
model->setData(model->index(1), "Du");
model->setData(model->index(2), "da");
```

## QFileDialog - Datei Dialoge

Zum Öffnen einer Datei werden Standard-Datei-Dialoge verwendet:

```c++
#include <qfiledialog.h>
...
  QString filename = QFileDialog::getOpenFileName(	// filename wird zurückgegeben
    this,
    tr("Datei Öffnen ..."),					// Titel
    "C:\\temp",								// Startordner
    "Alles (*.*);;Text Datei (*.txt);;"		// Filter
  );
```

Zum Speichern von Dateien läuft das ähnlich mit Speichern und Auswahl von Verzeichnissen. Für die Auswahl von mehreren Dateien gibt's wiederum ähnliche Funktionen.

Beispiel fürs Laden aus Textdatei:

```c++
QFile *fHdl = new QFile(filename);
fHdl->open(QIODevice::ReadOnly);

char str[1024];
QString gesStr;

while (!fHdl->atEnd()) {
  qint64 num = fHdl->read(str, 1024);
  str[num-1] = 0;         // notwendig wenn: num<1024
  gesStr += str;
}
fHdl->close();
```

## Fenstername

Statische Funktion für das Setzen:

```c++
MainWindow::setWindowTitle("Kuhl App");    // Aendern
qDebug() << this->windowTitle().toUtf8();  // Lesen
```

## QListWidget

Befüllen eines *QListWidgets* *lvNames*, klassische Methode:

```c++
ui->lvNames->addItem("Maier");
ui->lvNames->addItem("Schmidt");
ui->lvNames->addItem("Hofer");
```

Bearbeiten aktives Element (zum Beispiel Element in der Liste ausgewählt und dann eine Verändern-Schaltfläche gedrückt wurde):

```c++
ui->lvNames->currentItem()->setText("Hofer-Huber");
// oder wenn mehrfacher Zugriff:
QListWidgetItem *itm = ui->lvNames->currentItem();
itm->setText("Hoffer");
itm->setTextColor(Qt::red);
itm->setBackgroundColor(Qt::black);
```

Der Index des gedrückten Elements:

```c++
int idx = ui->lvNames->currentRow();
```

Löschen eines Elements aus dem Widget:

```c++
ui->lvNames->takeItem(10);	// loeschen 10tes Element
```

## Bäume

https://www.youtube.com/watch?v=TpkiVlOS3o4

Tree Widget (nicht ModelView)

h:

```c++
#include <QtCore>
#include <QtGui>
#include <QTreeWidgetItem>

void AddRoot(QString name, QString description);
void AddChild(QTreeWidgetItem *parent, QString name, QString description);
```

cpp:

```c++
  // Aufruf:
  ui->treeWidget->setColumnCount(2);
  AddRoot("NT3", "13.04.1999");

void MainWindow::AddRoot(QString name, QString description){
  QTreeWidgetItem *itm2 = new QTreeWidgetItem();
  itm2->setText(0, "Name");
  itm2->setText(1, "Datum");
  ui->treeWidget->setHeaderItem(itm2);

  QTreeWidgetItem *itm = new QTreeWidgetItem(ui->treeWidget);
  itm->setText(0, name);
  itm->setText(1, description);

  AddChild(itm, ".Setting", "13.04.2004");
  AddChild(itm, "Doc", "07.11.2012");
}
void MainWindow::AddChild(QTreeWidgetItem *parent, QString name, QString description) {
  QTreeWidgetItem *itm = new QTreeWidgetItem();
  itm->setText(0, name);
  itm->setText(1, description);
  parent->addChild(itm);
}
```

## List View (ModelView)

(nett: https://www.youtube.com/watch?v=uDC9L4T59bM)

Modern: Trennung von Code und GUI-Elemente. Daher ändert der Code eine darzustellende Liste lediglich in einem Model (nicht in der GUI direkt). Das GUI wird mittels einer eigenen Ebene upgedatet.

Eindrucksvolles Beispiel: in einer GUI liegt ein ListView (Name ListView) und eine Combobox (Name ComboBox). Wenn die Elemente eines der Objekte verändert wird, dann wird gleichzeitig das gleiche Element des zweiten Objekts verändert.

.h:

```c++
#include <QtCore>
#include <QtGui>
...
private:
  QStringListModel *model;		// include <QtCore>
```

.cpp:

```c++
model = new QStringListModel(this);

QStringList list;
list << "Katze" << "Hunde" << "Vogel";

// Model kriegt Daten:
model->setStringList(list);

// Model und Gui verknuepfen:
ui->listView->setModel(model);    // Listview-Element von GUI
ui->comboBox->setModel(model);    // ComboBox-Element von GUI

// Manuelles Editieren in der Liste zulassen (durch Taste oder Doppelklick):
ui->listView->setEditTriggers(QAbstractItemView::AnyKeyPressed | QAbstractItemView::DoubleClicked););
```

Um in diesem Beispiel rauszufinden welche Zeile in ListView momentan gewählt ist und Einfügen einer Zeile:

```c++
int pos = model->rowCount();	// aktive Zeile
model->insertRows(pos, 1);		// 1 Zeile einfuegen
```

Die komplette Bearbeitung erfolgt über das Modell.

## Kontext-Menü

Soll ein Kontext-Menü erscheinen, dann muss:

- es zuerst einmal zugelassen werden: Dazu wird beim Widget-Element die Eigenschaft *contextMenuPolicy* auf *CustomContextMenu* gesetzt.

- Eine Action-Handler muss erstellt werden, das kann im UI-Designer erfolgen (customContextMenuRequested), damit wird diese Funktion (leer) erstellt:

  ```c++
  void MainWindow::on_listWidget_customContextMenuRequested(const QPoint &pos)
  {
      if (!ui->listWidget->selectedItems().isEmpty()) {
          QMenu *delMenu = new QMenu(this);	// Kontext-Menue erzeugen
  
          // neue Action erstellen mit neuem Menueeintrag:
          QAction *delAction = delMenu->addAction("Löschen");
          // Verbinden dieser Action mit einem Action-Handler:
          connect(delAction, &QAction::triggered, this, &MainWindow::on_actionContextMenu_triggered);
  
          delMenu->exec(this->cursor().pos()); // Menue anzeigen
      }
  }
  ```

  Die obige connect-Funktion kann erst funktionieren, wenn der folgende Action-Handler erzeugt wird.

- Im UI-Designer kann auch eine neue Action erzeugt werden, hier mit dem Namen **ContextMenu**. Für dies Action wird auch gleich im Designer eine **Triggered**-Action erzeugt, damit wird im Code diese Funktion erzeugt:

  ```c++
  void MainWindow::on_actionContextMenu_triggered()
  {
      qDebug() << ui->listWidget->selectedItems().at(0)->text() << ui->listWidget->currentRow()
  }
  ```

## QDockWidget

Um ein Fenster zu organisieren, können andockbar Fenster *QDockWidget* verwendet werden. Diese Fenster werden im *ui* eingefügt. Dieses Widget kann an einer Seite angedockt werden (es können die erlaubten Seiten angegeben werden). Zusätzlich kann angegeben werden ob das Fenster geschlossen, abgedockt ... werden kann. Wenn während der Laufzeit ein Fenster geschlossen wird, kann es mittels

```c++
ui->dockWidget->show();
```

wieder hergestellt werden.

Innerhalb des Widgets können wiederum wie im Hauptfenster 

## QKeyEvent - Tastendruck-Erkennung

Zum Erkennen eines Tastendrucks (key press) gibt es einige Möglichkeiten, eine davon ist mittels EventFilter (siehe auch Maus). Dafür ist die Installation eines Event-Filters notwendig. Wenn Tastendruck für nur ein Element (hier beispielhaft listView) erkannt werden soll:

```c++
// z.B. im MainWindow-Konstruktor:
ui->listWidget->installEventFilter(this);

...
// Bsp: Loeschen eines Elements wenn 
bool MainWindow::eventFilter(QObject *obj, QEvent *event) {
  if (event->type() == QEvent::KeyRelease) {
    QKeyEvent *keyEvent = static_cast<QKeyEvent*>(event);
    if (keyEvent->key() == Qt::Key_Delete) {
        int num = ui->listWidget->currentRow();
        ui->listWidget->takeItem(num);
    }
  }
  return false;
}
```

In dem hier angeführten Beispiel wird für ein *listWidget* auf die Entfernen-Taste (Key_Delete) geprüft. Wenn sie gedrückt wird, dann wird das gewählte Element aus der Liste gelöscht.

## Erkennung Maus-Bewegung (055)

Zum Erfassen der Maus-Position innerhalb eines Fensters eignet sich:

```c++
bool MainWindow::eventFilter(QObject *obj, QEvent *event)
{
  if (event->type() == QEvent::MouseMove)     // MouseMove-Event
  {
    QMouseEvent *mouseEvent = static_cast<QMouseEvent*>(event);
    qDebug() << this->mapFromGlobal(mouseEvent->globalPos());
  }
  return false;
}
```

Dieser Eventfilter muss installiert werden (im Konstruktor o.ä.):

```c++
#include <QMouseEvent>
#include <QDebug>			// fuer qDebug() <<
...
qApp->installEventFilter(this);
```

Die Funktion mapFromGlobal() mit der globalen Position relativiert die Koordinaten auf das Widget in welchem man sich befindet. Werden nicht die globalen Koordinaten verwendet wird immer auf das Element bezogen innerhalb dessen sich der Zeiger gerade befindet.

## Erkennung Maus-Button-Klick (055)

Das Klick-Event auf einem Widget funktioniert einfacher als das Movement:

```c++
#include <QMouseEvent>
...
void MainWindow::mousePressEvent(QMouseEvent *event) {
	qDebug() << event->pos();
}
```

## Eigenes Widget

Widgets sind Objekte auf der UI-Oberfläche. In Qt können sehr einfach eigene Widgets erzeugt und mit eigenen Funktionen hinterlegt werden. Der große Vorteil dadurch ist die saubere Trennung des Widget-Codes von der grundsätzlichen Fenster-Steuerung.

- Eine neue C++ Klasse PaintAreaWidget zum Projekt hinzufügen: als Basisklasse `QWidget` einstellen
  (erzeugt eine cpp- und eine h-Datei).

- Das Paint-Event wird überladen:

  ```c++
  protected:
  void paintEvent(QPaintEvent *) override;
  
  #include <QPainter>
  void PaintAreaWidget::paintEvent(QPaintEvent *event) {
      QPainter painter(this);
      QRectF size = QRectF(3,3,this->width()-3, this->height()-3); // F=float
  	painter.fillRect(size,QBrush(Qt::white));
  
      painter.setPen(QPen(Qt::lightGray,2)); //painter.setBrush(Qt::blue);
      painter.drawRect(size);	
  }
  ```

- auf dem UI gibt's 

  ```
  Containers->Widget
  ```

  das wird platziert. Darauf rechte Maustaste -> "Platzhalter für benutzerdefinierte Widgets.."/"Promote to ..."

  Darin das erzeugte Widget eintippen.

## QTimer

Hier wird ein *Timer* in der *MainWindow*-Klasse (this) erzeugt.

```c++
#include <QTimer>
...
myTimer = new QTimer();
connect(myTimer, &QTimer::timeout, this, &MainWindow::rxTick);
myTimer->start(1000);
...
void rxTick() {...}
```

Mit *start* wird er gestartet. Nach dem Überlauf beginnt er von vorne. Hier wird ein Signal durch einen *Timeout* ausgelöst und damit der Slot *rxTick* aufgerufen. Mit *stop* kann der Timer gestoppt werden.

## Icons (055)

Für Symbole auf z.B. Buttons werden Grafiken am besten als Ressource eingebunden. Dazu wird dem Projekt eine Ressource hinzugefügt Qt->Qt Ressourcen-Datei. Dort eine existierende Datei hinzufügen. Ab hier ist die Grafik als Ressource verfügbar.

## Images

Um Bilder darzustellen können die etwa auf *label*s dargestellt werden, dazu muss ein Label erstellt werden. Benannt wird es hier mit *lblPic*.

Im Code kann dann das Bild eingefügt werden:

```c++
#include <QPixmap>
...
QPixmap pixmap("C:/temp/stars/pics/stern1.png");
int w = pixmap.size().width();
int h = pixmap.size().height();
int x = ui->lblPic->geometry().width();
int y = ui->lblPic->geometry().height();
ui->lblPic->setGeometry(x,y,w,h);
ui->lblPic->setPixmap(pixmap);
```

Hier wird das Label noch auf die Größe des Images verändert.

## Autosize

Sollen Elemente auf einem Widget automatisch ihre Größe an das Hauptfenster anpassen (Schlagworte Dock, Autosize), dann muss auf dem Hauptfenster mit der rechten Maustaste Layout->Objekte tabellarisch anordnen ausgewählt werden. Beim Eingepassten Element kann der Abstand zur Seite eingestellt werden.

## Toolbar/Menüleiste (055)

Um in eine Toolbar Elemente einzufügen werden diese Elemente zuerst im **Aktionseditor** definiert (alternativer Weg: in der Menüleiste direkt eintragen). Anschließend wird das erzeugte Action-Element auf die Toolbar (oder auch Menüleiste) gezogen. Um einen Event-Handler zu verknüpfen wird im Aktionseditor mittels Context-Menü *Slot anzeigen* ausgewählt und das entsprechende Event ausgewählt (allgemein: **triggered**). Ein und die selbe Action kann in eine Toolbar und eine Menüleiste platziert werden.

## Zeichnen (055)

Zum Zeichnen wird die Methode **paintEvent** eines Widgets überschrieben:

```c++
#include <QPainter>
...
void MainWindow::paintEvent(QPaintEvent *) {
    QPainter p(this);
    p.setPen(Qt::red);	// oder auch p.setPen(QPen(Qt::darkGreen, 3));
    p.drawLine(0,0,100,100);
}
```

Hier wird das mit `MainWindow` gemacht, mit anderen (oder eigenen) Widgets funktioniert das analog. Mit `repaint()` kann ein Neu-Zeichnen explizit angefordert werden.

## QSerialPort

**Voraussetzung** Konfiguration in der pro-Datei für das Arbeiten mit der QSerialPort-Klasse:

```
QT += serialport
```

**Erzeugen** und **Konfigurieren** eines QSerialPort-Objekts:

```c++
#include <QSerialPort>
...
QSerialPort serPort;
serPort.setBaudRate(QSerialPort::Baud9600);		// Alternativ: setBaudRate(9600)
serPort.setPortName("COM1");
```

**Öffnen** der Kommunikation mit Definition der Zugriffsart (ReadOnly/ReadWrite ...):

```c++
if (!serPort.open(QSerialPort::ReadWrite)) {
  qDebug() << QObject::tr("Failed to open port %1, error:  
       %2").arg(serialPortName).arg(serialPort.error()) << endl;
  return 1;
}
...          
serPort.close();
```

**Schreiben** auf den Port:

```c++
serPort.write("Hallo Welt!\r\n");
serPort.waitForBytesWritten();	// evtl. max Warte-Zeit mitgeben

qDebug() << serPort.error() << endl;
```

**Lesen** vom Port:

```c++
serPort.waitForReadyRead();	// evtl. max Warte-Zeit mitgeben
qDebug() << QString::fromLocal8Bit(serPort.readAll()) << endl;
```

**Signal/Slot** Konfiguration:

```c ++
connect(&m_sp, &QSerialPort::readyRead, this, &SerPort::readSig);
```

Voraussetzungen damit das funktioniert:

- m_sp ist ein QSerialPort
- readSig() ist eine Slot-Funktion in der Klasse SerPort (this)

(Zumindest) Mit virtuellen Ports auf Windows: die Slots werden nur ausgelöst, wenn gerade mittels *waitForReadyRead()* gewartet wird. Da diese Funktion blockiert muss sie entweder zyklisch aufgerufen werden (dann ists wie Polling) oder in einem eigenen Thread.b

## QMAKE

Kopieren von Dateien während dem Make:

```
# Copy *.png from source-folder to target-folder.
CONFIG += file_copies
COPIES += images
images.files = $$files($$IN_PWD/*.png)
images.path = $$OUT_PWD/
images.base = $$PWD
```

in diesem Beispiel werden png-Dateien in den Ziel-Ordner kopiert.

## HTTP-POST

Um einen http-Post-Request zu senden (in der Projektdatei: `QT += network`):

```c++
#include <QtNetwork/QNetworkRequest>
#include <QNetworkAccessManager>
#include <QUrlQuery>
#include <QDebug>

....

QNetworkAccessManager * manager = new QNetworkAccessManager(this);

QUrl url("http://localhost/api/create.php");
QNetworkRequest request(url);

request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");

QUrlQuery params;
params.addQueryItem("name", "qt qt");
params.addQueryItem("email", "qt@qt.qt");
params.addQueryItem("mobile", "+1234567890");

connect(manager, SIGNAL(finished(QNetworkReply *)), this, SLOT(replyFinished(QNetworkReply *)));

manager->post(request, params.query().toUtf8());
```

Um die Response-Nachricht auswerten zu können muss der Slot implementiert werden (vorletzte Zeile):

```c++
private slots:
    void replyFinished(QNetworkReply *) {qDebug() << "success.";};
```

### Kopieren von Dateien aus Quell- ins Zielverzeichnis

mittels QMAKE, kann in der Projektkonfiguration angefügt werden:

```
# Copy index.html+parking.png into target-folder
copydata.commands = $(COPY_FILE) $$PWD/index.html $$PWD/parking.png $$OUT_PWD
first.depends = $(first) copydata
export(first.depends)
export(copydata.commands)
QMAKE_EXTRA_TARGETS += first copydata
```

first ist der Standard-Make-Prozess.
