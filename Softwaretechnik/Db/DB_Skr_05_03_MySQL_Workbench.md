# 5.3 Tool - MySQL Workbench

MySQL Workbench ist ein GPL-Oracle-Datenbank-Tool das für die MySQL-Datenbank entwickelt wurde. Es bietet eine sehr komfortable Oberfläche (ansprechender als myPhpAdmin). Allerdings ist es auch um einiges größer als myPhpAdmin. Da MariaDB (aus XAMPP) *sehr* kompatibel zu MySQL ist kann es direkt dafür verwendet werden.

## Installation (Windows)

Die Unterstützung im Internet zu diesem Tool ist sehr gut.

- Download [mysql-workbench-community-8.0.15-winx64.msi](https://dev.mysql.com/downloads/file/?id=484382) mit *No thanks, just start my download.*
- Installation mit den Standardeinstellungen
- Einführung: [https://www.informatikzentrale.de/anleitung-mysql-workbench.html](https://www.informatikzentrale.de/anleitung-mysql-workbench.html)

## Einrichten

Verbinden mit der MariaDB von XAMPP:

- Beim ersten Start von MySQL-WB ist ein MySQL-Connections-Bereich dargestellt. Hier kann mit (+) eine neue Verbindung eingerichtet werden -> (+) Drücken
- Benennung der Verbindung **lokaleXamppDb** mit Hostname **127.0.0.1** und Port **3306**. Diese Einstellungen sind Standard solange sie nicht bewusst für die DB verstellt wurden.
- **Username**: derjenige der via eingestelltem Host verfügbar ist. Das Passwort kann eingestellt/gespeichert werden. Ansonsten muss es bei jedem Start eingegeben werden.
- Mit **Test Connection** können die getroffenen Einstellungen geprüft werden, wenn sie passen beenden/bestätigen mit **OK**.

Damit öffnet sich die Verbindung zur gewählten DB.

## Allgemein

Die Oberfläche:

- ganz oben über der Menüleiste kann die DB-Verbindung beendet werden indem der entsprechende Reiter geschlossen wird
- Unter den Reitern befindet sich die Menüleiste. Je nachdem was für Reiter gewählt sind verändern sich die Inhalte der Menüpunkte.
- Im Navigator: zwei Seiten Administration und Schemas.
  - Administration: Grundeinstellungen/Inforamtionen der DB (Benutzer, Rechte, Verbindung …)
  - Schemas: in MySQL-WB werden die myPhpAdmin-Datenbanken als Schema bezeichnet.

## Schemas Verwalten

- Auswahl des Schemas im Navigator
- Öffnen des Table-Untermenüs
- Mit der rechten Maustaste können Tabellen erstellt werden -> Create Tables
  - Bennenung
  - Einfügen von Spalten (Columns) und Auswahl der Eigenschaften
- Zum Löschen einer Tabelle rechte Maustaste auf die Tabelle -> Drop Table
- Sämtliche Einstellungen innerhalb der Tabelle erfolgt immer wechselseitig: Auswahl des Elements im Navigator (Contextmenü oder Icon) und dann im sich öffnenden Fenster

### Tabellen

- Erstellen eines neuen Navigator -> Schemas (~Datenbank) in der Symbolleiste **Create a new Schema…** -> Name eingeben und den zu verwendenden Zeichensatz auswählen. Mit **Apply** kann mit den dargestellten SQL-Anweisungen das Schema auch in der verbundenen Datenbank erstellt werden.

- Erstellen einer neuen Tabelle: im Navigator -> Schema -> Tables -> Kontextmenü -> **Create new Table …**  
  Name eingeben und eventuell auch die Spalten eintragen - mit Datentyp und Attributen (Übersetzung rechts unten). Abschließend **Apply** und wieder Abfrage ob die Tabelle in der verbunden DB erstellt werden soll.

- Das Bearbeiten / Hinzufügen / Löschen von Spalten/Tabellen/Schemas erfolgt jeweils über das Kontextmenü im Navigator.

- Beziehungen: im Navigator wird Tabelle bearbeiten ausgewählt. Im sich öffnenden Fenster kann unten auf **Foreign Keys** umgeschaltet werden:
  
  - jeder Fremdschlüssel bekommt einen **Namen**
  - Angabe in welche Tabelle referenziert werden soll
  - Angabe welche Spalte in der aktuellen Tabelle referenzieren soll
  - Angabe auf welche Spalte sich referenziert werden soll (muss ein Schlüssel sein)
  - Auswahl wie bei einem Update/Delete verfahren werden soll (CASCADE…)
  
  Damit wird eine Beziehung 1:n dargestellt.

- Erzeugen eines ERM-Diagramms aus einem Schema:
  
  - Menüleiste -> Database -> Reverse Engineer … -> … -> Schema auswählen -> … beim Vorletzten Punkt wurde ein ERM-Diagramm erstellt, der Ablauf kann beendet werden.

## ERD-Diagramm

In MySQL-WB werden diese Diagramm EER-Diagramme genannt.

- Menüleiste -> File -> New Model -> Model Overview -> **Add Diagram**. Zeichenbereich öffnet sich. Mittels Tools in der Leiste können Tabellen neue plaziert werden (Kurzwahl T). Wenn im gewählten Schema schon Tabellen existieren können die aus dem Catalog Tree per Drag and Drop plaziert werden.

- Doppelklick auf Tabelle -> Bereich mit Einstellungen öffnet sich: Tabelle benennen, Einfügen/Konfigurieren von Spalten …

- Beziehungen von Tabellen:
  
  - Auswahl einer Verbindung (Linie) 
  - Klick auf erste Tabelle
  - Klick auf zweite Tabelle
  
  Zum Erkennen welche Spalten miteinander Verbunden wurde: Klick auf die Verbindung - die betroffenen Spalten werden farbig abgehoben. Es gibt strichlierte Linien, dann muss es für einzelne Elemente nicht zwangsläufig eine Beziehung geben.
  
  Alternativ: Tabelle auswählen und in den Reitern unten auf *Foreign Keys*

- Erzeugen der SQL-Anweisung zur Erstellung der erzeugten Struktur:
  
  - Database -> Forward Engineer … -> … 
  - wenn der SQL-Code angezeigt wird, kann er kopiert werden und der Ablauf beendet werden.