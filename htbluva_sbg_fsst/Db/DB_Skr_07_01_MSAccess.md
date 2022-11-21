# 7.1 MS Access

## Erstellen einer DB anhand eines Beispiels

- MSAccess starten (Office Tool) und eine neue *Leere Datenbank* anlegen. Dadurch wird eine .accdb-Datei erzeugt (**Acc**ess **D**aten**b**ank) (ältere Access-DB verwenden das Format .mdb).
- Die Umgebung wirkt ähnlich wie Excel. Am Einfachsten in der Tabelle ein Telefonbuch (VName, NName, TelNr, Str, Nr, Plz, Ort, Staat) erzeugen - einen Beispiel-Eintrag eintippen. Kopfzeilen lassen sich editieren. Der Datentyp wird recht vernünftig vom Programm angenommen, es kann sein, dass er geändert werden muss. Im Menü gibt es dazu unter Menüleiste->Felder->Formatierung ein Pull-Down-Menü.
- Beim Speichern wird nach einem Tabellennamen gefragt, der ist sinnvoll zu vergeben (*TelBuch*)
- In der Statusleiste rechts unten kann zwischen verfügbaren Ansichten auf die Tabelle umgeschaltet werden. Für die Tabelle: zwischen Entwurfsansicht und Datenblattansicht.
- In der Entwurfsansicht geht's um die Definitionen/Layout (Datentypen ...), in der Datenblattansicht geht's um die Daten die in der Tabelle enthalten sind.

## Formular

Formulare dienen dazu um Daten in eine erstellte DB einzugeben (eventuell mit Erklärungen, Begrenzungen ...).

- Ein Formular kann nur zu einer schon bestehenden DB erzeugt werden.
- Zum Erzeugen DB öffnen und unter Menüleiste->Erstellen->Formulare->Formular-Assistent
  Es können die für die Eingabe gewünschten Felder ausgesucht werden und ein vorgeschlagenes Erst-Layout. Wenn der Assistent fertiggestellt wurde, dann ist ein Formular mit den gewählten Feldern verfügbar. In der Status-Leiste rechts unten kann zwischen unterschiedlichen Ansichten umgeschaltet werden. In der Entwurfsansicht kann das Formular individuell an die Bedürfnisse angepasst werden. 
- Im Navigationsbereich (linke Spalte im Hauptfenster) kann zwischen Tabellen/Formularen/Berichten umgeschaltet werden. Dadurch werden die erstellten Teile sichtbar.
- Zur Eingabe von Daten mittels Formular muss das Formular in die Formularansicht geschaltet sein.
  Nach Eingabe der Daten in sämtliche Felder kann der Datensatz mit Enter eingegeben werden. In der DB ist das Datum erst nach einem aktualisieren (Menü->Start->Datensätze->Alle aktualisieren) verfügbar.

### Eingabe-Vorrat

Wenn Elemente aus einer Liste eingegeben werden dürfen (Haarfarbe = Blond/Schwarz ...), dann erfolgt die Einstellung dazu in der Entwurfsansicht:

- Feld auswählen
- In den Feldeigenschaften (untere Bildhälfte) Steuerelement anzeigen->Listenfeld. Damit werden weitere Eigenschaften angezeigt
- Herkunftstyp: Wertliste, damit kann unter Datensatzherkunft eine Liste eingetragen werden.
- Herkunftstyp: Tabelle/Abfrage, damit können bestehende Werte aus einer zweiten Tabelle entnommen werden (die muss es schon geben, zB. Tabelle mit Haarfarben)
- In der Eigenschaft *Steuerelementinhalt* wird der Attribut-Name des verknüpften Werts eingegeben. In der Eigenschaft *Datensatzherkunft* werden die anzuzeigenden Daten errechnet (in einer Combo-Box können Namen angezeigt werden mittels welcher zugehörige Ids ermittelt werden).

Mit dieser Einstellung kann die Eingabe erleichtert werden. Es können weiterhin auch andere Werte eingetragen werden. Die Gültigkeit einer Eingabe kann mittels Gültigkeitsregel vorgegeben werden.

### Gültigkeitsprüfung

(Tabelle & Formulare)

- Entwurfsansicht->(zu prüfende Eingabe)->Feldeigenschaften->Allgemein->Gültigkeitsregel auswählen
- Einfache Zahlenbereiche: ">10"  : nur Eingaben >10 sind erlaubt
  ">=1 UND <=5": nur Zahlen im Bereich 1..5 sind erlaubt
- Eingabe erzwingen: "IST NICHT NULL": in dieses Feld muss etwas eingegeben werden
- Textlänge: "Länge([....]) < 100": statt ... ist der Feldname einzusetzen. Der Text muss kürzer als 100 Zeichen sein
- Datum: ">Datum()": nur Eingaben mit einem Datum später als Heute
- Bezug auf weitere Felder: "[xxx]<[yyy]": Wert des Feldes xxx muss kleiner als der Wert des Feldes yyy sein.
- Vergleich mit einer Liste: "IN ("braun";"rot";"grün")": das Feld darf nur einen der angeführten Werte annehmen.

https://support.office.com/de-de/article/erstellen-einer-g%C3%BCltigkeitsregel-zum-%C3%9Cberpr%C3%BCfen-von-daten-in-einem-feld-b91c6b15-bcd3-42c1-90bf-e3a0272e988d

Unter Gültigkeitsmeldung kann eine Meldung angeführt werden

### Auswahltypen

Sollen Eingaben nicht nur als Textfeld zur Verfügung stellen:

- Element auswählen
- Kontextmenü (rechte Maustaste) -> Ändern zu->Kombinationsfeld
- Damit wird die Eingabe mittels einer Combobox angeboten. Die Felder die hinterlegt sind kommen aus der 

### Eingabeformat

(Tabelle & Formulare)

Um bei der Eingabe zu unterstützen kann ein Eingabeformat vorgegeben werden. Die Auswahl erfolgt am einfachsten mittels Eingabeformat-Assistenten. Vorgeschlagen werden dort Formate für

- Datum / Uhrzeiten
- Kennwörter
- Mail-Adressen

und weitere mehr. Das Eingabeformat ist kein Schutz vor einer Falscheingabe. Ein zu einschränkendes Format ist eher lästig als hilfreich. Für manche Fälle kann es sehr gut unterstützen (etwa ein Datum mit --.--.----).

## Bericht

Berichte dienen zur formatierten Ausgabe von Daten (Anzeige, Ausdruck ...).

- In der Datenbank wird im Menüleiste->Erstellen->Berichte->Bericht-Assistent ausgewählt. Nachdem die gewünschten Optionen ausgewählt wurden erscheint der Bericht als Seitenansicht.
- Der Bericht kann in der Entwurfsansicht editiert werden.
- Im Navigationsbereicht (linke Spalte im Hauptfenster) kann zwischen Tabellen/Formularen/Berichten umgeschaltet werden. Dadurch werden die erstellten Teile sichtbar.
- Sollen nicht alle Datensätze angezeigt werden wird als Quelle nicht eine Tabelle sondern eine Abfrage (siehe dort) gewählt.
- Die alternierende Einfärbung von Zeilen wird bei Auswahl des Detailbereichs im Menü Menüleiste->Format->Hintergrund->AlternativeZeilenfarbe gesteuert.

## Abfrage

Abfragen dienen zur Auswahl spezieller Daten aus Tabellen (oder anderen Abfragen).

- Auswahl Menüleiste->Erstellen->Abfragen->AbfrageAssistent
- Es wird ein Fenster dargestellt in dem das Ergebnis der Abfrage dargestellt wird
- Bei einfacher Auswahl von Spalten wird die komplette Spalte angezeigt. In der Entwurfsansicht können Kriterien angegeben werden um die Auswahl einzuschränken.

## Verküpfung von Tabellen miteinander

- unter Menüleiste->Entwurf->Beziehungen->Beziehungen öffnen
- sämtliche Tabellen Öffnen die in Beziehung gesetzt werden sollen
- durch Ziehen eines Attributes von einer Tabelle in eine andere und Bestätigung wird eine Beziehung hergestellt. Vorsicht: es spielt eine Rolle welches Element gezogen wird!

## Referenzen

- MS-Access SQL-Referenz:

  [https://docs.microsoft.com/en-us/office/client-developer/access/desktop-database-reference/microsoft-access-sql-reference](https://docs.microsoft.com/en-us/office/client-developer/access/desktop-database-reference/microsoft-access-sql-reference)

